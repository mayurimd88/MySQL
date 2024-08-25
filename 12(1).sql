CREATE DEFINER=`root`@`localhost` PROCEDURE `Bankstatement`(Par_AccountID INT)
BEGIN
	SELECT * FROM Transactiondetails
    WHERE AccountID = Par_AccountID;
END