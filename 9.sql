INSERT INTO Accountdetails  (AccountID, Name, Age, Accounttype, Currentbalance) VALUES
(2,'Sana',23,'Current',500),
(3,'John',27,'Saving',1000),
(4,'Peter',25,'Saving',1500),
(5,'Kiran',27,'Current',5200),
(6,'Priya',21,'Saving',5500),
(7,'Varun',28,'Current',500),
(8,'Sonu',29,'Saving',2500),
(9,'Kumar',28,'Saving',2000),
(10,'Jathin',27,'Current',5000),
(11,'Suma',22,'Saving',1500);


SELECT * FROM Accountdetails;

INSERT INTO Transactiondetails (AccountID,Transactiontype,Transactionamount)
VALUES
(7, 'Credit', 1000);

SELECT * FROM Transactiondetails;

-- step 1
SELECT DISTINCT(AccountID) FROM Transactiondetails;

-- step 2
SELECT * FROM Accountdetails WHERE AccountID IN (1,7);

-- step 3
SELECT * FROM Accountdetails
WHERE AccountID IN(
	SELECT DISTINCT(AccountID) FROM Transactiondetails);








