-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-07-28
-- Description:	
-- =============================================

CREATE PROCEDURE [pta].[MergeAllPTAFromStage]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_Dokument';
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_SADPrzywozu';
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_SzczegolyTransportu';
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_Wyrob';
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_Opakowanie';
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_KodCzynnosciWino'; 
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_Zaswiadczenie';
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_Podmiot'; 
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_Wlasciciel';
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_MiejsceOdbioru'; 
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_TypZadania';
	EXEC [pta].[MergeTableFromStageHurtownia] 'AD_Zadanie'; 
	
END