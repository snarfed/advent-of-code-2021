-- ------
-- PART 1
-- ------

CREATE TABLE board (
  id INT AUTO_INCREMENT,
  a1 INT, a2 INT, a3 INT, a4 INT, a5 INT,
  b1 INT, b2 INT, b3 INT, b4 INT, b5 INT,
  c1 INT, c2 INT, c3 INT, c4 INT, c5 INT,
  d1 INT, d2 INT, d3 INT, d4 INT, d5 INT,
  e1 INT, e2 INT, e3 INT, e4 INT, e5 INT,
  PRIMARY KEY (id)
);

CREATE TABLE num (
  id INT AUTO_INCREMENT,
  val INT,
  PRIMARY KEY (id)
)

CREATE VIEW n AS SELECT val FROM num ORDER BY id;  -- limit 24
SELECT id FROM board
WHERE
  (a1 IN(TABLE n) AND a2 IN(TABLE n) AND a3 IN(TABLE n) AND a4 IN(TABLE n) AND a5 IN(TABLE n)) OR
  (b1 IN(TABLE n) AND b2 IN(TABLE n) AND b3 IN(TABLE n) AND b4 IN(TABLE n) AND b5 IN(TABLE n)) OR
  (c1 IN(TABLE n) AND c2 IN(TABLE n) AND c3 IN(TABLE n) AND c4 IN(TABLE n) AND c5 IN(TABLE n)) OR
  (d1 IN(TABLE n) AND d2 IN(TABLE n) AND d3 IN(TABLE n) AND d4 IN(TABLE n) AND d5 IN(TABLE n)) OR
  (e1 IN(TABLE n) AND e2 IN(TABLE n) AND e3 IN(TABLE n) AND e4 IN(TABLE n) AND e5 IN(TABLE n)) OR
  (a1 IN(TABLE n) AND b1 IN(TABLE n) AND c1 IN(TABLE n) AND d1 IN(TABLE n) AND e1 IN(TABLE n)) OR
  (a2 IN(TABLE n) AND b2 IN(TABLE n) AND c2 IN(TABLE n) AND d2 IN(TABLE n) AND e2 IN(TABLE n)) OR
  (a3 IN(TABLE n) AND b3 IN(TABLE n) AND c3 IN(TABLE n) AND d3 IN(TABLE n) AND e3 IN(TABLE n)) OR
  (a4 IN(TABLE n) AND b4 IN(TABLE n) AND c4 IN(TABLE n) AND d4 IN(TABLE n) AND e4 IN(TABLE n)) OR
  (a5 IN(TABLE n) AND b5 IN(TABLE n) AND c5 IN(TABLE n) AND d5 IN(TABLE n) AND e5 IN(TABLE n));

-- num 24, board 70

SELECT
  IF(a1 IN(TABLE n), 0, a1) +
  IF(a2 IN(TABLE n), 0, a2) +
  IF(a3 IN(TABLE n), 0, a3) +
  IF(a4 IN(TABLE n), 0, a4) +
  IF(a5 IN(TABLE n), 0, a5) +
  IF(b1 IN(TABLE n), 0, b1) +
  IF(b2 IN(TABLE n), 0, b2) +
  IF(b3 IN(TABLE n), 0, b3) +
  IF(b4 IN(TABLE n), 0, b4) +
  IF(b5 IN(TABLE n), 0, b5) +
  IF(c1 IN(TABLE n), 0, c1) +
  IF(c2 IN(TABLE n), 0, c2) +
  IF(c3 IN(TABLE n), 0, c3) +
  IF(c4 IN(TABLE n), 0, c4) +
  IF(c5 IN(TABLE n), 0, c5) +
  IF(d1 IN(TABLE n), 0, d1) +
  IF(d2 IN(TABLE n), 0, d2) +
  IF(d3 IN(TABLE n), 0, d3) +
  IF(d4 IN(TABLE n), 0, d4) +
  IF(d5 IN(TABLE n), 0, d5) +
  IF(e1 IN(TABLE n), 0, e1) +
  IF(e2 IN(TABLE n), 0, e2) +
  IF(e3 IN(TABLE n), 0, e3) +
  IF(e4 IN(TABLE n), 0, e4) +
  IF(e5 IN(TABLE n), 0, e5)
FROM board WHERE id=70;

SELECT val FROM num WHERE id=24;


-- ------
-- PART 2
-- ------

DROP VIEW n; CREATE VIEW n AS SELECT val FROM num ORDER BY id;
SELECT COUNT(DISTINCT id) FROM board
WHERE
  (a1 IN(TABLE n) AND a2 IN(TABLE n) AND a3 IN(TABLE n) AND a4 IN(TABLE n) AND a5 IN(TABLE n)) OR
  (b1 IN(TABLE n) AND b2 IN(TABLE n) AND b3 IN(TABLE n) AND b4 IN(TABLE n) AND b5 IN(TABLE n)) OR
  (c1 IN(TABLE n) AND c2 IN(TABLE n) AND c3 IN(TABLE n) AND c4 IN(TABLE n) AND c5 IN(TABLE n)) OR
  (d1 IN(TABLE n) AND d2 IN(TABLE n) AND d3 IN(TABLE n) AND d4 IN(TABLE n) AND d5 IN(TABLE n)) OR
  (e1 IN(TABLE n) AND e2 IN(TABLE n) AND e3 IN(TABLE n) AND e4 IN(TABLE n) AND e5 IN(TABLE n)) OR
  (a1 IN(TABLE n) AND b1 IN(TABLE n) AND c1 IN(TABLE n) AND d1 IN(TABLE n) AND e1 IN(TABLE n)) OR
  (a2 IN(TABLE n) AND b2 IN(TABLE n) AND c2 IN(TABLE n) AND d2 IN(TABLE n) AND e2 IN(TABLE n)) OR
  (a3 IN(TABLE n) AND b3 IN(TABLE n) AND c3 IN(TABLE n) AND d3 IN(TABLE n) AND e3 IN(TABLE n)) OR
  (a4 IN(TABLE n) AND b4 IN(TABLE n) AND c4 IN(TABLE n) AND d4 IN(TABLE n) AND e4 IN(TABLE n)) OR
  (a5 IN(TABLE n) AND b5 IN(TABLE n) AND c5 IN(TABLE n) AND d5 IN(TABLE n) AND e5 IN(TABLE n));


-- num 90, board 10
SELECT
  IF(a1 IN(TABLE n), 0, a1) +
  IF(a2 IN(TABLE n), 0, a2) +
  IF(a3 IN(TABLE n), 0, a3) +
  IF(a4 IN(TABLE n), 0, a4) +
  IF(a5 IN(TABLE n), 0, a5) +
  IF(b1 IN(TABLE n), 0, b1) +
  IF(b2 IN(TABLE n), 0, b2) +
  IF(b3 IN(TABLE n), 0, b3) +
  IF(b4 IN(TABLE n), 0, b4) +
  IF(b5 IN(TABLE n), 0, b5) +
  IF(c1 IN(TABLE n), 0, c1) +
  IF(c2 IN(TABLE n), 0, c2) +
  IF(c3 IN(TABLE n), 0, c3) +
  IF(c4 IN(TABLE n), 0, c4) +
  IF(c5 IN(TABLE n), 0, c5) +
  IF(d1 IN(TABLE n), 0, d1) +
  IF(d2 IN(TABLE n), 0, d2) +
  IF(d3 IN(TABLE n), 0, d3) +
  IF(d4 IN(TABLE n), 0, d4) +
  IF(d5 IN(TABLE n), 0, d5) +
  IF(e1 IN(TABLE n), 0, e1) +
  IF(e2 IN(TABLE n), 0, e2) +
  IF(e3 IN(TABLE n), 0, e3) +
  IF(e4 IN(TABLE n), 0, e4) +
  IF(e5 IN(TABLE n), 0, e5)
FROM board WHERE id=10;

SELECT val FROM num WHERE id=90;
