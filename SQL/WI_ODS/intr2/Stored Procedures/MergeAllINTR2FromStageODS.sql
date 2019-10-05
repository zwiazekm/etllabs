








-- =============================================
-- Author:		Michał Błędowski poprawki Paweł Roszkowski
-- Create date: 2015-12-15
-- Description:	Procedura merge'ująca w schemacie intr2.
-- =============================================

CREATE PROCEDURE [intr2].[MergeAllINTR2FromStageODS]
AS
BEGIN
	SET NOCOUNT ON;


EXEC [intr2].[MergeTableFromStageODS] 'caac_bledne_dane';
EXEC [intr2].[MergeTableFromStageODS] 'caac_bledne_dane_xml';
EXEC [intr2].[MergeTableFromStageODS] 'celina_bledne_dane_xml';
EXEC [intr2].[MergeTableFromStageODS] 'dn_podprogowe';
EXEC [intr2].[MergeTableFromStageODS] 'intr_dane_pod';
EXEC [intr2].[MergeTableFromStageODS] 'intr_rdin';
EXEC [intr2].[MergeTableFromStageODS] 'intr_ustalenia';
EXEC [intr2].[MergeTableFromStageODS] 'intr_vies';
EXEC [intr2].[MergeTableFromStageODS] 'intr_zdarzenie';
EXEC [intr2].[MergeTableFromStageODS] 'istat_blad_zrodlowy';
EXEC [intr2].[MergeTableFromStageODS] 'istat_dekl_wynik_dok';
EXEC [intr2].[MergeTableFromStageODS] 'istat_dok_zrodlowy_roboczy';
EXEC [intr2].[MergeTableFromStageODS] 'istat_grid_state';
EXEC [intr2].[MergeTableFromStageODS] 'istat_komunikat_popup';
EXEC [intr2].[MergeTableFromStageODS] 'istat_reporting_periods_recalc';
EXEC [intr2].[MergeTableFromStageODS] 'istat_zmiana_danych';
EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_CALENDARS';
EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_FIRED_TRIGGERS';
EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_JOB_DETAILS';
EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_LOCKS';
EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_PAUSED_TRIGGER_GRPS';
EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_SCHEDULER_STATE';
EXEC [intr2].[MergeTableFromStageODS] 'rodzslow';
EXEC [intr2].[MergeTableFromStageODS] 's_maxids_like_aes';
EXEC [intr2].[MergeTableFromStageODS] 'schema_version';
EXEC [intr2].[MergeTableFromStageODS] 'intr_ape';
EXEC [intr2].[MergeTableFromStageODS] 'intr_historia_podmiotu';
EXEC [intr2].[MergeTableFromStageODS] 'intr_historia_ustalenia';
EXEC [intr2].[MergeTableFromStageODS] 'intr_kategoria';
EXEC [intr2].[MergeTableFromStageODS] 'intr_okres_sprawozd';
EXEC [intr2].[MergeTableFromStageODS] 'intr_priorytet';
EXEC [intr2].[MergeTableFromStageODS] 'intr_status';
EXEC [intr2].[MergeTableFromStageODS] 'istat_dane_wlasne_podmiotu';
EXEC [intr2].[MergeTableFromStageODS] 'istat_dekl_wynik_blad';
EXEC [intr2].[MergeTableFromStageODS] 'istat_dekl_wynik_poz';
EXEC [intr2].[MergeTableFromStageODS] 'istat_dok_zrodlowy';
EXEC [intr2].[MergeTableFromStageODS] 'istat_komunikat';
EXEC [intr2].[MergeTableFromStageODS] 'istat_komunikat_popup_uzytkownik';
EXEC [intr2].[MergeTableFromStageODS] 'istat_menu';
EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_TRIGGERS';
EXEC [intr2].[MergeTableFromStageODS] 'slowniki';
EXEC [intr2].[MergeTableFromStageODS] 'intr_okres_sprawozd_kraj';
EXEC [intr2].[MergeTableFromStageODS] 'istat_dok_wyslany';
EXEC [intr2].[MergeTableFromStageODS] 'istat_komunikat_powiazania';
/* EXEC [intr2].[MergeTableFromStageODS] 'istat_komunikat_zalaczniki'; */
EXEC [intr2].[MergeTableFromStageODS] 'istat_zdarzenie';
EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_BLOB_TRIGGERS';
EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_CRON_TRIGGERS';

EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_SIMPLE_TRIGGERS';
EXEC [intr2].[MergeTableFromStageODS] 'QRTZ_SIMPROP_TRIGGERS';
EXEC [intr2].[MergeTableFromStageODS] 'intr_okres_sprawozd_kraj_kontrahent';
EXEC [intr2].[MergeTableFromStageODS] 'dot_obroty_roczne';




END