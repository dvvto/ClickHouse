#!/usr/bin/env bash
# Tags: long, no-fasttest

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=../shell_config.sh
. "$CURDIR"/../shell_config.sh

query="SELECT toDate('2020-12-12') as datetime, 'test-pipeline' as pipeline, 'clickhouse-test-host-001.clickhouse.com' as host, 'clickhouse' as home, 'clickhouse' as detail, number as row_number FROM numbers(1000000) SETTINGS max_block_size=65505 FORMAT JSON"

${CLICKHOUSE_CURL} -sS -H 'Accept-Encoding: zstd' \
    "${CLICKHOUSE_URL}&enable_http_compression=1" -d "${query}" |& zstdX 2>/dev/null ||:
