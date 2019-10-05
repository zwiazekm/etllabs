
-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-21
-- Description:	Procedura merge'ująca w schemacie Hermes2.
-- =============================================

CREATE PROCEDURE [her].[MergeAllHermes2FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;
		EXEC [her].[MergeTableFromStageODS] 'ad_org_typ';
		EXEC [her].[MergeTableFromStageODS] 'ad_org_etat';
		EXEC [her].[MergeTableFromStageODS] 'ka_dp25';
		EXEC [her].[MergeTableFromStageODS] 'ka_sl001';
		EXEC [her].[MergeTableFromStageODS] 'ad_kat_org';
		EXEC [her].[MergeTableFromStageODS] 'ka_dp001';
		EXEC [her].[MergeTableFromStageODS] 'ka_dp002';
		EXEC [her].[MergeTableFromStageODS] 'ka_dp004';
		EXEC [her].[MergeTableFromStageODS] 'ka_dp010f';
		EXEC [her].[MergeTableFromStageODS] 'ka_dp020';
		EXEC [her].[MergeTableFromStageODS] 'ka_dp020wym';
END