#pragma once

#include <Parsers/ASTQueryWithOutput.h>
#include <Parsers/ASTQueryWithOnCluster.h>


namespace DB
{
using Strings = std::vector<String>;
using DatabaseAndTableName = std::pair<String, String>;
class ASTFunction;


/** BACKUP { TABLE [db.]table_name [AS [db.]table_name_in_backup] [PARTITION[S] partition_expr [,...]] |
  *          DICTIONARY [db.]dictionary_name [AS [db.]dictionary_name_in_backup] |
  *          DATABASE database_name [AS database_name_in_backup] [EXCEPT TABLES ...] |
  *          TEMPORARY TABLE table_name [AS table_name_in_backup] |
  *          ALL [EXCEPT {TABLES|DATABASES}...] } [,...]
  *        [ON CLUSTER 'cluster_name']
  *        TO { File('path/') |
  *             Disk('disk_name', 'path/') }
  *        [SETTINGS ...]
  *
  * RESTORE { TABLE [db.]table_name_in_backup [AS [db.]table_name] [PARTITION[S] partition_expr [,...]] |
  *           DICTIONARY [db.]dictionary_name_in_backup [AS [db.]dictionary_name] |
  *           DATABASE database_name_in_backup [AS database_name] [EXCEPT TABLES ...] |
  *           TEMPORARY TABLE table_name_in_backup [AS table_name] |
  *           ALL [EXCEPT {TABLES|DATABASES} ...] } [,...]
  *         [ON CLUSTER 'cluster_name']
  *         FROM { File('path/') |
  *                Disk('disk_name', 'path/') }
  *        [SETTINGS ...]
  *
  * Notes:
  * RESTORE doesn't drop any data, it either creates a table or appends an existing table with restored data.
  * This behaviour can cause data duplication.
  * If appending isn't possible because the existing table has incompatible format then RESTORE will throw an exception.
  *
  * The "AS" clause is useful to backup or restore under another name.
  * For the BACKUP command this clause allows to set the name which an object will have inside the backup.
  * And for the RESTORE command this clause allows to set the name which an object will have after RESTORE has finished.
  */
class ASTBackupQuery : public ASTQueryWithOutput, public ASTQueryWithOnCluster
{
public:
    enum Kind
    {
        BACKUP,
        RESTORE,
    };
    Kind kind = Kind::BACKUP;

    enum ElementType
    {
        TABLE,
        TEMPORARY_TABLE,
        DATABASE,
        ALL,
    };

    struct Element
    {
        ElementType type;
        String table_name;
        String database_name;
        String new_table_name; /// usually the same as `table_name`, can be different in case of using AS <new_name>
        String new_database_name; /// usually the same as `database_name`, can be different in case of using AS <new_name>
        std::optional<ASTs> partitions;
        std::set<DatabaseAndTableName> except_tables;
        std::set<String> except_databases;

        void setCurrentDatabase(const String & current_database);
    };

    using Elements = std::vector<Element>;
    static void setCurrentDatabase(Elements & elements, const String & current_database);
    void setCurrentDatabase(const String & current_database) { setCurrentDatabase(elements, current_database); }

    Elements elements;

    ASTFunction * backup_name = nullptr;

    ASTPtr settings;

    /// Base backup. Only differences made after the base backup will be included in a newly created backup,
    /// so this setting allows to make an incremental backup.
    ASTFunction * base_backup_name = nullptr;

    /// List of cluster's hosts' IDs if this is a BACKUP/RESTORE ON CLUSTER command.
    ASTPtr cluster_host_ids;

    String getID(char) const override;
    ASTPtr clone() const override;
    void formatQueryImpl(WriteBuffer & ostr, const FormatSettings & fs, FormatState &, FormatStateStacked) const override;
    ASTPtr getRewrittenASTWithoutOnCluster(const WithoutOnClusterASTRewriteParams &) const override;
    QueryKind getQueryKind() const override;

    void forEachPointerToChild(std::function<void(void**)> f) override
    {
        f(reinterpret_cast<void **>(&backup_name));
        f(reinterpret_cast<void **>(&base_backup_name));
    }
};

}
