



-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-08-07
-- Description:	Procedura czyści wszystkie tabele znajdujące się w WA_StageHurtownia przygotowując je do zasilenia (przyrostowego) z systemu AKC
-- =============================================
CREATE PROCEDURE [zef2DP].[TruncateAllStageZEF2DP]
AS
BEGIN
	SET NOCOUNT ON;
		
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikA_InfKwotWplatDzien
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikB_InfKwotWplatDzien
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikB_Towary
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikC_InfKwotWplatDzien
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikC_Towary
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikD_InfKwotWplatDzien
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikD_Towary
		TRUNCATE TABLE zef2DP.AKC4_PodatekWedlugGrup
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikE_Towary
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikF_InfKwotWplatDzien
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikF_Towary
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikH_Towary
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikI_InfKwotWplatDzien
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikJ_InfKwotWplatDzien
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikJ_Towary
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikK_InfKwotWplatDzien
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikL_Towary
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikI_Towary
		TRUNCATE TABLE zef2DP.Podmiot
		TRUNCATE TABLE zef2DP.AKCU_Towary
		TRUNCATE TABLE zef2DP.AKCEN_Deklaracja
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikC
		TRUNCATE TABLE zef2DP.AKCP_Deklaracja
		TRUNCATE TABLE zef2DP.AKCPA_Towary
		TRUNCATE TABLE zef2DP.ZPNW_Towary
		TRUNCATE TABLE zef2DP.AKCPA_Deklaracja
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikD
		TRUNCATE TABLE zef2DP.AKCST_Deklaracja
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikE
		TRUNCATE TABLE zef2DP.AKCU_Deklaracja
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikF
		TRUNCATE TABLE zef2DP.AKCWG_Deklaracja
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikH
		TRUNCATE TABLE zef2DP.AKCWW_Deklaracja
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikI
		TRUNCATE TABLE zef2DP.GHD1_Informacja
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikJ
		TRUNCATE TABLE zef2DP.INF_Informacja_A
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikK
		TRUNCATE TABLE zef2DP.INF_Informacja_B
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikL
		TRUNCATE TABLE zef2DP.INF_Informacja_C
		TRUNCATE TABLE zef2DP.INF_Informacja_D
		TRUNCATE TABLE zef2DP.INF_Informacja_F
		TRUNCATE TABLE zef2DP.INF_Informacja_I
		TRUNCATE TABLE zef2DP.POG4_ZalacznikA
		TRUNCATE TABLE zef2DP.INF_Informacja_J
		TRUNCATE TABLE zef2DP.POG4_ZalacznikR
		TRUNCATE TABLE zef2DP.INF_Informacja_K
		TRUNCATE TABLE zef2DP.POG5_ZalacznikA
		TRUNCATE TABLE zef2DP.POG5_ZalacznikA_v4
		TRUNCATE TABLE zef2DP.OplataPaliwowa
		TRUNCATE TABLE zef2DP.POG5_ZalacznikC
		TRUNCATE TABLE zef2DP.POG5_ZalacznikC_v4
		TRUNCATE TABLE zef2DP.PKOP_Deklaracja
		TRUNCATE TABLE zef2DP.POG5_ZalacznikD
		TRUNCATE TABLE zef2DP.POG5_ZalacznikD_v4
		TRUNCATE TABLE zef2DP.POG4_Deklaracja
		TRUNCATE TABLE zef2DP.POG5_Deklaracja
		TRUNCATE TABLE zef2DP.POGP_Deklaracja
		TRUNCATE TABLE zef2DP.ZPNW_Dokument
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikK_Towary
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikA_Towary
		TRUNCATE TABLE zef2DP.AKC4_Deklaracja
		TRUNCATE TABLE zef2DP.AKCEN_Towary
		TRUNCATE TABLE zef2DP.AKCP_Towary
		TRUNCATE TABLE zef2DP.AKCST_Towary
		TRUNCATE TABLE zef2DP.AKCWG_Towary
		TRUNCATE TABLE zef2DP.AKCWW_Towary
		TRUNCATE TABLE zef2DP.GHD1_Gry
		TRUNCATE TABLE zef2DP.OplataPaliwowa_Towary
		TRUNCATE TABLE zef2DP.PKOP_Towary
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikA
		TRUNCATE TABLE zef2DP.AKC4_ZalacznikB
		TRUNCATE TABLE zef2DP.BledyWykonania;
		TRUNCATE TABLE zef2DP.VAT14_Deklaracja;
		TRUNCATE TABLE zef2DP.VAT14_Pozycje;
		TRUNCATE TABLE zef2DP.PKOPMS_Towary;
		TRUNCATE TABLE zef2DP.PKOPRG_Towary;
		TRUNCATE TABLE zef2DP.PKOPMS_Deklaracja;
		TRUNCATE TABLE zef2DP.PKOPRG_Deklaracja;

		--ZZ7
		TRUNCATE TABLE zef2DP.AKCUA_Deklaracja;
		TRUNCATE TABLE zef2DP.AKCUA_Towary;
		TRUNCATE TABLE zef2DP.AKCUS_Deklaracja;
		TRUNCATE TABLE zef2DP.AKCUS_Towary;

END