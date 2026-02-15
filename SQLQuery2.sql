--SELECT 
--    name AS LogicalName,
--    physical_name AS CurrentPath,
--    type_desc AS FileType
--FROM sys.master_files 
--WHERE database_id = DB_ID('PV_521');


--ALTER DATABASE PV_521 SET OFFLINE;


--ALTER DATABASE PV_521
--MODIFY FILE ( NAME = 'PV_521', 
--              FILENAME = 'C:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_521.mdf' );


--ALTER DATABASE PV_521
--MODIFY FILE ( NAME = 'PV_521_log', 
--              FILENAME = 'C:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_521_log.ldf' );

--ALTER DATABASE PV_521 SET ONLINE;









--SELECT 
--    name AS LogicalName,
--    physical_name AS CurrentPath,
--    type_desc AS FileType
--FROM sys.master_files 
--WHERE database_id = DB_ID('PV_521_DDL');


--ALTER DATABASE PV_521_DDL SET OFFLINE;


--ALTER DATABASE PV_521_DDL
--MODIFY FILE ( NAME = 'PV_521_DDL', 
--              FILENAME = 'C:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_521_DDL.mdf' );


--ALTER DATABASE PV_521_DDL
--MODIFY FILE ( NAME = 'PV_521_DDL_log', 
--              FILENAME = 'C:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_521_DDL_log.ldf' );

--ALTER DATABASE PV_521_DDL SET ONLINE;








--SELECT 
--    name AS LogicalName,
--    physical_name AS CurrentPath,
--    type_desc AS FileType
--FROM sys.master_files 
--WHERE database_id = DB_ID('ZOO');


--ALTER DATABASE ZOO SET OFFLINE;


--ALTER DATABASE ZOO
--MODIFY FILE ( NAME = 'ZOO', 
--              FILENAME = 'C:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ZOO.mdf' );


--ALTER DATABASE ZOO
--MODIFY FILE ( NAME = 'ZOO_log', 
--              FILENAME = 'C:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ZOO_log.ldf' );

--ALTER DATABASE ZOO SET ONLINE;