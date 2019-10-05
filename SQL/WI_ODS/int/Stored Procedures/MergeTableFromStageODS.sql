CREATE PROCEDURE [int].[MergeTableFromStageODS] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'dokumenty' BEGIN
		DELETE FROM int.dokumenty;
		MERGE INTO int.dokumenty AS tgt
		USING [WI_StageODS].int.dokumenty AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_dok=src.id_dok, tgt.id_jedn=src.id_jedn, tgt.id_rodz_dok=src.id_rodz_dok, tgt.id_konta=src.id_konta, tgt.id_kntr=src.id_kntr, tgt.rok=src.rok, tgt.id_stanow=src.id_stanow, tgt.nr_dok=src.nr_dok, tgt.sym_dok=src.sym_dok, tgt.dat_wystaw_dok=src.dat_wystaw_dok, tgt.dat_zamkn=src.dat_zamkn, tgt.operator=src.operator, tgt.status=src.status, tgt.semafor=src.semafor, tgt.wlasciciel=src.wlasciciel, tgt.etap_ar=src.etap_ar, tgt.data_wyst_ar=src.data_wyst_ar, tgt.fsynch=src.fsynch, tgt.data_synch=src.data_synch, tgt.etap_bilans=src.etap_bilans, tgt.data_formal_przyj=src.data_formal_przyj, tgt.login_usr=src.login_usr, tgt.id_jedn_sads=src.id_jedn_sads, tgt.src=src.src, tgt.signed=src.signed, tgt.ExtractDate=src.ExtractDate, tgt.Flaga=src.Flaga, tgt.lokalizacja=src.lokalizacja
		WHEN NOT MATCHED
		THEN INSERT (id_dok, id_jedn, id_rodz_dok, id_konta, id_kntr, rok, id_stanow, nr_dok, sym_dok, dat_wystaw_dok, dat_zamkn, operator, status, semafor, wlasciciel, etap_ar, data_wyst_ar, fsynch, data_synch, etap_bilans, data_formal_przyj, login_usr, id_jedn_sads, src, signed, ExtractDate, Flaga, lokalizacja)
		VALUES (src.id_dok, src.id_jedn, src.id_rodz_dok, src.id_konta, src.id_kntr, src.rok, src.id_stanow, src.nr_dok, src.sym_dok, src.dat_wystaw_dok, src.dat_zamkn, src.operator, src.status, src.semafor, src.wlasciciel, src.etap_ar, src.data_wyst_ar, src.fsynch, src.data_synch, src.etap_bilans, src.data_formal_przyj, src.login_usr, src.id_jedn_sads, src.src, src.signed, src.ExtractDate, src.Flaga, src.lokalizacja);
		SET @Merged = 1;
	END

	IF @TableName = 'intr_dane_pod' BEGIN
		MERGE INTO int.intr_dane_pod AS tgt
		USING [WI_StageODS].int.intr_dane_pod AS src
		ON (tgt.id_pod=src.id_pod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.nip=src.nip, tgt.regon=src.regon, tgt.pgus=src.pgus, tgt.pkep=src.pkep, tgt.pvat=src.pvat, tgt.pintrastat=src.pintrastat, tgt.nazwa=src.nazwa, tgt.imie=src.imie, tgt.nazwisko=src.nazwisko, tgt.kod_kraj=src.kod_kraj, tgt.kod_gmina=src.kod_gmina, tgt.kod_poczt=src.kod_poczt, tgt.poczta=src.poczta, tgt.miejscowosc=src.miejscowosc, tgt.ulica=src.ulica, tgt.nr_dom=src.nr_dom, tgt.nr_lok=src.nr_lok, tgt.telefon=src.telefon, tgt.faks=src.faks, tgt.email=src.email, tgt.rodz_vat=src.rodz_vat, tgt.data_wprow=src.data_wprow, tgt.uwagi=src.uwagi, tgt.status=src.status, tgt.data_zakoncz=src.data_zakoncz, tgt.data_aktual=src.data_aktual, tgt.zobowiazany=src.zobowiazany, tgt.przedstawiciel=src.przedstawiciel
		WHEN NOT MATCHED
		THEN INSERT (id_pod, nip, regon, pgus, pkep, pvat, pintrastat, nazwa, imie, nazwisko, kod_kraj, kod_gmina, kod_poczt, poczta, miejscowosc, ulica, nr_dom, nr_lok, telefon, faks, email, rodz_vat, data_wprow, uwagi, status, data_zakoncz, data_aktual, zobowiazany, przedstawiciel)
		VALUES (src.id_pod, src.nip, src.regon, src.pgus, src.pkep, src.pvat, src.pintrastat, src.nazwa, src.imie, src.nazwisko, src.kod_kraj, src.kod_gmina, src.kod_poczt, src.poczta, src.miejscowosc, src.ulica, src.nr_dom, src.nr_lok, src.telefon, src.faks, src.email, src.rodz_vat, src.data_wprow, src.uwagi, src.status, src.data_zakoncz, src.data_aktual, src.zobowiazany, src.przedstawiciel);
		SET @Merged = 1;
	END

	IF @TableName = 'intr_fwpdk' BEGIN
		MERGE INTO int.intr_fwpdk AS tgt
		USING [WI_StageODS].int.intr_fwpdk AS src
		ON (tgt.id_pod=src.id_pod and tgt.nr_poz=src.nr_poz)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.fw=src.fw, tgt.pkd=src.pkd, tgt.poczatek_obow=src.poczatek_obow, tgt.koniec_obow=src.koniec_obow
		WHEN NOT MATCHED
		THEN INSERT (id_pod, nr_poz, fw, pkd, poczatek_obow, koniec_obow)
		VALUES (src.id_pod, src.nr_poz, src.fw, src.pkd, src.poczatek_obow, src.koniec_obow);
		SET @Merged = 1;
	END

	IF @TableName = 'intr_historia_podmiotu' BEGIN
		MERGE INTO int.intr_historia_podmiotu AS tgt
		USING [WI_StageODS].int.intr_historia_podmiotu AS src
		ON (tgt.id_poz=src.id_poz)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_pod=src.id_pod, tgt.data_zmiany=src.data_zmiany, tgt.operator=src.operator, tgt.nazwa_dw=src.nazwa_dw, tgt.pozycja=src.pozycja, tgt.nazwa_danej=src.nazwa_danej, tgt.wartosc_przed=src.wartosc_przed, tgt.wartosc_po=src.wartosc_po, tgt.komentarz=src.komentarz
		WHEN NOT MATCHED
		THEN INSERT (id_poz, id_pod, data_zmiany, operator, nazwa_dw, pozycja, nazwa_danej, wartosc_przed, wartosc_po, komentarz)
		VALUES (src.id_poz, src.id_pod, src.data_zmiany, src.operator, src.nazwa_dw, src.pozycja, src.nazwa_danej, src.wartosc_przed, src.wartosc_po, src.komentarz);
		SET @Merged = 1;
	END

	IF @TableName = 'intr_kategoria' BEGIN
		MERGE INTO int.intr_kategoria AS tgt
		USING [WI_StageODS].int.intr_kategoria AS src
		ON (tgt.id_pod=src.id_pod and tgt.rodz_kat=src.rodz_kat and tgt.wazna_od_mies=src.wazna_od_mies and tgt.wazna_od_rok=src.wazna_od_rok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.nr_poz=src.nr_poz, tgt.kategoria=src.kategoria, tgt.zakres_szczeg=src.zakres_szczeg, tgt.wazna_do_mies=src.wazna_do_mies, tgt.wazna_do_rok=src.wazna_do_rok, tgt.w_systemie_od=src.w_systemie_od
		WHEN NOT MATCHED
		THEN INSERT (id_pod, nr_poz, rodz_kat, kategoria, zakres_szczeg, wazna_od_mies, wazna_od_rok, wazna_do_mies, wazna_do_rok, w_systemie_od)
		VALUES (src.id_pod, src.nr_poz, src.rodz_kat, src.kategoria, src.zakres_szczeg, src.wazna_od_mies, src.wazna_od_rok, src.wazna_do_mies, src.wazna_do_rok, src.w_systemie_od);
		SET @Merged = 1;
	END

	IF @TableName = 'intr_okres_sprawozd' BEGIN
		MERGE INTO int.intr_okres_sprawozd AS tgt
		USING [WI_StageODS].int.intr_okres_sprawozd AS src
		ON (tgt.id_pod=src.id_pod and tgt.nr_poz=src.nr_poz and tgt.id_jedn=src.id_jedn)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.rok=src.rok, tgt.typ=src.typ, tgt.miesiac=src.miesiac, tgt.status=src.status, tgt.wsk_popraw=src.wsk_popraw, tgt.operator=src.operator, tgt.data_zmiany=src.data_zmiany, tgt.roznica_V_I=src.roznica_V_I
		WHEN NOT MATCHED
		THEN INSERT (id_pod, nr_poz, rok, typ, miesiac, status, id_jedn, wsk_popraw, operator, data_zmiany, roznica_V_I)
		VALUES (src.id_pod, src.nr_poz, src.rok, src.typ, src.miesiac, src.status, src.id_jedn, src.wsk_popraw, src.operator, src.data_zmiany, src.roznica_V_I);
		SET @Merged = 1;
	END

	IF @TableName = 'intr_priorytet' BEGIN
		MERGE INTO int.intr_priorytet AS tgt
		USING [WI_StageODS].int.intr_priorytet AS src
		ON (tgt.id_pod=src.id_pod and tgt.rodzaj_prior=src.rodzaj_prior and tgt.wazna_od_mies=src.wazna_od_mies and tgt.wazna_od_rok=src.wazna_od_rok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.nr_poz=src.nr_poz, tgt.priorytet=src.priorytet, tgt.wazna_do_mies=src.wazna_do_mies, tgt.wazna_do_rok=src.wazna_do_rok, tgt.w_systemie_od=src.w_systemie_od
		WHEN NOT MATCHED
		THEN INSERT (id_pod, nr_poz, rodzaj_prior, priorytet, wazna_od_mies, wazna_od_rok, wazna_do_mies, wazna_do_rok, w_systemie_od)
		VALUES (src.id_pod, src.nr_poz, src.rodzaj_prior, src.priorytet, src.wazna_od_mies, src.wazna_od_rok, src.wazna_do_mies, src.wazna_do_rok, src.w_systemie_od);
		SET @Merged = 1;
	END

	IF @TableName = 'intr_rdin' BEGIN
		DELETE FROM int.intr_rdin
		MERGE INTO int.intr_rdin AS tgt
		USING [WI_StageODS].int.intr_rdin AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_rdin=src.id_rdin, tgt.NIP=src.NIP, tgt.rok=src.rok, tgt.miesiac=src.miesiac, tgt.wersja_dek=src.wersja_dek, tgt.kod_us=src.kod_us, tgt.trans_nabycie=src.trans_nabycie, tgt.trans_dostawa=src.trans_dostawa, tgt.poprawnosc=src.poprawnosc, tgt.status_us=src.status_us, tgt.rodz_dekl=src.rodz_dekl
		WHEN NOT MATCHED
		THEN INSERT (id_rdin, NIP, rok, miesiac, wersja_dek, kod_us, trans_nabycie, trans_dostawa, poprawnosc, status_us, rodz_dekl)
		VALUES (src.id_rdin, src.NIP, src.rok, src.miesiac, src.wersja_dek, src.kod_us, src.trans_nabycie, src.trans_dostawa, src.poprawnosc, src.status_us, src.rodz_dekl);
		SET @Merged = 1;
	END

	IF @TableName = 'intr_upowaznienie' BEGIN
		MERGE INTO int.intr_upowaznienie AS tgt
		USING [WI_StageODS].int.intr_upowaznienie AS src
		ON (tgt.id_pod=src.id_pod and tgt.nr_poz=src.nr_poz)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_up_pod=src.id_up_pod, tgt.zakres=src.zakres, tgt.poczatek_obow=src.poczatek_obow, tgt.koniec_obow=src.koniec_obow
		WHEN NOT MATCHED
		THEN INSERT (id_pod, nr_poz, id_up_pod, zakres, poczatek_obow, koniec_obow)
		VALUES (src.id_pod, src.nr_poz, src.id_up_pod, src.zakres, src.poczatek_obow, src.koniec_obow);
		SET @Merged = 1;
	END

	IF @TableName = 'intr_ustalenia' BEGIN
		MERGE INTO int.intr_ustalenia AS tgt
		USING WI_StageODS.int.intr_ustalenia AS src
		ON (tgt.nr_ustalenia=src.nr_ustalenia AND tgt.id_jedn=src.id_jedn AND tgt.nip=src.nip AND tgt.rok=src.rok AND tgt.miesiac=src.miesiac AND tgt.typ=src.typ)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.data=src.data, tgt.operator=src.operator, tgt.forma_kont=src.forma_kont, tgt.kategoria=src.kategoria, tgt.opis=src.opis, tgt.id_pisma=src.id_pisma, tgt.data_wys_pisma=src.data_wys_pisma, tgt.termin_real=src.termin_real, tgt.reakcja=src.reakcja, tgt.id_dok=src.id_dok, tgt.id_dok_nr_poz=src.id_dok_nr_poz
		WHEN NOT MATCHED
		THEN INSERT (nr_ustalenia, id_jedn, data, operator, forma_kont, kategoria, opis, id_pisma, data_wys_pisma, nip, rok, miesiac, typ, termin_real, reakcja, id_dok, id_dok_nr_poz)
		VALUES (src.nr_ustalenia, src.id_jedn, src.data, src.operator, src.forma_kont, src.kategoria, src.opis, src.id_pisma, src.data_wys_pisma, src.nip, src.rok, src.miesiac, src.typ, src.termin_real, src.reakcja, src.id_dok, src.id_dok_nr_poz);
		SET @Merged = 1;
	END

	IF @TableName = 'intr_wlasc_terytor' BEGIN
		MERGE INTO int.intr_wlasc_terytor AS tgt
		USING [WI_StageODS].int.intr_wlasc_terytor AS src
		ON (tgt.id_pod=src.id_pod and tgt.nr_poz=src.nr_poz)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.identyfikator=src.identyfikator, tgt.wazna_od_mies=src.wazna_od_mies, tgt.wazna_od_rok=src.wazna_od_rok, tgt.wazna_do_mies=src.wazna_do_mies, tgt.wazna_do_rok=src.wazna_do_rok
		WHEN NOT MATCHED
		THEN INSERT (id_pod, nr_poz, identyfikator, wazna_od_mies, wazna_od_rok, wazna_do_mies, wazna_do_rok)
		VALUES (src.id_pod, src.nr_poz, src.identyfikator, src.wazna_od_mies, src.wazna_od_rok, src.wazna_do_mies, src.wazna_do_rok);
		SET @Merged = 1;
	END

	IF @TableName = 'istat_blad_zrodlowy' BEGIN
		MERGE INTO int.istat_blad_zrodlowy AS tgt
		USING [WI_StageODS].int.istat_blad_zrodlowy AS src
		ON (tgt.id_bledu=src.id_bledu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_dok=src.id_dok, tgt.sym_dok=src.sym_dok, tgt.kod=src.kod, tgt.komunikat=src.komunikat, tgt.id_jedn=src.id_jedn
		WHEN NOT MATCHED
		THEN INSERT (id_bledu, id_dok, sym_dok, kod, komunikat, id_jedn)
		VALUES (src.id_bledu, src.id_dok, src.sym_dok, src.kod, src.komunikat, src.id_jedn);
		SET @Merged = 1;
	END

	IF @TableName = 'istat_dekl_wynik_blad' BEGIN
		MERGE INTO int.istat_dekl_wynik_blad AS tgt
		USING [WI_StageODS].int.istat_dekl_wynik_blad AS src
		ON (tgt.id_dok=src.id_dok and tgt.pozid=src.pozid and tgt.numer=src.numer)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.typ=src.typ, tgt.kod=src.kod, tgt.opis=src.opis, tgt.id_jedn=src.id_jedn
		WHEN NOT MATCHED
		THEN INSERT (id_dok, pozid, numer, typ, kod, opis, id_jedn)
		VALUES (src.id_dok, src.pozid, src.numer, src.typ, src.kod, src.opis, src.id_jedn);
		SET @Merged = 1;
	END

	IF @TableName = 'istat_dekl_wynik_dok' BEGIN
		MERGE INTO int.istat_dekl_wynik_dok AS tgt
		USING [WI_StageODS].int.istat_dekl_wynik_dok AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.status=src.status, tgt.typ=src.typ, tgt.miesiac=src.miesiac, tgt.numer=src.numer, tgt.nip_zobowiazanego=src.nip_zobowiazanego, tgt.regon_zobowiazanego=src.regon_zobowiazanego, tgt.rok=src.rok, tgt.wersja=src.wersja, tgt.id_jedn=src.id_jedn
		WHEN NOT MATCHED
		THEN INSERT (id_dok, status, typ, miesiac, numer, nip_zobowiazanego, regon_zobowiazanego, rok, wersja, id_jedn)
		VALUES (src.id_dok, src.status, src.typ, src.miesiac, src.numer, src.nip_zobowiazanego, src.regon_zobowiazanego, src.rok, src.wersja, src.id_jedn);
		SET @Merged = 1;
	END

	IF @TableName = 'istat_dekl_wynik_poz' BEGIN
		MERGE INTO int.istat_dekl_wynik_poz AS tgt
		USING [WI_StageODS].int.istat_dekl_wynik_poz AS src
		ON (tgt.id_dok=src.id_dok and tgt.pozid=src.pozid)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.status=src.status, tgt.komentarz=src.komentarz, tgt.opis_towaru=src.opis_towaru, tgt.kraj_przezn_wysyl=src.kraj_przezn_wysyl, tgt.warunki_dostawy=src.warunki_dostawy, tgt.rodzaj_transakcji=src.rodzaj_transakcji, tgt.rodzaj_transportu=src.rodzaj_transportu, tgt.kod_towarowy=src.kod_towarowy, tgt.kraj_pochodzenia=src.kraj_pochodzenia, tgt.masa_netto=src.masa_netto, tgt.uzup_jm=src.uzup_jm, tgt.wartosc_faktury=src.wartosc_faktury, tgt.wartosc_stat=src.wartosc_stat, tgt.wsk_progowy=src.wsk_progowy, tgt.flaga=src.flaga, tgt.semafor=src.semafor, tgt.id_jedn=src.id_jedn
		WHEN NOT MATCHED
		THEN INSERT (id_dok, pozid, status, komentarz, opis_towaru, kraj_przezn_wysyl, warunki_dostawy, rodzaj_transakcji, rodzaj_transportu, kod_towarowy, kraj_pochodzenia, masa_netto, uzup_jm, wartosc_faktury, wartosc_stat, wsk_progowy, flaga, semafor, id_jedn)
		VALUES (src.id_dok, src.pozid, src.status, src.komentarz, src.opis_towaru, src.kraj_przezn_wysyl, src.warunki_dostawy, src.rodzaj_transakcji, src.rodzaj_transportu, src.kod_towarowy, src.kraj_pochodzenia, src.masa_netto, src.uzup_jm, src.wartosc_faktury, src.wartosc_stat, src.wsk_progowy, src.flaga, src.semafor, src.id_jedn);
		SET @Merged = 1;
	END

	IF @TableName = 'istat_dok_zrodlowy' BEGIN
		MERGE INTO int.istat_dok_zrodlowy AS tgt
		USING [WI_StageODS].int.istat_dok_zrodlowy AS src
		ON (tgt.id_dok_zrd=src.id_dok_zrd)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.sym_dok_zrd=src.sym_dok_zrd, tgt.rodz_dok_zrd=src.rodz_dok_zrd, tgt.sposob_wpr_zrd=src.sposob_wpr_zrd, tgt.data_wpr_zrd=src.data_wpr_zrd, tgt.wprowadzil=src.wprowadzil, tgt.xml=src.xml, tgt.id_dok_dekl_wynik=src.id_dok_dekl_wynik, tgt.email=src.email, tgt.id_pliku=src.id_pliku, tgt.err_xml=src.err_xml, tgt.id_jedn=src.id_jedn, tgt.regon=src.regon, tgt.czy_potw=src.czy_potw
		WHEN NOT MATCHED
		THEN INSERT (id_dok_zrd, sym_dok_zrd, rodz_dok_zrd, sposob_wpr_zrd, data_wpr_zrd, wprowadzil, xml, id_dok_dekl_wynik, email, id_pliku, err_xml, id_jedn, regon, czy_potw)
		VALUES (src.id_dok_zrd, src.sym_dok_zrd, src.rodz_dok_zrd, src.sposob_wpr_zrd, src.data_wpr_zrd, src.wprowadzil, src.xml, src.id_dok_dekl_wynik, src.email, src.id_pliku, src.err_xml, src.id_jedn, src.regon, src.czy_potw);
		SET @Merged = 1;
	END

	IF @TableName = 'istat_zdarzenie' BEGIN
		MERGE INTO int.istat_zdarzenie AS tgt
		USING [WI_StageODS].int.istat_zdarzenie AS src
		ON (tgt.id_dok_dekl_wynik=src.id_dok_dekl_wynik and tgt.id_zdarzenia=src.id_zdarzenia)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.data_zdarzenia=src.data_zdarzenia, tgt.komentarz=src.komentarz, tgt.operacja=src.operacja, tgt.wykonal=src.wykonal, tgt.id_jedn=src.id_jedn
		WHEN NOT MATCHED
		THEN INSERT (data_zdarzenia, id_dok_dekl_wynik, id_zdarzenia, komentarz, operacja, wykonal, id_jedn)
		VALUES (src.data_zdarzenia, src.id_dok_dekl_wynik, src.id_zdarzenia, src.komentarz, src.operacja, src.wykonal, src.id_jedn);
		SET @Merged = 1;
	END

	IF @TableName = 'istat_zmiana_danych' BEGIN
		MERGE INTO int.istat_zmiana_danych AS tgt
		USING [WI_StageODS].int.istat_zmiana_danych AS src
		ON (tgt.id_dok_dekl_wynik=src.id_dok_dekl_wynik and tgt.id_zdarzenia=src.id_zdarzenia and tgt.pozid=src.pozid and tgt.pozycja_danej=src.pozycja_danej)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.nazwa_danej=src.nazwa_danej, tgt.wartosc_po=src.wartosc_po, tgt.wartosc_przed=src.wartosc_przed, tgt.id_jedn=src.id_jedn
		WHEN NOT MATCHED
		THEN INSERT (id_dok_dekl_wynik, id_zdarzenia, nazwa_danej, pozid, pozycja_danej, wartosc_po, wartosc_przed, id_jedn)
		VALUES (src.id_dok_dekl_wynik, src.id_zdarzenia, src.nazwa_danej, src.pozid, src.pozycja_danej, src.wartosc_po, src.wartosc_przed, src.id_jedn);
		SET @Merged = 1;
	END

	IF (@Merged = 0)
	BEGIN
			DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
			THROW 51002, @Info, 0;
				END
			END
		;