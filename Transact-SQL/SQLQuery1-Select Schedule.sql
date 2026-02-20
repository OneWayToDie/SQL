--SQLQuery1-Select Schedule
USE PV_521_Import;
-----------------------------------------------------------------------------|
--DELETE FROM Schedule														 |
--WHERE [group] = (SELECT group_id FROM Groups WHERE group_name = N'PV_521') |
-----------------------------------------------------------------------------|

SELECT  
			[Группа]		=		[group_name]
		   ,[Дисциплина]	=		discipline_name
		   ,[Преподаватель] =		FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name)
		   ,[День]			=		DATENAME(WEEKDAY, [date])
		   ,[дата]			=		[date]
		   ,[Время]				=	[time]
		   ,[Статус]			=	IIF(spent = 1, N'Проведено', N'Запланировано')
--тернарный оператор: IIF(condition, value_1, value_2)
FROM	Schedule, Groups, Teachers, Disciplines
WHERE	[group]			=		group_id
AND		discipline		=		discipline_id
AND		teacher			=		teacher_id
AND		[group]			=		(SELECT group_id	FROM Groups WHERE group_name = N'PV_521')
;
