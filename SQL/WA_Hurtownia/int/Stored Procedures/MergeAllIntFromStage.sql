-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2014-07-31
-- Description:	
-- =============================================

CREATE PROCEDURE [int].[MergeAllIntFromStage]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [int].[MergeTableFromStageHurtownia] 'INTRASTAT_DokumentZrodlowy';
	EXEC [int].[MergeTableFromStageHurtownia] 'INTRASTAT_DeklaracjaWynikowa';
	EXEC [int].[MergeTableFromStageHurtownia] 'INTRASTAT_Towar';
	EXEC [int].[MergeTableFromStageHurtownia] 'INTRASTAT_Podmiot';

END