-- Tags: deadlock

DROP TABLE IF EXISTS t;
CREATE TABLE t (x UInt8) ENGINE = TinyLog;

INSERT INTO t VALUES (1), (2), (3);
INSERT INTO t SELECT * FROM t;
SELECT count() FROM t;

DROP TABLE t;


CREATE TABLE t (x UInt8) ENGINE = Log;

INSERT INTO t VALUES (1), (2), (3);
INSERT INTO t SELECT * FROM t;
SELECT count() FROM t;

DROP TABLE t;


CREATE TABLE t (x UInt8) ENGINE = StripeLog;

INSERT INTO t VALUES (1), (2), (3);
INSERT INTO t SELECT * FROM t;
SELECT count() FROM t;

DROP TABLE t;
