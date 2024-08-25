-- create view
CREATE VIEW AccountsOfTransactions AS
	-- query to be placed in view
	SELECT * FROM Accountdetails WHERE AccountID IN (
	SELECT DISTINCT(AccountID) FROM Transactiondetails);

-- execute view
SELECT * FROM AccountsOfTransactions;

-- insert new record in tran. table
INSERT INTO Transactiondetails (AccountID,Transactiontype,Transactionamount)
VALUES
(2, 'Credit', 1000);

-- execute view
SELECT * FROM AccountsOfTransactions;

-- updatable view
UPDATE AccountsOfTransactions
SET Name='Ram Prasad'
WHERE AccountID=1;

SELECT * FROM AccountsOfTransactions;

SELECT * FROM Accountdetails;

-- unupdatable view
CREATE VIEW BalanceInBank AS
	SELECT SUM(Currentbalance) FROM Accountdetails;

SELECT * FROM BalanceInBank;

UPDATE BalanceInBank
SET Name='Ram' WHERE AccountID = 1;



