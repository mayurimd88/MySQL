-- enable permission for user functions
SET GLOBAL LOG_BIN_TRUST_FUNCTION_CREATORS=1;


-- system functions
------------------------- AGGREGATE FUNCTIONS ---------------------
-- sum function
SELECT SUM(Currentbalance) AS Totalbalance
FROM Accountdetails;

-- max function
SELECT MAX(Currentbalance) AS Maxbalance
FROM Accountdetails;

-- min function
SELECT MIN(Currentbalance) AS Minbalance
FROM Accountdetails;

-- count function
SELECT COUNT(Currentbalance) AS Totalrecords
FROM Accountdetails;

SELECT COUNT(*) AS Totalrecords
FROM Accountdetails;

-- distinct function
SELECT DISTINCT(Accounttype) AS UniqueAccountType
FROM Accountdetails;

-- average function
SELECT AVG(Currentbalance) AS Averagebalance
FROM Accountdetails;

SELECT ROUND(AVG(Currentbalance)) AS Averagebalance
FROM Accountdetails;

------------------------------ TEXT FUNCTIONS ------------------------

-- concat function
SELECT CONCAT(AccountID, ' ', Name, ' ', Accountstatus) AS Customer_details
FROM Accountdetails;

SELECT CONCAT('Tharun',' ', 'Challa') AS FullName;

-- upper function
SELECT UPPER(Name) AS CapitalCharacters
 FROM Accountdetails;

-- lower function
SELECT LOWER(Name) AS SmallCharacters
 FROM Accountdetails;
 
-- trim function
SELECT TRIM(' MYSQL WORKBENCH ') AS cleandata;

-- ltrim function
SELECT LTRIM(' MYSQL WORKBENCH ') AS Leftcleandata;

-- rtrim function
SELECT RTRIM(' MYSQL WORKBENCH ') AS Rightcleandata;

-- length function
SELECT LENGTH('MYSQL WORKBENCH') AS Textlength;

-- charindex function
-- SELECT CHARINDEX('a',Name) FROM Accountdetails;
-- instr function
SELECT Name,INSTR(Name,'a') AS Position FROM Accountdetails;

---------- DATE & TIME FUNCTIONS--------------

-- now()
SELECT NOW();

-- timestampdiff()
SELECT TIMESTAMPDIFF(DAY,'2024-08-01','2024-08-10') AS Datediff;
       
-- current_date()
SELECT CURRENT_DATE;

-- year()
SELECT YEAR('2024-08-05') AS Year;

-- month()
SELECT MONTH('2024-08-05') AS Month;

-- day()
SELECT DAY('2024-08-05') AS Day;

-- monthname()
SELECT MONTHNAME('2024-08-11') AS month_name;

-- date_add()
SELECT DATE_ADD('2024-08-05', INTERVAL 5 DAY) AS Newdate;
    
-- dayofweek()
SELECT DAYOFWEEK('2024-08-05')AS WeekNo ;

------------- Ranking functions -------

CREATE TABLE studentsmarks(
	Name CHAR(30) NOT NULL,
	Subject VARCHAR(20),
	Marks INT
);
INSERT INTO studentsmarks VALUES
('Ram','Maths',99),('Sana','Maths',85),
('John','Maths',99),('Peter','Maths',90),
('Ram','Science',99),('Sana','Science',92),
('John','Science',96),('Peter','Science',94);

SELECT Name, Subject, Marks,
	RANK() OVER(PARTITION BY Subject ORDER BY Marks DESC) AS Stud_rank
FROM studentsmarks;

SELECT Name, Subject, Marks,
	DENSE_RANK() OVER(PARTITION BY Subject ORDER BY Marks DESC) AS Stud_rank
FROM studentsmarks;


INSERT INTO studentsmarks VALUES
('Ram','Maths',99),('Sana','Maths',85),('Sana','Maths',85),('Sana','Maths',85),
('John','Maths',99),('Peter','Maths',90),
('Ram','Science',99),('Sana','Science',92),
('John','Science',96),('Peter','Science',94),('John','Science',96);

SELECT Name, Subject, Marks,
	ROW_NUMBER() OVER(PARTITION BY Name, Subject, Marks) AS Rowno
FROM studentsmarks;


-------------- statistical function ------------
CREATE TABLE empsalary(
	Name CHAR(30) NOT NULL,
	Year INT,
	Salary INT
);
INSERT INTO empsalary VALUES
('Ram',2018,15000),('Ram',2019,23000),('Ram',2020,25000),
('Ram',2021,27000),('Ram',2022,30000),('Ram',2023,35000),
('John',2020,22000),('John',2021,25000),
('John',2022,29000),('John',2023,32000);

SELECT *, LAG(Salary) OVER(PARTITION BY Name) AS Previousval
FROM empsalary;

SELECT *, LEAD(Salary) OVER(PARTITION BY Name) AS Nextval
FROM empsalary;


















