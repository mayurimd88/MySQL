-- tran. details of AccID 1
CREATE VIEW BankStatement AS
	SELECT * FROM Transactiondetails
    WHERE AccountID=1;
SELECT * FROM BankStatement;


-- add col
ALTER TABLE Accountdetails
ADD Accountstatus CHAR(28) DEFAULT('Active');

SELECT * FROM Accountdetails;


