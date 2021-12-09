-- number of segments: digits
-- 1: -
-- 2: 1
-- 3: 7
-- 4: 4
-- 5: 2, 3, 5
-- 6: 0, 6, 9
-- 7: 8

CREATE TABLE digits (
 num INT,
 a BOOL, b BOOL, c BOOL, d BOOL, e BOOL, f BOOL, g BOOL
);

INSERT INTO digits VALUES
(0, 1, 1, 1, 0, 1, 1, 1),
(1, 0, 0, 1, 0, 0, 1, 0),
(2, 1, 0, 1, 1, 1, 0, 1),
(3, 1, 0, 1, 1, 0, 1, 1),
(4, 0, 1, 1, 1, 0, 1, 0),
(5, 1, 1, 0, 1, 0, 1, 1),
(6, 1, 1, 0, 1, 1, 1, 1),
(7, 1, 0, 1, 0, 0, 1, 0),
(8, 1, 1, 1, 1, 1, 1, 1),
(9, 1, 1, 1, 1, 0, 1, 1);

CREATE TABLE seen (
 display INT,
 a BOOL, b BOOL, c BOOL, d BOOL, e BOOL, f BOOL, g BOOL
);

CREATE TABLE input (
 display INT,
 a BOOL, b BOOL, c BOOL, d BOOL, e BOOL, f BOOL, g BOOL
);

\. day-8.input.sql
