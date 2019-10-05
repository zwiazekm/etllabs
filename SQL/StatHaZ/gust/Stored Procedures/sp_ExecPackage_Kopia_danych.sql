CREATE PROCEDURE [gust].sp_ExecPackage_Kopia_danych
AS
exec master.dbo.xp_cmdshell 'dtsrun /S S162 /E /N02_kopia_danych_zrodlowych '

--TODOKC: Jakie tu podajemy parametry wejsciowe DataOd/DataDo?