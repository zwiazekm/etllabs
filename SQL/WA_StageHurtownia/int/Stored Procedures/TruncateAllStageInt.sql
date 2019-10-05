-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2014-07-25
-- Description:	Procedura czyści wszystkie tabele int przygotowując je do zasilenia (przyrostowego) z systemu WI_ODS
-- =============================================
CREATE PROCEDURE [int].[TruncateAllStageInt]
AS
BEGIN

	SET NOCOUNT ON;

		TRUNCATE TABLE [int].[INTRASTAT_DokumentZrodlowy];
		TRUNCATE TABLE [int].[INTRASTAT_DeklaracjaWynikowa];
		TRUNCATE TABLE [int].[INTRASTAT_Towar];
		TRUNCATE TABLE [int].[INTRASTAT_Podmiot];

END