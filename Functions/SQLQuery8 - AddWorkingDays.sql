--SQLQuery8 - AddWorkingDays.sql
USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION AddWorkingDays (@start_date DATE, @days_to_add INT) --days_to_add - Количество дней, которое нужно добавить
RETURNS DATE
AS
BEGIN
	DECLARE @result_date DATE = @start_date
	DECLARE @added_days	 INT  = 0	-- Добавленные дни

	WHILE @added_days < @days_to_add
	BEGIN
		SET @result_date = DATEADD(DAY,1,@result_date)
		IF dbo.IsWorkingDay(@result_date) = 1
			SET @added_days = @added_days + 1
	END

	RETURN @result_date
END