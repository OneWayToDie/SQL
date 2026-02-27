--SQLQuery1 - sp INSERT LESSON.sql
USE PV_521_Import;
SET	DATEFIRST 1;
GO

ALTER PROCEDURE sp_InsertLesson
    @group_id       INT,
    @discipline_id  SMALLINT,
    @teacher_id     SMALLINT,
    @date           DATE,
    @time           TIME
AS
BEGIN
    DECLARE	@lesson_number	AS	TINYINT			= 1;
    PRINT(FORMATMESSAGE(N'%i, %s, %s, %s', @lesson_number, CAST(@date AS VARCHAR(24)), DATENAME(WEEKDAY, @date), CAST(@time AS VARCHAR(24))));
		IF NOT EXISTS(SELECT lesson_id FROM Schedule WHERE [date] = @date AND [time] = @time AND [group] = @group_id)
		INSERT	Schedule	VALUES	(@group_id, @discipline_id, @teacher_id, @date, @time, IIF(@date < GETDATE(), 1,0));
END;
GO