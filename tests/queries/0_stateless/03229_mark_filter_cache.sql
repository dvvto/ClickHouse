SET use_mark_filter_cache = true;

DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (`a` Int64, `b` Int64) ENGINE = MergeTree ORDER BY a;
INSERT INTO t1 SELECT number, number FROM numbers(1000000);

SELECT a FROM t1 WHERE b = 10000;
SELECT b FROM t1 WHERE b = 10000;
SELECT b FROM t1 WHERE b = 10000;
SELECT * FROM t1 WHERE b = 10000;

SELECT a FROM t1 WHERE b > 1000 AND b < 10003 ORDER BY ALL LIMIT 5;
SELECT b FROM t1 WHERE b > 1000 AND b < 10003 ORDER BY ALL LIMIT 5;
SELECT b FROM t1 WHERE b > 1000 AND b < 10003 ORDER BY ALL LIMIT 5;
SELECT * FROM t1 WHERE b > 1000 AND b < 10003 ORDER BY ALL LIMIT 5;

SELECT 'Test optimize_move_to_prewhere=false';
DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (`a` Int64, `b` Int64) ENGINE = MergeTree ORDER BY a;
INSERT INTO t1 SELECT number, number FROM numbers(1000000);

SELECT a FROM t1 WHERE b = 10000 SETTINGS optimize_move_to_prewhere=false;
SELECT b FROM t1 WHERE b = 10000 SETTINGS optimize_move_to_prewhere=false;
SELECT * FROM t1 WHERE b = 10000 SETTINGS optimize_move_to_prewhere=false;

SELECT a FROM t1 WHERE b > 1000 AND b < 10003 ORDER BY ALL LIMIT 5 SETTINGS optimize_move_to_prewhere=false;
SELECT b FROM t1 WHERE b > 1000 AND b < 10003 ORDER BY ALL LIMIT 5 SETTINGS optimize_move_to_prewhere=false;
SELECT * FROM t1 WHERE b > 1000 AND b < 10003 ORDER BY ALL LIMIT 5 SETTINGS optimize_move_to_prewhere=false;

SELECT 'Test drop partition';
ALTER TABLE t1 DROP PARTITION tuple();
INSERT INTO t1 SELECT number * 10, number FROM numbers(1000000);

SELECT a FROM t1 WHERE b = 10000;
SELECT b FROM t1 WHERE b = 10000;
SELECT * FROM t1 WHERE b = 10000;

SELECT 'Test drop table';
DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (`a` Int64, `b` Int64) ENGINE = MergeTree ORDER BY a;
INSERT INTO t1 SELECT number * 100, number FROM numbers(1000000);

SELECT a FROM t1 WHERE b = 10000;
SELECT b FROM t1 WHERE b = 10000;
SELECT * FROM t1 WHERE b = 10000;


DROP TABLE IF EXISTS t1;
