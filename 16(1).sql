CREATE DEFINER=`root`@`localhost` FUNCTION `AgeCalculator`(Par_DateOfBirth DATE) RETURNS tinyint
BEGIN
	DECLARE Var_Age TINYINT;
    SELECT TIMESTAMPDIFF(YEAR, Par_DateOfBirth, NOW())
		INTO Var_Age;
RETURN Var_Age;
END