
-- =============================================
-- Author:		
-- Create date: 2015-10-05
-- Description:	
-- =============================================

CREATE PROCEDURE [zef2].[MergeAllZEFIR2FromStageHurtownia]
AS
BEGIN
	SET NOCOUNT ON;
		EXEC [zef2].[MergeTableFromStageHurtownia] 'AtrybutyKlasyfikacji';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'Bilans_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'Bilans_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'DefinicjaEtapowZatwierdzen';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'DefinicjaGrupZatwierdzen';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'DefinicjaPolaSprawozdania';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'DefinicjaSprawozdania';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'DefinicjaWierszySprawozdania';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'GrupaDefinicjiSprawozdan';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'GrupyZatrudnienia';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'JednostkiOrganizacyjne';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'Programy';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB23_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB23_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB23A_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB23A_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB23B_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB23B_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB27_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB27_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28NW_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28NW_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28Programy_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28Programy_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28ProgramyWPR_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28ProgramyWPR_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28UE_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28UE_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28UEWPR_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB28UEWPR_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB70_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RB70_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RBWSB_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RBWSB_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RZIS_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RZIS_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'ZZFJ_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'ZZFJ_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'Meldunek_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'Meldunek_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RBN_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RBN_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RBZ_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RBZ_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RBBZ1_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'RBBZ1_Pozycje';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'SC4_Dokument';
		EXEC [zef2].[MergeTableFromStageHurtownia] 'SC4_Pozycje';
END