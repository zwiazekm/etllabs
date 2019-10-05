
CREATE PROCEDURE [wald].[p_wczytaj_plik_xls_odp_intr] AS

exec master.dbo.xp_cmdshell 

'dtsrun /S S162 /E /Nwal_wczytanie_pliku_xls_odp_intr_do_tabeli /M waldek'