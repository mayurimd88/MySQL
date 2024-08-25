CREATE DEFINER=`root`@`localhost` FUNCTION `BodyMassIndex`(Par_Height FLOAT, Par_Weight FLOAT) RETURNS float
BEGIN
	DECLARE Var_BMI FLOAT;
    SELECT Par_Weight/(Par_Height * Par_Height)
		INTO Var_BMI;
RETURN Var_BMI;
END