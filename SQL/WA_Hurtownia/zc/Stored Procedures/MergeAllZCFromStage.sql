-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-08-04
-- Description:	
-- =============================================

CREATE PROCEDURE [zc].[MergeAllZCFromStage]
AS
BEGIN
	SET NOCOUNT ON;
		
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWA_Dokument';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWA_Trasa';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWA_Towar';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWA_Opakowanie';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWA_Kontener';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWA_ZamkniecieCelne';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWA_DokumentWymagany';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWA_TowarPodmiot';

		EXEC [zc].[MergeTableFromStageHurtownia] 'DWU_Trasa';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWU_Towar';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWU_Kontener';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWU_DokumentWymagany';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWU_ZamkniecieCelne';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWU_Opakowanie';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWU_WynikAnalizyRyzyka';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWU_TowarPodmiot';
		EXEC [zc].[MergeTableFromStageHurtownia] 'DWU_Dokument';

		EXEC [zc].[MergeTableFromStageHurtownia] 'MEX_Dokument';
		EXEC [zc].[MergeTableFromStageHurtownia] 'MEX_Przewoznik';
		EXEC [zc].[MergeTableFromStageHurtownia] 'MEX_DaneCelne';
		EXEC [zc].[MergeTableFromStageHurtownia] 'MEX_Towar';

		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_Podmiot';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_Zamkniecie';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_Kontener';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_Trasa';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_KolejnyUrzadWprowadzenia';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_TowarPodmiot';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_TransportNaGranicy';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_Opakowanie';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_DokumentWymagany';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_InformacjaDodatkowa';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PDS_Towar';

		EXEC [zc].[MergeTableFromStageHurtownia] 'PTW_Podmiot';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PTW_Towar';
		EXEC [zc].[MergeTableFromStageHurtownia] 'PTW_DaneCelne';

		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_Towar';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_Opakowanie';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_Kontener';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_DokumentPoprzedni';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_DokumentWymagany';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_InformacjaDodatkowa';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_ZamkniecieCelne';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_Komentarz';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_TowarKomentarz';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_Podmiot';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_Dokument';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWA_TowarPodmiot';
		
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Zglaszajacy';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Trasa';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Kontener';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Korekta';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_ZamkniecieCelne';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Komentarz';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_TowarKomentarz';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Towar';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Opakowanie';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Ilosc';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_DokumentPoprzedni';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_DokumentWymagany';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_InformacjaDodatkowa';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Oplata';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_KodDodatkowyUE';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_KodDodatkowyPL';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_TowarPodmiot';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Podmiot';
		EXEC [zc].[MergeTableFromStageHurtownia] 'ZWU_Dokument';
		
		
END