USE [master]

RESTORE DATABASE [AWDataWarehouseMZ] 
FROM  DISK = N'D:\Base\AWDataWarehouse.bak' 
WITH  FILE = 1, REPLACE,
MOVE N'AWDataWarehouse' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AWDataWarehouseMZ.mdf',  
MOVE N'AWDataWarehouse_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AWDataWarehouseMZ_log.ldf',  
NOUNLOAD,  STATS = 5

GO


