CREATE DEFINER=`root`@`localhost` PROCEDURE `ErrorHandler2`()
BEGIN
	DECLARE CONTINUE HANDLER FOR 1146
    BEGIN
		SELECT 'Check Table Name' AS Message;
	END;
    SELECT * FROM Accdetails; -- query 1
    SELECT * FROM Transactiondetails; -- query 2
END