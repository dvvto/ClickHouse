#include <Processors/QueryPlan/CreatingSetsStep.h>
#include <Processors/QueryPlan/Optimizations/Optimizations.h>
#include <Processors/QueryPlan/FilterStep.h>
#include <Processors/QueryPlan/JoinStepLogical.h>
#include <Columns/ColumnSet.h>
#include <Columns/ColumnConst.h>
#include <DataTypes/DataTypeSet.h>
#include <Functions/FunctionFactory.h>
#include <Functions/IFunctionAdaptors.h>
#include <Functions/tuple.h>
#include <Interpreters/ActionsDAG.h>


namespace DB::Setting
{
    extern const SettingsBool transform_null_in;
    extern const SettingsUInt64 use_index_for_in_with_subqueries_max_values;
}

namespace DB::QueryPlanOptimizations
{

bool hasJoinNode(QueryPlan::Node * root, QueryPlan::Node * join)
{
    if (root == join)
        return true;

    for (auto child : root->children)
    {
        if (hasJoinNode(child, join))
            return true;
    }

    return false;
}

QueryPlan::Node * getRoot(QueryPlan::Nodes & nodes, QueryPlan::Node * join_node)
{
    std::unordered_map<QueryPlan::Node *, bool> h;
    for (auto & n : nodes)
    {
        for (auto child : n.children)
            h[child] = false;
        if (!h.contains(&n))
            h[&n] = true;
    }
    for (const auto & [n, is_root] : h)
    {
        if (is_root && hasJoinNode(n, join_node))
            return n;
    }
    chassert(false);
    return nullptr;
}

size_t tryConvertJoinToIn(QueryPlan::Node * parent_node, QueryPlan::Nodes & nodes, const Optimization::ExtraSettings & /*settings*/)
{
    auto & parent = parent_node->step;
    auto * join = typeid_cast<JoinStepLogical *>(parent.get());
    if (!join)
        return 0;
    auto & join_info = join->getJoinInfo();
    if (join_info.strictness != JoinStrictness::All)
        return 0;
    if (join->getJoinSettings().join_use_nulls)
        return 0;

    const auto & left_input_header = join->getInputHeaders().front();
    const auto & right_input_header = join->getInputHeaders().back();
    const auto & output_header = join->getOutputHeader();

    bool left = false;
    bool right = false;
    for (const auto & column_with_type_and_name : output_header)
    {
        left |= left_input_header.has(column_with_type_and_name.name);
        right |= right_input_header.has(column_with_type_and_name.name);
    }
    /// All come from left side?
    if (!(left && !right))
        return 0;

    Header left_predicate_header;
    Header right_predicate_header;
    /// column in predicate is null, so get column here
    for (const auto & predicate : join_info.expression.condition.predicates)
    {
        const Header & left_header = parent_node->children.front()->step->getOutputHeader();
        left_predicate_header.insert(left_header.getByName(predicate.left_node.getColumn().name));

        const Header & right_header = parent_node->children.back()->step->getOutputHeader();
        right_predicate_header.insert(right_header.getByName(predicate.right_node.getColumn().name));
    }

    std::optional<ActionsDAG> dag = ActionsDAG(left_predicate_header.getColumnsWithTypeAndName());

    /// left parameter of IN function
    std::vector<const ActionsDAG::Node *> left_columns = dag->getOutputs(); //actions.getOutputs();
    FunctionOverloadResolverPtr func_tuple_builder =
        std::make_unique<FunctionToOverloadResolverAdaptor>(std::make_shared<FunctionTuple>());
    const ActionsDAG::Node * in_lhs_arg = left_columns.size() == 1 ?
        left_columns.front() :
        &dag->addFunction(func_tuple_builder, std::move(left_columns), {});

    /// right parameter of IN function
    auto context = join->getContext();
    const auto & settings = context->getSettingsRef();
    auto future_set = std::make_shared<FutureSetFromSubquery>(
        CityHash_v1_0_2::uint128(),
        right_predicate_header.getColumnsWithTypeAndName(),
        settings[Setting::transform_null_in],
        PreparedSets::getSizeLimitsForSet(settings),
        settings[Setting::use_index_for_in_with_subqueries_max_values]);

    chassert(future_set->get() == nullptr);
    ColumnPtr set_col = ColumnSet::create(1, future_set);
    const ActionsDAG::Node * in_rhs_arg =
        &dag->addColumn({set_col, std::make_shared<DataTypeSet>(), "set column"});

    /// IN function
    auto func_in = FunctionFactory::instance().get("in", context);
    auto & in_node = dag->addFunction(func_in, {in_lhs_arg, in_rhs_arg}, "");
    dag->getOutputs().push_back(&in_node);

    /// Attach IN to FilterStep
    auto filter_step = std::make_unique<FilterStep>(left_predicate_header,
        std::move(*dag),
        in_node.result_name,
        false);
    filter_step->setStepDescription("WHERE");

    /// CreatingSetsStep as root
    Headers input_headers{output_header};
    auto creating_sets_step = std::make_unique<CreatingSetsStep>(input_headers);
    creating_sets_step->setStepDescription("Create sets before main query execution");

    /// creating_set_step as right subtree
    auto creating_set_step = future_set->build(right_predicate_header, context);

    auto & new_root = *getRoot(nodes, parent_node);

    /// Replace JoinStepLogical with FilterStep, but keep left subtree and remove right subtree
    parent_node->step = std::move(filter_step);
    QueryPlan::Node * right_tree = parent_node->children[1];
    parent_node->children.pop_back();

    /// CreatingSetsStep should be the root, use swap
    auto & old_root = nodes.emplace_back();
    std::swap(new_root, old_root);
    new_root.step = std::move(creating_sets_step);
    new_root.children.push_back(&old_root);

    /// Attach CreatingSetStep node to the CreatingSetsStep node
    auto & creating_set_node = nodes.emplace_back();
    creating_set_node.step = std::move(creating_set_step);
    creating_set_node.children.push_back(right_tree);
    new_root.children.push_back(&creating_set_node);

    return 1;
}

}
