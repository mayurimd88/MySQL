CREATE DEFINER=`root`@`localhost` PROCEDURE `ExceptionHandling1`()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SELECT 'Something Went Wrong.. Please, Try Again!!!' AS Message;
	END;
    SELECT * FROM Accdetails; -- query 1
    SELECT * FROM Transactiondetails; -- query 2
END