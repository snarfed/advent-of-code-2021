-- ------
-- PART 1
-- ------

-- First, check that no endpoints are exactly the same:
-- sed 's/\ ->\ /\n/' day-5.input | sort | uniq -d

CREATE TABLE line (x1 INT, y1 INT, x2 INT, y2 INT);
CREATE VIEW straight AS SELECT * FROM line WHERE x1 = x2 OR y1 = y2;

-- shell: mysql advent -e "INSERT INTO line VALUES `sed 's/^/(/; s/\ ->\ /,/;  s/\$/),/' day-5.input` (null,null,null,null);"

-- MySQL (8) doesn't support CREATE SEQUENCE! Argh! OK here's a workaround:

CREATE TABLE seq (v INT);
-- shell: mysql advent -e "INSERT INTO seq VALUES (`seq -s '), (' 1 1000`);"

CREATE FUNCTION mx (a INT, b INT) RETURNS INT DETERMINISTIC RETURN IF(a > b, a, b);
CREATE FUNCTION mn (a INT, b INT) RETURNS INT DETERMINISTIC RETURN IF(a < b, a, b);

SELECT COUNT(DISTINCT x.v, y.v)
FROM seq x
LEFT JOIN seq y ON TRUE
LEFT JOIN straight l1 ON TRUE
LEFT JOIN straight l2 ON l1.x1 != l2.x1 OR l1.x2 != l2.x2 OR l1.y1 != l2.y1 OR l1.y2 != l2.y2
WHERE
  -- horiz, overlapping
  (x.v = l1.x1 AND x.v = l1.x2 AND x.v = l2.x1 AND x.v = l2.x2
   AND y.v <= mx(l1.y1, l1.y2) AND y.v <= mx(l2.y1, l2.y2)
   AND y.v >= mn(l1.y1, l1.y2) AND y.v >= mn(l2.y1, l2.y2))
  OR
  -- vert, overlapping
  (y.v = l1.y1 AND y.v = l1.y2 AND y.v = l2.y1 AND y.v = l2.y2
   AND x.v <= mx(l1.x1, l1.x2) AND x.v <= mx(l2.x1, l2.x2)
   AND x.v >= mn(l1.x1, l1.x2) AND x.v >= mn(l2.x1, l2.x2))
  OR
  -- intersecting
  (x.v = l1.x1 AND x.v = l1.x2 AND y.v = l2.y1 AND y.v = l2.y2
   AND x.v <= mx(l2.x1, l2.x2) AND x.v >= mn(l2.x1, l2.x2)
   AND y.v <= mx(l1.y1, l1.y2) AND y.v >= mn(l1.y1, l1.y2))


-- ------
-- PART 2
-- ------

CREATE VIEW diag AS SELECT * FROM line WHERE x1 != x2 AND y1 != y2;

-- In progress, trying to find pairs of lines with different orientations
SELECT *
FROM diag d1
LEFT JOIN diag d2 ON
  (SIGN(d1.y2 - d1.y1) - SIGN(d1.x2 - d1.x1) !=
   SIGN(d2.y2 - d2.y1) - SIGN(d2.x2 - d2.x1))
LIMIT 100;


-- Runs too long on my computer :/
SELECT COUNT(DISTINCT x.v, y.v)
FROM seq x
LEFT JOIN seq y ON TRUE
LEFT JOIN line l1 ON TRUE
LEFT JOIN line l2 ON l1.x1 != l2.x1 OR l1.x2 != l2.x2 OR l1.y1 != l2.y1 OR l1.y2 != l2.y2
WHERE
  -- l1 diagonal
  (mx(l1.x1, l1.x2) - x.v = x.v - mn(l1.x1, l1.x2) AND
   mx(l1.y1, l1.y2) - y.v = y.v - mn(l1.y1, l1.y2) AND (
    -- l2 diagonal
    (mx(l2.x1, l2.x2) - x.v = x.v - mn(l2.x1, l2.x2) AND
     mx(l2.y1, l2.y2) - y.v = y.v - mn(l2.y1, l2.y2))
    OR
    -- l2 horiz
    (x.v = l2.x1 AND x.v = l2.x2
     AND y.v >= mn(l2.y1, l2.y2) AND y.v >= mn(l2.y1, l2.y2))
    OR
    -- l2 vert
    (y.v = l2.y1 AND y.v = l2.y2
     AND x.v >= mn(l2.x1, l2.x2) AND x.v >= mn(l2.x1, l2.x2))))
  OR
  -- horiz, overlapping
  (x.v = l1.x1 AND x.v = l1.x2 AND x.v = l2.x1 AND x.v = l2.x2
   AND y.v <= mx(l1.y1, l1.y2) AND y.v <= mx(l2.y1, l2.y2)
   AND y.v >= mn(l1.y1, l1.y2) AND y.v >= mn(l2.y1, l2.y2))
  OR
  -- vert, overlapping
  (y.v = l1.y1 AND y.v = l1.y2 AND y.v = l2.y1 AND y.v = l2.y2
   AND x.v <= mx(l1.x1, l1.x2) AND x.v <= mx(l2.x1, l2.x2)
   AND x.v >= mn(l1.x1, l1.x2) AND x.v >= mn(l2.x1, l2.x2))
  OR
  -- intersecting
  (x.v = l1.x1 AND x.v = l1.x2 AND y.v = l2.y1 AND y.v = l2.y2
   AND x.v <= mx(l2.x1, l2.x2) AND x.v >= mn(l2.x1, l2.x2)
   AND y.v <= mx(l1.y1, l1.y2) AND y.v >= mn(l1.y1, l1.y2));
