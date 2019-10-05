
CREATE PROCEDURE [wald].[p_import_excel_tabela_powiazan_prawidlowych] AS

exec master.dbo.xp_cmdshell 

'dtsrun /S S162 /E /Nwal_powiazania_prawidlowe /M waldek'