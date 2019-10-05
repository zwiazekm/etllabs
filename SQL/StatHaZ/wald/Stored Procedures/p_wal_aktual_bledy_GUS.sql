
CREATE PROCEDURE [wald].[p_wal_aktual_bledy_GUS] AS

exec master.dbo.xp_cmdshell 

'dtsrun /S S162  /E /Nwal_aktual_bledy_GUS /M waldek'