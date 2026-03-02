--SQLQuery0 - Check.sql
USE PV_521_Import;
SET DATEFIRST 1;

EXEC sp_SelectScheduleFor N'PV_521'
--EXEC sp_InsertScheduleStacionar N'PV_521', N'Сетевое%', N'Олег', N'2026-02-18';
PRINT dbo.GetNextLearningDay_CW(N'PV_521');
