--SQLQuery2 - HomeWork
USE PV_521_Import;
SET DATEFIRST 1;

DECLARE @group INT = (SELECT group_id FROM Groups WHERE group_name = N'PV_521');
DECLARE @start_time	TIME = (SELECT start_time FROM Groups WHERE group_id = @group);
DECLARE @teacher1 INT = (SELECT teacher_id FROM Teachers WHERE first_name = N'Олег');
DECLARE @teacher2 INT = (SELECT teacher_id FROM Teachers WHERE first_name = N'Алексей');

DECLARE @CPlusPlus INT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'%Основы программирования на языке C++%');
DECLARE @BIT	   INT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'%Основы информациооных технологий%');
DECLARE @Conf_Win  INT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'%Конфигурирование Windows 10%');

DECLARE @CPlusPlus_Start DATE = '2025-01-20', @CPlusPlus_End Date = '2025-06-20';
DECLARE @BIT_Start		 DATE = '2025-02-10', @BIT_End		 DATE = '2025-03-14';	--BIT - Basic Information Technology 
DECLARE @Conf_Win_Start  DATE = '2025-03-17', @Conf_Win_End  DATE = '2025-06-20';

DECLARE @date DATE = @CPlusPlus_start;
WHILE	@date	   <= @CPlusPlus_End
BEGIN	
		IF DATEPART(WEEKDAY, @date) IN (1,3,5)
		BEGIN
			DECLARE @teacher_CPlusPlus INT = CASE
				WHEN (DATEDIFF(day, @CPlusPlus_Start, @date)/7)%2 = 0 AND DATEPART(WEEKDAY, @date) = 1 THEN @teacher1
				WHEN (DATEDIFF(day, @CPlusPlus_Start, @date)/7)%2 = 0 AND DATEPART(WEEKDAY, @date) IN (3,5) THEN @teacher2
				WHEN (DATEDIFF(day, @CPlusPlus_Start, @date)/7)%2 = 1 AND DATEPART(WEEKDAY, @date) = 1 THEN @teacher2
				WHEN (DATEDIFF(day, @CPlusPlus_Start, @date)/7)%2 = 1 AND DATEPART(WEEKDAY, @date) IN (3,5) THEN @teacher1
			END;
			INSERT INTO Schedule ([group], discipline, teacher, [date], [time], [status])
			VALUES (@group, @CPlusPlus, @teacher_CPlusPlus, @date, @start_time, IIF(@date < GETDATE(), 1, 0));
		END
		SET @date = DATEADD(day, 1, @date);
END



