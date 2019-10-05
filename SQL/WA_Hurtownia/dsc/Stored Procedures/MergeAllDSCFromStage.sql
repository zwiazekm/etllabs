-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-28
-- Description:	
-- =============================================

CREATE PROCEDURE [dsc].[MergeAllDSCFromStage]
AS
BEGIN
	SET NOCOUNT ON;
	EXEC [dsc].[MergeTableFromStageHurtownia] 'Slownik';
	EXEC [dsc].[MergeTableFromStageHurtownia] 'Pracownik';
	EXEC [dsc].[MergeTableFromStageHurtownia] 'Umowa';
	EXEC [dsc].[MergeTableFromStageHurtownia] 'StatusZatrudnienia';
	EXEC [dsc].[MergeTableFromStageHurtownia] 'RodzajWyksztalcenia';
	EXEC [dsc].[MergeTableFromStageHurtownia] 'StopienSluzbowy';
	EXEC [dsc].[MergeTableFromStageHurtownia] 'WymiarEtatu';
	EXEC [dsc].[MergeTableFromStageHurtownia] 'JednostkaOrganizacyjna';
	EXEC [dsc].[MergeTableFromStageHurtownia] 'TypJednostkiOrganizacyjnej';
	EXEC [dsc].[MergeTableFromStageHurtownia] 'Stanowisko';
	EXEC [dsc].[MergeTableFromStageHurtownia] 'Zatrudnienie';
	
END