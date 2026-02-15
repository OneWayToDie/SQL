--CREATE DATABASE All_In
--ON
--(
--	NAME		=	All_In,
--	FILENAME	=	'C:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\All_In.mdf',
--	SIZE		=	  8 MB,
--	MAXSIZE		=	500 MB,
--	FILEGROWTH	=	  8 MB
--)
--LOG ON
--(
--	NAME		=	All_In_log,
--	FILENAME	=	'C:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\All_In.ldf',
--	SIZE		=	  8 MB,
--	MAXSIZE		=	500 MB,
--	FILEGROWTH	=	  8 MB
--)
USE All_In;
GO
--Копирую данные из таблицы PV_521_DDL(Кроме ключей, их по синтаксису надо указывать отдельно)
--https://learn.microsoft.com/ru-ru/sql/t-sql/queries/select-into-clause-transact-sql?view=sql-server-ver17
--SELECT * INTO Directions						FROM PV_521_DDL.dbo.Directions;
--SELECT * INTO Groups							FROM PV_521_DDL.dbo.Groups;
--SELECT * INTO Students							FROM PV_521_DDL.dbo.Students;
--SELECT * INTO Teachers							FROM PV_521_DDL.dbo.Teachers;
--SELECT * INTO Disciplines						FROM PV_521_DDL.dbo.Disciplines;
--SELECT * INTO DisciplinesDirectionsRelation		FROM PV_521_DDL.dbo.DisciplinesDirectionsRelation;
--SELECT * INTO TeachersDisciplinesRelation		FROM PV_521_DDL.dbo.TeachersDisciplinesRelation;
--SELECT * INTO RequiredDisciplines				FROM PV_521_DDL.dbo.RequiredDisciplines;
--SELECT * INTO DependentDisciplines				FROM PV_521_DDL.dbo.DependentDisciplines;
--SELECT * INTO Schedule							FROM PV_521_DDL.dbo.Schedule;
--SELECT * INTO Grades							FROM PV_521_DDL.dbo.Grades;
--SELECT * INTO Exams								FROM PV_521_DDL.dbo.Exams;
--SELECT * INTO HomeWorks							FROM PV_521_DDL.dbo.HomeWorks;
--SELECT * INTO ResultsHW							FROM PV_521_DDL.dbo.ResultsHW;
--GO
--ALTER TABLE --https://learn.microsoft.com/ru-ru/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver17
--https://selectel.ru/blog/tutorials/how-to-change-tables-in-sql/
--Отдельно добавляю первичные ключи
ALTER TABLE Directions							ADD PRIMARY KEY (direction_id);
ALTER TABLE Groups								ADD PRIMARY KEY (group_id);
ALTER TABLE Students							ADD PRIMARY KEY (student_id);
ALTER TABLE Teachers							ADD PRIMARY KEY (teacher_id);
ALTER TABLE Disciplines							ADD PRIMARY KEY (discipline_id);
ALTER TABLE DisciplinesDirectionsRelation		ADD PRIMARY KEY (discipline,direction);
ALTER TABLE TeachersDisciplinesRelation			ADD PRIMARY KEY (teacher,discipline);
ALTER TABLE RequiredDisciplines					ADD PRIMARY KEY (discipline, required_discipline);
ALTER TABLE DependentDisciplines				ADD PRIMARY KEY (discipline,dependent_discipline);
ALTER TABLE Schedule							ADD PRIMARY KEY (lesson_id);
ALTER TABLE Grades								ADD PRIMARY KEY (student,lesson);
ALTER TABLE HomeWorks							ADD PRIMARY KEY ([group],lesson);
ALTER TABLE ResultsHW							ADD PRIMARY KEY (student,[group],lesson);
GO

--Добавляю внешние ключи
ALTER TABLE Groups								ADD CONSTRAINT	FK_Groups_Direction		FOREIGN KEY	(direction)					REFERENCES	Directions	(direction_id);
ALTER TABLE Students							ADD CONSTRAINT	FK_Students_Group		FOREIGN KEY	([group])					REFERENCES	Groups		(group_id);
ALTER TABLE DisciplinesDirectionsRelation		ADD CONSTRAINT	FK_DDR_Discipline		FOREIGN KEY (discipline)				REFERENCES	Disciplines (discipline_id);
ALTER TABLE DisciplinesDirectionsRelation		ADD CONSTRAINT	FK_DDR_Direction		FOREIGN	KEY (direction)					REFERENCES	Directions	(direction_id);
ALTER TABLE TeachersDisciplinesRelation			ADD CONSTRAINT	FK_TDR_Teacher			FOREIGN KEY (teacher)					REFERENCES	Teachers	(teacher_id);
ALTER TABLE TeachersDisciplinesRelation			ADD CONSTRAINT	FK_TDR_Discipline		FOREIGN KEY (discipline)				REFERENCES	Disciplines (discipline_id);
ALTER TABLE RequiredDisciplines					ADD CONSTRAINT	FK_RD_Discipline		FOREIGN KEY (discipline)				REFERENCES	Disciplines (discipline_id);
ALTER TABLE RequiredDisciplines					ADD CONSTRAINT	FK_RD_Required			FOREIGN KEY (required_discipline)		REFERENCES 	Disciplines (discipline_id);
ALTER TABLE DependentDisciplines				ADD CONSTRAINT	FK_DD_Discipline		FOREIGN KEY (discipline)				REFERENCES	Disciplines (discipline_id);
ALTER TABLE DependentDisciplines				ADD CONSTRAINT	FK_DD_Dependent			FOREIGN KEY (dependent_discipline)		REFERENCES	Disciplines (discipline_id);
ALTER TABLE Schedule							ADD CONSTRAINT	FK_Schedule_Groups		FOREIGN KEY	([group])					REFERENCES	Groups		(group_id);
ALTER TABLE Schedule							ADD CONSTRAINT	FK_Schedule_Discipline	FOREIGN KEY	(discipline)				REFERENCES	Disciplines	(discipline_id);
ALTER TABLE Schedule							ADD CONSTRAINT	FK_Schedule_Teacher		FOREIGN KEY	(teacher)					REFERENCES	Teachers	(teacher_id);
ALTER TABLE Grades								ADD CONSTRAINT	FK_Grades_Students		FOREIGN KEY	(student)					REFERENCES  Students	(student_id);
ALTER TABLE Grades								ADD CONSTRAINT	FK_Grades_Schedule		FOREIGN KEY	(lesson)					REFERENCES  Schedule	(lesson_id);
ALTER TABLE Exams								ADD CONSTRAINT	FK_Exams_Students		FOREIGN KEY	(student)					REFERENCES  Students	(student_id);
ALTER TABLE Exams								ADD CONSTRAINT	FK_Exams_Discipline		FOREIGN KEY	(discipline)				REFERENCES  Disciplines	(discipline_id);
ALTER TABLE HomeWorks							ADD CONSTRAINT	FK_HW_Groups			FOREIGN KEY	([group])					REFERENCES  Groups		(group_id);
ALTER TABLE HomeWorks							ADD CONSTRAINT	FK_HW_Schedule			FOREIGN KEY	(lesson)					REFERENCES  Schedule	(lesson_id);
ALTER TABLE ResultsHW							ADD CONSTRAINT	FK_Results_Students		FOREIGN KEY	(student)					REFERENCES  Students	(student_id);
ALTER TABLE ResultsHW							ADD CONSTRAINT	FK_Results_HW			FOREIGN KEY ([group],lesson)			REFERENCES  HomeWorks	([group], lesson);
GO
--Добавляю ключи проверки
ALTER TABLE Grades								ADD CONSTRAINT	CK_Grade_1				CHECK (grade_1 > 0 AND grade_1 <= 12);
ALTER TABLE Grades								ADD CONSTRAINT	CK_Grade_2				CHECK (grade_2 > 0 AND grade_2 <= 12);
ALTER TABLE Exams								ADD CONSTRAINT	CK_Exam_Grade			CHECK (grade > 0 AND grade <= 12);
ALTER TABLE HomeWorks							ADD CONSTRAINT	CK_DATA_OR_COMMENT		CHECK ([data] IS NOT NULL OR comment IS NOT NULL);
ALTER TABLE ResultsHW							ADD CONSTRAINT	CK_HW_Grade				CHECK (grade > 0 AND grade <= 12);
ALTER TABLE ResultsHW							ADD CONSTRAINT	CK_RESULT_OR_COMMENT	CHECK ([result] IS NOT NULL OR comment IS NOT NULL);
GO


--ALTER DATABASE All_In_One SET OFFLINE