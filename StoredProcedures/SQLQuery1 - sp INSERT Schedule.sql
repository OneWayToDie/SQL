--SQLQuery1 - sp INSERT Schedule
USE PV_521_Import;
SET	DATEFIRST 1;
GO -- Применить

CREATE OR ALTER PROCEDURE sp_InsertScheduleStacionar
		@group_name				AS		NCHAR(10),
		@discipline_name		AS		NVARCHAR(150),
		@teacher_first_name		AS		NVARCHAR(50),
		@start_date				AS		DATE	=	N'1900-01-01'
AS
	BEGIN
			DECLARE @group				AS	INT		 = (SELECT group_id			 FROM Groups		WHERE group_name	  LIKE @group_name);
			DECLARE @teacher			AS	SMALLINT = (SELECT teacher_id		 FROM Teachers		WHERE first_name	  LIKE @teacher_first_name);
			DECLARE @discipline			AS	SMALLINT = (SELECT discipline_id	 FROM Disciplines	WHERE discipline_name LIKE @discipline_name);
			DECLARE	@number_of_lessons	AS	TINYINT	 = (SELECT number_of_lessons FROM Disciplines	WHERE discipline_name LIKE @discipline_name);
			--DECLARE @lesson_number		AS	TINYINT	 = 0;
			--DECLARE	@date				AS	DATE	 = @start_date;
			DECLARE @start_time			AS	TIME	 = (SELECT start_time		 FROM Groups		WHERE group_id = @group);
	
	PRINT(@group);
	PRINT(@discipline);
	PRINT(@number_of_lessons);
	PRINT(@teacher);
	PRINT(@start_date);
	PRINT(@start_time);
	PRINT('=========================')

	--В цикле перебираем занятия по номеру, определяем дату и время каждого занятия
	DECLARE	@date			AS	DATE			= 
	IIF(@start_date <> N'1900-01-01', @start_date, (SELECT MAX([date]) FROM Schedule WHERE [group]=@group));
	DECLARE	@lesson_number	AS	TINYINT			= dbo.CountLessons(@group,@discipline);
	DECLARE @time			AS	TIME			= @start_time;
	WHILE	(@lesson_number  <	@number_of_lessons)
	BEGIN
			SET @date = dbo.GetNextLearningDate_CW(@group_name, @date);
			SET @time = @start_time;
			--IF EXISTS (SELECT holiday FROM DaysOFF WHERE [date]=@date)CONTINUE;
			EXEC	sp_InsertLesson @group, @discipline, @teacher, @date, @time OUTPUT, @lesson_number OUTPUT;

			EXEC	sp_InsertLesson @group, @discipline, @teacher, @date, @time OUTPUT, @lesson_number OUTPUT;
			
			--DECLARE @day	AS	TINYINT = DATEPART(WEEKDAY, @date);
			--SET	@date		=	DATEADD(DAY,  IIF(@day = 5, 3, 2), @date);
			--SET @date = dbo.GetNextLearningDate_CW(@group_name, @date);
	END

END





--USE PV_521_Import;
--SET DATEFIRST 1;
--GO

--ALTER PROCEDURE sp_InsertScheduleStacionar
--    @group_name             AS      NCHAR(10),
--    @discipline_name        AS      NVARCHAR(150),
--    @teacher_first_name     AS      NVARCHAR(50),
--    @start_date             AS      DATE
--AS
--BEGIN
--    DECLARE @group              AS INT         = (SELECT group_id          FROM Groups      WHERE group_name      LIKE @group_name);
--    DECLARE @teacher            AS SMALLINT    = (SELECT teacher_id        FROM Teachers    WHERE first_name      LIKE @teacher_first_name);
--    DECLARE @discipline         AS SMALLINT    = (SELECT discipline_id     FROM Disciplines WHERE discipline_name LIKE @discipline_name);
--    DECLARE @number_of_lessons  AS TINYINT     = (SELECT number_of_lessons FROM Disciplines WHERE discipline_name LIKE @discipline_name);
--    DECLARE @start_time         AS TIME        = (SELECT start_time        FROM Groups      WHERE group_id = @group);

--    PRINT(@group);
--    PRINT(@discipline);
--    PRINT(@number_of_lessons);
--    PRINT(@teacher);
--    PRINT(@start_date);
--    PRINT(@start_time);

--    DECLARE @date           AS DATE          = @start_date;
--    DECLARE @lesson_number  AS TINYINT       = dbo.CountLessons(@group, @discipline);
--    DECLARE @time           AS TIME          = @start_time;
    
--    WHILE (@lesson_number < @number_of_lessons)
--    BEGIN
--        SET @time = @start_time;

--        EXEC sp_InsertLesson @group, @discipline, @teacher, @date, @time OUTPUT, @lesson_number OUTPUT;

--        IF @lesson_number < @number_of_lessons
--        BEGIN
--            SET @time = DATEADD(MINUTE, 95, @start_time);
--            EXEC sp_InsertLesson @group, @discipline, @teacher, @date, @time OUTPUT, @lesson_number OUTPUT;
--        END

--        SET @date = dbo.GetNextLearningDay(@date, @group);
--    END
--END;