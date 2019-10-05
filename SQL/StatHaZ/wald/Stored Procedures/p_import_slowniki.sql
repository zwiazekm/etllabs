
CREATE PROCEDURE [wald].[p_import_slowniki] AS

exec master.dbo.xp_cmdshell 

'dtsrun /S S162 /E /Nwal_import_slowniki /M waldek'