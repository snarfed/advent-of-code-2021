--
-- PART 1
--
CREATE TABLE h (
  x INT,
  y INT,
  h INT,
);

\. day-9.input.sql

SELECT SUM(pt.h + 1)
FROM height pt
LEFT JOIN height AS l  ON l.x = pt.x - 1 AND l.y = pt.y
LEFT JOIN height AS r ON r.x = pt.x + 1 AND r.y = pt.y
LEFT JOIN height AS u ON u.x = pt.x AND u.y = pt.y - 1
LEFT JOIN height AS d ON d.x = pt.x AND d.y = pt.y + 1
WHERE (l.h > pt.h OR l.h IS NULL)
  AND (r.h > pt.h OR r.h IS NULL)
  AND (u.h > pt.h OR u.h IS NULL)
  AND (d.h > pt.h OR d.h IS NULL);


--
-- PART 2
--
SELECT
  CASE
    WHEN pt.h = 9 THEN ' '
    WHEN l.h IS NOT NULL AND IFNULL(l.h < pt.h, TRUE) AND IFNULL(l.h < r.h, TRUE) AND IFNULL(l.h < u.h, TRUE) AND IFNULL(l.h < d.h, TRUE) THEN 'L'
    WHEN r.h IS NOT NULL AND IFNULL(r.h < pt.h, TRUE) AND IFNULL(r.h < l.h, TRUE) AND IFNULL(r.h < u.h, TRUE) AND IFNULL(r.h < d.h, TRUE) THEN 'R'
    WHEN u.h IS NOT NULL AND IFNULL(u.h < pt.h, TRUE) AND IFNULL(u.h < l.h, TRUE) AND IFNULL(u.h < r.h, TRUE) AND IFNULL(u.h < d.h, TRUE) THEN 'U'
    WHEN d.h IS NOT NULL AND IFNULL(d.h < pt.h, TRUE) AND IFNULL(d.h < l.h, TRUE) AND IFNULL(d.h < r.h, TRUE) AND IFNULL(d.h < u.h, TRUE) THEN 'D'
    ELSE 'X'
  END

FROM height pt
LEFT JOIN height AS l ON l.x = pt.x - 1 AND l.y = pt.y
LEFT JOIN height AS r ON r.x = pt.x + 1 AND r.y = pt.y
LEFT JOIN height AS u ON u.x = pt.x AND u.y = pt.y - 1
LEFT JOIN height AS d ON d.x = pt.x AND d.y = pt.y + 1
ORDER BY pt.y, pt.x;
