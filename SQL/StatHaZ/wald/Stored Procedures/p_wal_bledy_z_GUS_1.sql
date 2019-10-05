

CREATE  PROCEDURE [wald].[p_wal_bledy_z_GUS_1] AS

exec master.dbo.xp_cmdshell 

'dtsrun /S S162 /E /Nwal_bledy_z_GUS_1 /Mwaldek'