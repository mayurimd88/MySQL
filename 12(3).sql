CREATE DEFINER=`root`@`localhost` PROCEDURE `AccountStatusUpdater`()
BEGIN
	UPDATE Accountdetails 
    SET Accountstatus = 'Active' WHERE AccountID IN (
		SELECT AccountID FROM Transactiondetails
        WHERE TIMESTAMPDIFF(MONTH, Transactiontime,NOW())<=6);
	UPDATE Accountdetails 
    SET Accountstatus = 'Inactive' WHERE AccountID NOT IN (
		SELECT AccountID FROM Transactiondetails
        WHERE TIMESTAMPDIFF(MONTH, Transactiontime,NOW())<=6);
END

