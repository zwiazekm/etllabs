



CREATE PROCEDURE [zef2].[TruncateAllStageZEF2]
AS
BEGIN
	SET NOCOUNT ON;
		TRUNCATE TABLE zef2.RB28_Dokument;
		TRUNCATE TABLE zef2.RB28_Pozycje;
		TRUNCATE TABLE zef2.RB27_Dokument;
		TRUNCATE TABLE zef2.RB27_Pozycje;
		TRUNCATE TABLE zef2.RB23A_Dokument;
		TRUNCATE TABLE zef2.RB23A_Pozycje;
		TRUNCATE TABLE zef2.RB23B_Dokument;
		TRUNCATE TABLE zef2.RB23B_Pozycje;
		TRUNCATE TABLE zef2.RB23_Dokument;
		TRUNCATE TABLE zef2.RB23_Pozycje;
		TRUNCATE TABLE zef2.RB28UE_Dokument;
		TRUNCATE TABLE zef2.RB28UE_Pozycje;
		TRUNCATE TABLE zef2.RB28UEWPR_Dokument;
		TRUNCATE TABLE zef2.RB28UEWPR_Pozycje;
		TRUNCATE TABLE zef2.RB28Programy_Dokument;
		TRUNCATE TABLE zef2.RB28Programy_Pozycje;
		TRUNCATE TABLE zef2.RB28ProgramyWPR_Dokument;
		TRUNCATE TABLE zef2.RB28ProgramyWPR_Pozycje;
		TRUNCATE TABLE zef2.RB28NW_Dokument;
		TRUNCATE TABLE zef2.RB28NW_Pozycje;
		TRUNCATE TABLE zef2.RB70_Dokument;
		TRUNCATE TABLE zef2.RB70_Pozycje;
		TRUNCATE TABLE zef2.RBWSB_Dokument;
		TRUNCATE TABLE zef2.RBWSB_Pozycje;
		TRUNCATE TABLE zef2.Bilans_Dokument;
		TRUNCATE TABLE zef2.Bilans_Pozycje;
		TRUNCATE TABLE zef2.RZIS_Dokument;
		TRUNCATE TABLE zef2.RZIS_Pozycje;
		TRUNCATE TABLE zef2.ZZFJ_Dokument;
		TRUNCATE TABLE zef2.ZZFJ_Pozycje;
		TRUNCATE TABLE zef2.GrupaDefinicjiSprawozdan;
		TRUNCATE TABLE zef2.JednostkiOrganizacyjne;
		TRUNCATE TABLE zef2.DefinicjaSprawozdania;
		TRUNCATE TABLE zef2.DefinicjaPolaSprawozdania;
		TRUNCATE TABLE zef2.DefinicjaWierszySprawozdania;
		TRUNCATE TABLE zef2.DefinicjaGrupZatwierdzen;
		TRUNCATE TABLE zef2.DefinicjaEtapowZatwierdzen;
		TRUNCATE TABLE zef2.Programy;
		TRUNCATE TABLE zef2.GrupyZatrudnienia;
		TRUNCATE TABLE zef2.AtrybutyKlasyfikacji;		
		TRUNCATE TABLE zef2.Meldunek_Dokument;
		TRUNCATE TABLE zef2.Meldunek_Pozycje;
		TRUNCATE TABLE zef2.RBN_Dokument;
		TRUNCATE TABLE zef2.RBN_Pozycje;
		TRUNCATE TABLE zef2.RBZ_Dokument;
		TRUNCATE TABLE zef2.RBZ_Pozycje;
		TRUNCATE TABLE zef2.RBBZ1_Dokument;
		TRUNCATE TABLE zef2.RBBZ1_Pozycje;
		TRUNCATE TABLE zef2.SC4_Dokument;
		TRUNCATE TABLE zef2.SC4_Pozycje;
	END