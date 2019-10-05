-- =============================================
-- Author:		Gwidon Józwiak
-- Create date: 2015-08-26
-- Description:	
-- =============================================

CREATE PROCEDURE [zef2].[MergeAllZEFIR2FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;

		EXEC [zef2].[MergeTableFromStageODS] 'Pismo';
		EXEC [zef2].[MergeTableFromStageODS] 'Pismo_Historia';
		EXEC [zef2].[MergeTableFromStageODS] 'Pismo_XML';
		EXEC [zef2].[MergeTableFromStageODS] 'Pismo_XML_Historia';
		EXEC [zef2].[MergeTableFromStageODS] 'Dedykowane_OpisyStatusow';
		EXEC [zef2].[MergeTableFromStageODS] 'Komorka';
		EXEC [zef2].[MergeTableFromStageODS] 'Pracownik';
		EXEC [zef2].[MergeTableFromStageODS] 'Priorytet';
		EXEC [zef2].[MergeTableFromStageODS] 'KierunekPisma';
		EXEC [zef2].[MergeTableFromStageODS] 'rodzaj_deklaracji';
		EXEC [zef2].[MergeTableFromStageODS] 'formy';
		EXEC [zef2].[MergeTableFromStageODS] 'KPfinstatementTable';
		EXEC [zef2].[MergeTableFromStageODS] 'KPfinstatementTrans';
		EXEC [zef2].[MergeTableFromStageODS] 'KPorganizationUnitTable';
		EXEC [zef2].[MergeTableFromStageODS] 'KPProgramTable';
		EXEC [zef2].[MergeTableFromStageODS] 'KPEmploymentGroup';
		EXEC [zef2].[MergeTableFromStageODS] 'KPClassificationAttributeTable';
		EXEC [zef2].[MergeTableFromStageODS] 'KPfinstatementTypeDef';
		EXEC [zef2].[MergeTableFromStageODS] 'KPFinstatementDef';
		EXEC [zef2].[MergeTableFromStageODS] 'KPfinstatementFielddef';
		EXEC [zef2].[MergeTableFromStageODS] 'KPfinstatementRowDef';
		EXEC [zef2].[MergeTableFromStageODS] 'KPJournalStatusTable';
		EXEC [zef2].[MergeTableFromStageODS] 'KPJournalStatusLine';
		EXEC [zef2].[MergeTableFromStageODS] 'orbeon_form_data';
		EXEC [zef2].[MergeTableFromStageODS] 'PismoPowiazane';
		EXEC [zef2].[MergeTableFromStageODS] 'TypPowiazania';
END