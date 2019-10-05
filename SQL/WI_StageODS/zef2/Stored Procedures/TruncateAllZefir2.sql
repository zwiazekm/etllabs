-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [zef2].[TruncateAllZefir2]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @nazwa nvarchar(256), @schema nvarchar(100)
	DECLARE @sql nvarchar(1000)

	DECLARE cTabele CURSOR
	FOR
	SELECT t.name AS nazwa,
		   schema_name(t.schema_id) AS schem
	  FROM sys.tables t 
	 WHERE schema_name(t.schema_id) = 'zef2'
	 ORDER BY t.name

	
	
	OPEN cTabele
	FETCH NEXT FROM cTabele INTO @nazwa, @schema

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @sql = 'TRUNCATE TABLE ' + @schema + '.' + @nazwa
		EXEC sp_executesql @sql
		FETCH NEXT FROM cTabele INTO @nazwa, @schema
	END

	CLOSE cTabele
	DEALLOCATE cTabele
END