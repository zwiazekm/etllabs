

-- =============================================
-- Author:
-- Create date: 2016-10-20
-- Description:	
-- =============================================

CREATE PROCEDURE [emcs2].[MergeAllFromStage]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_AnalizaRyzykaDokument]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_AnalizaRyzykaKontrola]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_AnalizaRyzykaKontrPodsum]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_AnalizaRyzykaKontrPozycje]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_AnalizaRyzykaMetodyKontroli]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_AnalizaRyzykaZespolKontroli]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_Dokument]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_KodCzynnosciWino]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_Opakowanie]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_Podmiot]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_TypZadania]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_MiejsceOdbioru]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_SADPrzywozu]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_SzczegolyTransportu]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_Wlasciciel]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_Wyrob]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_Zadanie]';
	EXEC [emcs2].[MergeTableFromStageHurtownia] '[emcs2].[AD_Zaswiadczenie]';

END