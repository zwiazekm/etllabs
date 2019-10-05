CREATE PROCEDURE [a2].[WykonajSQLuslugiWeb]
	@sqlcmd nvarchar(max),
	@asLogin varchar(256)
AS
	declare @id bigint = 0;
	DECLARE @result int = 0;

	exec a2.DziennikUstawContextInfo 'WebService';

	BEGIN TRY
		EXECUTE AS USER = @asLogin;
			EXEC @id = a2.DziennikWpisInfo @sqlcmd, @@PROCID;
			EXECUTE sp_executesql @sqlCmd;
		REVERT;
	END TRY
	BEGIN CATCH
		 set @result = ERROR_NUMBER();
		 DECLARE @msg varchar(8000) = ERROR_MESSAGE();
		 exec a2.DziennikWpis 'E', @msg, @@PROCID;
	END CATCH

	exec a2.DziennikCzas @id;

RETURN @result