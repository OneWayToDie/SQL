--USE PV_521_DDL;
USE Prover04ka;

--CREATE TABLE Directions
--(
--	direction_id	TINYINT				PRIMARY KEY,
--	direction_name	NVARCHAR(150)		NOT NULL,
--);

--CREATE TABLE Groups
--(
--	group_id		INT					PRIMARY KEY,
--	group_name		NVARCHAR(24)		NOT NULL,
--	direction		TINYINT				NOT NULL		--Описание поля
--	CONSTRAINT	FK_Groups_Direction		FOREIGN KEY REFERENCES	Directions(direction_id)
--	--Constraint	FK_ИМЯ_ВнешнегоКлюча	FOREIGN KEY REFERENCES	Таблица(первичный_ключ_внешней_таблицы)
--);

--CREATE TABLE Groups
--(
--	group_id		INT						PRIMARY KEY,
--	group_name		NVARCHAR(24)			NOT NULL,
--	direction		TINYINT					NOT NULL	
--	CONSTRAINT		FK_Groups_Direction		FOREIGN KEY									REFERENCES Directions(direction_id),
--	form			INT						NOT NULL,
--	payment			INT						NOT NULL,
--	CONSTRAINT		FK_Groups_DF			FOREIGN KEY (direction, form)				REFERENCES DirectionsForms(direction, form),
--	CONSTRAINT		FK_Groups_DP			FOREIGN KEY (direction, payment)			REFERENCES DirectionsPayment(direction, payment)
--);

CREATE TABLE Students
(
	student_id		INT					PRIMARY KEY IDENTITY(1,1),	--IDENTITY - Autoincrement
	last_name		NVARCHAR(50)		NOT NULL,
	first_name		NVARCHAR(50)		NOT NULL,
	middle_name		NVARCHAR(50)		NULL,
	birth_date		DATE				NOT NULL,
	[group]			INT					NOT NULL	--[group] - это ключевое слово языка SQL транзакт. Ключевые слова можно использовать для именования полей только в квадратных скобках
	CONSTRAINT		FK_Students_Group	FOREIGN KEY REFERENCES	Groups(group_id)
);

--DROP TABLE Directions, Groups, Students;