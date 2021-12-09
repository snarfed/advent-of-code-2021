--
-- PART 1
--
CREATE TABLE height (
  x INT,
  y INT,
  height INT,
);

\. day-9.input.sql

SELECT SUM(pt.height + 1)
FROM height pt
LEFT JOIN height AS l  ON l.x = pt.x - 1 AND l.y = pt.y
LEFT JOIN height AS r ON r.x = pt.x + 1 AND r.y = pt.y
LEFT JOIN height AS u ON u.x = pt.x AND u.y = pt.y - 1
LEFT JOIN height AS d ON d.x = pt.x AND d.y = pt.y + 1
WHERE (l.height > pt.height OR l.height IS NULL)
  AND (r.height > pt.height OR r.height IS NULL)
  AND (u.height > pt.height OR u.height IS NULL)
  AND (d.height > pt.height OR d.height IS NULL);
