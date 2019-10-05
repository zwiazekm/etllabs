
-- =============================================
-- Author:	
-- Create date: 2016-10-28
-- Description:	Procedura uzupełniajaca kolumnę IdentyfikatorPodatnika wartością z kolumny ID_Pismo_xml
-- =============================================

CREATE PROCEDURE [zef2DW].[ConcatDW_SWITCH]
AS
BEGIN

	SET NOCOUNT ON;

		DECLARE @NazwaTabeli varchar(30)
		declare kursor SCROLL cursor for 
			SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE  [COLUMN_NAME] = 'IdentyfikatorPodatnika' AND [TABLE_SCHEMA] = 'zef2DW'
		OPEN kursor;
		FETCH NEXT FROM kursor INTO @NazwaTabeli;
		WHILE @@FETCH_STATUS=0
      
			BEGIN 
					DECLARE @SQLQuery AS NVARCHAR(500) =
					'UPDATE zef2DW.' + @NazwaTabeli + ' SET IdentyfikatorPodatnika = ID_Pismo_xml WHERE IdentyfikatorPodatnika IS NULL' 
					PRINT @NazwaTabeli
					EXECUTE sp_executesql @SQLQuery

			FETCH NEXT FROM kursor INTO @NazwaTabeli;
			END
		CLOSE kursor   
		DEALLOCATE kursor

END