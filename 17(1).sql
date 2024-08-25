CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAccountDetails1`()
BEGIN
 
 -- Declare variables 
 DECLARE Var_AccountID INT;
 DECLARE Var_Name CHAR(30);
 DECLARE Var_Age TINYINT;
 DECLARE Var_Accountype CHAR(20);
 DECLARE Var_Currentbalance INT;
 DECLARE Var_Accountstatus CHAR(28);
 
 -- Declare a variable to detect when the cursor has fetched all rows
 DECLARE done INT DEFAULT 0;
 
 -- cursor to select data from the `Accountdetails` table
 DECLARE Account_details CURSOR FOR 
 SELECT accountID, name, age, accounttype, currentbalance, accountstatus FROM Accountdetails;
 
 -- handler that sets `done` to 1 when there are no more rows to fetch
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
 
 -- Open the cursor to fetch rows
 OPEN Account_details;

 -- Start a loop 
 FETCH_LOOP: LOOP
     -- Fetch the row from the cursor into the declared variables
     FETCH Account_details INTO 
     Var_AccountID, Var_Name, Var_Age, Var_Accountype, Var_Currentbalance, Var_Accountstatus;
 
     -- exit the loop
     IF done THEN
         LEAVE FETCH_LOOP;
     END IF;
 
     -- Display the fetched data as a single row
     SELECT 
         Var_AccountID AS AccountID,
         Var_Name AS Name,
         Var_Age AS Age,
         Var_Accountype AS AccountType,
         Var_Currentbalance AS CurrentBalance,
         Var_Accountstatus AS AccountStatus;
 
 END LOOP FETCH_LOOP;

 -- Close the cursor 
 CLOSE Account_details;

END