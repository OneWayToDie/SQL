--SQLQuery1 - GetNextLearningDay.sql
USE PV_521_Import;
GO

CREATE OR ALTER FUNCTION GetNextLearningDay (@current_date AS DATE, @group_id AS INT)
RETURNS DATE
AS
BEGIN
	DECLARE @next_date AS DATE;
	DECLARE @current_day AS TINYINT;
	DECLARE @days_to_add AS TINYINT;

	SET @current_day = DATEPART(WEEKDAY, @current_date);

	SET @days_to_add = CASE
		WHEN @current_day = 5 THEN 3
		WHEN @current_day = 6 THEN 2
		WHEN @current_day = 7 THEN 1
		ELSE 2
		END;

	SET @next_date = DATEADD(DAY, @days_to_add, @current_date);

	RETURN @next_date;
END;
GO