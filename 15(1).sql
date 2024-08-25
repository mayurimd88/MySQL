CREATE DEFINER=`root`@`localhost` PROCEDURE `ErrorHandler`()
BEGIN
	DECLARE CONTINUE HANDLER FOR 1146
    BEGIN
		SELECT 'Check Table Name' AS Message;
	END;
    SELECT * FROM Accdetails;
END