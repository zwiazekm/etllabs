



-- =============================================
-- Author:		Gwidon Józwiak
-- Create date: 2015-08-26
-- Description:	
-- =============================================

CREATE PROCEDURE [zef2].[Set_DataZlozeniaDeklaracji_in_PismoXML]
AS

BEGIN
	SET NOCOUNT ON;

		 UPDATE [zef2].[Pismo_XML]
		   SET 
				[DataZlozeniaDeklaracji] = 
			   (CASE    
					WHEN xDaneXML.exist('(/PISMO_XML/@submit_date)[1]') = 1
					THEN
						xDaneXML.value('(/PISMO_XML/@submit_date)[1]', 'nvarchar(200)')
					 ELSE
						'BRAK'
				END)
				   WHERE IDPisma > 5000000 AND IDPisma <= 7000000;
END