-- 5th highest balance
-- step 1- top 5 balances
SELECT Currentbalance FROM Accountdetails
ORDER BY Currentbalance DESC
LIMIT 5;

-- step 2
SELECT  MIN(Currentbalance) FROM Accountdetails
WHERE Currentbalance IN(
	 SELECT Currentbalance FROM Accountdetails
	ORDER BY Currentbalance DESC
	LIMIT 5 );

-- step 3
SELECT  MIN(Currentbalance) FROM (
	SELECT Currentbalance FROM Accountdetails
	ORDER BY Currentbalance DESC
	LIMIT 5 ) AS Topbalance;


-- 2nd highest balance

/* SELECT MAX(Currentbalance) FROM Accountdetails
WHERE Currentbalance NOT IN (
	SELECT MAX(Currentbalance) FROM Accountdetails
	WHERE Currentbalance NOT IN (
		SELECT MAX(Currentbalance) FROM Accountdetails
	)
); */

SELECT  MIN(Currentbalance) FROM (
	SELECT Currentbalance FROM Accountdetails
	ORDER BY Currentbalance DESC
	LIMIT 2 ) AS Topbalance;



















