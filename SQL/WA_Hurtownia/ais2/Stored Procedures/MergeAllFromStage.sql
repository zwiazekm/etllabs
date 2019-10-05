

-- =============================================
-- Author:
-- Create date: 2014-07-31
-- Description:	
-- =============================================

CREATE PROCEDURE [ais2].[MergeAllFromStage]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_Dokument]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PTW_Dokument]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_KolejnyUrzadWprowadzenia]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_Podmiot]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_Towar]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_Trasa]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_Zamkniecie]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PTW_Podmiot]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PTW_Towar]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_DokumentWymagany]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_InformacjaDodatkowa]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_Kontener]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_Opakowanie]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_TowarPodmiot]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PDS_TransportNaGranicy]';
	EXEC [ais2].[MergeTableFromStageHurtownia] '[ais2].[PTW_DaneCelne]';

END