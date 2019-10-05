-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2014-07-25
-- Description:	
-- =============================================

CREATE PROCEDURE [zab].[MergeAllZabFromStage]
AS
BEGIN
	SET NOCOUNT ON;

	EXEC [zab].[MergeTableFromStageHurtownia] 'Podmiot';
	EXEC [zab].[MergeTableFromStageHurtownia] 'Zabezpieczenia';
	EXEC [zab].[MergeTableFromStageHurtownia] 'StatusPodmiotu';
	EXEC [zab].[MergeTableFromStageHurtownia] 'Gwaranci';
	EXEC [zab].[MergeTableFromStageHurtownia] 'Gwarancja';
	EXEC [zab].[MergeTableFromStageHurtownia] 'Hipoteka';
	EXEC [zab].[MergeTableFromStageHurtownia] 'Potwierdzenie';
	EXEC [zab].[MergeTableFromStageHurtownia] 'OgraniczenieWaznosciZabezp';
	EXEC [zab].[MergeTableFromStageHurtownia] 'PokwitowaniePotwierdzenie';
	EXEC [zab].[MergeTableFromStageHurtownia] 'ProceduryAkcyzoweNaZabezp';
	EXEC [zab].[MergeTableFromStageHurtownia] 'StatusPodmiotuNaZabezp';
	EXEC [zab].[MergeTableFromStageHurtownia] 'WlasciwoscMiejscowa';
	EXEC [zab].[MergeTableFromStageHurtownia] 'ZlozenieZabezpieczenia';
	EXEC [zab].[MergeTableFromStageHurtownia] 'ProceduryCelne';
	EXEC [zab].[MergeTableFromStageHurtownia] 'ProceduryCelneNaZabezp';
END