CREATE   PROCEDURE [gust].sp_ExecPackage_Kopia_do_wynikowych
AS
exec master.dbo.xp_cmdshell 'dtsrun /S S162 /E /N03_kopia_do_wynikowych '

--TODOKC: Jakie tu podajemy parametry wejsciowe DataOd/DataDo?