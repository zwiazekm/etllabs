
CREATE PROCEDURE [wald].[p_import_excel_tabela_powiazan_nieprawidlowych] AS

exec master.dbo.xp_cmdshell 

'dtsrun /S S162 /E /Nwal_powiazania_nieprawidlowe /M waldek'