-- JOINS

CREATE TABLE Employee (
EmpID TINYINT PRIMARY KEY,
EmpName VARCHAR(20) NOT NULL,
DepartmentID TINYINT
);

INSERT INTO Employee VALUES 
(01, 'Ram', 101),
(02, 'Sham', 102),
(03, 'Peter', 101),
(04, 'John', 103);

CREATE TABLE Department (
DepartmentID TINYINT PRIMARY KEY,
DeptName VARCHAR(20) NOT NULL
);

INSERT INTO department VALUES 
(101, 'IT'),
(102, 'HR'),
(103, 'Sales'),
(104, 'Marketing');

-- INNER JOIN
SELECT e.EmpID, e.EmpName, d.DeptName
FROM employee AS e
INNER JOIN department AS d
ON e.DepartmentID = d.DepartmentID;

SELECT *
FROM employee AS e
INNER JOIN department AS d
ON e.DepartmentID = d.DepartmentID;

-- LEFT OUTER JOIN
SELECT e.EmpID, e.EmpName, d.DepartmentID, d.DeptName
FROM employee AS e
LEFT JOIN department AS d
ON e.DepartmentID = d.DepartmentID;

-- RIGHT OUTER JOIN
SELECT e.EmpID, e.EmpName, d.DepartmentID, d.DeptName
FROM employee AS e
RIGHT JOIN department AS d
ON e.DepartmentID = d.DepartmentID;

-- FULL OUTER JOIN
SELECT e.EmpID, e.EmpName, d.DepartmentID, d.DeptName
FROM employee AS e
LEFT JOIN department AS d
ON e.DepartmentID = d.DepartmentID
UNION 
SELECT e.EmpID, e.EmpName, d.DepartmentID, d.DeptName
FROM employee AS e
RIGHT JOIN department AS d
ON e.DepartmentID = d.DepartmentID;

SELECT e.EmpID, e.EmpName, d.DepartmentID, d.DeptName
FROM employee AS e
LEFT JOIN department AS d
ON e.DepartmentID = d.DepartmentID
UNION ALL
SELECT e.EmpID, e.EmpName, d.DepartmentID, d.DeptName
FROM employee AS e
RIGHT JOIN department AS d
ON e.DepartmentID = d.DepartmentID;

-- CROSS JOIN
SELECT e.EmpID, e.EmpName, d.DeptName
FROM employee AS e
CROSS JOIN department AS d;



create table company
(emp_id int,
emp_name varchar(50),
manager_id int);
insert into company
values (1, "john",0),
(2, "alice", 1),
(3, "bob", 1),
(4, "mary", 2);

-- self join
SELECT c.emp_name AS employee_name, 
		m.emp_name AS manager_name
FROM company c
 JOIN company m 
ON c.manager_id = m.emp_id;











