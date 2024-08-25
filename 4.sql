-------------------- COMMANDS ----------------------

ALTER TABLE students
ADD location VARCHAR(20);

SELECT * FROM students;

DROP TABLE students;

DROP DATABASE practice;

TRUNCATE TABLE students;

SELECT * FROM students;

UPDATE students
SET location = "Bangalore"
WHERE StudentID IN (1,3);

UPDATE students
SET location = "Chennai"
WHERE StudentID = 2;

UPDATE students
SET location = "Hyderabad"
WHERE StudentID = 4;

SELECT * FROM students;

DELETE FROM students
WHERE StudentID = 4;

SELECT * FROM students;

-- to print all columns from table
SELECT * FROM students;

-- to print selected columns
SELECT Name, Gender, Location 
FROM students;

-- print count of students/records
SELECT COUNT(*) AS Np_pf_students
 FROM students;

-- print students from bangalore
SELECT StudentID, Name
FROM students
WHERE location = "Bangalore";

-- print unique/distinct locations
SELECT DISTINCT location 
from students;

-- print top/asc 2 names only 
SELECT Name FROM Students
LIMIT 2;

-- commit 
-- turn off autocommit mode
SET AUTOCOMMIT = 0;
-- TCL start
START TRANSACTION;
-- query 1
SELECT * FROM students;
-- query 2
DELETE FROM students
WHERE StudentID = 4;
-- close transaction/save permanently
COMMIT;

-- rollback 
-- turn off autocommit mode
SET AUTOCOMMIT = 0;
-- TCL start
START TRANSACTION;
-- query 1
SELECT * FROM students;
-- query 2
DELETE FROM students
WHERE StudentID = 4;
-- undo deleted query
ROLLBACK;
-- close transaction/save permanently
COMMIT;

-- savepoint 
-- turn off autocommit mode
SET AUTOCOMMIT = 0;
-- TCL start
START TRANSACTION;
SAVEPOINT A; -- define savepoint
SELECT * FROM students; -- query 1
SAVEPOINT B; -- define savepoint
DELETE FROM students
WHERE StudentID = 4; -- query 2
ROLLBACK TO B;  -- undo deleted query
-- close transaction/save permanently
COMMIT;
