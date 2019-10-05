
CREATE PROCEDURE [wald].[p_wal_bledy_z_GUS_2] AS

exec master.dbo.xp_cmdshell 

'dtsrun /S S162 /E /Nwal_bledy_z_GUS_2 /M waldek'