--SQLQuery3 - CREATE Schedule & Grades.sql
USE PV_521_DDL;

--CREATE TABLE Schedule
--(
--	lesson_id			INT						PRIMARY KEY,
--	[date]				DATE					NOT NULL,
--	[time]				TIME(7)					NOT NULL,
--	[group]				INT						NOT NULL,
--	discipline			SMALLINT				NOT NULL
--	CONSTRAINT		FK_Schedule_Discipline		FOREIGN KEY	REFERENCES Disciplines(discipline_id),
--	teacher				INT						NOT NULL
--	CONSTRAINT		FK_Schedule_Teacher			FOREIGN KEY	REFERENCES Teachers(teacher_id),
--	[subject]			NVARCHAR(256)			NULL,
--	[status]			BIT						NULL
	
--);

DROP TABLE Schedule;