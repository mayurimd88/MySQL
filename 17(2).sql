CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAccountDetails`()
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

    -- temporary table to store the results
    CREATE TEMPORARY TABLE IF NOT EXISTS TempAccountDetails (
        AccountID INT,
        Name CHAR(30),
        Age TINYINT,
        AccountType CHAR(20),
        CurrentBalance INT,
        AccountStatus CHAR(28)
    );

    -- Open the cursor to fetching rows
    OPEN Account_details;

    -- Start a loop 
    FETCH_LOOP: LOOP
        -- Fetch row from the cursor into the declared variables
        FETCH Account_details INTO 
        Var_AccountID, Var_Name, Var_Age, Var_Accountype, Var_Currentbalance, Var_Accountstatus;

        -- exit the loop
        IF done THEN
            LEAVE FETCH_LOOP;
        END IF;

        -- Insert the fetched data into the temporary table
        INSERT INTO TempAccountDetails (AccountID, Name, Age, AccountType, CurrentBalance, AccountStatus)
        VALUES (Var_AccountID, Var_Name, Var_Age, Var_Accountype, Var_Currentbalance, Var_Accountstatus);
    END LOOP FETCH_LOOP;

    -- Close the cursor 
    CLOSE Account_details;

    -- Select temporary table to display them in a table format
    SELECT * FROM TempAccountDetails;

    -- Drop the temporary table as it is no longer needed
    DROP TEMPORARY TABLE IF EXISTS TempAccountDetails;
END