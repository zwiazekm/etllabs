-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-19
-- Description:	Procedura merge'ująca w schemacie Intrastat.
-- =============================================

CREATE PROCEDURE [int].[MergeAllIntrastatFromStageODS]
AS
BEGIN
	SET NOCOUNT ON;
		EXEC [int].[MergeTableFromStageODS] 'dokumenty';
		EXEC [int].[MergeTableFromStageODS] 'intr_dane_pod';
		EXEC [int].[MergeTableFromStageODS] 'intr_historia_podmiotu';
		EXEC [int].[MergeTableFromStageODS] 'intr_kategoria';
		EXEC [int].[MergeTableFromStageODS] 'intr_okres_sprawozd';
		EXEC [int].[MergeTableFromStageODS] 'intr_priorytet';
		EXEC [int].[MergeTableFromStageODS] 'intr_rdin';
		EXEC [int].[MergeTableFromStageODS] 'intr_upowaznienie';
		EXEC [int].[MergeTableFromStageODS] 'intr_ustalenia';
		EXEC [int].[MergeTableFromStageODS] 'intr_wlasc_terytor';
		EXEC [int].[MergeTableFromStageODS] 'istat_blad_zrodlowy';
		EXEC [int].[MergeTableFromStageODS] 'istat_dekl_wynik_dok';
		EXEC [int].[MergeTableFromStageODS] 'istat_dekl_wynik_blad';
		EXEC [int].[MergeTableFromStageODS] 'istat_dekl_wynik_poz';
		EXEC [int].[MergeTableFromStageODS] 'istat_dok_zrodlowy';
		EXEC [int].[MergeTableFromStageODS] 'istat_zdarzenie';
		EXEC [int].[MergeTableFromStageODS] 'istat_zmiana_danych';
END