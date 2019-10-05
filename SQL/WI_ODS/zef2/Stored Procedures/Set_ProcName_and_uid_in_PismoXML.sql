




-- =============================================
-- Author:		Gwidon Józwiak
-- Create date: 2015-08-26
-- Description:	
-- =============================================

-- Procedura nieużywana -- jej użycie zostało przeniesione na Stagea
CREATE PROCEDURE [zef2].[Set_ProcName_and_uid_in_PismoXML]
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
				   WHERE IDPisma in (
  3936277,
3936393,
4609296,
5596075,
5615860
)

END