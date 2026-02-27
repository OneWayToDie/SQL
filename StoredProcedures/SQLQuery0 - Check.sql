--SQLQuery0 - Check
USE PV_521_Import;
SET	DATEFIRST 1;

--DELETE	FROM Schedule WHERE	[group]=521 AND [date] >= N'2026-01-21'
--DELETE	FROM Schedule WHERE	discipline = (SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%сетевое%');
--EXEC	sp_InsertScheduleStacionar N'PV_521', N'%ADO.NET%', N'Олег', N'2026-01-21';
EXEC	sp_InsertScheduleStacionar	N'PV_521', N'Сетевое%', N'Олег', N'2026-02-18';
EXEC	sp_SelectScheduleFor N'PV_521';