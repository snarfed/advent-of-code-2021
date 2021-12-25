CREATE TABLE cucumber (
  x INT,
  y INT,
  dir CHAR(1),
  step INT DEFAULT 0
);

delimiter //
DROP PROCEDURE run//
CREATE PROCEDURE run(steps INT)
BEGIN
  SET @i = 1;
  REPEAT
    SET @cur_step = (SELECT MAX(step) FROM cucumber);

    INSERT INTO cucumber
      SELECT IFNULL(next.x, cur.x), IFNULL(next.y, cur.y), cur.dir, cur.step + 1
      FROM cucumber cur
      LEFT JOIN cucumber next ON
        next.x = (cur.x + IF(cur.dir = 'R', 1, 0)) % 139 AND
        next.y = (cur.y + IF(cur.dir = 'D', 1, 0)) % 137
      WHERE cur.step = @cur_step AND (next.step = @cur_step OR next.step IS NULL);

    SET @i = @i + 1;
  UNTIL @i > steps END REPEAT;
END//
delimiter ;

-- CREATE PROCEDURE render(step INT)
-- BEGIN
--   SET @cur_step = SELECT MAX(step) FROM cucumber;

--     INSERT INTO cucumber
--       SELECT IFNULL(next.x, cur.x), IFNULL(next.y, cur.y), cur.dir, cur.step + 1
--       FROM cucumber cur
--       LEFT JOIN cucumber next ON
--         next.x = (cur.x + IF(cur.dir = 'R', 1, 0)) % 139 AND
--         next.y = (cur.y + IF(cur.dir = 'D', 1, 0)) % 137
--       WHERE cur.step = cur_step AND next.step IN (cur_step, NULL);

--     SET @i = @i + 1;
--   UNTIL @i > steps END REPEAT;
-- END//
delimiter ;

INSERT INTO cucumber(x, y, dir) VALUES

(0, 0, 'D'),
(4, 0, 'R'),
(5, 0, 'R'),
(7, 0, 'D'),
(8, 0, 'D'),
(9, 0, 'R'),

(1, 1, 'D'),
(2, 1, 'D'),
(3, 1, 'R'),
(4, 1, 'R'),
(6, 1, 'D'),
(7, 1, 'D'),

(0, 2, 'R'),
(1, 2, 'R'),
(3, 2, 'R'),
(4, 2, 'D'),
(5, 2, 'R'),
(9, 2, 'D'),

(0, 3, 'R'),
(1, 3, 'R'),
(2, 3, 'D'),
(3, 3, 'R'),
(4, 3, 'R'),
(6, 3, 'R'),
(8, 3, 'D'),

(0, 4, 'D'),
(1, 4, 'R'),
(2, 4, 'D'),
(4, 4, 'D'),
(5, 4, 'D'),
(7, 4, 'D'),

(0, 5, 'R'),
(2, 5, 'R'),
(3, 5, 'R'),
(6, 5, 'D'),

(1, 6, 'D'),
(2, 6, 'D'),
(5, 6, 'R'),
(7, 6, 'R'),
(8, 6, 'D'),

(0, 7, 'D'),
(2, 7, 'D'),
(5, 7, 'R'),
(6, 7, 'R'),
(7, 7, 'D'),
(9, 7, 'D'),

(4, 8, 'D'),
(7, 8, 'D'),
(9, 8, 'R');
