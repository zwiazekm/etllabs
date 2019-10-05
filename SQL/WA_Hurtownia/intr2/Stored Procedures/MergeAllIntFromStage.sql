-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2014-07-31
-- Description:	
-- =============================================

CREATE PROCEDURE [intr2].[MergeAllIntFromStage]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [intr2].[MergeTableFromStageHurtownia] 'INTRASTAT_DokumentZrodlowy';
	EXEC [intr2].[MergeTableFromStageHurtownia] 'INTRASTAT_DeklaracjaWynikowa';
	EXEC [intr2].[MergeTableFromStageHurtownia] 'INTRASTAT_Towar';
	EXEC [intr2].[MergeTableFromStageHurtownia] 'INTRASTAT_Podmiot';

END