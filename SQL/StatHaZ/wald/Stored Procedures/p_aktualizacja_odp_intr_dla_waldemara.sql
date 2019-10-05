
CREATE PROCEDURE [wald].[p_aktualizacja_odp_intr_dla_waldemara] AS

exec master.sys.xp_cmdshell 

'dtsrun /S S162  /E /Nwal_aktualizacja_odp_intr /M waldek'