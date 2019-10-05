-- =============================================
-- Author:		Kamil Nowiński
-- Create date: 2014-07-30
-- Description:	Procedura czyści wszystkie tabele w schemacie [vies] przygotowując je do zasilenia (przyrostowego) z systemu VIES
-- =============================================
CREATE PROCEDURE [vies].[TruncateAllStage]
AS
BEGIN

	SET NOCOUNT ON;

		TRUNCATE TABLE vies.VIES_dostawy;
		TRUNCATE TABLE vies.VIES_nabycia;

END