CREATE PROCEDURE [stat].[AktualizowanieWidoku]
@NazwaWidoku as sysname,
@NazwaTabeli as sysname,
@GeneracjaId int
AS

DECLARE @DropSql nvarchar(MAX);
DECLARE @CreateSql nvarchar(MAX);

set @DropSql = 'IF object_id(N''' + @NazwaWidoku + ''', ''V'') IS NOT NULL' + CHAR(13)+CHAR(10) + 'DROP VIEW ' + @NazwaWidoku + ';'
set @CreateSql = 'CREATE VIEW ' + @NazwaWidoku + CHAR(13)+CHAR(10) + 'AS' + CHAR(13)+CHAR(10) +
'SELECT ' + stat.sf_object_columns(@NazwaTabeli) + CHAR(13)+CHAR(10) +
'FROM ' + @NazwaTabeli + CHAR(13)+CHAR(10) +
'WHERE GeneracjaId = ' + cast(@GeneracjaId as varchar(10)) + ';'

exec sys.sp_executesql @DropSql;
exec sys.sp_executesql @CreateSql;