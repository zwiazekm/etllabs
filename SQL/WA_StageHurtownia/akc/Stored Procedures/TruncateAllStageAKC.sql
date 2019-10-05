

-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-08-07
-- Description:	Procedura czyści wszystkie tabele znajdujące się w WA_StageHurtownia przygotowując je do zasilenia (przyrostowego) z systemu AKC
-- =============================================
CREATE PROCEDURE [akc].[TruncateAllStageAKC]
AS
BEGIN
	SET NOCOUNT ON;
		
		TRUNCATE TABLE akc.Podmiot;
		TRUNCATE TABLE akc.AKC3_Deklaracja;
		TRUNCATE TABLE akc.AKC3_PodatekWedlugGrup;
		TRUNCATE TABLE akc.AKC3_ZalacznikA;
		TRUNCATE TABLE akc.AKC3_ZalacznikB;
		TRUNCATE TABLE akc.AKC3_ZalacznikC;
		TRUNCATE TABLE akc.AKC3_ZalacznikD;
		TRUNCATE TABLE akc.AKC3_ZalacznikE;
		TRUNCATE TABLE akc.AKC3_ZalacznikF;
		TRUNCATE TABLE akc.AKC3_ZalacznikG;
		TRUNCATE TABLE akc.AKC3_ZalacznikH;
		TRUNCATE TABLE akc.AKC3_ZalacznikI;
		TRUNCATE TABLE akc.AKC3_ZalacznikJ;
		TRUNCATE TABLE akc.AKC3_ZalacznikA_Towary;
		TRUNCATE TABLE akc.AKC3_ZalacznikB_Towary;
		TRUNCATE TABLE akc.AKC3_ZalacznikC_Towary;
		TRUNCATE TABLE akc.AKC3_ZalacznikD_Towary;
		TRUNCATE TABLE akc.AKC3_ZalacznikE_Towary;
		TRUNCATE TABLE akc.AKC3_ZalacznikF_Towary;
		TRUNCATE TABLE akc.AKC3_ZalacznikG_Towary;
		TRUNCATE TABLE akc.AKC3_ZalacznikH_Towary;
		TRUNCATE TABLE akc.AKC3_ZalacznikI_Towary;
		TRUNCATE TABLE akc.AKC3_ZalacznikJ_Towary;
		TRUNCATE TABLE akc.AKC4_Deklaracja;
		TRUNCATE TABLE akc.AKC4_PodatekWedlugGrup;
		TRUNCATE TABLE akc.AKC4_ZalacznikA;
		TRUNCATE TABLE akc.AKC4_ZalacznikB;
		TRUNCATE TABLE akc.AKC4_ZalacznikC;
		TRUNCATE TABLE akc.AKC4_ZalacznikD;
		TRUNCATE TABLE akc.AKC4_ZalacznikE;
		TRUNCATE TABLE akc.AKC4_ZalacznikF;
		TRUNCATE TABLE akc.AKC4_ZalacznikH;
		TRUNCATE TABLE akc.AKC4_ZalacznikI;
		TRUNCATE TABLE akc.AKC4_ZalacznikJ;
		TRUNCATE TABLE akc.AKC4_ZalacznikK;
		TRUNCATE TABLE akc.AKC4_ZalacznikL;
		TRUNCATE TABLE akc.AKC4_ZalacznikA_Towary;
		TRUNCATE TABLE akc.AKC4_ZalacznikB_Towary;
		TRUNCATE TABLE akc.AKC4_ZalacznikC_Towary;
		TRUNCATE TABLE akc.AKC4_ZalacznikD_Towary;
		TRUNCATE TABLE akc.AKC4_ZalacznikE_Towary;
		TRUNCATE TABLE akc.AKC4_ZalacznikF_Towary;
		TRUNCATE TABLE akc.AKC4_ZalacznikH_Towary;
		TRUNCATE TABLE akc.AKC4_ZalacznikI_Towary;
		TRUNCATE TABLE akc.AKC4_ZalacznikJ_Towary;
		TRUNCATE TABLE akc.AKC4_ZalacznikK_Towary;
		TRUNCATE TABLE akc.AKC4_ZalacznikL_Towary;
		TRUNCATE TABLE akc.AKCEN_Deklaracja;
		TRUNCATE TABLE akc.AKCEN_Towary;
		TRUNCATE TABLE akc.AKCP_Deklaracja;
		TRUNCATE TABLE akc.AKCP_Towary;
		TRUNCATE TABLE akc.AKCPA_Deklaracja;
		TRUNCATE TABLE akc.AKCPA_Zalacznik;
		TRUNCATE TABLE akc.AKCPA_Towary;
		TRUNCATE TABLE akc.AKCST_Deklaracja;
		TRUNCATE TABLE akc.AKCST_Towary;
		TRUNCATE TABLE akc.ZPNW_Dokument;
		TRUNCATE TABLE akc.ZPNW_Towary;
		TRUNCATE TABLE akc.AKCU_Deklaracja;
		TRUNCATE TABLE akc.AKCU_Towary;
		TRUNCATE TABLE akc.AKCWW_Deklaracja;
		TRUNCATE TABLE akc.AKCWW_Towary;
		TRUNCATE TABLE akc.INF_Informacja_A;
		TRUNCATE TABLE akc.INF_Informacja_B;
		TRUNCATE TABLE akc.INF_Informacja_C;
		TRUNCATE TABLE akc.INF_Informacja_D;
		TRUNCATE TABLE akc.INF_Informacja_F;
		TRUNCATE TABLE akc.INF_Informacja_I;
		TRUNCATE TABLE akc.INF_Informacja_J;
		TRUNCATE TABLE akc.INF_Informacja_K;
		TRUNCATE TABLE akc.OplataPaliwowa;
		TRUNCATE TABLE akc.OplataPaliwowa_Towary;
		TRUNCATE TABLE akc.POG_Deklaracja;
		TRUNCATE TABLE akc.PodatekWedlugGier;
		TRUNCATE TABLE akc.POG_ZalacznikA;
		TRUNCATE TABLE akc.POG_ZalacznikC;
		TRUNCATE TABLE akc.POG_ZalacznikD;
		TRUNCATE TABLE akc.POG_ZalacznikR;
		TRUNCATE TABLE akc.POG_ZalacznikA_Gry;
		TRUNCATE TABLE akc.POG_ZalacznikC_Gry;
		TRUNCATE TABLE akc.POG_ZalacznikD_Gry;
		TRUNCATE TABLE akc.POG_ZalacznikR_Gry;
		TRUNCATE TABLE akc.POGP_Deklaracja;
		TRUNCATE TABLE akc.PKOP_Deklaracja;
		TRUNCATE TABLE akc.PKOP_Towary;
		TRUNCATE TABLE akc.AKCWG_Deklaracja;
		TRUNCATE TABLE akc.AKCWG_Towary;

END