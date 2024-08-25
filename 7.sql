-- create database
CREATE DATABASE BesantBank;

-- use db
USE BesantBank;

CREATE TABLE Accountdetails(
	AccountID INT PRIMARY KEY,
	Name CHAR(30) NOT NULL,
	Age TINYINT CHECK(Age >18),
	Accounttype VARCHAR(20),
	Currentbalance INT
);
SELECT * FROM accountdetails;

INSERT INTO Accountdetails (AccountID, Name, Age, Accounttype, Currentbalance)
VALUES
(1,'Ram',21,'Saving',2000);



CREATE TABLE Transactiondetails(
	TransactionID INT PRIMARY KEY AUTO_INCREMENT,
	AccountID INT,
	Transactiontype VARCHAR(10) CHECK(Transactiontype ='Credit' OR Transactiontype ='Debit'),
	Transactionamount INT, 
	Transactiontime DATETIME DEFAULT(NOW()),
	FOREIGN KEY(AccountID) REFERENCES Accountdetails (AccountID)
);

SELECT * FROM transactiondetails;

INSERT INTO Transactiondetails (AccountID,Transactiontype,Transactionamount)
VALUES
(1, 'Credit', 1000),
(2, 'Debit', 500);
-- (7, 'Credit', 1000);






