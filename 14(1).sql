
-- after trigger query
Delimiter $$
CREATE TRIGGER BalanceUpdater
AFTER INSERT ON Transactiondetails
FOR EACH ROW
BEGIN
	DECLARE Var_LatestTransactionID INT;
    DECLARE Var_AccountID INT;
    DECLARE Var_Transactiontype VARCHAR(10);
    DECLARE Var_Transactionamount INT;
    DECLARE Var_Currentbalance INT;
    SELECT MAX(TransactionID) INTO Var_LatestTransactionID
		FROM Transactiondetails;
	SELECT AccountID, Transactiontype, Transactionamount 
		INTO Var_AccountID, Var_Transactiontype, Var_Transactionamount
        FROM Transactiondetails
        WHERE TransactionID = Var_LatestTransactionID;
	IF Var_LatestTransactionID = 'Credit' 
    THEN
		UPDATE Accountdetails 
        SET Currentbalance = Currentbalance + Var_Transactionamount
        WHERE AccountID = Var_AccountID;
     ELSE
		IF Var_Transactionamount <= Var_Currentbalance
        THEN
			UPDATE Accountdetails 
			SET Currentbalance = Currentbalance - Var_Transactionamount
			WHERE AccountID = Var_AccountID;
		ELSE
			UPDATE Accountdetails 
			SET Currentbalance = Currentbalance
			WHERE AccountID = Var_AccountID;
		END IF;
	END IF;
END

DELIMITER ;

-- DROP TRIGGER Balanceupdater;

-- truncate transac.details table
TRUNCATE TABLE Transactiondetails;
SELECT * FROM transactiondetails;


-- update accounts table balances
UPDATE Accountdetails SET Currentbalance = 0;
SELECT * FROM Accountdetails;

-- insert records
INSERT INTO Transactiondetails (AccountID,Transactiontype, Transactionamount)
VALUES (1, 'Credit', 1000), (2, 'Debit', 500);
SELECT * FROM Transactiondetails;

SELECT * FROM Accountdetails;







