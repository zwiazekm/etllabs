


-- ==============================================
-- Author:		Michał Błędowski poprawki Paweł Roszkowski
-- Create date: 2015-12-09
-- Description:	Procedura Merge'ująca w schemacie intr2.
-- ===============================================

CREATE PROCEDURE [intr2].[MergeTableFromStageODS] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
		END

	IF @TableName = 'caac_bledne_dane' BEGIN
MERGE INTO intr2.caac_bledne_dane AS tgt
USING WI_StageODS.intr2.caac_bledne_dane AS src
ON (tgt.id=src.id AND tgt.pozid=src.pozid)
WHEN MATCHED
THEN UPDATE SET
tgt.typ=src.typ, tgt.kierunek=src.kierunek, tgt.adresat=src.adresat, tgt.autor=src.autor, tgt.id_dok=src.id_dok, tgt.nrpoz=src.nrpoz, tgt.pole=src.pole, tgt.wartosc_bledna=src.wartosc_bledna, tgt.wartosc_poprawna=src.wartosc_poprawna, tgt.wartosc_po_korekcie=src.wartosc_po_korekcie, tgt.stan_korekty=src.stan_korekty, tgt.komentarz=src.komentarz, tgt.komentarz_ic=src.komentarz_ic, tgt.semafor=src.semafor, tgt.nip=src.nip
WHEN NOT MATCHED
THEN INSERT (id, typ, kierunek, adresat, pozid, autor, id_dok, nrpoz, pole, wartosc_bledna, wartosc_poprawna, wartosc_po_korekcie, stan_korekty, komentarz, komentarz_ic, semafor, nip)
VALUES (src.id, src.typ, src.kierunek, src.adresat, src.pozid, src.autor, src.id_dok, src.nrpoz, src.pole, src.wartosc_bledna, src.wartosc_poprawna, src.wartosc_po_korekcie, src.stan_korekty, src.komentarz, src.komentarz_ic, src.semafor, src.nip);
	SET @Merged = 1;
	END
		
	IF @TableName = 'caac_bledne_dane_xml' BEGIN
MERGE INTO intr2.caac_bledne_dane_xml AS tgt
USING WI_StageODS.intr2.caac_bledne_dane_xml AS src
ON (tgt.id_xml=src.id_xml AND tgt.zrodlo=src.zrodlo)
WHEN MATCHED
THEN UPDATE SET
tgt.id_jedn=src.id_jedn, tgt.status=src.status, tgt.operator=src.operator, tgt.data_utworzenia=src.data_utworzenia, tgt.xml=src.xml
WHEN NOT MATCHED
THEN INSERT (id_xml, zrodlo, id_jedn, status, operator, data_utworzenia, xml)
VALUES (src.id_xml, src.zrodlo, src.id_jedn, src.status, src.operator, src.data_utworzenia, src.xml);
	SET @Merged = 1;
	END
		

		IF @TableName = 'celina_bledne_dane_xml' BEGIN
MERGE INTO intr2.celina_bledne_dane_xml AS tgt
USING WI_StageODS.intr2.celina_bledne_dane_xml AS src
ON (tgt.id_xml=src.id_xml AND tgt.zrodlo=src.zrodlo)
WHEN MATCHED
THEN UPDATE SET
tgt.id_jedn=src.id_jedn, tgt.status=src.status, tgt.operator=src.operator, tgt.data_utworzenia=src.data_utworzenia, tgt.xml=src.xml
WHEN NOT MATCHED
THEN INSERT (id_xml, zrodlo, id_jedn, status, operator, data_utworzenia, xml)
VALUES (src.id_xml, src.zrodlo, src.id_jedn, src.status, src.operator, src.data_utworzenia, src.xml);
	SET @Merged = 1;
	END
		

		IF @TableName = 'dn_podprogowe' BEGIN
MERGE INTO intr2.dn_podprogowe AS tgt
USING WI_StageODS.intr2.dn_podprogowe AS src
ON (tgt.podm_p=src.podm_p AND tgt.podm_w=src.podm_w AND tgt.nabycia=src.nabycia AND tgt.dostawy=src.dostawy AND tgt.dotyczy_rok=src.dotyczy_rok AND tgt.data=src.data)
WHEN NOT MATCHED
THEN INSERT (podm_p, podm_w, nabycia, dostawy, dotyczy_rok, data)
VALUES (src.podm_p, src.podm_w, src.nabycia, src.dostawy, src.dotyczy_rok, src.data);
	SET @Merged = 1;
	END
	
	IF @TableName = 'intr_dane_pod' BEGIN
		MERGE INTO intr2.intr_dane_pod AS tgt
		USING WI_StageODS.intr2.intr_dane_pod AS src
		ON (tgt.id_pod=src.id_pod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.nip=src.nip, tgt.regon=src.regon, tgt.nazwa=src.nazwa, tgt.imie=src.imie, tgt.nazwisko=src.nazwisko, tgt.kod_kraj=src.kod_kraj, tgt.kod_gmina=src.kod_gmina, tgt.kod_poczt=src.kod_poczt, tgt.poczta=src.poczta, tgt.miejscowosc=src.miejscowosc, tgt.ulica=src.ulica, tgt.nr_dom=src.nr_dom, tgt.nr_lok=src.nr_lok, tgt.telefon=src.telefon, tgt.faks=src.faks, tgt.email=src.email, tgt.data_wprow=src.data_wprow, tgt.uwagi=src.uwagi, tgt.status=src.status, tgt.data_zakoncz=src.data_zakoncz, tgt.data_aktual=src.data_aktual, tgt.zobowiazany=src.zobowiazany, tgt.przedstawiciel=src.przedstawiciel, tgt.dane_wlasne=src.dane_wlasne, tgt.dane_kontaktowe=src.dane_kontaktowe, tgt.id_old_pdr=src.id_old_pdr, tgt.tin=src.tin, tgt.pesel=src.pesel, tgt.eori=src.eori, tgt.nazwa_krotka=src.nazwa_krotka, tgt.edi=src.edi, tgt.podmiot_gospodarczy=src.podmiot_gospodarczy, tgt.forma_dzialalnosci_gospodarczej=src.forma_dzialalnosci_gospodarczej, tgt.certyfikat_aeo=src.certyfikat_aeo, tgt.placowka=src.placowka, tgt.urzad_rejestrowy=src.urzad_rejestrowy, tgt.pomin_identyfikacje=src.pomin_identyfikacje, tgt.zgoda_komunikacja_elektroniczna=src.zgoda_komunikacja_elektroniczna, tgt.id_sisc=src.id_sisc, tgt.wyslano_info_prog_podstawowy=src.wyslano_info_prog_podstawowy, tgt.wyslano_info_prog_szczegolowy=src.wyslano_info_prog_szczegolowy
		WHEN NOT MATCHED
		THEN INSERT (id_pod, nip, regon, nazwa, imie, nazwisko, kod_kraj, kod_gmina, kod_poczt, poczta, miejscowosc, ulica, nr_dom, nr_lok, telefon, faks, email, data_wprow, uwagi, status, data_zakoncz, data_aktual, zobowiazany, przedstawiciel, dane_wlasne, dane_kontaktowe, id_old_pdr, tin, pesel, eori, nazwa_krotka, edi, podmiot_gospodarczy, forma_dzialalnosci_gospodarczej, certyfikat_aeo, placowka, urzad_rejestrowy, pomin_identyfikacje, zgoda_komunikacja_elektroniczna, id_sisc, wyslano_info_prog_podstawowy, wyslano_info_prog_szczegolowy)
		VALUES (src.id_pod, src.nip, src.regon, src.nazwa, src.imie, src.nazwisko, src.kod_kraj, src.kod_gmina, src.kod_poczt, src.poczta, src.miejscowosc, src.ulica, src.nr_dom, src.nr_lok, src.telefon, src.faks, src.email, src.data_wprow, src.uwagi, src.status, src.data_zakoncz, src.data_aktual, src.zobowiazany, src.przedstawiciel, src.dane_wlasne, src.dane_kontaktowe, src.id_old_pdr, src.tin, src.pesel, src.eori, src.nazwa_krotka, src.edi, src.podmiot_gospodarczy, src.forma_dzialalnosci_gospodarczej, src.certyfikat_aeo, src.placowka, src.urzad_rejestrowy, src.pomin_identyfikacje, src.zgoda_komunikacja_elektroniczna, src.id_sisc, src.wyslano_info_prog_podstawowy, src.wyslano_info_prog_szczegolowy);	
	SET @Merged = 1;
	END	

		IF @TableName = 'intr_rdin' BEGIN
MERGE INTO intr2.intr_rdin AS tgt
USING WI_StageODS.intr2.intr_rdin AS src
ON (tgt.id_rdin=src.id_rdin)
WHEN MATCHED
THEN UPDATE SET
tgt.NIP=src.NIP, tgt.rok=src.rok, tgt.miesiac=src.miesiac, tgt.wersja_dek=src.wersja_dek, tgt.kod_us=src.kod_us, tgt.trans_nabycie=src.trans_nabycie, tgt.trans_dostawa=src.trans_dostawa, tgt.poprawnosc=src.poprawnosc, tgt.status_us=src.status_us, tgt.rodz_dekl=src.rodz_dekl, tgt.data_aktualizacji=src.data_aktualizacji
WHEN NOT MATCHED
THEN INSERT (NIP, rok, miesiac, wersja_dek, kod_us, trans_nabycie, trans_dostawa, poprawnosc, status_us, rodz_dekl, data_aktualizacji, id_rdin)
VALUES (src.NIP, src.rok, src.miesiac, src.wersja_dek, src.kod_us, src.trans_nabycie, src.trans_dostawa, src.poprawnosc, src.status_us, src.rodz_dekl, src.data_aktualizacji, src.id_rdin);
	SET @Merged = 1;
	END

	IF @TableName = 'intr_ustalenia' BEGIN
		MERGE INTO intr2.intr_ustalenia AS tgt
		USING WI_StageODS.intr2.intr_ustalenia AS src
		ON (tgt.nr_ustalenia=src.nr_ustalenia AND tgt.nip=src.nip AND tgt.rok=src.rok AND tgt.miesiac=src.miesiac AND tgt.typ=src.typ)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.data=src.data, tgt.operator=src.operator, tgt.forma_kont=src.forma_kont, tgt.kategoria=src.kategoria, tgt.opis=src.opis, tgt.id_pisma=src.id_pisma, tgt.data_wys_pisma=src.data_wys_pisma, tgt.termin_real=src.termin_real, tgt.reakcja=src.reakcja, tgt.id_dok=src.id_dok, tgt.id_dok_nr_poz=src.id_dok_nr_poz, tgt.data_dostarczenia_pisma=src.data_dostarczenia_pisma, tgt.szablon=src.szablon, tgt.html=src.html, tgt.id_sprawy=src.id_sprawy, tgt.identity_id=src.identity_id, tgt.status=src.status, tgt.inicjaly=src.inicjaly, tgt.prev_id_sprawy=src.prev_id_sprawy
		WHEN NOT MATCHED
		THEN INSERT (nr_ustalenia, data, operator, forma_kont, kategoria, opis, id_pisma, data_wys_pisma, nip, rok, miesiac, typ, termin_real, reakcja, id_dok, id_dok_nr_poz, data_dostarczenia_pisma, szablon, html, id_sprawy, identity_id, status, inicjaly, prev_id_sprawy)
		VALUES (src.nr_ustalenia, src.data, src.operator, src.forma_kont, src.kategoria, src.opis, src.id_pisma, src.data_wys_pisma, src.nip, src.rok, src.miesiac, src.typ, src.termin_real, src.reakcja, src.id_dok, src.id_dok_nr_poz, src.data_dostarczenia_pisma, src.szablon, src.html, src.id_sprawy, src.identity_id, src.status, src.inicjaly, src.prev_id_sprawy);	
	SET @Merged = 1;
	END
		

		IF @TableName = 'intr_vies' BEGIN
MERGE INTO intr2.intr_vies AS tgt
USING WI_StageODS.intr2.intr_vies AS src
ON (tgt.id_vies=src.id_vies)
WHEN MATCHED
THEN UPDATE SET
tgt.nip=src.nip, tgt.rok=src.rok, tgt.miesiac=src.miesiac, tgt.typ=src.typ, tgt.kod_kraju=src.kod_kraju, tgt.id_kontrahenta=src.id_kontrahenta, tgt.kwota=src.kwota, tgt.kwota_trojstronna=src.kwota_trojstronna, tgt.kod_us=src.kod_us, tgt.rodzaj_okresu=src.rodzaj_okresu, tgt.data_aktualizacji=src.data_aktualizacji
WHEN NOT MATCHED
THEN INSERT (nip, rok, miesiac, typ, kod_kraju, id_kontrahenta, kwota, kwota_trojstronna, kod_us, rodzaj_okresu, data_aktualizacji, id_vies)
VALUES (src.nip, src.rok, src.miesiac, src.typ, src.kod_kraju, src.id_kontrahenta, src.kwota, src.kwota_trojstronna, src.kod_us, src.rodzaj_okresu, src.data_aktualizacji, src.id_vies);
	SET @Merged = 1;
	END
		

		IF @TableName = 'intr_zdarzenie' BEGIN
MERGE INTO intr2.intr_zdarzenie AS tgt
USING WI_StageODS.intr2.intr_zdarzenie AS src
ON (tgt.id_zdarzen=src.id_zdarzen)
WHEN MATCHED
THEN UPDATE SET
tgt.typ=src.typ, tgt.operator=src.operator, tgt.data_oper_od=src.data_oper_od, tgt.data_oper_do=src.data_oper_do, tgt.typ_pliku=src.typ_pliku, tgt.nazwa_pliku=src.nazwa_pliku, tgt.wynik=src.wynik, tgt.raport=src.raport
WHEN NOT MATCHED
THEN INSERT (typ, operator, data_oper_od, data_oper_do, typ_pliku, nazwa_pliku, wynik, raport, id_zdarzen)
VALUES (src.typ, src.operator, src.data_oper_od, src.data_oper_do, src.typ_pliku, src.nazwa_pliku, src.wynik, src.raport, src.id_zdarzen);
	SET @Merged = 1;
	END
		

	IF @TableName = 'istat_blad_zrodlowy' BEGIN
		MERGE INTO intr2.istat_blad_zrodlowy AS tgt
		USING WI_StageODS.intr2.istat_blad_zrodlowy AS src
		ON (tgt.id_bledu=src.id_bledu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_dok=src.id_dok, tgt.sym_dok=src.sym_dok, tgt.kod=src.kod, tgt.komunikat=src.komunikat, tgt.identity_id=src.identity_id, tgt.pozycja=src.pozycja
		WHEN NOT MATCHED
		THEN INSERT (id_bledu, id_dok, sym_dok, kod, komunikat, identity_id, pozycja)
		VALUES (src.id_bledu, src.id_dok, src.sym_dok, src.kod, src.komunikat, src.identity_id, src.pozycja);	
	SET @Merged = 1;
	END
		

	IF @TableName = 'istat_dekl_wynik_dok' BEGIN
		MERGE INTO intr2.istat_dekl_wynik_dok AS tgt
		USING WI_StageODS.intr2.istat_dekl_wynik_dok AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.status=src.status, tgt.typ=src.typ, tgt.rok=src.rok, tgt.miesiac=src.miesiac, tgt.numer=src.numer, tgt.nip_zobowiazanego=src.nip_zobowiazanego, tgt.regon_zobowiazanego=src.regon_zobowiazanego, tgt.wersja=src.wersja, tgt.sym_dok=src.sym_dok, tgt.id_sprawy=src.id_sprawy, tgt.data_utworzenia=src.data_utworzenia
		WHEN NOT MATCHED
		THEN INSERT (id_dok, status, typ, rok, miesiac, numer, nip_zobowiazanego, regon_zobowiazanego, wersja, sym_dok, id_sprawy, data_utworzenia)
		VALUES (src.id_dok, src.status, src.typ, src.rok, src.miesiac, src.numer, src.nip_zobowiazanego, src.regon_zobowiazanego, src.wersja, src.sym_dok, src.id_sprawy, src.data_utworzenia);	
	SET @Merged = 1;
	END
		

	IF @TableName = 'istat_dok_zrodlowy_roboczy' BEGIN
		MERGE INTO intr2.istat_dok_zrodlowy_roboczy AS tgt
		USING WI_StageODS.intr2.istat_dok_zrodlowy_roboczy AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.login=src.login, tgt.data_utworzenia=src.data_utworzenia, tgt.date_modyfikacji=src.date_modyfikacji, tgt.xml=src.xml, tgt.data_dokonania_zgloszenia=src.data_dokonania_zgloszenia, tgt.komentarz=src.komentarz, tgt.zrodlo_wpr=src.zrodlo_wpr, tgt.status_uploadu=src.status_uploadu, tgt.id_dok_zrd=src.id_dok_zrd, tgt.nip=src.nip, tgt.nr_wlasny=src.nr_wlasny, tgt.data_wprowadzenia=src.data_wprowadzenia
		WHEN NOT MATCHED
		THEN INSERT (id, login, data_utworzenia, date_modyfikacji, xml, data_dokonania_zgloszenia, komentarz, zrodlo_wpr, status_uploadu, id_dok_zrd, nip, nr_wlasny, data_wprowadzenia)
		VALUES (src.id, src.login, src.data_utworzenia, src.date_modyfikacji, src.xml, src.data_dokonania_zgloszenia, src.komentarz, src.zrodlo_wpr, src.status_uploadu, src.id_dok_zrd, src.nip, src.nr_wlasny, src.data_wprowadzenia);	
	SET @Merged = 1;
	END
		

		IF @TableName = 'istat_grid_state' BEGIN
MERGE INTO intr2.istat_grid_state AS tgt
USING WI_StageODS.intr2.istat_grid_state AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.user_name=src.user_name, tgt.grid_name=src.grid_name, tgt.configuration=src.configuration
WHEN NOT MATCHED
THEN INSERT (id, user_name, grid_name, configuration)
VALUES (src.id, src.user_name, src.grid_name, src.configuration);
	SET @Merged = 1;
	END
		

		IF @TableName = 'istat_komunikat_popup' BEGIN
MERGE INTO intr2.istat_komunikat_popup AS tgt
USING WI_StageODS.intr2.istat_komunikat_popup AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.content=src.content, tgt.creation_date=src.creation_date
WHEN NOT MATCHED
THEN INSERT (id, content, creation_date)
VALUES (src.id, src.content, src.creation_date);
	SET @Merged = 1;
	END
		

		IF @TableName = 'istat_reporting_periods_recalc' BEGIN
MERGE INTO intr2.istat_reporting_periods_recalc AS tgt
USING WI_StageODS.intr2.istat_reporting_periods_recalc AS src
ON (tgt.nip=src.nip AND tgt.data_od=src.data_od AND tgt.data_zlecenia=src.data_zlecenia)
WHEN NOT MATCHED
THEN INSERT (nip, data_od, data_zlecenia)
VALUES (src.nip, src.data_od, src.data_zlecenia);
	SET @Merged = 1;
	END
		

	IF @TableName = 'istat_zmiana_danych' BEGIN			
		MERGE INTO intr2.istat_zmiana_danych AS tgt
		USING WI_StageODS.intr2.istat_zmiana_danych AS src
		ON (tgt.id_zdarzenia=src.id_zdarzenia AND tgt.pozid=src.pozid AND tgt.pozycja_danej=src.pozycja_danej)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.nazwa_danej=src.nazwa_danej, tgt.wartosc_przed=src.wartosc_przed, tgt.wartosc_po=src.wartosc_po
		WHEN NOT MATCHED
		THEN INSERT (id_zdarzenia, pozid, nazwa_danej, pozycja_danej, wartosc_przed, wartosc_po)
		VALUES (src.id_zdarzenia, src.pozid, src.nazwa_danej, src.pozycja_danej, src.wartosc_przed, src.wartosc_po);	
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_CALENDARS' BEGIN
MERGE INTO intr2.QRTZ_CALENDARS AS tgt
USING WI_StageODS.intr2.QRTZ_CALENDARS AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.CALENDAR_NAME=src.CALENDAR_NAME)
WHEN MATCHED
THEN UPDATE SET
tgt.CALENDAR=src.CALENDAR
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, CALENDAR_NAME, CALENDAR)
VALUES (src.SCHED_NAME, src.CALENDAR_NAME, src.CALENDAR);
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_FIRED_TRIGGERS' BEGIN
MERGE INTO intr2.QRTZ_FIRED_TRIGGERS AS tgt
USING WI_StageODS.intr2.QRTZ_FIRED_TRIGGERS AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.ENTRY_ID=src.ENTRY_ID)
WHEN MATCHED
THEN UPDATE SET
tgt.TRIGGER_NAME=src.TRIGGER_NAME, tgt.TRIGGER_GROUP=src.TRIGGER_GROUP, tgt.INSTANCE_NAME=src.INSTANCE_NAME, tgt.FIRED_TIME=src.FIRED_TIME, tgt.SCHED_TIME=src.SCHED_TIME, tgt.PRIORITY=src.PRIORITY, tgt.STATE=src.STATE, tgt.JOB_NAME=src.JOB_NAME, tgt.JOB_GROUP=src.JOB_GROUP, tgt.IS_NONCONCURRENT=src.IS_NONCONCURRENT, tgt.REQUESTS_RECOVERY=src.REQUESTS_RECOVERY
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, ENTRY_ID, TRIGGER_NAME, TRIGGER_GROUP, INSTANCE_NAME, FIRED_TIME, SCHED_TIME, PRIORITY, STATE, JOB_NAME, JOB_GROUP, IS_NONCONCURRENT, REQUESTS_RECOVERY)
VALUES (src.SCHED_NAME, src.ENTRY_ID, src.TRIGGER_NAME, src.TRIGGER_GROUP, src.INSTANCE_NAME, src.FIRED_TIME, src.SCHED_TIME, src.PRIORITY, src.STATE, src.JOB_NAME, src.JOB_GROUP, src.IS_NONCONCURRENT, src.REQUESTS_RECOVERY);
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_JOB_DETAILS' BEGIN
MERGE INTO intr2.QRTZ_JOB_DETAILS AS tgt
USING WI_StageODS.intr2.QRTZ_JOB_DETAILS AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.JOB_NAME=src.JOB_NAME AND tgt.JOB_GROUP=src.JOB_GROUP)
WHEN MATCHED
THEN UPDATE SET
tgt.DESCRIPTION=src.DESCRIPTION, tgt.JOB_CLASS_NAME=src.JOB_CLASS_NAME, tgt.IS_DURABLE=src.IS_DURABLE, tgt.IS_NONCONCURRENT=src.IS_NONCONCURRENT, tgt.IS_UPDATE_DATA=src.IS_UPDATE_DATA, tgt.REQUESTS_RECOVERY=src.REQUESTS_RECOVERY, tgt.JOB_DATA=src.JOB_DATA
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, JOB_NAME, JOB_GROUP, DESCRIPTION, JOB_CLASS_NAME, IS_DURABLE, IS_NONCONCURRENT, IS_UPDATE_DATA, REQUESTS_RECOVERY, JOB_DATA)
VALUES (src.SCHED_NAME, src.JOB_NAME, src.JOB_GROUP, src.DESCRIPTION, src.JOB_CLASS_NAME, src.IS_DURABLE, src.IS_NONCONCURRENT, src.IS_UPDATE_DATA, src.REQUESTS_RECOVERY, src.JOB_DATA);
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_LOCKS' BEGIN
MERGE INTO intr2.QRTZ_LOCKS AS tgt
USING WI_StageODS.intr2.QRTZ_LOCKS AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.LOCK_NAME=src.LOCK_NAME)
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, LOCK_NAME)
VALUES (src.SCHED_NAME, src.LOCK_NAME);
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_PAUSED_TRIGGER_GRPS' BEGIN
MERGE INTO intr2.QRTZ_PAUSED_TRIGGER_GRPS AS tgt
USING WI_StageODS.intr2.QRTZ_PAUSED_TRIGGER_GRPS AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.TRIGGER_GROUP=src.TRIGGER_GROUP)
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, TRIGGER_GROUP)
VALUES (src.SCHED_NAME, src.TRIGGER_GROUP);
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_SCHEDULER_STATE' BEGIN
MERGE INTO intr2.QRTZ_SCHEDULER_STATE AS tgt
USING WI_StageODS.intr2.QRTZ_SCHEDULER_STATE AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.INSTANCE_NAME=src.INSTANCE_NAME)
WHEN MATCHED
THEN UPDATE SET
tgt.LAST_CHECKIN_TIME=src.LAST_CHECKIN_TIME, tgt.CHECKIN_INTERVAL=src.CHECKIN_INTERVAL
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, INSTANCE_NAME, LAST_CHECKIN_TIME, CHECKIN_INTERVAL)
VALUES (src.SCHED_NAME, src.INSTANCE_NAME, src.LAST_CHECKIN_TIME, src.CHECKIN_INTERVAL);
	SET @Merged = 1;
	END
		

		IF @TableName = 'rodzslow' BEGIN
MERGE INTO intr2.rodzslow AS tgt
USING WI_StageODS.intr2.rodzslow AS src
ON (tgt.id_rodz_slow=src.id_rodz_slow)
WHEN MATCHED
THEN UPDATE SET
tgt.nazwa=src.nazwa, tgt.okno_nagl=src.okno_nagl, tgt.dw_naglowka=src.dw_naglowka, tgt.okno_poz=src.okno_poz, tgt.dw_pozycji=src.dw_pozycji, tgt.rodzaj=src.rodzaj
WHEN NOT MATCHED
THEN INSERT (id_rodz_slow, nazwa, okno_nagl, dw_naglowka, okno_poz, dw_pozycji, rodzaj)
VALUES (src.id_rodz_slow, src.nazwa, src.okno_nagl, src.dw_naglowka, src.okno_poz, src.dw_pozycji, src.rodzaj);
	SET @Merged = 1;
	END
		

		IF @TableName = 's_maxids_like_aes' BEGIN
MERGE INTO intr2.s_maxids_like_aes AS tgt
USING WI_StageODS.intr2.s_maxids_like_aes AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.system_name=src.system_name, tgt.key_name=src.key_name, tgt.key_value=src.key_value, tgt.key_section=src.key_section, tgt.version=src.version
WHEN NOT MATCHED
THEN INSERT (id, system_name, key_name, key_value, key_section, version)
VALUES (src.id, src.system_name, src.key_name, src.key_value, src.key_section, src.version);
	SET @Merged = 1;
	END
		

		IF @TableName = 'schema_version' BEGIN
MERGE INTO intr2.schema_version AS tgt
USING WI_StageODS.intr2.schema_version AS src
ON (tgt.version=src.version)
WHEN MATCHED
THEN UPDATE SET
tgt.version_rank=src.version_rank, tgt.installed_rank=src.installed_rank, tgt.description=src.description, tgt.type=src.type, tgt.script=src.script, tgt.checksum=src.checksum, tgt.installed_by=src.installed_by, tgt.installed_on=src.installed_on, tgt.execution_time=src.execution_time, tgt.success=src.success
WHEN NOT MATCHED
THEN INSERT (version_rank, installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success)
VALUES (src.version_rank, src.installed_rank, src.version, src.description, src.type, src.script, src.checksum, src.installed_by, src.installed_on, src.execution_time, src.success);
	SET @Merged = 1;
	END
		

		IF @TableName = 'intr_ape' BEGIN
MERGE INTO intr2.intr_ape AS tgt
USING WI_StageODS.intr2.intr_ape AS src
ON (tgt.id_pod=src.id_pod AND tgt.nr_poz=src.nr_poz)
WHEN MATCHED
THEN UPDATE SET
tgt.ape=src.ape, tgt.poczatek_obow=src.poczatek_obow, tgt.koniec_obow=src.koniec_obow
WHEN NOT MATCHED
THEN INSERT (id_pod, nr_poz, ape, poczatek_obow, koniec_obow)
VALUES (src.id_pod, src.nr_poz, src.ape, src.poczatek_obow, src.koniec_obow);
	SET @Merged = 1;
	END
		

	IF @TableName = 'intr_historia_podmiotu' BEGIN
		MERGE INTO intr2.intr_historia_podmiotu AS tgt
		USING WI_StageODS.intr2.intr_historia_podmiotu AS src
		ON (tgt.id_poz=src.id_poz)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_pod=src.id_pod, tgt.data_zmiany=src.data_zmiany, tgt.operator=src.operator, tgt.pozycja=src.pozycja, tgt.nazwa_danej=src.nazwa_danej, tgt.wartosc_przed=src.wartosc_przed, tgt.wartosc_po=src.wartosc_po, tgt.komentarz=src.komentarz
		WHEN NOT MATCHED
		THEN INSERT (id_poz, id_pod, data_zmiany, operator, pozycja, nazwa_danej, wartosc_przed, wartosc_po, komentarz)
		VALUES (src.id_poz, src.id_pod, src.data_zmiany, src.operator, src.pozycja, src.nazwa_danej, src.wartosc_przed, src.wartosc_po, src.komentarz);	
	SET @Merged = 1;
	END
		

	IF @TableName = 'intr_historia_ustalenia' BEGIN
		MERGE INTO intr2.intr_historia_ustalenia AS tgt
		USING WI_StageODS.intr2.intr_historia_ustalenia AS src
		ON (tgt.nr_ustalenia=src.nr_ustalenia AND tgt.nr_zmiany=src.nr_zmiany AND tgt.nip=src.nip AND tgt.rok=src.rok AND tgt.miesiac=src.miesiac AND tgt.typ=src.typ)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.data=src.data, tgt.operator=src.operator, tgt.nazwa_danej=src.nazwa_danej, tgt.przed=src.przed, tgt.po=src.po
		WHEN NOT MATCHED
		THEN INSERT (nr_ustalenia, nr_zmiany, data, operator, nazwa_danej, przed, po, nip, rok, miesiac, typ)
		VALUES (src.nr_ustalenia, src.nr_zmiany, src.data, src.operator, src.nazwa_danej, src.przed, src.po, src.nip, src.rok, src.miesiac, src.typ);	
	SET @Merged = 1;
	END
		

		IF @TableName = 'intr_kategoria' BEGIN
MERGE INTO intr2.intr_kategoria AS tgt
USING WI_StageODS.intr2.intr_kategoria AS src
ON (tgt.id_pod=src.id_pod AND tgt.rodz_kat=src.rodz_kat AND tgt.wazna_od_mies=src.wazna_od_mies AND tgt.wazna_od_rok=src.wazna_od_rok)
WHEN MATCHED
THEN UPDATE SET
tgt.nr_poz=src.nr_poz, tgt.kategoria=src.kategoria, tgt.zakres_szczeg=src.zakres_szczeg, tgt.wazna_do_mies=src.wazna_do_mies, tgt.wazna_do_rok=src.wazna_do_rok, tgt.w_systemie_od=src.w_systemie_od
WHEN NOT MATCHED
THEN INSERT (id_pod, nr_poz, rodz_kat, kategoria, zakres_szczeg, wazna_od_mies, wazna_od_rok, wazna_do_mies, wazna_do_rok, w_systemie_od)
VALUES (src.id_pod, src.nr_poz, src.rodz_kat, src.kategoria, src.zakres_szczeg, src.wazna_od_mies, src.wazna_od_rok, src.wazna_do_mies, src.wazna_do_rok, src.w_systemie_od);
	SET @Merged = 1;
	END
		

	IF @TableName = 'intr_okres_sprawozd' BEGIN
		MERGE INTO intr2.intr_okres_sprawozd AS tgt
		USING WI_StageODS.intr2.intr_okres_sprawozd AS src
		ON (tgt.id_pod=src.id_pod AND tgt.nr_poz=src.nr_poz)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.rok=src.rok, tgt.typ=src.typ, tgt.miesiac=src.miesiac, tgt.operator=src.operator, tgt.data_zmiany=src.data_zmiany, tgt.deklaracja=src.deklaracja, tgt.vat=src.vat, tgt.vies=src.vies, tgt.vies_trojstronne=src.vies_trojstronne, tgt.status_deklaracji=src.status_deklaracji, tgt.deklaracja_pozycje_FLKZ=src.deklaracja_pozycje_FLKZ, tgt.deklaracja_kod_transakcji_1=src.deklaracja_kod_transakcji_1, tgt.status_vat=src.status_vat, tgt.status_vies=src.status_vies, tgt.status_szczegolowosci=src.status_szczegolowosci, tgt.zgodnosc_deklaracji_vat=src.zgodnosc_deklaracji_vat, tgt.zgodnosc_deklaracji_vies=src.zgodnosc_deklaracji_vies, tgt.zgodnosc_vat_vies=src.zgodnosc_vat_vies, tgt.intrastatViesRoznica12m=src.intrastatViesRoznica12m, tgt.intrastatViesRoznicaProcent12m=src.intrastatViesRoznicaProcent12m, tgt.intrastatBViesRoznica12m=src.intrastatBViesRoznica12m, tgt.intrastatBViesRoznicaProcent12m=src.intrastatBViesRoznicaProcent12m, tgt.intrastat1ViesRoznica12m=src.intrastat1ViesRoznica12m, tgt.intrastat1ViesRoznicaProcent12m=src.intrastat1ViesRoznicaProcent12m, tgt.vatViesRoznica12m=src.vatViesRoznica12m, tgt.vatViesRoznicaProcent12m=src.vatViesRoznicaProcent12m
		WHEN NOT MATCHED
		THEN INSERT (id_pod, nr_poz, rok, typ, miesiac, operator, data_zmiany, deklaracja, vat, vies, vies_trojstronne, status_deklaracji, deklaracja_pozycje_FLKZ, deklaracja_kod_transakcji_1, status_vat, status_vies, status_szczegolowosci, zgodnosc_deklaracji_vat, zgodnosc_deklaracji_vies, zgodnosc_vat_vies, intrastatViesRoznica12m, intrastatViesRoznicaProcent12m, intrastatBViesRoznica12m, intrastatBViesRoznicaProcent12m, intrastat1ViesRoznica12m, intrastat1ViesRoznicaProcent12m, vatViesRoznica12m, vatViesRoznicaProcent12m)
		VALUES (src.id_pod, src.nr_poz, src.rok, src.typ, src.miesiac, src.operator, src.data_zmiany, src.deklaracja, src.vat, src.vies, src.vies_trojstronne, src.status_deklaracji, src.deklaracja_pozycje_FLKZ, src.deklaracja_kod_transakcji_1, src.status_vat, src.status_vies, src.status_szczegolowosci, src.zgodnosc_deklaracji_vat, src.zgodnosc_deklaracji_vies, src.zgodnosc_vat_vies, src.intrastatViesRoznica12m, src.intrastatViesRoznicaProcent12m, src.intrastatBViesRoznica12m, src.intrastatBViesRoznicaProcent12m, src.intrastat1ViesRoznica12m, src.intrastat1ViesRoznicaProcent12m, src.vatViesRoznica12m, src.vatViesRoznicaProcent12m);	
	SET @Merged = 1;
	END
		

		IF @TableName = 'intr_priorytet' BEGIN
MERGE INTO intr2.intr_priorytet AS tgt
USING WI_StageODS.intr2.intr_priorytet AS src
ON (tgt.id_pod=src.id_pod AND tgt.rodzaj_prior=src.rodzaj_prior AND tgt.wazna_od_mies=src.wazna_od_mies AND tgt.wazna_od_rok=src.wazna_od_rok)
WHEN MATCHED
THEN UPDATE SET
tgt.nr_poz=src.nr_poz, tgt.priorytet=src.priorytet, tgt.wazna_do_mies=src.wazna_do_mies, tgt.wazna_do_rok=src.wazna_do_rok, tgt.w_systemie_od=src.w_systemie_od
WHEN NOT MATCHED
THEN INSERT (id_pod, nr_poz, rodzaj_prior, priorytet, wazna_od_mies, wazna_od_rok, wazna_do_mies, wazna_do_rok, w_systemie_od)
VALUES (src.id_pod, src.nr_poz, src.rodzaj_prior, src.priorytet, src.wazna_od_mies, src.wazna_od_rok, src.wazna_do_mies, src.wazna_do_rok, src.w_systemie_od);
	SET @Merged = 1;
	END
		

		IF @TableName = 'intr_status' BEGIN
MERGE INTO intr2.intr_status AS tgt
USING WI_StageODS.intr2.intr_status AS src
ON (tgt.id_pod=src.id_pod AND tgt.nr_poz=src.nr_poz)
WHEN MATCHED
THEN UPDATE SET
tgt.status=src.status, tgt.poczatek_obow=src.poczatek_obow, tgt.koniec_obow=src.koniec_obow, tgt.data_aktualizacji=src.data_aktualizacji, tgt.operator=src.operator
WHEN NOT MATCHED
THEN INSERT (id_pod, nr_poz, status, poczatek_obow, koniec_obow, data_aktualizacji, operator)
VALUES (src.id_pod, src.nr_poz, src.status, src.poczatek_obow, src.koniec_obow, src.data_aktualizacji, src.operator);
	SET @Merged = 1;
	END
		

	IF @TableName = 'istat_dane_wlasne_podmiotu' BEGIN
MERGE INTO intr2.istat_dane_wlasne_podmiotu AS tgt
USING WI_StageODS.intr2.istat_dane_wlasne_podmiotu AS src
ON (tgt.id_pod=src.id_pod)
WHEN MATCHED
THEN UPDATE SET
tgt.regon=src.regon, tgt.nazwa=src.nazwa, tgt.imie=src.imie, tgt.nazwisko=src.nazwisko, tgt.kod_kraj=src.kod_kraj, tgt.kod_gmina=src.kod_gmina, tgt.kod_poczt=src.kod_poczt, tgt.poczta=src.poczta, tgt.miejscowosc=src.miejscowosc, tgt.ulica=src.ulica, tgt.nr_dom=src.nr_dom, tgt.nr_lok=src.nr_lok, tgt.telefon=src.telefon, tgt.faks=src.faks, tgt.email=src.email, tgt.data_wprow=src.data_wprow, tgt.data_aktual=src.data_aktual
WHEN NOT MATCHED
THEN INSERT (id_pod, regon, nazwa, imie, nazwisko, kod_kraj, kod_gmina, kod_poczt, poczta, miejscowosc, ulica, nr_dom, nr_lok, telefon, faks, email, data_wprow, data_aktual)
VALUES (src.id_pod, src.regon, src.nazwa, src.imie, src.nazwisko, src.kod_kraj, src.kod_gmina, src.kod_poczt, src.poczta, src.miejscowosc, src.ulica, src.nr_dom, src.nr_lok, src.telefon, src.faks, src.email, src.data_wprow, src.data_aktual);
	SET @Merged = 1;
	END
		

	IF @TableName = 'istat_dekl_wynik_blad' BEGIN
		MERGE INTO intr2.istat_dekl_wynik_blad AS tgt
		USING WI_StageODS.intr2.istat_dekl_wynik_blad AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_dok=src.id_dok, tgt.pozid=src.pozid, tgt.numer=src.numer, tgt.typ=src.typ, tgt.kod=src.kod, tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (id_dok, pozid, numer, typ, kod, opis, id)
		VALUES (src.id_dok, src.pozid, src.numer, src.typ, src.kod, src.opis, src.id);
	SET @Merged = 1;
	END
		

	IF @TableName = 'istat_dekl_wynik_poz' BEGIN
		MERGE INTO intr2.istat_dekl_wynik_poz AS tgt
		USING WI_StageODS.intr2.istat_dekl_wynik_poz AS src
		ON (tgt.id_dok=src.id_dok AND tgt.pozid=src.pozid)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.status=src.status, tgt.komentarz=src.komentarz, tgt.opis_towaru=src.opis_towaru, tgt.kraj_przezn_wysyl=src.kraj_przezn_wysyl, tgt.warunki_dostawy=src.warunki_dostawy, tgt.rodzaj_transakcji=src.rodzaj_transakcji, tgt.rodzaj_transportu=src.rodzaj_transportu, tgt.kod_towarowy=src.kod_towarowy, tgt.kraj_pochodzenia=src.kraj_pochodzenia, tgt.masa_netto=src.masa_netto, tgt.uzup_jm=src.uzup_jm, tgt.wartosc_faktury=src.wartosc_faktury, tgt.wartosc_stat=src.wartosc_stat, tgt.wsk_progowy=src.wsk_progowy, tgt.flaga=src.flaga, tgt.id_kontrahenta=src.id_kontrahenta, tgt.timer=src.timer, tgt.blad_informacyjny=src.blad_informacyjny, tgt.autokorekta=src.autokorekta
		WHEN NOT MATCHED
		THEN INSERT (id_dok, pozid, status, komentarz, opis_towaru, kraj_przezn_wysyl, warunki_dostawy, rodzaj_transakcji, rodzaj_transportu, kod_towarowy, kraj_pochodzenia, masa_netto, uzup_jm, wartosc_faktury, wartosc_stat, wsk_progowy, flaga, id_kontrahenta, timer, blad_informacyjny, autokorekta)
		VALUES (src.id_dok, src.pozid, src.status, src.komentarz, src.opis_towaru, src.kraj_przezn_wysyl, src.warunki_dostawy, src.rodzaj_transakcji, src.rodzaj_transportu, src.kod_towarowy, src.kraj_pochodzenia, src.masa_netto, src.uzup_jm, src.wartosc_faktury, src.wartosc_stat, src.wsk_progowy, src.flaga, src.id_kontrahenta, src.timer, src.blad_informacyjny, src.autokorekta);
	SET @Merged = 1;
	END
		

	IF @TableName = 'istat_dok_zrodlowy' BEGIN
		MERGE INTO intr2.istat_dok_zrodlowy AS tgt
		USING WI_StageODS.intr2.istat_dok_zrodlowy AS src
		ON (tgt.id_dok_zrd=src.id_dok_zrd)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.sym_dok_zrd=src.sym_dok_zrd, tgt.rodz_dok_zrd=src.rodz_dok_zrd, tgt.sposob_wpr_zrd=src.sposob_wpr_zrd, tgt.data_wpr_zrd=src.data_wpr_zrd, tgt.wprowadzil=src.wprowadzil, tgt.xml=src.xml, tgt.id_dok_dekl_wynik=src.id_dok_dekl_wynik, tgt.regon=src.regon, tgt.email=src.email, tgt.id_pliku=src.id_pliku, tgt.nip=src.nip, tgt.status=src.status, tgt.wersja=src.wersja, tgt.id_osoby=src.id_osoby, tgt.id_podmiotu=src.id_podmiotu, tgt.id_podmiotu_posr=src.id_podmiotu_posr, tgt.nr_wlasny=src.nr_wlasny, tgt.data_dokonania_zgloszenia=src.data_dokonania_zgloszenia, tgt.manual=src.manual, tgt.pomin_identyfikacje=src.pomin_identyfikacje, tgt.id_osoby_seap=src.id_osoby_seap, tgt.status_celina=src.status_celina, tgt.id_dekl_roboczej=src.id_dekl_roboczej, tgt.data_ze_zgloszenia=src.data_ze_zgloszenia, tgt.login=src.login, tgt.data_ost_zdarzenia=src.data_ost_zdarzenia
		WHEN NOT MATCHED
		THEN INSERT (id_dok_zrd, sym_dok_zrd, rodz_dok_zrd, sposob_wpr_zrd, data_wpr_zrd, wprowadzil, xml, id_dok_dekl_wynik, regon, email, id_pliku, nip, status, wersja, id_osoby, id_podmiotu, id_podmiotu_posr, nr_wlasny, data_dokonania_zgloszenia, manual, pomin_identyfikacje, id_osoby_seap, status_celina, id_dekl_roboczej, data_ze_zgloszenia, login, data_ost_zdarzenia)
		VALUES (src.id_dok_zrd, src.sym_dok_zrd, src.rodz_dok_zrd, src.sposob_wpr_zrd, src.data_wpr_zrd, src.wprowadzil, src.xml, src.id_dok_dekl_wynik, src.regon, src.email, src.id_pliku, src.nip, src.status, src.wersja, src.id_osoby, src.id_podmiotu, src.id_podmiotu_posr, src.nr_wlasny, src.data_dokonania_zgloszenia, src.manual, src.pomin_identyfikacje, src.id_osoby_seap, src.status_celina, src.id_dekl_roboczej, src.data_ze_zgloszenia, src.login, src.data_ost_zdarzenia);	
	SET @Merged = 1;
	END
		

		IF @TableName = 'istat_komunikat' BEGIN
MERGE INTO intr2.istat_komunikat AS tgt
USING WI_StageODS.intr2.istat_komunikat AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.nadrzedny_id=src.nadrzedny_id, tgt.data=src.data, tgt.kierunek=src.kierunek, tgt.nazwa_pliku=src.nazwa_pliku, tgt.mime=src.mime, tgt.naglowek_koperty=src.naglowek_koperty, tgt.zawartosc=src.zawartosc, tgt.typ=src.typ, tgt.status=src.status, tgt.numer_wlasny=src.numer_wlasny, tgt.id_podmiotu=src.id_podmiotu, tgt.manual=src.manual, tgt.login=src.login, tgt.nip=src.nip, tgt.zapisany_w_crkid=src.zapisany_w_crkid, tgt.podtyp=src.podtyp, tgt.data_wyslania=src.data_wyslania, tgt.data_dostarczenia=src.data_dostarczenia, tgt.nie_obslugiwac_przed_id_komunikatu=src.nie_obslugiwac_przed_id_komunikatu
WHEN NOT MATCHED
THEN INSERT (id, nadrzedny_id, data, kierunek, nazwa_pliku, mime, naglowek_koperty, zawartosc, typ, status, numer_wlasny, id_podmiotu, manual, login, nip, zapisany_w_crkid, podtyp, data_wyslania, data_dostarczenia, nie_obslugiwac_przed_id_komunikatu)
VALUES (src.id, src.nadrzedny_id, src.data, src.kierunek, src.nazwa_pliku, src.mime, src.naglowek_koperty, src.zawartosc, src.typ, src.status, src.numer_wlasny, src.id_podmiotu, src.manual, src.login, src.nip, src.zapisany_w_crkid, src.podtyp, src.data_wyslania, src.data_dostarczenia, src.nie_obslugiwac_przed_id_komunikatu);
	SET @Merged = 1;
	END
		

		IF @TableName = 'istat_komunikat_popup_uzytkownik' BEGIN
MERGE INTO intr2.istat_komunikat_popup_uzytkownik AS tgt
USING WI_StageODS.intr2.istat_komunikat_popup_uzytkownik AS src
ON (tgt.popup_id=src.popup_id AND tgt.user_name=src.user_name)
WHEN NOT MATCHED
THEN INSERT (popup_id, user_name)
VALUES (src.popup_id, src.user_name);
	SET @Merged = 1;
	END
		

		IF @TableName = 'istat_menu' BEGIN
MERGE INTO intr2.istat_menu AS tgt
USING WI_StageODS.intr2.istat_menu AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.parent_id=src.parent_id, tgt.shortname=src.shortname, tgt.fullname=src.fullname, tgt.target_grid=src.target_grid, tgt.icon=src.icon, tgt.configuration=src.configuration, tgt.user_name=src.user_name
WHEN NOT MATCHED
THEN INSERT (id, parent_id, shortname, fullname, target_grid, icon, configuration, user_name)
VALUES (src.id, src.parent_id, src.shortname, src.fullname, src.target_grid, src.icon, src.configuration, src.user_name);
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_TRIGGERS' BEGIN
MERGE INTO intr2.QRTZ_TRIGGERS AS tgt
USING WI_StageODS.intr2.QRTZ_TRIGGERS AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.TRIGGER_NAME=src.TRIGGER_NAME AND tgt.TRIGGER_GROUP=src.TRIGGER_GROUP)
WHEN MATCHED
THEN UPDATE SET
tgt.JOB_NAME=src.JOB_NAME, tgt.JOB_GROUP=src.JOB_GROUP, tgt.DESCRIPTION=src.DESCRIPTION, tgt.NEXT_FIRE_TIME=src.NEXT_FIRE_TIME, tgt.PREV_FIRE_TIME=src.PREV_FIRE_TIME, tgt.PRIORITY=src.PRIORITY, tgt.TRIGGER_STATE=src.TRIGGER_STATE, tgt.TRIGGER_TYPE=src.TRIGGER_TYPE, tgt.START_TIME=src.START_TIME, tgt.END_TIME=src.END_TIME, tgt.CALENDAR_NAME=src.CALENDAR_NAME, tgt.MISFIRE_INSTR=src.MISFIRE_INSTR, tgt.JOB_DATA=src.JOB_DATA
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP, JOB_NAME, JOB_GROUP, DESCRIPTION, NEXT_FIRE_TIME, PREV_FIRE_TIME, PRIORITY, TRIGGER_STATE, TRIGGER_TYPE, START_TIME, END_TIME, CALENDAR_NAME, MISFIRE_INSTR, JOB_DATA)
VALUES (src.SCHED_NAME, src.TRIGGER_NAME, src.TRIGGER_GROUP, src.JOB_NAME, src.JOB_GROUP, src.DESCRIPTION, src.NEXT_FIRE_TIME, src.PREV_FIRE_TIME, src.PRIORITY, src.TRIGGER_STATE, src.TRIGGER_TYPE, src.START_TIME, src.END_TIME, src.CALENDAR_NAME, src.MISFIRE_INSTR, src.JOB_DATA);
	SET @Merged = 1;
	END
		

	IF @TableName = 'slowniki' BEGIN
		MERGE INTO intr2.slowniki AS tgt
		USING WI_StageODS.intr2.slowniki AS src
		ON (tgt.id_rodz_slow=src.id_rodz_slow AND tgt.id_slown=src.id_slown)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.symbol=src.symbol, tgt.kwota=src.kwota, tgt.kwota2=src.kwota2, tgt.data=src.data, tgt.opis=src.opis, tgt.data_od=src.data_od, tgt.data_do=src.data_do, tgt.operator=src.operator
		WHEN NOT MATCHED
		THEN INSERT (id_rodz_slow, id_slown, symbol, kwota, kwota2, data, opis, data_od, data_do, operator)
		VALUES (src.id_rodz_slow, src.id_slown, src.symbol, src.kwota, src.kwota2, src.data, src.opis, src.data_od, src.data_do, src.operator);
	SET @Merged = 1;
	END
		

		IF @TableName = 'intr_okres_sprawozd_kraj' BEGIN
MERGE INTO intr2.intr_okres_sprawozd_kraj AS tgt
USING WI_StageODS.intr2.intr_okres_sprawozd_kraj AS src
ON (tgt.id_pod=src.id_pod AND tgt.nr_poz=src.nr_poz AND tgt.kraj=src.kraj)
WHEN MATCHED
THEN UPDATE SET
tgt.data_aktualizacji=src.data_aktualizacji, tgt.deklaracja=src.deklaracja, tgt.vies=src.vies, tgt.vies_trojstronne=src.vies_trojstronne, tgt.deklaracja_pozycje_FLKZ=src.deklaracja_pozycje_FLKZ, tgt.deklaracja_kod_transakcji_1=src.deklaracja_kod_transakcji_1
WHEN NOT MATCHED
THEN INSERT (id_pod, nr_poz, kraj, data_aktualizacji, deklaracja, vies, vies_trojstronne, deklaracja_pozycje_FLKZ, deklaracja_kod_transakcji_1)
VALUES (src.id_pod, src.nr_poz, src.kraj, src.data_aktualizacji, src.deklaracja, src.vies, src.vies_trojstronne, src.deklaracja_pozycje_FLKZ, src.deklaracja_kod_transakcji_1);
	SET @Merged = 1;
	END
		

		IF @TableName = 'istat_dok_wyslany' BEGIN
MERGE INTO intr2.istat_dok_wyslany AS tgt
USING WI_StageODS.intr2.istat_dok_wyslany AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.id_dok_zrd=src.id_dok_zrd, tgt.id_dok=src.id_dok, tgt.identyfikator=src.identyfikator, tgt.typ=src.typ, tgt.data_wyslania=src.data_wyslania, tgt.data_dostarczenia=src.data_dostarczenia, tgt.xml=src.xml, tgt.podtyp=src.podtyp
WHEN NOT MATCHED
THEN INSERT (id_dok_zrd, id_dok, identyfikator, typ, data_wyslania, data_dostarczenia, xml, podtyp, id)
VALUES (src.id_dok_zrd, src.id_dok, src.identyfikator, src.typ, src.data_wyslania, src.data_dostarczenia, src.xml, src.podtyp, src.id);
	SET @Merged = 1;
	END
		

		IF @TableName = 'istat_komunikat_powiazania' BEGIN
MERGE INTO intr2.istat_komunikat_powiazania AS tgt
USING WI_StageODS.intr2.istat_komunikat_powiazania AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.id_komunikatu=src.id_komunikatu, tgt.id_dok_zrd=src.id_dok_zrd, tgt.id_dok_wyn=src.id_dok_wyn, tgt.id_dok_wyslany=src.id_dok_wyslany, tgt.ustalenie=src.ustalenie
WHEN NOT MATCHED
THEN INSERT (id, id_komunikatu, id_dok_zrd, id_dok_wyn, id_dok_wyslany, ustalenie)
VALUES (src.id, src.id_komunikatu, src.id_dok_zrd, src.id_dok_wyn, src.id_dok_wyslany, src.ustalenie);
	SET @Merged = 1;
	END
		

/*		IF @TableName = 'istat_komunikat_zalaczniki' BEGIN
MERGE INTO intr2.istat_komunikat_zalaczniki AS tgt
USING WI_StageODS.intr2.istat_komunikat_zalaczniki AS src
ON (tgt.id=src.id)
WHEN MATCHED
THEN UPDATE SET
tgt.id_komunikatu=src.id_komunikatu, tgt.nazwa_pliku=src.nazwa_pliku, tgt.mime=src.mime, tgt.zawartosc=src.zawartosc
WHEN NOT MATCHED
THEN INSERT (id, id_komunikatu, nazwa_pliku, mime, zawartosc)
VALUES (src.id, src.id_komunikatu, src.nazwa_pliku, src.mime, src.zawartosc);
	SET @Merged = 1;
	END */
		

	IF @TableName = 'istat_zdarzenie' BEGIN
		MERGE INTO intr2.istat_zdarzenie AS tgt
		USING WI_StageODS.intr2.istat_zdarzenie AS src
		ON (tgt.id_zdarzenia=src.id_zdarzenia)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_dok_dekl_wynik=src.id_dok_dekl_wynik, tgt.data_zdarzenia=src.data_zdarzenia, tgt.operacja=src.operacja, tgt.wykonal=src.wykonal, tgt.komentarz=src.komentarz, tgt.id_dok_dekl_zrd=src.id_dok_dekl_zrd, tgt.identity_id=src.identity_id
		WHEN NOT MATCHED
		THEN INSERT (id_zdarzenia, id_dok_dekl_wynik, data_zdarzenia, operacja, wykonal, komentarz, id_dok_dekl_zrd, identity_id)
		VALUES (src.id_zdarzenia, src.id_dok_dekl_wynik, src.data_zdarzenia, src.operacja, src.wykonal, src.komentarz, src.id_dok_dekl_zrd, src.identity_id);	
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_BLOB_TRIGGERS' BEGIN
MERGE INTO intr2.QRTZ_BLOB_TRIGGERS AS tgt
USING WI_StageODS.intr2.QRTZ_BLOB_TRIGGERS AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.TRIGGER_NAME=src.TRIGGER_NAME AND tgt.TRIGGER_GROUP=src.TRIGGER_GROUP)
WHEN MATCHED
THEN UPDATE SET
tgt.BLOB_DATA=src.BLOB_DATA
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP, BLOB_DATA)
VALUES (src.SCHED_NAME, src.TRIGGER_NAME, src.TRIGGER_GROUP, src.BLOB_DATA);
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_CRON_TRIGGERS' BEGIN
MERGE INTO intr2.QRTZ_CRON_TRIGGERS AS tgt
USING WI_StageODS.intr2.QRTZ_CRON_TRIGGERS AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.TRIGGER_NAME=src.TRIGGER_NAME AND tgt.TRIGGER_GROUP=src.TRIGGER_GROUP)
WHEN MATCHED
THEN UPDATE SET
tgt.CRON_EXPRESSION=src.CRON_EXPRESSION, tgt.TIME_ZONE_ID=src.TIME_ZONE_ID
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP, CRON_EXPRESSION, TIME_ZONE_ID)
VALUES (src.SCHED_NAME, src.TRIGGER_NAME, src.TRIGGER_GROUP, src.CRON_EXPRESSION, src.TIME_ZONE_ID);
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_SIMPLE_TRIGGERS' BEGIN
MERGE INTO intr2.QRTZ_SIMPLE_TRIGGERS AS tgt
USING WI_StageODS.intr2.QRTZ_SIMPLE_TRIGGERS AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.TRIGGER_NAME=src.TRIGGER_NAME AND tgt.TRIGGER_GROUP=src.TRIGGER_GROUP)
WHEN MATCHED
THEN UPDATE SET
tgt.REPEAT_COUNT=src.REPEAT_COUNT, tgt.REPEAT_INTERVAL=src.REPEAT_INTERVAL, tgt.TIMES_TRIGGERED=src.TIMES_TRIGGERED
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP, REPEAT_COUNT, REPEAT_INTERVAL, TIMES_TRIGGERED)
VALUES (src.SCHED_NAME, src.TRIGGER_NAME, src.TRIGGER_GROUP, src.REPEAT_COUNT, src.REPEAT_INTERVAL, src.TIMES_TRIGGERED);
	SET @Merged = 1;
	END
		

		IF @TableName = 'QRTZ_SIMPROP_TRIGGERS' BEGIN
MERGE INTO intr2.QRTZ_SIMPROP_TRIGGERS AS tgt
USING WI_StageODS.intr2.QRTZ_SIMPROP_TRIGGERS AS src
ON (tgt.SCHED_NAME=src.SCHED_NAME AND tgt.TRIGGER_NAME=src.TRIGGER_NAME AND tgt.TRIGGER_GROUP=src.TRIGGER_GROUP)
WHEN MATCHED
THEN UPDATE SET
tgt.STR_PROP_1=src.STR_PROP_1, tgt.STR_PROP_2=src.STR_PROP_2, tgt.STR_PROP_3=src.STR_PROP_3, tgt.INT_PROP_1=src.INT_PROP_1, tgt.INT_PROP_2=src.INT_PROP_2, tgt.LONG_PROP_1=src.LONG_PROP_1, tgt.LONG_PROP_2=src.LONG_PROP_2, tgt.DEC_PROP_1=src.DEC_PROP_1, tgt.DEC_PROP_2=src.DEC_PROP_2, tgt.BOOL_PROP_1=src.BOOL_PROP_1, tgt.BOOL_PROP_2=src.BOOL_PROP_2
WHEN NOT MATCHED
THEN INSERT (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP, STR_PROP_1, STR_PROP_2, STR_PROP_3, INT_PROP_1, INT_PROP_2, LONG_PROP_1, LONG_PROP_2, DEC_PROP_1, DEC_PROP_2, BOOL_PROP_1, BOOL_PROP_2)
VALUES (src.SCHED_NAME, src.TRIGGER_NAME, src.TRIGGER_GROUP, src.STR_PROP_1, src.STR_PROP_2, src.STR_PROP_3, src.INT_PROP_1, src.INT_PROP_2, src.LONG_PROP_1, src.LONG_PROP_2, src.DEC_PROP_1, src.DEC_PROP_2, src.BOOL_PROP_1, src.BOOL_PROP_2);
	SET @Merged = 1;
	END
		

		IF @TableName = 'intr_okres_sprawozd_kraj_kontrahent' BEGIN
MERGE INTO intr2.intr_okres_sprawozd_kraj_kontrahent AS tgt
USING WI_StageODS.intr2.intr_okres_sprawozd_kraj_kontrahent AS src
ON (tgt.id_pod=src.id_pod AND tgt.nr_poz=src.nr_poz AND tgt.kraj=src.kraj AND tgt.id_kontrahenta=src.id_kontrahenta)
WHEN MATCHED
THEN UPDATE SET
tgt.data_aktualizacji=src.data_aktualizacji, tgt.deklaracja=src.deklaracja, tgt.vies=src.vies, tgt.vies_trojstronne=src.vies_trojstronne, tgt.deklaracja_pozycje_FLKZ=src.deklaracja_pozycje_FLKZ, tgt.deklaracja_kod_transakcji_1=src.deklaracja_kod_transakcji_1
WHEN NOT MATCHED
THEN INSERT (id_pod, nr_poz, kraj, id_kontrahenta, data_aktualizacji, deklaracja, vies, vies_trojstronne, deklaracja_pozycje_FLKZ, deklaracja_kod_transakcji_1)
VALUES (src.id_pod, src.nr_poz, src.kraj, src.id_kontrahenta, src.data_aktualizacji, src.deklaracja, src.vies, src.vies_trojstronne, src.deklaracja_pozycje_FLKZ, src.deklaracja_kod_transakcji_1);
	SET @Merged = 1;
	END
		


	IF @TableName = 'dot_obroty_roczne' BEGIN
		MERGE INTO intr2.dot_obroty_roczne AS tgt
		USING WI_StageODS.intr2.dot_obroty_roczne AS src
		ON (tgt.nip=src.nip AND tgt.rok=src.rok AND tgt.typ=src.typ AND tgt.sr_mies_stat=src.sr_mies_stat AND tgt.roczny_stat=src.roczny_stat)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.nip=src.nip, tgt.rok=src.rok, tgt.typ=src.typ, tgt.sr_mies_stat=src.sr_mies_stat, tgt.roczny_stat=src.roczny_stat
		WHEN NOT MATCHED
		THEN INSERT (nip, rok, typ, sr_mies_stat, roczny_stat)
		VALUES (src.nip, src.rok, src.typ, src.sr_mies_stat, src.roczny_stat);
	SET @Merged = 1;
	END
		

		
		IF (@Merged = 0)
		BEGIN
				DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
				THROW 51002, @Info, 0;
					END
				END
			;