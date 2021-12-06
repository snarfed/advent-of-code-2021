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

WITH points AS (
SELECT x.v xv, y.v yv,
  mn(l1.x1, l1.x2) l1xs, mx(l1.x1, l1.x2) l1xe,  -- s for start, e for end
  mn(l2.x1, l2.x2) l2xs, mx(l2.x1, l2.x2) l2xe,
  mn(l1.y1, l1.y2) l1ys, mx(l1.y1, l1.y2) l1ye,  -- s for start, e for end
  mn(l2.y1, l2.y2) l2ys, mx(l2.y1, l2.y2) l2ye
FROM seq x
LEFT JOIN seq y ON TRUE
LEFT JOIN straight l1 ON TRUE
LEFT JOIN straight l2 ON l1.x1 != l2.x1 OR l1.x2 != l2.x2 OR l1.y1 != l2.y1 OR l1.y2 != l2.y2
WHERE
  -- horiz, overlapping
  (x.v = l1.x1 AND x.v = l1.x2 AND x.v = l2.x1 AND x.v = l2.x2
   AND y.v <= l1ye AND y.v <= l2ye
   AND y.v >= l1ys AND y.v >= l2ys)
  OR
  -- vert, overlapping
  (y.v = l1.y1 AND y.v = l1.y2 AND y.v = l2.y1 AND y.v = l2.y2
   AND x.v <= l1xe AND x.v <= l2xe
   AND x.v >= l1xs AND x.v >= l2xs)
  OR
  -- intersecting
  (x.v = l1.x1 AND x.v = l1.x2 AND y.v = l2.y1 AND y.v = l2.y2
   AND x.v <= l2xe AND x.v >= l2xs
   AND y.v <= l1ye AND y.v >= l1ys)
)

SELECT COUNT(DISTINCT xv, yv)
FROM points;
