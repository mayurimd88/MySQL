-- before trigger

DELIMITER $$
CREATE TRIGGER CASCADINGDELETE
BEFORE DELETE ON Accountdetails
FOR EACH ROW
BEGIN
	DELETE FROM Transactiondetails 
    WHERE AccountID = OLD.AccountID;
END

DELIMITER ;

DELETE FROM Accountdetails
WHERE AccountID=1;
SELECT * FROM Accountdetails;

SELECT * FROM transactiondetails;