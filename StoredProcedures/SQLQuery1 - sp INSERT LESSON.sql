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
    IF NOT EXISTS(SELECT lesson_id FROM Schedule WHERE [date] = @date AND [time] = @time AND [group] = @group_id)
        INSERT INTO Schedule ([group], discipline, teacher, [date], [time])
        VALUES (@group_id, @discipline_id, @teacher_id, @date, @time);
END;
GO