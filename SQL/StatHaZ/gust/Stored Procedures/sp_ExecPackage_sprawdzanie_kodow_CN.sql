CREATE    PROCEDURE [gust].sp_ExecPackage_sprawdzanie_kodow_CN
AS
exec master.dbo.xp_cmdshell 'dtsrun /S S162  /E /N Sprawdzenie_kodow_CN'