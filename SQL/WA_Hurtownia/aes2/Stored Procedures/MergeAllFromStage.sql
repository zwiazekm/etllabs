


-- =============================================
-- Author:
-- Create date: 2016-10-20
-- Description:	
-- =============================================

CREATE PROCEDURE [aes2].[MergeAllFromStage]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWA_Dokument]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWU_Dokument]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[MEX_Dokument]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_Dokument]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[TRS_Dokument]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_Dokument]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_Dokument]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_Podmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_Towar]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_Dokument]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Dokument]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWA_Podmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWA_Towar]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWA_Trasa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWA_ZamkniecieCelne]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWU_Podmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWU_Towar]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWU_Trasa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWU_WynikAnalizyRyzyka]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWU_ZamkniecieCelne]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[MEX_Przewoznik]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[MEX_Towar]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_Podmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_Towar]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_Trasa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_WynikAnalizyRyzyka]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_ZamkniecieCelne]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[TRS_Pozycje]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_Podmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_Pozwolenie]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_Towar]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_Trasa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_ZamkniecieCelne]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_ZamkniecieCelneWUzupeln]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_Zglaszajacy]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_DokumentPoprzedni]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_DokumentWymagany]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_InformacjaDodatkowa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_Komentarz]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_Kontener]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_Opakowanie]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_TowarKomentarz]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_TowarPodmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWA_ZamkniecieCelne]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_Komentarz]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_Podmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_Towar]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_Trasa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_ZamkniecieCelne]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Komentarz]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Podmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Towar]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Trasa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_ZamkniecieCelne]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Zglaszajacy]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWA_DokumentWymagany]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWA_Kontener]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWA_Opakowanie]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWA_TowarPodmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWU_DokumentWymagany]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWU_Kontener]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWU_Opakowanie]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[DWU_TowarPodmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[MEX_DaneCelne]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_DokumentPoprzedni]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_DokumentWymagany]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_InformacjaDodatkowa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_Kontener]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_Opakowanie]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[QUERY_TowarPodmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[TRS_DokumentyDeklaracji]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[TRS_Rezerwacje]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_DokumentPoprzedni]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_DokumentWymagany]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_Ilosc]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_InformacjaDodatkowa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_KodDodatkowyPL]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_KodDodatkowyPLWUzupln]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_KodDodatkowyUE]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_KodDodatkowyUEWUzupln]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_Kontener]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_Opakowanie]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_Oplata]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_ProceduraGospodarcza]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_SrodkiTaryfowe]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZUZ_TowarPodmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_DokumentPoprzedni]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_DokumentWymagany]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_InformacjaDodatkowa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_Kontener]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_Opakowanie]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_TowarKomentarz]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWP_TowarPodmiot]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_DokumentPoprzedni]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_DokumentWymagany]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Ilosc]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_InformacjaDodatkowa]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_KodDodatkowyPL]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_KodDodatkowyUE]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Kontener]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Korekta]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Opakowanie]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_Oplata]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_TowarKomentarz]';
	EXEC [aes2].[MergeTableFromStageHurtownia] '[aes2].[ZWU_TowarPodmiot]';

END