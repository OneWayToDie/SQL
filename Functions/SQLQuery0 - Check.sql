--SQLQuery0 - Check.sql
USE PV_521_Import;
SET DATEFIRST 1;

--EXEC sp_InsertScheduleStacionar N'PV_521', N'Сетевое%', N'Олег', N'2026-02-18';

--EXEC sp_SelectScheduleFor N'PV_521'
--PRINT dbo.GetNextLearningDay_CW(N'PV_521', DEFAULT);
--PRINT dbo.GetNextLearningDay_CW(N'PV_521', N'2026-03-05');

EXEC sp_SelectScheduleFor N'PV_521'
PRINT dbo.GetNextLearningDate_CW(N'PV_521', N'2026-03-05');
PRINT dbo.GetNextLearningDate_CW(N'SPU_411', N'2026-03-07');



--EXEC sp_SelectScheduleFor N'PV_319'
--PRINT dbo.GetNextLearningDay_CW(N'PV_319');

--EXEC sp_SelectScheduleFor N'Java_326'
--PRINT dbo.GetNextLearningDay_CW(N'Java_326');
