﻿

-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-07-28
-- Description:	
-- =============================================

CREATE PROCEDURE [akc].[MergeAllAKCFromStage]
AS
BEGIN
	SET NOCOUNT ON;

		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCWG_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'PKOP_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'Podmiot';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCEN_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCP_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCPA_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCST_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCU_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCWG_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCWW_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_A';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_B';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_C';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_D';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_F';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_I';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_J';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_K';
		EXEC [akc].[MergeTableFromStageHurtownia] 'OplataPaliwowa';
		EXEC [akc].[MergeTableFromStageHurtownia] 'PKOP_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POGP_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'ZPNW_Dokument';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_PodatekWedlugGrup';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikA';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikB';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikC';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikD';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikE';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikF';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikG';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikH';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikI';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikJ';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_PodatekWedlugGrup';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikA';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikB';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikC';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikD';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikE';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikF';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikH';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikI';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikJ';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikK';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikL';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCEN_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCP_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCPA_Zalacznik';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCST_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCU_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCWW_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'OplataPaliwowa_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'PodatekWedlugGier';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikA';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikC';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikD';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikR';
		EXEC [akc].[MergeTableFromStageHurtownia] 'ZPNW_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikA_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikB_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikC_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikD_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikE_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikF_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikG_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikH_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikI_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikJ_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikA_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikB_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikC_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikD_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikE_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikF_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikH_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikI_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikJ_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikK_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikL_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCPA_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikA_Gry';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikC_Gry';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikD_Gry';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikR_Gry';

		/* zła kolejność mergowania??
		EXEC [akc].[MergeTableFromStageHurtownia] 'Podmiot';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_PodatekWedlugGrup';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikA';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikB';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikC';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikD';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikE';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikF';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikG';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikH';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikI';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikJ';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikA_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikB_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikC_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikD_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikE_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikF_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikG_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikH_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikI_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC3_ZalacznikJ_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_PodatekWedlugGrup';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikA';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikB';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikC';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikD';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikE';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikF';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikH';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikI';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikJ';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikK';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikL';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikA_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikB_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikC_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikD_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikE_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikF_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikH_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikI_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikJ_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikK_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKC4_ZalacznikL_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCEN_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCEN_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCP_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCP_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCPA_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCPA_Zalacznik';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCPA_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCST_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCST_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'ZPNW_Dokument';
		EXEC [akc].[MergeTableFromStageHurtownia] 'ZPNW_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCU_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCU_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCWW_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCWW_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_A';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_B';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_C';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_D';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_F';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_I';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_J';
		EXEC [akc].[MergeTableFromStageHurtownia] 'INF_Informacja_K';
		EXEC [akc].[MergeTableFromStageHurtownia] 'OplataPaliwowa';
		EXEC [akc].[MergeTableFromStageHurtownia] 'OplataPaliwowa_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'PodatekWedlugGier';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikA';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikC';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikD';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikR';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikA_Gry';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikC_Gry';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikD_Gry';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POG_ZalacznikR_Gry';
		EXEC [akc].[MergeTableFromStageHurtownia] 'POGP_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'PKOP_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'PKOP_Towary';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCWG_Deklaracja';
		EXEC [akc].[MergeTableFromStageHurtownia] 'AKCWG_Towary';
		*/
END