CREATE PROCEDURE [zef2DP].[MergeAllFromStageHurtownia]
AS
BEGIN
	SET NOCOUNT ON;
	
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_PodatekWedlugGrup';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikA';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikA_InfKwotWplatDzien';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikA_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikB';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikB_InfKwotWplatDzien';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikB_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikC';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikC_InfKwotWplatDzien';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikC_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikD';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikD_InfKwotWplatDzien';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikD_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikE';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikE_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikF';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikF_InfKwotWplatDzien';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikF_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikH';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikH_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikI';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikI_InfKwotWplatDzien';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikI_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikJ';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikJ_InfKwotWplatDzien';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikJ_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikK';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikK_InfKwotWplatDzien';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikK_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikL';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_ZalacznikL_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCEN_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCP_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCPA_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCST_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCU_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCWG_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCWW_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'GHD1_Gry';
	EXEC zef2DP.MergeTableFromStageHurtownia 'OplataPaliwowa_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'PKOP_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'PKOPRG_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'PKOPMS_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'Podmiot';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POG4_ZalacznikA';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POG4_ZalacznikR';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POG5_ZalacznikA';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POG5_ZalacznikA_v4';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POG5_ZalacznikC';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POG5_ZalacznikC_v4';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POG5_ZalacznikD';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POG5_ZalacznikD_v4';
	EXEC zef2DP.MergeTableFromStageHurtownia 'ZPNW_Towary';

	--PISMO XML Z WARUNKAMI
	
	EXEC zef2DP.MergeTableFromStageHurtownia 'ZPNW_Dokument';
	EXEC zef2DP.MergeTableFromStageHurtownia 'OplataPaliwowa';
	EXEC zef2DP.MergeTableFromStageHurtownia 'GHD1_Informacja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKC4_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCP_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCPA_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCST_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCU_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCWG_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCWW_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POG5_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POG4_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'PKOP_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'PKOPMS_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'PKOPRG_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'POGP_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCEN_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'INF_Informacja_A';
	EXEC zef2DP.MergeTableFromStageHurtownia 'INF_Informacja_B';
	EXEC zef2DP.MergeTableFromStageHurtownia 'INF_Informacja_C';
	EXEC zef2DP.MergeTableFromStageHurtownia 'INF_Informacja_D';
	EXEC zef2DP.MergeTableFromStageHurtownia 'INF_Informacja_F';
	EXEC zef2DP.MergeTableFromStageHurtownia 'INF_Informacja_I';
	EXEC zef2DP.MergeTableFromStageHurtownia 'INF_Informacja_J';
	EXEC zef2DP.MergeTableFromStageHurtownia 'INF_Informacja_K';

	--VAT

	EXEC zef2DP.MergeTableFromStageHurtownia 'VAT14_Pozycje';
	EXEC zef2DP.MergeTableFromStageHurtownia 'VAT14_Deklaracja';

	--ZZ7
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCUA_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCUA_Towary';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCUS_Deklaracja';
	EXEC zef2DP.MergeTableFromStageHurtownia 'AKCUS_Towary';


END