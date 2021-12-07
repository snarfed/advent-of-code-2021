CREATE TABLE generation (
  d0 INT,  -- number of lanternfish currently at this timer
  d1 INT,
  d2 INT,
  d3 INT,
  d4 INT,
  d5 INT,
  d6 INT,
  d7 INT,
  d8 INT,
  id INT AUTO_INCREMENT,
  PRIMARY KEY (id)
);

-- Get initial generation with:
-- $ sed 's/,/\n/g' day-6.input | sort | uniq -c
-- 116 1
--  45 2
--  42 3
--  48 4
--  49 5

INSERT INTO generation(d0, d1, d2, d3, d4, d5, d6, d7, d8)
  VALUES(0, 116, 45, 42, 48, 49, 0, 0, 0);

delimiter //
CREATE PROCEDURE simulate(generations INT)
BEGIN
  SET @i = 1;
  REPEAT
    INSERT INTO generation(d0, d1, d2, d3, d4, d5, d6, d7, d8)
    SELECT d1, d2, d3, d4, d5, d6, d0 + d7, d8, d0
      FROM generation ORDER BY id DESC LIMIT 1;
    SET @i = @i + 1;
  UNTIL @i > generations END REPEAT;
END//
delimiter ;

CALL simulate(80);

SELECT d0 + d1 + d2 + d3 + d4 + d5 + d6 + d7 + d8
FROM generation
WHERE id = 81;
