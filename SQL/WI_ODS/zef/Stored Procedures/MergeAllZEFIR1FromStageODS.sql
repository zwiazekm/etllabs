-- =============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-10-10
-- Description:	
-- =============================================

CREATE PROCEDURE [zef].[MergeAllZEFIR1FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;

		EXEC [zef].[MergeTableFromStageODS] 'kontrahenci';
		EXEC [zef].[MergeTableFromStageODS] 'dokumenty';
		EXEC [zef].[MergeTableFromStageODS] 'dl_kontr';
		EXEC [zef].[MergeTableFromStageODS] 'dl_sprawy';
		EXEC [zef].[MergeTableFromStageODS] 'dl_kontr_solid';
		EXEC [zef].[MergeTableFromStageODS] 'dok_jednostka';
		EXEC [zef].[MergeTableFromStageODS] 'dok_opal';
		EXEC [zef].[MergeTableFromStageODS] 'dok_sad';
		EXEC [zef].[MergeTableFromStageODS] 'dok_tytwyk';
		EXEC [zef].[MergeTableFromStageODS] 'dok_wplaty';
		EXEC [zef].[MergeTableFromStageODS] 'mand_kwal';
		EXEC [zef].[MergeTableFromStageODS] 'mand_kwot';
		EXEC [zef].[MergeTableFromStageODS] 'popal';
		EXEC [zef].[MergeTableFromStageODS] 'psad';
		EXEC [zef].[MergeTableFromStageODS] 'pwplat';
		EXEC [zef].[MergeTableFromStageODS] 'slowniki';
		EXEC [zef].[MergeTableFromStageODS] 'sprawoz_meld';
		EXEC [zef].[MergeTableFromStageODS] 'dok_ainf';
		EXEC [zef].[MergeTableFromStageODS] 'dok_pog';
		EXEC [zef].[MergeTableFromStageODS] 'dok_akc';
		EXEC [zef].[MergeTableFromStageODS] 'pspraw';
		EXEC [zef].[MergeTableFromStageODS] 'dok_akcz';
		EXEC [zef].[MergeTableFromStageODS] 'pdok_akcz';
		EXEC [zef].[MergeTableFromStageODS] 'dok_pok';
		EXEC [zef].[MergeTableFromStageODS] 'pdok_pok'
		EXEC [zef].[MergeTableFromStageODS] 'dok_ainf1';
		EXEC [zef].[MergeTableFromStageODS] 'dok_ainf2';
		EXEC [zef].[MergeTableFromStageODS] 'dok_akc3z';
		EXEC [zef].[MergeTableFromStageODS] 'dok_akc3zf';
		EXEC [zef].[MergeTableFromStageODS] 'pdok_akc3z';
		EXEC [zef].[MergeTableFromStageODS] 'dok_pog4z';
		EXEC [zef].[MergeTableFromStageODS] 'pdok_pog4z';
		EXEC [zef].[MergeTableFromStageODS] 'dok_akc4z';
		EXEC [zef].[MergeTableFromStageODS] 'pdok_akc4z';
		EXEC [zef].[MergeTableFromStageODS] 'ew_egz_agr';
		EXEC [zef].[MergeTableFromStageODS] 'ew_nal_agr';
		EXEC [zef].[MergeTableFromStageODS] 'samochody';

END