CREATE    PROCEDURE [gust].sp_ExecPackage_update_rekordow
AS
exec master.dbo.xp_cmdshell 'dtsrun /S S162 /E /NAlternatywne_zrodla_danych '


--TODOKN: Nie mamy tego DTS