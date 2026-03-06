--SQLQuery7 - DaysOFF.sql
USE PV_521_Import;
GO

DELETE FROM DaysOFF WHERE YEAR([date]) = 2026;

--ќбъ€вил временное выражение с наименованием dates(существует только в рамках этого запроса)
WITH dates AS ( SELECT TOP 365	--¬ыбираю первые 365 строк из результата
					-- дл€ каждой строки сгенерированна последовательность номера строк:
					DATEADD(DAY, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1, '2026-01-01') AS [date] 
					-- ROW_NUMBER() начинает отсчЄт с единицы, '-1' нам нужно дл€ начала отсчЄта с нул€
-- — помощью DATEADD прибавл€ю число дней к первому €нвар€
				From sys.objects source1, sys.objects source2 )
-- декартово произведение системной таблицы sys.objects саму на себ€. Ќужно дл€ получени€ достаточного количества строк
-- sys.objects - https://learn.microsoft.com/ru-ru/sql/relational-databases/system-catalog-views/sys-objects-transact-sql?view=sql-server-ver17
-- ѕро декартово произведение в рамках sql - https://sky.pro/wiki/analytics/sql-dekartovo-proizvedenie-dvuh-tablits---printsipy-i-primenenie/
-- а если в двух словах, то это - комбинирование строк одной таблицы со строками другой
-- ѕримен€ем его здесь дл€ увеличени€ количества строк, если брать просто из sys.objects, то мы получим малый объЄм вместимых данных

INSERT INTO DaysOFF ([date], [holiday])		-- вставл€ю данные в таблицу DaysOFF, заполн€€ date и holiday
SELECT [date], NULL FROM dates				-- выбираю дату из своего временного выражени€, в колонку holiday вставл€ю NULL(Ёто нужно дл€ обозначени€, что это не праздник, просто выходной) 
WHERE DATEPART(WEEKDAY, [date]) IN (6,7);	--


INSERT INTO DaysOFF ([date], [holiday])		--оп€ть вставл€ю данные в DaysOFF
SELECT
	--ƒл€ каждой строки из таблицы holidays беру мес€ц, день и формирую дату 2026-го года, holidays_id - как ссылка на таблицу
	DATEFROMPARTS(2026, [month], [day]) AS [date],
	holiday_id
FROM holidays
WHERE DATEFROMPARTS(2026, [month], [day]) NOT IN (SELECT [date] FROM [DaysOFF]); 
-- здесь провер€ю на наличие этой даты в DaysOFF, чтобы не создавать дубликаты



--SELECT
--	[date],
--	DATENAME(WEEKDAY, [date]) AS WEEKDAY,
--	(SELECT holiday_name FROM holidays WHERE holiday_id = holiday) AS holiday_name
--FROM DaysOFF
--WHERE YEAR([date]) = 2026
--ORDER BY [date];




