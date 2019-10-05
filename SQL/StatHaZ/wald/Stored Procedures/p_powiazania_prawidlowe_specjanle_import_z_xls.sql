
CREATE PROCEDURE [wald].[p_powiazania_prawidlowe_specjanle_import_z_xls] AS

exec master.dbo.xp_cmdshell 

'dtsrun /S 10.47.255.162 /E /Nwal_powiazania_prawidlowe_specjalne /Mwaldek'