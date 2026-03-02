--SQLQuery1 - GetNextLearningDate.sql
USE PV_521_Import;
GO

CREATE OR ALTER FUNCTION GetNextLearningDate (@current_date AS DATE, @group_id AS INT)
RETURNS DATE
AS
BEGIN
	DECLARE @next_date DATE;
	DECLARE @start_time TIME;
	DECLARE @current_day TINYINT;

	SELECT @start_time = start_time FROM Groups WHERE group_id = @group_id;

	SET @next_date = DATEADD(DAY, 1, @current_date);
	SET @current_day = DATEPART(WEEKDAY, @next_date);

	WHILE @current_day = 7
	BEGIN
		SET @next_date = DATEADD(DAY, 1, @next_date);
		SET @current_day = DATEPART(WEEKDAY, @next_date);
	END
	RETURN @next_date;
END;
GO