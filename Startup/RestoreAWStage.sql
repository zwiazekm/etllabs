USE [master]

RESTORE DATABASE [StagingMZ] 
FROM  DISK = N'D:\Base\Staging.bak' 
WITH  FILE = 1,  MOVE N'Staging' 
TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StagingMZ.mdf',  
MOVE N'Staging_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StagingMZ_log.ldf',  
NOUNLOAD,  STATS = 5, REPLACE

GO


