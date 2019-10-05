



-- =============================================
-- Author:		Michał Błędowski
-- Create date: 2015-12-15
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego).
-- =============================================
CREATE PROCEDURE [intr2].[TruncateINTR2]


AS
BEGIN
	SET NOCOUNT ON;

TRUNCATE TABLE intr2.caac_bledne_dane
TRUNCATE TABLE intr2.caac_bledne_dane_xml
TRUNCATE TABLE intr2.celina_bledne_dane_xml
TRUNCATE TABLE intr2.dn_podprogowe
TRUNCATE TABLE intr2.intr_ape
TRUNCATE TABLE intr2.intr_dane_pod
TRUNCATE TABLE intr2.intr_historia_podmiotu
TRUNCATE TABLE intr2.intr_historia_ustalenia
TRUNCATE TABLE intr2.intr_kategoria
TRUNCATE TABLE intr2.intr_okres_sprawozd
TRUNCATE TABLE intr2.intr_okres_sprawozd_kraj
TRUNCATE TABLE intr2.intr_okres_sprawozd_kraj_kontrahent
TRUNCATE TABLE intr2.intr_priorytet
TRUNCATE TABLE intr2.intr_rdin
TRUNCATE TABLE intr2.intr_status
TRUNCATE TABLE intr2.intr_ustalenia
TRUNCATE TABLE intr2.intr_vies
TRUNCATE TABLE intr2.intr_zdarzenie
TRUNCATE TABLE intr2.istat_blad_zrodlowy
TRUNCATE TABLE intr2.istat_dane_wlasne_podmiotu
TRUNCATE TABLE intr2.istat_dekl_wynik_blad
TRUNCATE TABLE intr2.istat_dekl_wynik_dok
TRUNCATE TABLE intr2.istat_dekl_wynik_poz
TRUNCATE TABLE intr2.istat_dok_wyslany
TRUNCATE TABLE intr2.istat_dok_zrodlowy
TRUNCATE TABLE intr2.istat_dok_zrodlowy_roboczy
TRUNCATE TABLE intr2.istat_grid_state
TRUNCATE TABLE intr2.istat_komunikat
TRUNCATE TABLE intr2.istat_komunikat_popup
TRUNCATE TABLE intr2.istat_komunikat_popup_uzytkownik
TRUNCATE TABLE intr2.istat_komunikat_powiazania
TRUNCATE TABLE intr2.istat_komunikat_zalaczniki
TRUNCATE TABLE intr2.istat_menu
TRUNCATE TABLE intr2.istat_reporting_periods_recalc
TRUNCATE TABLE intr2.istat_zdarzenie
TRUNCATE TABLE intr2.istat_zmiana_danych
TRUNCATE TABLE intr2.QRTZ_BLOB_TRIGGERS
TRUNCATE TABLE intr2.QRTZ_CALENDARS
TRUNCATE TABLE intr2.QRTZ_CRON_TRIGGERS
TRUNCATE TABLE intr2.QRTZ_FIRED_TRIGGERS
TRUNCATE TABLE intr2.QRTZ_JOB_DETAILS
TRUNCATE TABLE intr2.QRTZ_LOCKS
TRUNCATE TABLE intr2.QRTZ_PAUSED_TRIGGER_GRPS
TRUNCATE TABLE intr2.QRTZ_SCHEDULER_STATE
TRUNCATE TABLE intr2.QRTZ_SIMPLE_TRIGGERS
TRUNCATE TABLE intr2.QRTZ_SIMPROP_TRIGGERS
TRUNCATE TABLE intr2.QRTZ_TRIGGERS
TRUNCATE TABLE intr2.rodzslow
TRUNCATE TABLE intr2.s_maxids_like_aes
TRUNCATE TABLE intr2.schema_version
TRUNCATE TABLE intr2.slowniki
TRUNCATE TABLE intr2.dot_obroty_roczne

END