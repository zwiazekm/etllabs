




-- ==============================================
-- Author:		Magdalena Nocoń
-- Create date: 2015-09-02
-- Description:	Procedura Merge'ująca w schemacie NCTS2.
-- ===============================================

CREATE PROCEDURE [ncts2].[MergeTableFromStageODS] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
		END

		IF @TableName = 'ar_dokument' BEGIN
			MERGE INTO ncts2.ar_dokument AS tgt
			USING [WI_StageODS].ncts2.ar_dokument AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.numer_dokumentu_zisar=src.numer_dokumentu_zisar, tgt.numer_dokumentu_so=src.numer_dokumentu_so, tgt.system_operacyjny=src.system_operacyjny, tgt.rodzaj_dokumentu=src.rodzaj_dokumentu, tgt.nr_typu_komunikatu=src.nr_typu_komunikatu, tgt.wynik_analizy_ryzyka=src.wynik_analizy_ryzyka, tgt.uc_zglaszajacy_do_aar=src.uc_zglaszajacy_do_aar, tgt.uc_kontroli_towarow=src.uc_kontroli_towarow, tgt.miejsce_analizy=src.miejsce_analizy, tgt.czas_analizy=src.czas_analizy, tgt.wersja=src.wersja, tgt.rola_urzedu=src.rola_urzedu, tgt.komunikat_id=src.komunikat_id, tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id
			WHEN NOT MATCHED
			THEN INSERT (id, numer_dokumentu_zisar, numer_dokumentu_so, system_operacyjny, rodzaj_dokumentu, nr_typu_komunikatu, wynik_analizy_ryzyka, uc_zglaszajacy_do_aar, uc_kontroli_towarow, miejsce_analizy, czas_analizy, wersja, rola_urzedu, komunikat_id, operacja_tranzytowa_id)
			VALUES (src.id, src.numer_dokumentu_zisar, src.numer_dokumentu_so, src.system_operacyjny, src.rodzaj_dokumentu, src.nr_typu_komunikatu, src.wynik_analizy_ryzyka, src.uc_zglaszajacy_do_aar, src.uc_kontroli_towarow, src.miejsce_analizy, src.czas_analizy, src.wersja, src.rola_urzedu, src.komunikat_id, src.operacja_tranzytowa_id);
		SET @Merged = 1;
		END

		IF @TableName = 'ar_obsluga_wskazan_kontroli' BEGIN
			MERGE INTO ncts2.ar_obsluga_wskazan_kontroli AS tgt
			USING [WI_StageODS].ncts2.ar_obsluga_wskazan_kontroli AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.ar_dokument_id=src.ar_dokument_id, tgt.zrodlo=src.zrodlo, tgt.nr_algorytmu=src.nr_algorytmu, tgt.autor=src.autor, tgt.war1=src.war1, tgt.war1_so=src.war1_so, tgt.war24=src.war24, tgt.war24_so=src.war24_so, tgt.war5=src.war5, tgt.war5_so=src.war5_so, tgt.zmiana_war_uzasadnienie_so=src.zmiana_war_uzasadnienie_so, tgt.obszar_ryzyka=src.obszar_ryzyka, tgt.zmiana_metod_kontroli_uzasadnienie_so=src.zmiana_metod_kontroli_uzasadnienie_so, tgt.tresc_dyrektywy=src.tresc_dyrektywy, tgt.informacja_dla_dyspozytora=src.informacja_dla_dyspozytora, tgt.decyzja_dyspozytora_so=src.decyzja_dyspozytora_so, tgt.odstapienie_od_kontroli_uzasadnienie_so=src.odstapienie_od_kontroli_uzasadnienie_so, tgt.adresaci_dyrektywy_so=src.adresaci_dyrektywy_so, tgt.zalecenie_dyspozytora_so=src.zalecenie_dyspozytora_so, tgt.dyrektywa_dla_kolejnego_uc_wprowadzenia_so=src.dyrektywa_dla_kolejnego_uc_wprowadzenia_so, tgt.zakres_przebieg_kontroli_so=src.zakres_przebieg_kontroli_so, tgt.wynik_kontroli_so=src.wynik_kontroli_so, tgt.metoda_analizy=src.metoda_analizy, tgt.czy_widoczna_w_innych_uc=src.czy_widoczna_w_innych_uc, tgt.numer_profilu_algorytmu=src.numer_profilu_algorytmu, tgt.numer_zastrzezenia=src.numer_zastrzezenia, tgt.rola_wystepowania_podmiotu=src.rola_wystepowania_podmiotu, tgt.poziom_ryzyka=src.poziom_ryzyka, tgt.status=src.status, tgt.obsluzyl_uzytkownik_id=src.obsluzyl_uzytkownik_id, tgt.zarejestrowal_wynik_kontroli_uzytkownik_id=src.zarejestrowal_wynik_kontroli_uzytkownik_id, tgt.kontroler_obszar_ryzyka=src.kontroler_obszar_ryzyka, tgt.kontroler_powod_zmiany_metody=src.kontroler_powod_zmiany_metody, tgt.dyspozytor_powod_zmiany_metody=src.dyspozytor_powod_zmiany_metody, tgt.kontroler_wynik_kontroli=src.kontroler_wynik_kontroli, tgt.kontroler_przebieg_kontroli=src.kontroler_przebieg_kontroli, tgt.segment=src.segment, tgt.czas_zarejestrowania_wyniku=src.czas_zarejestrowania_wyniku, tgt.czas_obslugi=src.czas_obslugi, tgt.dyspozycja=src.dyspozycja
			WHEN NOT MATCHED
			THEN INSERT (id, ar_dokument_id, zrodlo, nr_algorytmu, autor, war1, war1_so, war24, war24_so, war5, war5_so, zmiana_war_uzasadnienie_so, obszar_ryzyka, zmiana_metod_kontroli_uzasadnienie_so, tresc_dyrektywy, informacja_dla_dyspozytora, decyzja_dyspozytora_so, odstapienie_od_kontroli_uzasadnienie_so, adresaci_dyrektywy_so, zalecenie_dyspozytora_so, dyrektywa_dla_kolejnego_uc_wprowadzenia_so, zakres_przebieg_kontroli_so, wynik_kontroli_so, metoda_analizy, czy_widoczna_w_innych_uc, numer_profilu_algorytmu, numer_zastrzezenia, rola_wystepowania_podmiotu, poziom_ryzyka, status, obsluzyl_uzytkownik_id, zarejestrowal_wynik_kontroli_uzytkownik_id, kontroler_obszar_ryzyka, kontroler_powod_zmiany_metody, dyspozytor_powod_zmiany_metody, kontroler_wynik_kontroli, kontroler_przebieg_kontroli, segment, czas_zarejestrowania_wyniku, czas_obslugi, dyspozycja)
			VALUES (src.id, src.ar_dokument_id, src.zrodlo, src.nr_algorytmu, src.autor, src.war1, src.war1_so, src.war24, src.war24_so, src.war5, src.war5_so, src.zmiana_war_uzasadnienie_so, src.obszar_ryzyka, src.zmiana_metod_kontroli_uzasadnienie_so, src.tresc_dyrektywy, src.informacja_dla_dyspozytora, src.decyzja_dyspozytora_so, src.odstapienie_od_kontroli_uzasadnienie_so, src.adresaci_dyrektywy_so, src.zalecenie_dyspozytora_so, src.dyrektywa_dla_kolejnego_uc_wprowadzenia_so, src.zakres_przebieg_kontroli_so, src.wynik_kontroli_so, src.metoda_analizy, src.czy_widoczna_w_innych_uc, src.numer_profilu_algorytmu, src.numer_zastrzezenia, src.rola_wystepowania_podmiotu, src.poziom_ryzyka, src.status, src.obsluzyl_uzytkownik_id, src.zarejestrowal_wynik_kontroli_uzytkownik_id, src.kontroler_obszar_ryzyka, src.kontroler_powod_zmiany_metody, src.dyspozytor_powod_zmiany_metody, src.kontroler_wynik_kontroli, src.kontroler_przebieg_kontroli, src.segment, src.czas_zarejestrowania_wyniku, src.czas_obslugi, src.dyspozycja);
		SET @Merged = 1;
		END

		IF @TableName = 'uzytkownicy_uprawnienia_oc' BEGIN
			MERGE INTO ncts2.uzytkownicy_uprawnienia_oc AS tgt
			USING [WI_StageODS].ncts2.uzytkownicy_uprawnienia_oc AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.uzytkownik_id=src.uzytkownik_id, tgt.typ_uprawnienia=src.typ_uprawnienia, tgt.kod_urzedu=src.kod_urzedu
			WHEN NOT MATCHED
			THEN INSERT (id, uzytkownik_id, typ_uprawnienia, kod_urzedu)
			VALUES (src.id, src.uzytkownik_id, src.typ_uprawnienia, src.kod_urzedu);
		SET @Merged = 1;
		END

		IF @TableName = 'ar_metody_kontroli' BEGIN
			MERGE INTO ncts2.ar_metody_kontroli AS tgt
			USING [WI_StageODS].ncts2.ar_metody_kontroli AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.ar_obsluga_wskazan_kontroli_id=src.ar_obsluga_wskazan_kontroli_id, tgt.poziom_zdefiniowania=src.poziom_zdefiniowania, tgt.metoda_kontroli=src.metoda_kontroli
			WHEN NOT MATCHED
			THEN INSERT (id, ar_obsluga_wskazan_kontroli_id, poziom_zdefiniowania, metoda_kontroli)
			VALUES (src.id, src.ar_obsluga_wskazan_kontroli_id, src.poziom_zdefiniowania, src.metoda_kontroli);
		SET @Merged = 1;
		END

		IF @TableName = 'ar_obsluga_wskazan_kontroli_pozycje' BEGIN
			MERGE INTO ncts2.ar_obsluga_wskazan_kontroli_pozycje AS tgt
			USING [WI_StageODS].ncts2.ar_obsluga_wskazan_kontroli_pozycje AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.ar_obsluga_wskazan_kontroli_id=src.ar_obsluga_wskazan_kontroli_id, tgt.nr_pozycji=src.nr_pozycji
			WHEN NOT MATCHED
			THEN INSERT (id, ar_obsluga_wskazan_kontroli_id, nr_pozycji)
			VALUES (src.id, src.ar_obsluga_wskazan_kontroli_id, src.nr_pozycji);
		SET @Merged = 1;
		END

		IF @TableName = 'ar_zespol_kontroli' BEGIN
			MERGE INTO ncts2.ar_zespol_kontroli AS tgt
			USING [WI_StageODS].ncts2.ar_zespol_kontroli AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.ar_obsluga_wskazan_kontroli_id=src.ar_obsluga_wskazan_kontroli_id, tgt.login=src.login, tgt.rejestrator_wynikow_zisar=src.rejestrator_wynikow_zisar
			WHEN NOT MATCHED
			THEN INSERT (id, ar_obsluga_wskazan_kontroli_id, login, rejestrator_wynikow_zisar)
			VALUES (src.id, src.ar_obsluga_wskazan_kontroli_id, src.login, src.rejestrator_wynikow_zisar);
		SET @Merged = 1;
		END

		IF @TableName = 'dokumenty_poprzednie_wpt' BEGIN
			MERGE INTO ncts2.dokumenty_poprzednie_wpt AS tgt
			USING [WI_StageODS].ncts2.dokumenty_poprzednie_wpt AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.towar_id=src.towar_id, tgt.kod=src.kod, tgt.nr=src.nr, tgt.uwagi=src.uwagi, tgt.poz_id=src.poz_id
			WHEN NOT MATCHED
			THEN INSERT (towar_id, kod, nr, uwagi, id, poz_id)
			VALUES (src.towar_id, src.kod, src.nr, src.uwagi, src.id, src.poz_id);
			SET @Merged = 1;
		END

		IF @TableName = 'dokumenty_wymagane_wpt' BEGIN
			MERGE INTO ncts2.dokumenty_wymagane_wpt AS tgt
			USING [WI_StageODS].ncts2.dokumenty_wymagane_wpt AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.towar_id=src.towar_id, tgt.kod=src.kod, tgt.nr=src.nr, tgt.uwagi=src.uwagi, tgt.poz_id=src.poz_id, tgt.tryb_utworzenia_pozycji=src.tryb_utworzenia_pozycji, tgt.iteracja_uwag_rozladunkowych=src.iteracja_uwag_rozladunkowych, tgt.nr_jezyk=src.nr_jezyk, tgt.uwagi_jezyk=src.uwagi_jezyk
			WHEN NOT MATCHED
			THEN INSERT (towar_id, kod, nr, uwagi, id, poz_id, tryb_utworzenia_pozycji, iteracja_uwag_rozladunkowych, nr_jezyk, uwagi_jezyk)
			VALUES (src.towar_id, src.kod, src.nr, src.uwagi, src.id, src.poz_id, src.tryb_utworzenia_pozycji, src.iteracja_uwag_rozladunkowych, src.nr_jezyk, src.uwagi_jezyk);
			SET @Merged = 1;
		END

		IF @TableName = 'gwarancje' BEGIN
			MERGE INTO ncts2.gwarancje AS tgt
			USING [WI_StageODS].ncts2.gwarancje AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_gwarancja_id=src.operacja_tranzytowa_gwarancja_id, tgt.grn=src.grn, tgt.kod_dostepu=src.kod_dostepu, tgt.niewazna_na_ue=src.niewazna_na_ue, tgt.poz_id=src.poz_id, tgt.nr=src.nr, tgt.kwota=src.kwota, tgt.waluta=src.waluta, tgt.status=src.status, tgt.numer_operacji_zajecia_zabezpieczenia=src.numer_operacji_zajecia_zabezpieczenia, tgt.numer_operacji_zwolnienia_zabezpieczenia=src.numer_operacji_zwolnienia_zabezpieczenia, tgt.numer_operacji_wycofania_zabezpieczenia=src.numer_operacji_wycofania_zabezpieczenia, tgt.niewazna_na_strony_konwencji=src.niewazna_na_strony_konwencji, tgt.kwota_euro=src.kwota_euro, tgt.uc_gwarancji=src.uc_gwarancji, tgt.kwota_pln=src.kwota_pln, tgt.kod_przyczyny_odrzucenia=src.kod_przyczyny_odrzucenia, tgt.opis_przyczyny_odrzucenia=src.opis_przyczyny_odrzucenia, tgt.status_integralnosci=src.status_integralnosci, tgt.data_sprawdzenia_integralnosci=src.data_sprawdzenia_integralnosci, tgt.data_zapytania_o_integralnosc=src.data_zapytania_o_integralnosc
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_gwarancja_id, grn, kod_dostepu, niewazna_na_ue, poz_id, nr, kwota, waluta, status, numer_operacji_zajecia_zabezpieczenia, numer_operacji_zwolnienia_zabezpieczenia, numer_operacji_wycofania_zabezpieczenia, niewazna_na_strony_konwencji, kwota_euro, uc_gwarancji, kwota_pln, kod_przyczyny_odrzucenia, opis_przyczyny_odrzucenia, status_integralnosci, data_sprawdzenia_integralnosci, data_zapytania_o_integralnosc)
			VALUES (src.id, src.operacja_tranzytowa_gwarancja_id, src.grn, src.kod_dostepu, src.niewazna_na_ue, src.poz_id, src.nr, src.kwota, src.waluta, src.status, src.numer_operacji_zajecia_zabezpieczenia, src.numer_operacji_zwolnienia_zabezpieczenia, src.numer_operacji_wycofania_zabezpieczenia, src.niewazna_na_strony_konwencji, src.kwota_euro, src.uc_gwarancji, src.kwota_pln, src.kod_przyczyny_odrzucenia, src.opis_przyczyny_odrzucenia, src.status_integralnosci, src.data_sprawdzenia_integralnosci, src.data_zapytania_o_integralnosc);
			SET @Merged = 1;
		END

		IF @TableName = 'gwarancje_niewazne_kraje' BEGIN
			MERGE INTO ncts2.gwarancje_niewazne_kraje AS tgt
			USING [WI_StageODS].ncts2.gwarancje_niewazne_kraje AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.gwarancja_id=src.gwarancja_id, tgt.kod_kraju=src.kod_kraju, tgt.poz_id=src.poz_id
			WHEN NOT MATCHED
			THEN INSERT (gwarancja_id, kod_kraju, id, poz_id)
			VALUES (src.gwarancja_id, src.kod_kraju, src.id, src.poz_id);
			SET @Merged = 1;
		END

		IF @TableName = 'historia_zmian_towarow' BEGIN
			MERGE INTO ncts2.historia_zmian_towarow AS tgt
			USING [WI_StageODS].ncts2.historia_zmian_towarow AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.wersja=src.wersja, tgt.calkowita_liczba_sztuk=src.calkowita_liczba_sztuk, tgt.calkowita_liczba_opakowan=src.calkowita_liczba_opakowan, tgt.calkowita_masa_brutto=src.calkowita_masa_brutto, tgt.poz_id=src.poz_id, tgt.kod_towarowy=src.kod_towarowy, tgt.opis_towaru=src.opis_towaru, tgt.liczba_opakowan=src.liczba_opakowan, tgt.liczba_sztuk=src.liczba_sztuk, tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.komunikat_id=src.komunikat_id, tgt.masa_brutto=src.masa_brutto
			WHEN NOT MATCHED
			THEN INSERT (id, wersja, calkowita_liczba_sztuk, calkowita_liczba_opakowan, calkowita_masa_brutto, poz_id, kod_towarowy, opis_towaru, liczba_opakowan, liczba_sztuk, operacja_tranzytowa_id, komunikat_id, masa_brutto)
			VALUES (src.id, src.wersja, src.calkowita_liczba_sztuk, src.calkowita_liczba_opakowan, src.calkowita_masa_brutto, src.poz_id, src.kod_towarowy, src.opis_towaru, src.liczba_opakowan, src.liczba_sztuk, src.operacja_tranzytowa_id, src.komunikat_id, src.masa_brutto);
			SET @Merged = 1;
		END

		IF @TableName = 'informacje_dodatkowe_wpt' BEGIN
			MERGE INTO ncts2.informacje_dodatkowe_wpt AS tgt
			USING [WI_StageODS].ncts2.informacje_dodatkowe_wpt AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.towar_id=src.towar_id, tgt.kod=src.kod, tgt.kraj_wywozu=src.kraj_wywozu, tgt.tekst=src.tekst, tgt.wywoz_z_ue=src.wywoz_z_ue, tgt.poz_id=src.poz_id
			WHEN NOT MATCHED
			THEN INSERT (towar_id, kod, kraj_wywozu, tekst, id, wywoz_z_ue, poz_id)
			VALUES (src.towar_id, src.kod, src.kraj_wywozu, src.tekst, src.id, src.wywoz_z_ue, src.poz_id);
			SET @Merged = 1;
		END

		IF @TableName = 'komunikaty' BEGIN
			MERGE INTO ncts2.komunikaty AS tgt
			USING [WI_StageODS].ncts2.komunikaty AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.komunikat_zawartosc_id=src.komunikat_zawartosc_id, tgt.data_utworzenia=src.data_utworzenia, tgt.typ=src.typ, tgt.rewizja=src.rewizja, tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.numer_wlasny=src.numer_wlasny, tgt.komunikacja_nadawca=src.komunikacja_nadawca, tgt.komunikacja_odbiorca=src.komunikacja_odbiorca, tgt.zrodlo=src.zrodlo, tgt.przeznaczenie=src.przeznaczenie, tgt.mrn=src.mrn, tgt.czy_wstawiony_recznie=src.czy_wstawiony_recznie, tgt.zadanie_id=src.zadanie_id, tgt.zadanie_zrodlo=src.zadanie_zrodlo, tgt.kod_uc=src.kod_uc, tgt.login=src.login, tgt.status=src.status, tgt.data_komunikacji=src.data_komunikacji, tgt.kanal_typ=src.kanal_typ, tgt.kanal_wartosc=src.kanal_wartosc, tgt.sisc_id_sprawy=src.sisc_id_sprawy, tgt.sisc_id_wplywu=src.sisc_id_wplywu, tgt.sisc_id_podmiotu=src.sisc_id_podmiotu, tgt.sisc_id_podmiotu_posr=src.sisc_id_podmiotu_posr, tgt.sisc_id_osoby=src.sisc_id_osoby
			WHEN NOT MATCHED
			THEN INSERT (id, komunikat_zawartosc_id, data_utworzenia, typ, rewizja, operacja_tranzytowa_id, numer_wlasny, komunikacja_nadawca, komunikacja_odbiorca, zrodlo, przeznaczenie, mrn, czy_wstawiony_recznie, zadanie_id, zadanie_zrodlo, kod_uc, login, status, data_komunikacji, kanal_typ, kanal_wartosc, sisc_id_sprawy, sisc_id_wplywu, sisc_id_podmiotu, sisc_id_podmiotu_posr, sisc_id_osoby)
			VALUES (src.id, src.komunikat_zawartosc_id, src.data_utworzenia, src.typ, src.rewizja, src.operacja_tranzytowa_id, src.numer_wlasny, src.komunikacja_nadawca, src.komunikacja_odbiorca, src.zrodlo, src.przeznaczenie, src.mrn, src.czy_wstawiony_recznie, src.zadanie_id, src.zadanie_zrodlo, src.kod_uc, src.login, src.status, src.data_komunikacji, src.kanal_typ, src.kanal_wartosc, src.sisc_id_sprawy, src.sisc_id_wplywu, src.sisc_id_podmiotu, src.sisc_id_podmiotu_posr, src.sisc_id_osoby);
			SET @Merged = 1;
		END

		IF @TableName = 'komunikaty_systemy_zewnetrzne' BEGIN
			MERGE INTO ncts2.komunikaty_systemy_zewnetrzne AS tgt
			USING [WI_StageODS].ncts2.komunikaty_systemy_zewnetrzne AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.data_utworzenia=src.data_utworzenia, tgt.data_modyfikacji=src.data_modyfikacji, tgt.nadawca=src.nadawca, tgt.odbiorca=src.odbiorca, tgt.kierunek=src.kierunek, tgt.typ=src.typ, tgt.status=src.status, tgt.komunikat_id=src.komunikat_id, tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.zadanie_id=src.zadanie_id, tgt.zewnetrzny_identyfikator_komunikatu=src.zewnetrzny_identyfikator_komunikatu, tgt.wsa_komunikat_id=src.wsa_komunikat_id, tgt.wsa_dotyczy_id=src.wsa_dotyczy_id, tgt.zawartosc_id=src.zawartosc_id, tgt.rewizja=src.rewizja
			WHEN NOT MATCHED
			THEN INSERT (id, data_utworzenia, data_modyfikacji, nadawca, odbiorca, kierunek, typ, status, komunikat_id, operacja_tranzytowa_id, zadanie_id, zewnetrzny_identyfikator_komunikatu, wsa_komunikat_id, wsa_dotyczy_id, zawartosc_id, rewizja)
			VALUES (src.id, src.data_utworzenia, src.data_modyfikacji, src.nadawca, src.odbiorca, src.kierunek, src.typ, src.status, src.komunikat_id, src.operacja_tranzytowa_id, src.zadanie_id, src.zewnetrzny_identyfikator_komunikatu, src.wsa_komunikat_id, src.wsa_dotyczy_id, src.zawartosc_id, src.rewizja);
			SET @Merged = 1;
		END

		IF @TableName = 'komunikaty_zawartosc' BEGIN
			MERGE INTO ncts2.komunikaty_zawartosc AS tgt
			USING [WI_StageODS].ncts2.komunikaty_zawartosc AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.rozmiar_bytes=src.rozmiar_bytes, tgt.nazwa_pliku=src.nazwa_pliku, tgt.rozszerzenie=src.rozszerzenie, tgt.zawartosc=src.zawartosc
			WHEN NOT MATCHED
			THEN INSERT (id, rozmiar_bytes, nazwa_pliku, rozszerzenie, zawartosc)
			VALUES (src.id, src.rozmiar_bytes, src.nazwa_pliku, src.rozszerzenie, src.zawartosc);
			SET @Merged = 1;
		END

		IF @TableName = 'komunikaty_systemy_zewnetrzne_zawartosc' BEGIN
			MERGE INTO ncts2.komunikaty_systemy_zewnetrzne_zawartosc AS tgt
			USING [WI_StageODS].ncts2.komunikaty_systemy_zewnetrzne_zawartosc AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.rozmiar=src.rozmiar, tgt.zawartosc=src.zawartosc
			WHEN NOT MATCHED
			THEN INSERT (id, rozmiar, zawartosc)
			VALUES (src.id, src.rozmiar, src.zawartosc);
			SET @Merged = 1;
		END

		IF @TableName = 'kontenery' BEGIN
			MERGE INTO ncts2.kontenery AS tgt
			USING [WI_StageODS].ncts2.kontenery AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.towar_id=src.towar_id, tgt.nr=src.nr, tgt.poz_id=src.poz_id, tgt.tryb_utworzenia_pozycji=src.tryb_utworzenia_pozycji, tgt.iteracja_uwag_rozladunkowych=src.iteracja_uwag_rozladunkowych
			WHEN NOT MATCHED
			THEN INSERT (id, towar_id, nr, poz_id, tryb_utworzenia_pozycji, iteracja_uwag_rozladunkowych)
			VALUES (src.id, src.towar_id, src.nr, src.poz_id, src.tryb_utworzenia_pozycji, src.iteracja_uwag_rozladunkowych);
			SET @Merged = 1;
		END

		IF @TableName = 'kraje_wyslane_informacje_o_operacji_tranzytowej' BEGIN
			MERGE INTO ncts2.kraje_wyslane_informacje_o_operacji_tranzytowej AS tgt
			USING [WI_StageODS].ncts2.kraje_wyslane_informacje_o_operacji_tranzytowej AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.kod_kraju=src.kod_kraju, tgt.urzad_tranzytowy=src.urzad_tranzytowy
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, kod_kraju, urzad_tranzytowy)
			VALUES (src.id, src.operacja_tranzytowa_id, src.kod_kraju, src.urzad_tranzytowy);
			SET @Merged = 1;
		END

		IF @TableName = 'logi' BEGIN
			MERGE INTO ncts2.logi AS tgt
			USING [WI_StageODS].ncts2.logi AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.czas=src.czas, tgt.poziom=src.poziom, tgt.kod_uc=src.kod_uc, tgt.typ_uc=src.typ_uc, tgt.blad_id=src.blad_id, tgt.komunikat_id=src.komunikat_id, tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.status=src.status, tgt.proces_biznesowy=src.proces_biznesowy, tgt.operacja=src.operacja, tgt.uwagi=src.uwagi, tgt.login=src.login, tgt.uzytkownik_id=src.uzytkownik_id, tgt.rola_id=src.rola_id, tgt.adres_ip=src.adres_ip, tgt.nazwa_hosta=src.nazwa_hosta, tgt.nazwa_procesu=src.nazwa_procesu, tgt.pid=src.pid, tgt.watek_id=src.watek_id
			WHEN NOT MATCHED
			THEN INSERT (id, czas, poziom, kod_uc, typ_uc, blad_id, komunikat_id, operacja_tranzytowa_id, status, proces_biznesowy, operacja, uwagi, login, uzytkownik_id, rola_id, adres_ip, nazwa_hosta, nazwa_procesu, pid, watek_id)
			VALUES (src.id, src.czas, src.poziom, src.kod_uc, src.typ_uc, src.blad_id, src.komunikat_id, src.operacja_tranzytowa_id, src.status, src.proces_biznesowy, src.operacja, src.uwagi, src.login, src.uzytkownik_id, src.rola_id, src.adres_ip, src.nazwa_hosta, src.nazwa_procesu, src.pid, src.watek_id);
			SET @Merged = 1;
		END

		IF @TableName = 'niedostepnosci' BEGIN
			MERGE INTO ncts2.niedostepnosci AS tgt
			USING [WI_StageODS].ncts2.niedostepnosci AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.kraj=src.kraj, tgt.typ_niedostepnosci=src.typ_niedostepnosci, tgt.kod_funkcjonanosci_biznesowej=src.kod_funkcjonanosci_biznesowej, tgt.czas_poczatku_niedostepnosci=src.czas_poczatku_niedostepnosci, tgt.czas_konca_niedostepnosci=src.czas_konca_niedostepnosci, tgt.wyjasnienia=src.wyjasnienia, tgt.wyjasnienia_lng=src.wyjasnienia_lng
			WHEN NOT MATCHED
			THEN INSERT (id, kraj, typ_niedostepnosci, kod_funkcjonanosci_biznesowej, czas_poczatku_niedostepnosci, czas_konca_niedostepnosci, wyjasnienia, wyjasnienia_lng)
			VALUES (src.id, src.kraj, src.typ_niedostepnosci, src.kod_funkcjonanosci_biznesowej, src.czas_poczatku_niedostepnosci, src.czas_konca_niedostepnosci, src.wyjasnienia, src.wyjasnienia_lng);
			SET @Merged = 1;
		END

		IF @TableName = 'opakowania' BEGIN
			MERGE INTO ncts2.opakowania AS tgt
			USING [WI_StageODS].ncts2.opakowania AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.towar_id=src.towar_id, tgt.rodzaj=src.rodzaj, tgt.znaki=src.znaki, tgt.liczba_opakowan=src.liczba_opakowan, tgt.ilosc_sztuk=src.ilosc_sztuk, tgt.poz_id=src.poz_id, tgt.tryb_utworzenia_pozycji=src.tryb_utworzenia_pozycji, tgt.iteracja_uwag_rozladunkowych=src.iteracja_uwag_rozladunkowych, tgt.znaki_jezyk=src.znaki_jezyk
			WHEN NOT MATCHED
			THEN INSERT (towar_id, rodzaj, znaki, liczba_opakowan, ilosc_sztuk, id, poz_id, tryb_utworzenia_pozycji, iteracja_uwag_rozladunkowych, znaki_jezyk)
			VALUES (src.towar_id, src.rodzaj, src.znaki, src.liczba_opakowan, src.ilosc_sztuk, src.id, src.poz_id, src.tryb_utworzenia_pozycji, src.iteracja_uwag_rozladunkowych, src.znaki_jezyk);
			SET @Merged = 1;
		END

		IF @TableName = 'operacje_tranzytowe' BEGIN
			MERGE INTO ncts2.operacje_tranzytowe AS tgt
			USING [WI_StageODS].ncts2.operacje_tranzytowe AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.data_utworzenia=src.data_utworzenia, tgt.data_modyfikacji=src.data_modyfikacji, tgt.data_zwolnienia=src.data_zwolnienia, tgt.uc_wyjscia=src.uc_wyjscia, tgt.uc_przeznaczenia=src.uc_przeznaczenia, tgt.nadawca_nazwa=src.nadawca_nazwa, tgt.nadawca_ulica_numer=src.nadawca_ulica_numer, tgt.nadawca_kod_pocztowy=src.nadawca_kod_pocztowy, tgt.nadawca_miejscowosc=src.nadawca_miejscowosc, tgt.nadawca_kraj=src.nadawca_kraj, tgt.nadawca_tin=src.nadawca_tin, tgt.odbiorca_nazwa=src.odbiorca_nazwa, tgt.odbiorca_ulica_numer=src.odbiorca_ulica_numer, tgt.odbiorca_kod_pocztowy=src.odbiorca_kod_pocztowy, tgt.odbiorca_miejscowosc=src.odbiorca_miejscowosc, tgt.odbiorca_kraj=src.odbiorca_kraj, tgt.odbiorca_tin=src.odbiorca_tin, tgt.glowny_zobowiazany_nazwa=src.glowny_zobowiazany_nazwa, tgt.glowny_zobowiazany_ulica_numer=src.glowny_zobowiazany_ulica_numer, tgt.glowny_zobowiazany_kod_pocztowy=src.glowny_zobowiazany_kod_pocztowy, tgt.glowny_zobowiazany_miejscowosc=src.glowny_zobowiazany_miejscowosc, tgt.glowny_zobowiazany_kraj=src.glowny_zobowiazany_kraj, tgt.glowny_zobowiazany_tin=src.glowny_zobowiazany_tin, tgt.glowny_zobowiazany_przedstawiciel_tin=src.glowny_zobowiazany_przedstawiciel_tin, tgt.upowazniony_odbiorca_tin=src.upowazniony_odbiorca_tin, tgt.transport_rodzaj=src.transport_rodzaj, tgt.transport_znaki=src.transport_znaki, tgt.transport_kraj=src.transport_kraj, tgt.transport_na_granicy_rodzaj=src.transport_na_granicy_rodzaj, tgt.transport_na_granicy_znaki=src.transport_na_granicy_znaki, tgt.transport_na_granicy_kraj=src.transport_na_granicy_kraj, tgt.wynik_kontroli_kod=src.wynik_kontroli_kod, tgt.wynik_kontroli_termin_dostarczenia=src.wynik_kontroli_termin_dostarczenia, tgt.zamkniecia_celne_ilosc=src.zamkniecia_celne_ilosc, tgt.zamkniecia_celne_nakladajacy=src.zamkniecia_celne_nakladajacy, tgt.bezpieczenstwo_spec_warunki=src.bezpieczenstwo_spec_warunki, tgt.bezpieczenstwo_forma_platnosci=src.bezpieczenstwo_forma_platnosci, tgt.bezpieczenstwo_nr_referencyjny_przesylki=src.bezpieczenstwo_nr_referencyjny_przesylki, tgt.bezpieczenstwo_nr_referencyjny_przewozu=src.bezpieczenstwo_nr_referencyjny_przewozu, tgt.bezpieczenstwo_miejsce_rozladunku=src.bezpieczenstwo_miejsce_rozladunku, tgt.bezpieczenstwo_nadawca_nazwa=src.bezpieczenstwo_nadawca_nazwa, tgt.bezpieczenstwo_nadawca_ulica_numer=src.bezpieczenstwo_nadawca_ulica_numer, tgt.bezpieczenstwo_nadawca_kod_pocztowy=src.bezpieczenstwo_nadawca_kod_pocztowy, tgt.bezpieczenstwo_nadawca_miejscowosc=src.bezpieczenstwo_nadawca_miejscowosc, tgt.bezpieczenstwo_nadawca_kraj=src.bezpieczenstwo_nadawca_kraj, tgt.bezpieczenstwo_nadawca_tin=src.bezpieczenstwo_nadawca_tin, tgt.bezpieczenstwo_odbiorca_nazwa=src.bezpieczenstwo_odbiorca_nazwa, tgt.bezpieczenstwo_odbiorca_ulica_numer=src.bezpieczenstwo_odbiorca_ulica_numer, tgt.bezpieczenstwo_odbiorca_kod_pocztowy=src.bezpieczenstwo_odbiorca_kod_pocztowy, tgt.bezpieczenstwo_odbiorca_miejscowosc=src.bezpieczenstwo_odbiorca_miejscowosc, tgt.bezpieczenstwo_odbiorca_kraj=src.bezpieczenstwo_odbiorca_kraj, tgt.bezpieczenstwo_odbiorca_tin=src.bezpieczenstwo_odbiorca_tin, tgt.bezpieczenstwo_przewoznik_nazwa=src.bezpieczenstwo_przewoznik_nazwa, tgt.bezpieczenstwo_przewoznik_ulica_numer=src.bezpieczenstwo_przewoznik_ulica_numer, tgt.bezpieczenstwo_przewoznik_kod_pocztowy=src.bezpieczenstwo_przewoznik_kod_pocztowy, tgt.bezpieczenstwo_przewoznik_miejscowosc=src.bezpieczenstwo_przewoznik_miejscowosc, tgt.bezpieczenstwo_przewoznik_kraj=src.bezpieczenstwo_przewoznik_kraj, tgt.bezpieczenstwo_przewoznik_tin=src.bezpieczenstwo_przewoznik_tin, tgt.miejsce_data_data=src.miejsce_data_data, tgt.typ_deklaracji=src.typ_deklaracji, tgt.liczba_pozycji=src.liczba_pozycji, tgt.liczba_opakowan=src.liczba_opakowan, tgt.kraj_wysylki=src.kraj_wysylki, tgt.kraj_przeznaczenia=src.kraj_przeznaczenia, tgt.masa_brutto=src.masa_brutto, tgt.miejsce_zaladunku=src.miejsce_zaladunku, tgt.procedura_uproszczona_uc_wyjscia=src.procedura_uproszczona_uc_wyjscia, tgt.glowny_zobowiazany_tir_holder=src.glowny_zobowiazany_tir_holder,
			tgt.kontenery=src.kontenery, tgt.lrn=src.lrn, tgt.mrn=src.mrn, tgt.rewizja=src.rewizja, tgt.blokada_czas_wygasniecia=src.blokada_czas_wygasniecia, tgt.blokada_login_uzytkownika=src.blokada_login_uzytkownika, tgt.status_uc_przeznaczenia_data=src.status_uc_przeznaczenia_data, tgt.flaga_ar_uc_wyjscia=src.flaga_ar_uc_wyjscia, tgt.flaga_stop_uc_wyjscia=src.flaga_stop_uc_wyjscia, tgt.status_uc_wyjscia=src.status_uc_wyjscia, tgt.status_uc_wyjscia_data=src.status_uc_wyjscia_data, tgt.miejsce_data_miejsce=src.miejsce_data_miejsce, tgt.miejsce_data_nazwisko_imie=src.miejsce_data_nazwisko_imie, tgt.miejsce_data_stanowisko=src.miejsce_data_stanowisko, tgt.miejsce_uznane=src.miejsce_uznane, tgt.ryzyko_uc_wyjscia=src.ryzyko_uc_wyjscia, tgt.ryzyko_uc_przeznaczenia=src.ryzyko_uc_przeznaczenia, tgt.data_dokonania=src.data_dokonania, tgt.wiazaca_trasa_przewozu=src.wiazaca_trasa_przewozu, tgt.zap_o_przesylke_odp=src.zap_o_przesylke_odp, tgt.przedstawiajacy_nazwa=src.przedstawiajacy_nazwa, tgt.przedstawiajacy_ulica_numer=src.przedstawiajacy_ulica_numer, tgt.przedstawiajacy_kod_pocztowy=src.przedstawiajacy_kod_pocztowy, tgt.przedstawiajacy_miejscowosc=src.przedstawiajacy_miejscowosc, tgt.przedstawiajacy_kraj=src.przedstawiajacy_kraj, tgt.przedstawiajacy_tin=src.przedstawiajacy_tin, tgt.flaga_ar_uc_przeznaczenia=src.flaga_ar_uc_przeznaczenia, tgt.towary_wrazliwe=src.towary_wrazliwe, tgt.komunikacja_podmiot_wyjscia=src.komunikacja_podmiot_wyjscia, tgt.komunikacja_kraj_wyjscia=src.komunikacja_kraj_wyjscia, tgt.komunikacja_podmiot_przeznaczenia=src.komunikacja_podmiot_przeznaczenia, tgt.komunikacja_kraj_przeznaczenia=src.komunikacja_kraj_przeznaczenia, tgt.procedura_uproszczona_uc_przeznaczenia=src.procedura_uproszczona_uc_przeznaczenia, tgt.data_przyjecia=src.data_przyjecia, tgt.status_uc_przeznaczenia=src.status_uc_przeznaczenia, tgt.nr_karnetu_tir=src.nr_karnetu_tir, tgt.przedstawiajacy_przedstawiciel_tin=src.przedstawiajacy_przedstawiciel_tin, tgt.uc_przeznaczenia_deklarowany=src.uc_przeznaczenia_deklarowany, tgt.data_przybycia=src.data_przybycia, tgt.flaga_uniewaznienie_uc_wyjscia=src.flaga_uniewaznienie_uc_wyjscia, tgt.jezyk_tdt=src.jezyk_tdt, tgt.data_kontroli=src.data_kontroli, tgt.bezpieczenstwo=src.bezpieczenstwo, tgt.flaga_aeo=src.flaga_aeo, tgt.flaga_rej_gwar_uc_wyjscia=src.flaga_rej_gwar_uc_wyjscia, tgt.miejsce_przybycia=src.miejsce_przybycia, tgt.flaga_glow_zob_pozw_na_proc_upro=src.flaga_glow_zob_pozw_na_proc_upro, tgt.glowny_zobowiazany_przedstawiciel_nazwa=src.glowny_zobowiazany_przedstawiciel_nazwa, tgt.glowny_zobowiazany_przedstawiciel_ulica_numer=src.glowny_zobowiazany_przedstawiciel_ulica_numer, tgt.glowny_zobowiazany_przedstawiciel_kod_pocztowy=src.glowny_zobowiazany_przedstawiciel_kod_pocztowy, tgt.glowny_zobowiazany_przedstawiciel_miejscowosc=src.glowny_zobowiazany_przedstawiciel_miejscowosc, tgt.glowny_zobowiazany_przedstawiciel_kraj=src.glowny_zobowiazany_przedstawiciel_kraj, tgt.transport_znaki_jezyk=src.transport_znaki_jezyk, tgt.flaga_uniewaznienie_aes=src.flaga_uniewaznienie_aes, tgt.flaga_ostrzezenia=src.flaga_ostrzezenia, tgt.przedstawiajacy_nr_pozwolenia=src.przedstawiajacy_nr_pozwolenia
			WHEN NOT MATCHED
			THEN INSERT (id, data_utworzenia, data_modyfikacji, data_zwolnienia, uc_wyjscia, uc_przeznaczenia, nadawca_nazwa, nadawca_ulica_numer, nadawca_kod_pocztowy, nadawca_miejscowosc, nadawca_kraj, nadawca_tin, odbiorca_nazwa, odbiorca_ulica_numer, odbiorca_kod_pocztowy, odbiorca_miejscowosc, odbiorca_kraj, odbiorca_tin, glowny_zobowiazany_nazwa, glowny_zobowiazany_ulica_numer, glowny_zobowiazany_kod_pocztowy, glowny_zobowiazany_miejscowosc, glowny_zobowiazany_kraj, glowny_zobowiazany_tin, glowny_zobowiazany_przedstawiciel_tin, upowazniony_odbiorca_tin, transport_rodzaj, transport_znaki, transport_kraj, transport_na_granicy_rodzaj, transport_na_granicy_znaki, transport_na_granicy_kraj, wynik_kontroli_kod, wynik_kontroli_termin_dostarczenia, zamkniecia_celne_ilosc, zamkniecia_celne_nakladajacy, bezpieczenstwo_spec_warunki, bezpieczenstwo_forma_platnosci, bezpieczenstwo_nr_referencyjny_przesylki, bezpieczenstwo_nr_referencyjny_przewozu, bezpieczenstwo_miejsce_rozladunku, bezpieczenstwo_nadawca_nazwa, bezpieczenstwo_nadawca_ulica_numer, bezpieczenstwo_nadawca_kod_pocztowy, bezpieczenstwo_nadawca_miejscowosc, bezpieczenstwo_nadawca_kraj, bezpieczenstwo_nadawca_tin, bezpieczenstwo_odbiorca_nazwa, bezpieczenstwo_odbiorca_ulica_numer, bezpieczenstwo_odbiorca_kod_pocztowy, bezpieczenstwo_odbiorca_miejscowosc, bezpieczenstwo_odbiorca_kraj, bezpieczenstwo_odbiorca_tin, bezpieczenstwo_przewoznik_nazwa, bezpieczenstwo_przewoznik_ulica_numer, bezpieczenstwo_przewoznik_kod_pocztowy, bezpieczenstwo_przewoznik_miejscowosc, bezpieczenstwo_przewoznik_kraj, bezpieczenstwo_przewoznik_tin, miejsce_data_data, typ_deklaracji, liczba_pozycji, liczba_opakowan, kraj_wysylki, kraj_przeznaczenia, masa_brutto, miejsce_zaladunku, procedura_uproszczona_uc_wyjscia, glowny_zobowiazany_tir_holder, kontenery, lrn, mrn, rewizja, blokada_czas_wygasniecia, blokada_login_uzytkownika, status_uc_przeznaczenia_data, flaga_ar_uc_wyjscia, flaga_stop_uc_wyjscia, status_uc_wyjscia, status_uc_wyjscia_data, miejsce_data_miejsce, miejsce_data_nazwisko_imie, miejsce_data_stanowisko, miejsce_uznane, ryzyko_uc_wyjscia, ryzyko_uc_przeznaczenia, data_dokonania, wiazaca_trasa_przewozu, zap_o_przesylke_odp, przedstawiajacy_nazwa, przedstawiajacy_ulica_numer, przedstawiajacy_kod_pocztowy, przedstawiajacy_miejscowosc, przedstawiajacy_kraj, przedstawiajacy_tin, flaga_ar_uc_przeznaczenia, towary_wrazliwe, komunikacja_podmiot_wyjscia, komunikacja_kraj_wyjscia, komunikacja_podmiot_przeznaczenia, komunikacja_kraj_przeznaczenia, procedura_uproszczona_uc_przeznaczenia, data_przyjecia, status_uc_przeznaczenia, nr_karnetu_tir, przedstawiajacy_przedstawiciel_tin, uc_przeznaczenia_deklarowany, data_przybycia, flaga_uniewaznienie_uc_wyjscia, jezyk_tdt, data_kontroli, bezpieczenstwo, flaga_aeo, flaga_rej_gwar_uc_wyjscia, miejsce_przybycia, flaga_glow_zob_pozw_na_proc_upro, glowny_zobowiazany_przedstawiciel_nazwa, glowny_zobowiazany_przedstawiciel_ulica_numer, glowny_zobowiazany_przedstawiciel_kod_pocztowy, glowny_zobowiazany_przedstawiciel_miejscowosc, glowny_zobowiazany_przedstawiciel_kraj, transport_znaki_jezyk, flaga_uniewaznienie_aes, flaga_ostrzezenia, przedstawiajacy_nr_pozwolenia)
			VALUES (src.id, src.data_utworzenia, src.data_modyfikacji, src.data_zwolnienia, src.uc_wyjscia, src.uc_przeznaczenia, src.nadawca_nazwa, src.nadawca_ulica_numer, src.nadawca_kod_pocztowy, src.nadawca_miejscowosc, src.nadawca_kraj, src.nadawca_tin, src.odbiorca_nazwa, src.odbiorca_ulica_numer, src.odbiorca_kod_pocztowy, src.odbiorca_miejscowosc, src.odbiorca_kraj, src.odbiorca_tin, src.glowny_zobowiazany_nazwa, src.glowny_zobowiazany_ulica_numer, src.glowny_zobowiazany_kod_pocztowy, src.glowny_zobowiazany_miejscowosc, src.glowny_zobowiazany_kraj, src.glowny_zobowiazany_tin, src.glowny_zobowiazany_przedstawiciel_tin, src.upowazniony_odbiorca_tin, src.transport_rodzaj, src.transport_znaki, src.transport_kraj, src.transport_na_granicy_rodzaj, src.transport_na_granicy_znaki, src.transport_na_granicy_kraj, src.wynik_kontroli_kod, src.wynik_kontroli_termin_dostarczenia, src.zamkniecia_celne_ilosc, src.zamkniecia_celne_nakladajacy, src.bezpieczenstwo_spec_warunki, src.bezpieczenstwo_forma_platnosci, src.bezpieczenstwo_nr_referencyjny_przesylki, src.bezpieczenstwo_nr_referencyjny_przewozu, src.bezpieczenstwo_miejsce_rozladunku, src.bezpieczenstwo_nadawca_nazwa, src.bezpieczenstwo_nadawca_ulica_numer, src.bezpieczenstwo_nadawca_kod_pocztowy, src.bezpieczenstwo_nadawca_miejscowosc, src.bezpieczenstwo_nadawca_kraj, src.bezpieczenstwo_nadawca_tin, src.bezpieczenstwo_odbiorca_nazwa, src.bezpieczenstwo_odbiorca_ulica_numer, src.bezpieczenstwo_odbiorca_kod_pocztowy, src.bezpieczenstwo_odbiorca_miejscowosc, src.bezpieczenstwo_odbiorca_kraj, src.bezpieczenstwo_odbiorca_tin, src.bezpieczenstwo_przewoznik_nazwa, src.bezpieczenstwo_przewoznik_ulica_numer, src.bezpieczenstwo_przewoznik_kod_pocztowy, src.bezpieczenstwo_przewoznik_miejscowosc, src.bezpieczenstwo_przewoznik_kraj, src.bezpieczenstwo_przewoznik_tin, src.miejsce_data_data, src.typ_deklaracji, src.liczba_pozycji, src.liczba_opakowan, src.kraj_wysylki, src.kraj_przeznaczenia, src.masa_brutto, src.miejsce_zaladunku, src.procedura_uproszczona_uc_wyjscia, src.glowny_zobowiazany_tir_holder, src.kontenery, src.lrn, src.mrn, src.rewizja, src.blokada_czas_wygasniecia, src.blokada_login_uzytkownika, src.status_uc_przeznaczenia_data, src.flaga_ar_uc_wyjscia, src.flaga_stop_uc_wyjscia, src.status_uc_wyjscia, src.status_uc_wyjscia_data, src.miejsce_data_miejsce, src.miejsce_data_nazwisko_imie, src.miejsce_data_stanowisko, src.miejsce_uznane, src.ryzyko_uc_wyjscia, src.ryzyko_uc_przeznaczenia, src.data_dokonania, src.wiazaca_trasa_przewozu, src.zap_o_przesylke_odp, src.przedstawiajacy_nazwa, src.przedstawiajacy_ulica_numer, src.przedstawiajacy_kod_pocztowy, src.przedstawiajacy_miejscowosc, src.przedstawiajacy_kraj, src.przedstawiajacy_tin, src.flaga_ar_uc_przeznaczenia, src.towary_wrazliwe, src.komunikacja_podmiot_wyjscia, src.komunikacja_kraj_wyjscia, src.komunikacja_podmiot_przeznaczenia, src.komunikacja_kraj_przeznaczenia, src.procedura_uproszczona_uc_przeznaczenia, src.data_przyjecia, src.status_uc_przeznaczenia, src.nr_karnetu_tir, src.przedstawiajacy_przedstawiciel_tin, src.uc_przeznaczenia_deklarowany, src.data_przybycia, src.flaga_uniewaznienie_uc_wyjscia, src.jezyk_tdt, src.data_kontroli, src.bezpieczenstwo, src.flaga_aeo, src.flaga_rej_gwar_uc_wyjscia, src.miejsce_przybycia, src.flaga_glow_zob_pozw_na_proc_upro, src.glowny_zobowiazany_przedstawiciel_nazwa, src.glowny_zobowiazany_przedstawiciel_ulica_numer, src.glowny_zobowiazany_przedstawiciel_kod_pocztowy, src.glowny_zobowiazany_przedstawiciel_miejscowosc, src.glowny_zobowiazany_przedstawiciel_kraj, src.transport_znaki_jezyk, src.flaga_uniewaznienie_aes, src.flaga_ostrzezenia, src.przedstawiajacy_nr_pozwolenia);
			SET @Merged = 1;
		END

		IF @TableName = 'operacje_tranzytowe_gwarancje' BEGIN
			MERGE INTO ncts2.operacje_tranzytowe_gwarancje AS tgt
			USING [WI_StageODS].ncts2.operacje_tranzytowe_gwarancje AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.rodzaj=src.rodzaj, tgt.poz_id=src.poz_id
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, rodzaj, poz_id)
			VALUES (src.id, src.operacja_tranzytowa_id, src.rodzaj, src.poz_id);
			SET @Merged = 1;
		END

		IF @TableName = 'operacje_tranzytowe_inne_informacje' BEGIN
			MERGE INTO ncts2.operacje_tranzytowe_inne_informacje AS tgt
			USING [WI_StageODS].ncts2.operacje_tranzytowe_inne_informacje AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.uwagi=src.uwagi, tgt.uwagi_jezyk=src.uwagi_jezyk, tgt.tryb_utworzenia_pozycji=src.tryb_utworzenia_pozycji, tgt.iteracja_uwag_rozladunkowych=src.iteracja_uwag_rozladunkowych
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, uwagi, uwagi_jezyk, tryb_utworzenia_pozycji, iteracja_uwag_rozladunkowych)
			VALUES (src.id, src.operacja_tranzytowa_id, src.uwagi, src.uwagi_jezyk, src.tryb_utworzenia_pozycji, src.iteracja_uwag_rozladunkowych);
			SET @Merged = 1;
		END

--		IF @TableName = 'operacje_tranzytowe_pobor_naleznosci' BEGIN
--			SET @Merged = 1;
--		END

		IF @TableName = 'operacje_tranzytowe_seap' BEGIN
			MERGE INTO ncts2.operacje_tranzytowe_seap AS tgt
			USING [WI_StageODS].ncts2.operacje_tranzytowe_seap AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.kanal_typ=src.kanal_typ, tgt.kanal_wartosc=src.kanal_wartosc, tgt.sisc_id_sprawy=src.sisc_id_sprawy, tgt.sisc_id_wplywu=src.sisc_id_wplywu, tgt.sisc_id_podmiotu=src.sisc_id_podmiotu, tgt.sisc_id_podmiotu_posr=src.sisc_id_podmiotu_posr, tgt.sisc_id_osoby=src.sisc_id_osoby
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, kanal_typ, kanal_wartosc, sisc_id_sprawy, sisc_id_wplywu, sisc_id_podmiotu, sisc_id_podmiotu_posr, sisc_id_osoby)
			VALUES (src.id, src.operacja_tranzytowa_id, src.kanal_typ, src.kanal_wartosc, src.sisc_id_sprawy, src.sisc_id_wplywu, src.sisc_id_podmiotu, src.sisc_id_podmiotu_posr, src.sisc_id_osoby);
			SET @Merged = 1;
		END

		IF @TableName = 'operacje_tranzytowe_szczegoly' BEGIN
			MERGE INTO ncts2.operacje_tranzytowe_szczegoly AS tgt
			USING [WI_StageODS].ncts2.operacje_tranzytowe_szczegoly AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.wynik_kontroli_skontrolowal_uc_wyjscia=src.wynik_kontroli_skontrolowal_uc_wyjscia, tgt.wynik_kontroli_uwagi_uc_wyjscia=src.wynik_kontroli_uwagi_uc_wyjscia, tgt.lokalizacja_kod_miejsca_uznanego=src.lokalizacja_kod_miejsca_uznanego, tgt.lokalizacja_miejsce_uznane=src.lokalizacja_miejsce_uznane, tgt.lokalizacja_miejsce_odpraw_celnych=src.lokalizacja_miejsce_odpraw_celnych, tgt.lokalizacja_kod_miejsca_wskazanego_w_pozwoleniu=src.lokalizacja_kod_miejsca_wskazanego_w_pozwoleniu, tgt.przybycie_lokalizacja_kod_miejsca_uznanego=src.przybycie_lokalizacja_kod_miejsca_uznanego, tgt.przybycie_lokalizacja_miejsce_uznane=src.przybycie_lokalizacja_miejsce_uznane, tgt.przybycie_lokalizacja_miejsce_odpraw_celnych=src.przybycie_lokalizacja_miejsce_odpraw_celnych, tgt.przybycie_lokalizacja_kod_miejsca_wskazanego_w_pozwoleniu=src.przybycie_lokalizacja_kod_miejsca_wskazanego_w_pozwoleniu, tgt.status_komunikacji_aes=src.status_komunikacji_aes, tgt.nadawca_certyfikat_aeo=src.nadawca_certyfikat_aeo, tgt.odbiorca_certyfikat_aeo=src.odbiorca_certyfikat_aeo, tgt.przedstawiajacy_certyfikat_aeo=src.przedstawiajacy_certyfikat_aeo, tgt.glowny_zobowiazany_certyfikat_aeo=src.glowny_zobowiazany_certyfikat_aeo, tgt.glowny_zobowiazany_przedstawiciel_certyfikat_aeo=src.glowny_zobowiazany_przedstawiciel_certyfikat_aeo, tgt.upowazniony_odbiorca_certyfikat_aeo=src.upowazniony_odbiorca_certyfikat_aeo, tgt.bezpieczenstwo_nadawca_certyfikat_aeo=src.bezpieczenstwo_nadawca_certyfikat_aeo, tgt.bezpieczenstwo_odbiorca_certyfikat_aeo=src.bezpieczenstwo_odbiorca_certyfikat_aeo, tgt.bezpieczenstwo_przewoznik_certyfikat_aeo=src.bezpieczenstwo_przewoznik_certyfikat_aeo, tgt.przybycie_nr_pozwolenia=src.przybycie_nr_pozwolenia
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, wynik_kontroli_skontrolowal_uc_wyjscia, wynik_kontroli_uwagi_uc_wyjscia, lokalizacja_kod_miejsca_uznanego, lokalizacja_miejsce_uznane, lokalizacja_miejsce_odpraw_celnych, lokalizacja_kod_miejsca_wskazanego_w_pozwoleniu, przybycie_lokalizacja_kod_miejsca_uznanego, przybycie_lokalizacja_miejsce_uznane, przybycie_lokalizacja_miejsce_odpraw_celnych, przybycie_lokalizacja_kod_miejsca_wskazanego_w_pozwoleniu, status_komunikacji_aes, nadawca_certyfikat_aeo, odbiorca_certyfikat_aeo, przedstawiajacy_certyfikat_aeo, glowny_zobowiazany_certyfikat_aeo, glowny_zobowiazany_przedstawiciel_certyfikat_aeo, upowazniony_odbiorca_certyfikat_aeo, bezpieczenstwo_nadawca_certyfikat_aeo, bezpieczenstwo_odbiorca_certyfikat_aeo, bezpieczenstwo_przewoznik_certyfikat_aeo, przybycie_nr_pozwolenia)
			VALUES (src.id, src.operacja_tranzytowa_id, src.wynik_kontroli_skontrolowal_uc_wyjscia, src.wynik_kontroli_uwagi_uc_wyjscia, src.lokalizacja_kod_miejsca_uznanego, src.lokalizacja_miejsce_uznane, src.lokalizacja_miejsce_odpraw_celnych, src.lokalizacja_kod_miejsca_wskazanego_w_pozwoleniu, src.przybycie_lokalizacja_kod_miejsca_uznanego, src.przybycie_lokalizacja_miejsce_uznane, src.przybycie_lokalizacja_miejsce_odpraw_celnych, src.przybycie_lokalizacja_kod_miejsca_wskazanego_w_pozwoleniu, src.status_komunikacji_aes, src.nadawca_certyfikat_aeo, src.odbiorca_certyfikat_aeo, src.przedstawiajacy_certyfikat_aeo, src.glowny_zobowiazany_certyfikat_aeo, src.glowny_zobowiazany_przedstawiciel_certyfikat_aeo, src.upowazniony_odbiorca_certyfikat_aeo, src.bezpieczenstwo_nadawca_certyfikat_aeo, src.bezpieczenstwo_odbiorca_certyfikat_aeo, src.bezpieczenstwo_przewoznik_certyfikat_aeo, src.przybycie_nr_pozwolenia);
			SET @Merged = 1;
		END

		IF @TableName = 'operacje_typy' BEGIN
			MERGE INTO ncts2.operacje_typy AS tgt
			USING [WI_StageODS].ncts2.operacje_typy AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja=src.operacja, tgt.widocznosc_operacji=src.widocznosc_operacji
			WHEN NOT MATCHED
			THEN INSERT (id, operacja, widocznosc_operacji)
			VALUES (src.id, src.operacja, src.widocznosc_operacji);
			SET @Merged = 1;
		END

		IF @TableName = 'ostrzezenia_systemy_zewnetrzne' BEGIN
			MERGE INTO ncts2.ostrzezenia_systemy_zewnetrzne AS tgt
			USING [WI_StageODS].ncts2.ostrzezenia_systemy_zewnetrzne AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.zrodlo=src.zrodlo, tgt.opis=src.opis, tgt.typ_uc=src.typ_uc
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, zrodlo, opis, typ_uc)
			VALUES (src.id, src.operacja_tranzytowa_id, src.zrodlo, src.opis, src.typ_uc);
			SET @Merged = 1;
		END

		IF @TableName = 'poszukiwania_pobory' BEGIN
			MERGE INTO ncts2.poszukiwania_pobory AS tgt
			USING [WI_StageODS].ncts2.poszukiwania_pobory AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.typ=src.typ, tgt.status=src.status, tgt.mrn=src.mrn, tgt.urzad_wyjscia=src.urzad_wyjscia, tgt.urzad_pytajacy=src.urzad_pytajacy, tgt.odbiorca=src.odbiorca, tgt.data_wyslania_zapytania=src.data_wyslania_zapytania, tgt.czy_przekroczony_czas_odpowiedzi=src.czy_przekroczony_czas_odpowiedzi, tgt.data_obsluzenia=src.data_obsluzenia, tgt.kod_odpowiedzi=src.kod_odpowiedzi, tgt.tresc_odpowiedzi=src.tresc_odpowiedzi, tgt.tresc_informacji=src.tresc_informacji, tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.komunikat_zapytania_id=src.komunikat_zapytania_id, tgt.komunikat_odpowiedzi_id=src.komunikat_odpowiedzi_id, tgt.czy_informacje_dodatkowe_ie144=src.czy_informacje_dodatkowe_ie144, tgt.czy_informacje_dodatkowe_ie145=src.czy_informacje_dodatkowe_ie145, tgt.rewizja=src.rewizja, tgt.termin_na_odpowiedz=src.termin_na_odpowiedz, tgt.rola_urzedu_odbiorcy=src.rola_urzedu_odbiorcy, tgt.data_utworzenia=src.data_utworzenia, tgt.data_modyfikacji=src.data_modyfikacji
			WHEN NOT MATCHED
			THEN INSERT (id, typ, status, mrn, urzad_wyjscia, urzad_pytajacy, odbiorca, data_wyslania_zapytania, czy_przekroczony_czas_odpowiedzi, data_obsluzenia, kod_odpowiedzi, tresc_odpowiedzi, tresc_informacji, operacja_tranzytowa_id, komunikat_zapytania_id, komunikat_odpowiedzi_id, czy_informacje_dodatkowe_ie144, czy_informacje_dodatkowe_ie145, rewizja, termin_na_odpowiedz, rola_urzedu_odbiorcy, data_utworzenia, data_modyfikacji)
			VALUES (src.id, src.typ, src.status, src.mrn, src.urzad_wyjscia, src.urzad_pytajacy, src.odbiorca, src.data_wyslania_zapytania, src.czy_przekroczony_czas_odpowiedzi, src.data_obsluzenia, src.kod_odpowiedzi, src.tresc_odpowiedzi, src.tresc_informacji, src.operacja_tranzytowa_id, src.komunikat_zapytania_id, src.komunikat_odpowiedzi_id, src.czy_informacje_dodatkowe_ie144, src.czy_informacje_dodatkowe_ie145, src.rewizja, src.termin_na_odpowiedz, src.rola_urzedu_odbiorcy, src.data_utworzenia, src.data_modyfikacji);
			SET @Merged = 1;
		END

		IF @TableName = 'pobory_naleznosci' BEGIN
			MERGE INTO ncts2.pobory_naleznosci AS tgt
			USING [WI_StageODS].ncts2.pobory_naleznosci AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.uc=src.uc, tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.mrn=src.mrn, tgt.rola_urzedu=src.rola_urzedu, tgt.status=src.status, tgt.status_data=src.status_data, tgt.uc_poboru=src.uc_poboru, tgt.uc_przeprowadzajacy_pobor=src.uc_przeprowadzajacy_pobor, tgt.poszukiwanie_pobor_id=src.poszukiwanie_pobor_id, tgt.data_utworzenia=src.data_utworzenia, tgt.data_modyfikacji=src.data_modyfikacji, tgt.rewizja=src.rewizja, tgt.typ_deklaracji=src.typ_deklaracji, tgt.uc_wyjscia=src.uc_wyjscia, tgt.procedura_uproszczona_uc_przeznaczenia=src.procedura_uproszczona_uc_przeznaczenia, tgt.przedstawiajacy_tin=src.przedstawiajacy_tin, tgt.przedstawiajacy_nazwa=src.przedstawiajacy_nazwa
			WHEN NOT MATCHED
			THEN INSERT (id, uc, operacja_tranzytowa_id, mrn, rola_urzedu, status, status_data, uc_poboru, uc_przeprowadzajacy_pobor, poszukiwanie_pobor_id, data_utworzenia, data_modyfikacji, rewizja, typ_deklaracji, uc_wyjscia, procedura_uproszczona_uc_przeznaczenia, przedstawiajacy_tin, przedstawiajacy_nazwa)
			VALUES (src.id, src.uc, src.operacja_tranzytowa_id, src.mrn, src.rola_urzedu, src.status, src.status_data, src.uc_poboru, src.uc_przeprowadzajacy_pobor, src.poszukiwanie_pobor_id, src.data_utworzenia, src.data_modyfikacji, src.rewizja, src.typ_deklaracji, src.uc_wyjscia, src.procedura_uproszczona_uc_przeznaczenia, src.przedstawiajacy_tin, src.przedstawiajacy_nazwa);
			SET @Merged = 1;
		END

		IF @TableName = 'poszukiwania_pobory_informacje_dodatkowe' BEGIN
			MERGE INTO ncts2.poszukiwania_pobory_informacje_dodatkowe AS tgt
			USING [WI_StageODS].ncts2.poszukiwania_pobory_informacje_dodatkowe AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.typ=src.typ, tgt.mrn=src.mrn, tgt.data_wyslania=src.data_wyslania, tgt.komunikat_id=src.komunikat_id, tgt.zapytanie_poszukiwacze_id=src.zapytanie_poszukiwacze_id, tgt.data_utworzenia=src.data_utworzenia
			WHEN NOT MATCHED
			THEN INSERT (id, typ, mrn, data_wyslania, komunikat_id, zapytanie_poszukiwacze_id, data_utworzenia)
			VALUES (src.id, src.typ, src.mrn, src.data_wyslania, src.komunikat_id, src.zapytanie_poszukiwacze_id, src.data_utworzenia);
			SET @Merged = 1;
		END

		IF @TableName = 'powiadomienia_komunikatow' BEGIN
			MERGE INTO ncts2.powiadomienia_komunikatow AS tgt
			USING [WI_StageODS].ncts2.powiadomienia_komunikatow AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.data_utworzenia=src.data_utworzenia, tgt.mrn=src.mrn, tgt.typ_komunikatu=src.typ_komunikatu, tgt.tresc=src.tresc, tgt.czy_obsluzone=src.czy_obsluzone, tgt.kod_uc=src.kod_uc, tgt.uzytkownik_id=src.uzytkownik_id
			WHEN NOT MATCHED
			THEN INSERT (id, data_utworzenia, mrn, typ_komunikatu, tresc, czy_obsluzone, kod_uc, uzytkownik_id)
			VALUES (src.id, src.data_utworzenia, src.mrn, src.typ_komunikatu, src.tresc, src.czy_obsluzone, src.kod_uc, src.uzytkownik_id);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_kanaly_kom' BEGIN
			MERGE INTO ncts2.ref_kanaly_kom AS tgt
			USING [WI_StageODS].ncts2.ref_kanaly_kom AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.podmiot_id=src.podmiot_id, tgt.kanal=src.kanal, tgt.email_adres=src.email_adres, tgt.epuap_podmiot_id=src.epuap_podmiot_id, tgt.epuap_skrytka_id=src.epuap_skrytka_id, tgt.ws_do_podmiotu_url=src.ws_do_podmiotu_url, tgt.ws_do_podmiotu_login=src.ws_do_podmiotu_login, tgt.ws_do_podmiotu_haslo=src.ws_do_podmiotu_haslo, tgt.ws_do_podmiotu_odcisk_palca=src.ws_do_podmiotu_odcisk_palca, tgt.domyslny=src.domyslny, tgt.data_od=src.data_od, tgt.data_do=src.data_do, tgt.seap_id=src.seap_id
			WHEN NOT MATCHED
			THEN INSERT (id, podmiot_id, kanal, email_adres, epuap_podmiot_id, epuap_skrytka_id, ws_do_podmiotu_url, ws_do_podmiotu_login, ws_do_podmiotu_haslo, ws_do_podmiotu_odcisk_palca, domyslny, data_od, data_do, seap_id)
			VALUES (src.id, src.podmiot_id, src.kanal, src.email_adres, src.epuap_podmiot_id, src.epuap_skrytka_id, src.ws_do_podmiotu_url, src.ws_do_podmiotu_login, src.ws_do_podmiotu_haslo, src.ws_do_podmiotu_odcisk_palca, src.domyslny, src.data_od, src.data_do, src.seap_id);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_miejsca_wyznaczone' BEGIN
			MERGE INTO ncts2.ref_miejsca_wyznaczone AS tgt
			USING [WI_StageODS].ncts2.ref_miejsca_wyznaczone AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.numer_rozstrzygniecia=src.numer_rozstrzygniecia, tgt.nazwa_rozstrzygniecia=src.nazwa_rozstrzygniecia, tgt.idsisc=src.idsisc, tgt.numer_miejsca=src.numer_miejsca, tgt.data_wydania=src.data_wydania, tgt.organ_wydania=src.organ_wydania, tgt.organ_nadzoru=src.organ_nadzoru, tgt.gmina=src.gmina, tgt.wojewodztwo=src.wojewodztwo, tgt.kod_pocztowy=src.kod_pocztowy, tgt.miejscowosc=src.miejscowosc, tgt.powiat=src.powiat, tgt.ulica=src.ulica, tgt.numer_domu=src.numer_domu, tgt.numer_lokalu=src.numer_lokalu, tgt.poczta=src.poczta, tgt.kraj=src.kraj, tgt.wazne_od=src.wazne_od, tgt.wazne_do=src.wazne_do, tgt.status=src.status, tgt.data_cofniecia=src.data_cofniecia, tgt.valid_from=src.valid_from, tgt.valid_to=src.valid_to
			WHEN NOT MATCHED
			THEN INSERT (id, numer_rozstrzygniecia, nazwa_rozstrzygniecia, idsisc, numer_miejsca, data_wydania, organ_wydania, organ_nadzoru, gmina, wojewodztwo, kod_pocztowy, miejscowosc, powiat, ulica, numer_domu, numer_lokalu, poczta, kraj, wazne_od, wazne_do, status, data_cofniecia, valid_from, valid_to)
			VALUES (src.id, src.numer_rozstrzygniecia, src.nazwa_rozstrzygniecia, src.idsisc, src.numer_miejsca, src.data_wydania, src.organ_wydania, src.organ_nadzoru, src.gmina, src.wojewodztwo, src.kod_pocztowy, src.miejscowosc, src.powiat, src.ulica, src.numer_domu, src.numer_lokalu, src.poczta, src.kraj, src.wazne_od, src.wazne_do, src.status, src.data_cofniecia, src.valid_from, src.valid_to);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_podmioty_aeo' BEGIN
			MERGE INTO ncts2.ref_podmioty_aeo AS tgt
			USING [WI_StageODS].ncts2.ref_podmioty_aeo AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.idsisc=src.idsisc, tgt.numer=src.numer, tgt.data_obowiazywania=src.data_obowiazywania, tgt.wazne_od=src.wazne_od, tgt.wazne_do=src.wazne_do
			WHEN NOT MATCHED
			THEN INSERT (id, idsisc, numer, data_obowiazywania, wazne_od, wazne_do)
			VALUES (src.id, src.idsisc, src.numer, src.data_obowiazywania, src.wazne_od, src.wazne_do);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_pozwolenia_na_procedure_uproszczona' BEGIN
			MERGE INTO ncts2.ref_pozwolenia_na_procedure_uproszczona AS tgt
			USING [WI_StageODS].ncts2.ref_pozwolenia_na_procedure_uproszczona AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.idsisc=src.idsisc, tgt.numer_pozwolenia=src.numer_pozwolenia, tgt.forma_procedury_uproszczonej=src.forma_procedury_uproszczonej, tgt.wazne_od=src.wazne_od, tgt.status=src.status, tgt.data_zawieszenia=src.data_zawieszenia, tgt.valid_from=src.valid_from, tgt.valid_to=src.valid_to, tgt.numer_klucz=src.numer_klucz
			WHEN NOT MATCHED
			THEN INSERT (id, idsisc, numer_pozwolenia, forma_procedury_uproszczonej, wazne_od, status, data_zawieszenia, valid_from, valid_to, numer_klucz)
			VALUES (src.id, src.idsisc, src.numer_pozwolenia, src.forma_procedury_uproszczonej, src.wazne_od, src.status, src.data_zawieszenia, src.valid_from, src.valid_to, src.numer_klucz);
		SET @Merged = 1;
		END

		IF @TableName = 'ref_procedura_uproszczona_miejsca_lokalizacji_towa' BEGIN
			MERGE INTO ncts2.ref_procedura_uproszczona_miejsca_lokalizacji_towaru AS tgt
			USING [WI_StageODS].ncts2.ref_procedura_uproszczona_miejsca_lokalizacji_towaru AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.pozwolenie_na_procedure_uproszczona_id=src.pozwolenie_na_procedure_uproszczona_id, tgt.numer_miejsca=src.numer_miejsca, tgt.czas_decyzje_tranzyt=src.czas_decyzje_tranzyt, tgt.zgoda_po_godzinach_pracy_urzedu_uc_wyjscia=src.zgoda_po_godzinach_pracy_urzedu_uc_wyjscia, tgt.zgoda_po_godzinach_pracy_urzedy_uc_przeznaczenia=src.zgoda_po_godzinach_pracy_urzedy_uc_przeznaczenia, tgt.kod_urzedu=src.kod_urzedu
			WHEN NOT MATCHED
			THEN INSERT (id, pozwolenie_na_procedure_uproszczona_id, numer_miejsca, czas_decyzje_tranzyt, zgoda_po_godzinach_pracy_urzedu_uc_wyjscia, zgoda_po_godzinach_pracy_urzedy_uc_przeznaczenia, kod_urzedu)
			VALUES (src.id, src.pozwolenie_na_procedure_uproszczona_id, src.numer_miejsca, src.czas_decyzje_tranzyt, src.zgoda_po_godzinach_pracy_urzedu_uc_wyjscia, src.zgoda_po_godzinach_pracy_urzedy_uc_przeznaczenia, src.kod_urzedu);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_procedura_uproszczona_towary_wykluczone' BEGIN
			MERGE INTO ncts2.ref_procedura_uproszczona_towary_wykluczone AS tgt
			USING [WI_StageODS].ncts2.ref_procedura_uproszczona_towary_wykluczone AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.miejsce_lokalizacji_towaru_id=src.miejsce_lokalizacji_towaru_id, tgt.kod=src.kod
			WHEN NOT MATCHED
			THEN INSERT (id, miejsce_lokalizacji_towaru_id, kod)
			VALUES (src.id, src.miejsce_lokalizacji_towaru_id, src.kod);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_swieta' BEGIN
			MERGE INTO ncts2.ref_swieta AS tgt
			USING [WI_StageODS].ncts2.ref_swieta AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.kod_kraju=src.kod_kraju, tgt.wazny_od=src.wazny_od, tgt.wazny_do=src.wazny_do
			WHEN NOT MATCHED
			THEN INSERT (id, kod_kraju, wazny_od, wazny_do)
			VALUES (src.id, src.kod_kraju, src.wazny_od, src.wazny_do);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_swieta_daty' BEGIN
			MERGE INTO ncts2.ref_swieta_daty AS tgt
			USING [WI_StageODS].ncts2.ref_swieta_daty AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.swieto_id=src.swieto_id, tgt.swieto_ruchome=src.swieto_ruchome, tgt.dzien=src.dzien, tgt.miesiac=src.miesiac, tgt.rok=src.rok
			WHEN NOT MATCHED
			THEN INSERT (id, swieto_id, swieto_ruchome, dzien, miesiac, rok)
			VALUES (src.id, src.swieto_id, src.swieto_ruchome, src.dzien, src.miesiac, src.rok);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_swieta_daty_lsd' BEGIN
			MERGE INTO ncts2.ref_swieta_daty_lsd AS tgt
			USING WI_StageODS.ncts2.ref_swieta_daty_lsd AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.swieto_data_id=src.swieto_data_id, tgt.kod_jezyka=src.kod_jezyka, tgt.nazwa_swieta=src.nazwa_swieta
			WHEN NOT MATCHED
			THEN INSERT (id, swieto_data_id, kod_jezyka, nazwa_swieta)
			VALUES (src.id, src.swieto_data_id, src.kod_jezyka, src.nazwa_swieta);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_urzedy_celne' BEGIN
			MERGE INTO ncts2.ref_urzedy_celne AS tgt
			USING [WI_StageODS].ncts2.ref_urzedy_celne AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.kod_uc=src.kod_uc, tgt.kod_uc_glowne_biuro=src.kod_uc_glowne_biuro, tgt.kod_uc_wyzszy_organ=src.kod_uc_wyzszy_organ, tgt.kod_uc_przejecia=src.kod_uc_przejecia, tgt.kod_uc_poszukiwania=src.kod_uc_poszukiwania, tgt.kod_uc_poboru=src.kod_uc_poboru, tgt.kod_kraju=src.kod_kraju, tgt.kod_miasta=src.kod_miasta, tgt.kod_regionu=src.kod_regionu, tgt.data_wejscia_ncts=src.data_wejscia_ncts, tgt.najblizszy_urzad=src.najblizszy_urzad, tgt.kod_pocztowy=src.kod_pocztowy, tgt.fax=src.fax, tgt.telefon=src.telefon, tgt.telex=src.telex, tgt.adres_email=src.adres_email, tgt.kod_polozenia_geograficznego=src.kod_polozenia_geograficznego, tgt.podmiot_przeznaczenia=src.podmiot_przeznaczenia, tgt.wazny_od=src.wazny_od, tgt.wazny_do=src.wazny_do
			WHEN NOT MATCHED
			THEN INSERT (id, kod_uc, kod_uc_glowne_biuro, kod_uc_wyzszy_organ, kod_uc_przejecia, kod_uc_poszukiwania, kod_uc_poboru, kod_kraju, kod_miasta, kod_regionu, data_wejscia_ncts, najblizszy_urzad, kod_pocztowy, fax, telefon, telex, adres_email, kod_polozenia_geograficznego, podmiot_przeznaczenia, wazny_od, wazny_do)
			VALUES (src.id, src.kod_uc, src.kod_uc_glowne_biuro, src.kod_uc_wyzszy_organ, src.kod_uc_przejecia, src.kod_uc_poszukiwania, src.kod_uc_poboru, src.kod_kraju, src.kod_miasta, src.kod_regionu, src.data_wejscia_ncts, src.najblizszy_urzad, src.kod_pocztowy, src.fax, src.telefon, src.telex, src.adres_email, src.kod_polozenia_geograficznego, src.podmiot_przeznaczenia, src.wazny_od, src.wazny_do);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_urzedy_celne_lsd' BEGIN
			MERGE INTO ncts2.ref_urzedy_celne_lsd AS tgt
			USING [WI_StageODS].ncts2.ref_urzedy_celne_lsd AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.urzad_celny_id=src.urzad_celny_id, tgt.kod_jezyka=src.kod_jezyka, tgt.nazwa_zwyczajowa_urzedu=src.nazwa_zwyczajowa_urzedu, tgt.ulica_numer=src.ulica_numer, tgt.miasto=src.miasto, tgt.flaga_prefix_suffix=src.flaga_prefix_suffix, tgt.prefix_suffix_nazwa=src.prefix_suffix_nazwa, tgt.przestrzen_do_dodania=src.przestrzen_do_dodania, tgt.poziom_prefix_suffix=src.poziom_prefix_suffix
			WHEN NOT MATCHED
			THEN INSERT (id, urzad_celny_id, kod_jezyka, nazwa_zwyczajowa_urzedu, ulica_numer, miasto, flaga_prefix_suffix, prefix_suffix_nazwa, przestrzen_do_dodania, poziom_prefix_suffix)
			VALUES (src.id, src.urzad_celny_id, src.kod_jezyka, src.nazwa_zwyczajowa_urzedu, src.ulica_numer, src.miasto, src.flaga_prefix_suffix, src.prefix_suffix_nazwa, src.przestrzen_do_dodania, src.poziom_prefix_suffix);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_urzedy_celne_podmioty' BEGIN
			MERGE INTO ncts2.ref_urzedy_celne_podmioty AS tgt
			USING [WI_StageODS].ncts2.ref_urzedy_celne_podmioty AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.urzad_celny_id=src.urzad_celny_id, tgt.nazwa=src.nazwa, tgt.kod_jezyka=src.kod_jezyka, tgt.tin=src.tin
			WHEN NOT MATCHED
			THEN INSERT (id, urzad_celny_id, nazwa, kod_jezyka, tin)
			VALUES (src.id, src.urzad_celny_id, src.nazwa, src.kod_jezyka, src.tin);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_urzedy_celne_sezony' BEGIN
			MERGE INTO ncts2.ref_urzedy_celne_sezony AS tgt
			USING [WI_StageODS].ncts2.ref_urzedy_celne_sezony AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.urzad_celny_id=src.urzad_celny_id, tgt.kod_sezonu=src.kod_sezonu, tgt.nazwa=src.nazwa, tgt.data_od=src.data_od, tgt.data_do=src.data_do
			WHEN NOT MATCHED
			THEN INSERT (id, urzad_celny_id, kod_sezonu, nazwa, data_od, data_do)
			VALUES (src.id, src.urzad_celny_id, src.kod_sezonu, src.nazwa, src.data_od, src.data_do);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_urzedy_celne_sezony_okresy' BEGIN
			MERGE INTO ncts2.ref_urzedy_celne_sezony_okresy AS tgt
			USING [WI_StageODS].ncts2.ref_urzedy_celne_sezony_okresy AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.urzad_celny_sezon_id=src.urzad_celny_sezon_id, tgt.dzien_od=src.dzien_od, tgt.dzien_do=src.dzien_do, tgt.godzina_od=src.godzina_od, tgt.godzina_do=src.godzina_do, tgt.godzina_od_drugi_okres=src.godzina_od_drugi_okres, tgt.godzina_do_drugi_okres=src.godzina_do_drugi_okres
			WHEN NOT MATCHED
			THEN INSERT (id, urzad_celny_sezon_id, dzien_od, dzien_do, godzina_od, godzina_do, godzina_od_drugi_okres, godzina_do_drugi_okres)
			VALUES (src.id, src.urzad_celny_sezon_id, src.dzien_od, src.dzien_do, src.godzina_od, src.godzina_do, src.godzina_od_drugi_okres, src.godzina_do_drugi_okres);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_urzedy_celne_sezony_okresy_role' BEGIN
			MERGE INTO ncts2.ref_urzedy_celne_sezony_okresy_role AS tgt
			USING [WI_StageODS].ncts2.ref_urzedy_celne_sezony_okresy_role AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.urzed_celny_sezon_okres_id=src.urzed_celny_sezon_okres_id, tgt.rola=src.rola, tgt.rodzaj_ruchu=src.rodzaj_ruchu
			WHEN NOT MATCHED
			THEN INSERT (id, urzed_celny_sezon_okres_id, rola, rodzaj_ruchu)
			VALUES (src.id, src.urzed_celny_sezon_okres_id, src.rola, src.rodzaj_ruchu);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_urzedy_celne_uwagi' BEGIN
			MERGE INTO ncts2.ref_urzedy_celne_uwagi AS tgt
			USING [WI_StageODS].ncts2.ref_urzedy_celne_uwagi AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.urzad_celny_id=src.urzad_celny_id, tgt.kod_uwagi=src.kod_uwagi
			WHEN NOT MATCHED
			THEN INSERT (id, urzad_celny_id, kod_uwagi)
			VALUES (src.id, src.urzad_celny_id, src.kod_uwagi);
			SET @Merged = 1;
		END

		IF @TableName = 'safe_tir_rejestracje_awaryjne' BEGIN
			MERGE INTO ncts2.safe_tir_rejestracje_awaryjne AS tgt
			USING [WI_StageODS].ncts2.safe_tir_rejestracje_awaryjne AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.numer_karnetu_tir=src.numer_karnetu_tir, tgt.mrn=src.mrn, tgt.kod_uc=src.kod_uc, tgt.status=src.status, tgt.data_kontroli=src.data_kontroli, tgt.numer_strony_karnetu_tir=src.numer_strony_karnetu_tir, tgt.typ_rozladunku=src.typ_rozladunku, tgt.numer_rozladunku=src.numer_rozladunku, tgt.zwolnienie_zastrzezenia=src.zwolnienie_zastrzezenia, tgt.id_komunkatu_utworzenia=src.id_komunkatu_utworzenia, tgt.id_komunikatu_usuniecia=src.id_komunikatu_usuniecia, tgt.anr=src.anr, tgt.status_data=src.status_data, tgt.kod_bledu=src.kod_bledu
			WHEN NOT MATCHED
			THEN INSERT (id, numer_karnetu_tir, mrn, kod_uc, status, data_kontroli, numer_strony_karnetu_tir, typ_rozladunku, numer_rozladunku, zwolnienie_zastrzezenia, id_komunkatu_utworzenia, id_komunikatu_usuniecia, anr, status_data, kod_bledu)
			VALUES (src.id, src.numer_karnetu_tir, src.mrn, src.kod_uc, src.status, src.data_kontroli, src.numer_strony_karnetu_tir, src.typ_rozladunku, src.numer_rozladunku, src.zwolnienie_zastrzezenia, src.id_komunkatu_utworzenia, src.id_komunikatu_usuniecia, src.anr, src.status_data, src.kod_bledu);
			SET @Merged = 1;
		END

		IF @TableName = 'slowniki_typy' BEGIN
			MERGE INTO ncts2.slowniki_typy AS tgt
			USING [WI_StageODS].ncts2.slowniki_typy AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.nazwa=src.nazwa, tgt.id_ddnta=src.id_ddnta, tgt.id_pdr=src.id_pdr
			WHEN NOT MATCHED
			THEN INSERT (id, nazwa, id_ddnta, id_pdr)
			VALUES (src.id, src.nazwa, src.id_ddnta, src.id_pdr);
			SET @Merged = 1;
		END

		IF @TableName = 'slowniki_wartosci' BEGIN
			MERGE INTO ncts2.slowniki_wartosci AS tgt
			USING [WI_StageODS].ncts2.slowniki_wartosci AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.slownik_typ_id=src.slownik_typ_id, tgt.kod=src.kod, tgt.wazny_od=src.wazny_od, tgt.wazny_do=src.wazny_do, tgt.opis=src.opis, tgt.opis_en=src.opis_en
			WHEN NOT MATCHED
			THEN INSERT (id, slownik_typ_id, kod, wazny_od, wazny_do, opis, opis_en)
			VALUES (src.id, src.slownik_typ_id, src.kod, src.wazny_od, src.wazny_do, src.opis, src.opis_en);
			SET @Merged = 1;
		END

		IF @TableName = 'timery_instancje' BEGIN
			MERGE INTO ncts2.timery_instancje AS tgt
			USING [WI_StageODS].ncts2.timery_instancje AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.timer_typ_id=src.timer_typ_id, tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.komunikat_id=src.komunikat_id, tgt.start_data=src.start_data, tgt.koniec_data=src.koniec_data, tgt.zatrzymanie_data=src.zatrzymanie_data, tgt.status=src.status, tgt.start_wykonanie=src.start_wykonanie, tgt.koniec_wykonanie=src.koniec_wykonanie, tgt.rewizja=src.rewizja
			WHEN NOT MATCHED
			THEN INSERT (id, timer_typ_id, operacja_tranzytowa_id, komunikat_id, start_data, koniec_data, zatrzymanie_data, status, start_wykonanie, koniec_wykonanie, rewizja)
			VALUES (src.id, src.timer_typ_id, src.operacja_tranzytowa_id, src.komunikat_id, src.start_data, src.koniec_data, src.zatrzymanie_data, src.status, src.start_wykonanie, src.koniec_wykonanie, src.rewizja);
			SET @Merged = 1;
		END

		IF @TableName = 'timery_typy' BEGIN
			MERGE INTO ncts2.timery_typy AS tgt
			USING [WI_StageODS].ncts2.timery_typy AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.nazwa=src.nazwa, tgt.opis=src.opis, tgt.czas_trwania=src.czas_trwania
			WHEN NOT MATCHED
			THEN INSERT (id, nazwa, opis, czas_trwania)
			VALUES (src.id, src.nazwa, src.opis, src.czas_trwania);
			SET @Merged = 1;
		END

		IF @TableName = 'towary' BEGIN
			MERGE INTO ncts2.towary AS tgt
			USING [WI_StageODS].ncts2.towary AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.poz_id=src.poz_id, tgt.typ_deklaracji=src.typ_deklaracji, tgt.kraj_wysylki=src.kraj_wysylki, tgt.kraj_przeznaczenia=src.kraj_przeznaczenia, tgt.opis=src.opis, tgt.kod_towarowy=src.kod_towarowy, tgt.masa_brutto=src.masa_brutto, tgt.masa_netto=src.masa_netto, tgt.nadawca_nazwa=src.nadawca_nazwa, tgt.nadawca_ulica_numer=src.nadawca_ulica_numer, tgt.nadawca_kod_pocztowy=src.nadawca_kod_pocztowy, tgt.nadawca_miejscowosc=src.nadawca_miejscowosc, tgt.nadawca_kraj=src.nadawca_kraj, tgt.nadawca_tin=src.nadawca_tin, tgt.odbiorca_nazwa=src.odbiorca_nazwa, tgt.odbiorca_ulica_numer=src.odbiorca_ulica_numer, tgt.odbiorca_kod_pocztowy=src.odbiorca_kod_pocztowy, tgt.odbiorca_miejscowosc=src.odbiorca_miejscowosc, tgt.odbiorca_kraj=src.odbiorca_kraj, tgt.odbiorca_tin=src.odbiorca_tin, tgt.bezpieczenstwo_forma_platnosci=src.bezpieczenstwo_forma_platnosci, tgt.bezpieczenstwo_nr_referencyjny_przesylki=src.bezpieczenstwo_nr_referencyjny_przesylki, tgt.bezpieczenstwo_kod_un_towarow_niebezpiecznych=src.bezpieczenstwo_kod_un_towarow_niebezpiecznych, tgt.bezpieczenstwo_nadawca_nazwa=src.bezpieczenstwo_nadawca_nazwa, tgt.bezpieczenstwo_nadawca_ulica_numer=src.bezpieczenstwo_nadawca_ulica_numer, tgt.bezpieczenstwo_nadawca_kod_pocztowy=src.bezpieczenstwo_nadawca_kod_pocztowy, tgt.bezpieczenstwo_nadawca_miejscowosc=src.bezpieczenstwo_nadawca_miejscowosc, tgt.bezpieczenstwo_nadawca_kraj=src.bezpieczenstwo_nadawca_kraj, tgt.bezpieczenstwo_nadawca_tin=src.bezpieczenstwo_nadawca_tin, tgt.bezpieczenstwo_odbiorca_nazwa=src.bezpieczenstwo_odbiorca_nazwa, tgt.bezpieczenstwo_odbiorca_ulica_numer=src.bezpieczenstwo_odbiorca_ulica_numer, tgt.bezpieczenstwo_odbiorca_kod_pocztowy=src.bezpieczenstwo_odbiorca_kod_pocztowy, tgt.bezpieczenstwo_odbiorca_miejscowosc=src.bezpieczenstwo_odbiorca_miejscowosc, tgt.bezpieczenstwo_odbiorca_kraj=src.bezpieczenstwo_odbiorca_kraj, tgt.bezpieczenstwo_odbiorca_tin=src.bezpieczenstwo_odbiorca_tin, tgt.tryb_utworzenia_pozycji=src.tryb_utworzenia_pozycji, tgt.iteracja_uwag_rozladunkowych=src.iteracja_uwag_rozladunkowych, tgt.nadawca_certyfikat_aeo=src.nadawca_certyfikat_aeo, tgt.odbiorca_certyfikat_aeo=src.odbiorca_certyfikat_aeo, tgt.bezpieczenstwo_nadawca_certyfikat_aeo=src.bezpieczenstwo_nadawca_certyfikat_aeo, tgt.bezpieczenstwo_odbiorca_certyfikat_aeo=src.bezpieczenstwo_odbiorca_certyfikat_aeo, tgt.opis_jezyk=src.opis_jezyk
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, poz_id, typ_deklaracji, kraj_wysylki, kraj_przeznaczenia, opis, kod_towarowy, masa_brutto, masa_netto, nadawca_nazwa, nadawca_ulica_numer, nadawca_kod_pocztowy, nadawca_miejscowosc, nadawca_kraj, nadawca_tin, odbiorca_nazwa, odbiorca_ulica_numer, odbiorca_kod_pocztowy, odbiorca_miejscowosc, odbiorca_kraj, odbiorca_tin, bezpieczenstwo_forma_platnosci, bezpieczenstwo_nr_referencyjny_przesylki, bezpieczenstwo_kod_un_towarow_niebezpiecznych, bezpieczenstwo_nadawca_nazwa, bezpieczenstwo_nadawca_ulica_numer, bezpieczenstwo_nadawca_kod_pocztowy, bezpieczenstwo_nadawca_miejscowosc, bezpieczenstwo_nadawca_kraj, bezpieczenstwo_nadawca_tin, bezpieczenstwo_odbiorca_nazwa, bezpieczenstwo_odbiorca_ulica_numer, bezpieczenstwo_odbiorca_kod_pocztowy, bezpieczenstwo_odbiorca_miejscowosc, bezpieczenstwo_odbiorca_kraj, bezpieczenstwo_odbiorca_tin, tryb_utworzenia_pozycji, iteracja_uwag_rozladunkowych, nadawca_certyfikat_aeo, odbiorca_certyfikat_aeo, bezpieczenstwo_nadawca_certyfikat_aeo, bezpieczenstwo_odbiorca_certyfikat_aeo, opis_jezyk)
			VALUES (src.id, src.operacja_tranzytowa_id, src.poz_id, src.typ_deklaracji, src.kraj_wysylki, src.kraj_przeznaczenia, src.opis, src.kod_towarowy, src.masa_brutto, src.masa_netto, src.nadawca_nazwa, src.nadawca_ulica_numer, src.nadawca_kod_pocztowy, src.nadawca_miejscowosc, src.nadawca_kraj, src.nadawca_tin, src.odbiorca_nazwa, src.odbiorca_ulica_numer, src.odbiorca_kod_pocztowy, src.odbiorca_miejscowosc, src.odbiorca_kraj, src.odbiorca_tin, src.bezpieczenstwo_forma_platnosci, src.bezpieczenstwo_nr_referencyjny_przesylki, src.bezpieczenstwo_kod_un_towarow_niebezpiecznych, src.bezpieczenstwo_nadawca_nazwa, src.bezpieczenstwo_nadawca_ulica_numer, src.bezpieczenstwo_nadawca_kod_pocztowy, src.bezpieczenstwo_nadawca_miejscowosc, src.bezpieczenstwo_nadawca_kraj, src.bezpieczenstwo_nadawca_tin, src.bezpieczenstwo_odbiorca_nazwa, src.bezpieczenstwo_odbiorca_ulica_numer, src.bezpieczenstwo_odbiorca_kod_pocztowy, src.bezpieczenstwo_odbiorca_miejscowosc, src.bezpieczenstwo_odbiorca_kraj, src.bezpieczenstwo_odbiorca_tin, src.tryb_utworzenia_pozycji, src.iteracja_uwag_rozladunkowych, src.nadawca_certyfikat_aeo, src.odbiorca_certyfikat_aeo, src.bezpieczenstwo_nadawca_certyfikat_aeo, src.bezpieczenstwo_odbiorca_certyfikat_aeo, src.opis_jezyk);
			SET @Merged = 1;
		END

		IF @TableName = 'towary_uwagi' BEGIN
			MERGE INTO ncts2.towary_uwagi AS tgt
			USING [WI_StageODS].ncts2.towary_uwagi AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.towar_id=src.towar_id, tgt.uwagi=src.uwagi, tgt.uwagi_jezyk=src.uwagi_jezyk, tgt.tryb_utworzenia_pozycji=src.tryb_utworzenia_pozycji, tgt.iteracja_uwag_rozladunkowych=src.iteracja_uwag_rozladunkowych
			WHEN NOT MATCHED
			THEN INSERT (id, towar_id, uwagi, uwagi_jezyk, tryb_utworzenia_pozycji, iteracja_uwag_rozladunkowych)
			VALUES (src.id, src.towar_id, src.uwagi, src.uwagi_jezyk, src.tryb_utworzenia_pozycji, src.iteracja_uwag_rozladunkowych);
			SET @Merged = 1;
		END

		IF @TableName = 'towary_wrazliwe' BEGIN
			MERGE INTO ncts2.towary_wrazliwe AS tgt
			USING [WI_StageODS].ncts2.towary_wrazliwe AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.towar_id=src.towar_id, tgt.kod=src.kod, tgt.ilosc=src.ilosc, tgt.poz_id=src.poz_id, tgt.tryb_utworzenia_pozycji=src.tryb_utworzenia_pozycji, tgt.iteracja_uwag_rozladunkowych=src.iteracja_uwag_rozladunkowych
			WHEN NOT MATCHED
			THEN INSERT (towar_id, kod, ilosc, poz_id, id, tryb_utworzenia_pozycji, iteracja_uwag_rozladunkowych)
			VALUES (src.towar_id, src.kod, src.ilosc, src.poz_id, src.id, src.tryb_utworzenia_pozycji, src.iteracja_uwag_rozladunkowych);
			SET @Merged = 1;
		END

		IF @TableName = 'trasy_przewozu' BEGIN
			MERGE INTO ncts2.trasy_przewozu AS tgt
			USING [WI_StageODS].ncts2.trasy_przewozu AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.trasa=src.trasa
			WHEN NOT MATCHED
			THEN INSERT (operacja_tranzytowa_id, trasa, id)
			VALUES (src.operacja_tranzytowa_id, src.trasa, src.id);
			SET @Merged = 1;
		END

		IF @TableName = 'uc_tranzytowe' BEGIN
			MERGE INTO ncts2.uc_tranzytowe AS tgt
			USING [WI_StageODS].ncts2.uc_tranzytowe AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.uc_tranzytowy=src.uc_tranzytowy, tgt.czas_przybycia=src.czas_przybycia, tgt.poz_id=src.poz_id, tgt.status_uc_tranzytowy=src.status_uc_tranzytowy, tgt.status_uc_tranzytowy_data=src.status_uc_tranzytowy_data, tgt.ryzyko_uc_tranzytowy=src.ryzyko_uc_tranzytowy, tgt.flaga_ar_uc_tranzytowy=src.flaga_ar_uc_tranzytowy
			WHEN NOT MATCHED
			THEN INSERT (operacja_tranzytowa_id, uc_tranzytowy, czas_przybycia, id, poz_id, status_uc_tranzytowy, status_uc_tranzytowy_data, ryzyko_uc_tranzytowy, flaga_ar_uc_tranzytowy)
			VALUES (src.operacja_tranzytowa_id, src.uc_tranzytowy, src.czas_przybycia, src.id, src.poz_id, src.status_uc_tranzytowy, src.status_uc_tranzytowy_data, src.ryzyko_uc_tranzytowy, src.flaga_ar_uc_tranzytowy);
			SET @Merged = 1;
		END

		IF @TableName = 'upowazniony_odbiorca' BEGIN
			MERGE INTO ncts2.upowazniony_odbiorca AS tgt
			USING [WI_StageODS].ncts2.upowazniony_odbiorca AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.data_zapytania=src.data_zapytania, tgt.data_odpowiedzi=src.data_odpowiedzi, tgt.status=src.status, tgt.tin=src.tin, tgt.urzad_pytany=src.urzad_pytany, tgt.komunikat_zapytania_id=src.komunikat_zapytania_id, tgt.komunikat_odpowiedzi_id=src.komunikat_odpowiedzi_id, tgt.kod_odpowiedzi=src.kod_odpowiedzi, tgt.urzad_pytajacy=src.urzad_pytajacy
			WHEN NOT MATCHED
			THEN INSERT (id, data_zapytania, data_odpowiedzi, status, tin, urzad_pytany, komunikat_zapytania_id, komunikat_odpowiedzi_id, kod_odpowiedzi, urzad_pytajacy)
			VALUES (src.id, src.data_zapytania, src.data_odpowiedzi, src.status, src.tin, src.urzad_pytany, src.komunikat_zapytania_id, src.komunikat_odpowiedzi_id, src.kod_odpowiedzi, src.urzad_pytajacy);
			SET @Merged = 1;
		END

		IF @TableName = 'uwagi_rozladunkowe' BEGIN
			MERGE INTO ncts2.uwagi_rozladunkowe AS tgt
			USING [WI_StageODS].ncts2.uwagi_rozladunkowe AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.iteracja=src.iteracja, tgt.data_rozladunku=src.data_rozladunku, tgt.wynik_rozladunku_zakonczenie=src.wynik_rozladunku_zakonczenie, tgt.wynik_rozladunku_zgodny=src.wynik_rozladunku_zgodny, tgt.wynik_rozladunku_zamkniecia_prawidlowe=src.wynik_rozladunku_zamkniecia_prawidlowe, tgt.podmiot_w_miejscu_przeznaczenia_nazwa=src.podmiot_w_miejscu_przeznaczenia_nazwa, tgt.podmiot_w_miejscu_przeznaczenia_ulica_numer=src.podmiot_w_miejscu_przeznaczenia_ulica_numer, tgt.podmiot_w_miejscu_przeznaczenia_kod_pocztowy=src.podmiot_w_miejscu_przeznaczenia_kod_pocztowy, tgt.podmiot_w_miejscu_przeznaczenia_miejscowosc=src.podmiot_w_miejscu_przeznaczenia_miejscowosc, tgt.podmiot_w_miejscu_przeznaczenia_kraj=src.podmiot_w_miejscu_przeznaczenia_kraj, tgt.podmiot_w_miejscu_przeznaczenia_tin=src.podmiot_w_miejscu_przeznaczenia_tin, tgt.uwagi_rozladunkowe=src.uwagi_rozladunkowe, tgt.karnet_tir_nie_dotyczy=src.karnet_tir_nie_dotyczy, tgt.karnet_tir_numer_strony=src.karnet_tir_numer_strony, tgt.karnet_tir_typ_rozladunku=src.karnet_tir_typ_rozladunku, tgt.karnet_tir_numer_rozladunku=src.karnet_tir_numer_rozladunku, tgt.zwolnienie=src.zwolnienie, tgt.zamkniecia_celne_ilosc=src.zamkniecia_celne_ilosc, tgt.liczba_pozycji=src.liczba_pozycji, tgt.liczba_opakowan=src.liczba_opakowan, tgt.masa_brutto=src.masa_brutto, tgt.transport_znaki=src.transport_znaki, tgt.transport_kraj=src.transport_kraj, tgt.liczba_pozycji_uwagi=src.liczba_pozycji_uwagi, tgt.masa_brutto_uwagi=src.masa_brutto_uwagi, tgt.liczba_opakowan_uwagi=src.liczba_opakowan_uwagi, tgt.transport_znaki_uwagi=src.transport_znaki_uwagi, tgt.transport_kraj_uwagi=src.transport_kraj_uwagi, tgt.data_utworzenia=src.data_utworzenia
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, iteracja, data_rozladunku, wynik_rozladunku_zakonczenie, wynik_rozladunku_zgodny, wynik_rozladunku_zamkniecia_prawidlowe, podmiot_w_miejscu_przeznaczenia_nazwa, podmiot_w_miejscu_przeznaczenia_ulica_numer, podmiot_w_miejscu_przeznaczenia_kod_pocztowy, podmiot_w_miejscu_przeznaczenia_miejscowosc, podmiot_w_miejscu_przeznaczenia_kraj, podmiot_w_miejscu_przeznaczenia_tin, uwagi_rozladunkowe, karnet_tir_nie_dotyczy, karnet_tir_numer_strony, karnet_tir_typ_rozladunku, karnet_tir_numer_rozladunku, zwolnienie, zamkniecia_celne_ilosc, liczba_pozycji, liczba_opakowan, masa_brutto, transport_znaki, transport_kraj, liczba_pozycji_uwagi, masa_brutto_uwagi, liczba_opakowan_uwagi, transport_znaki_uwagi, transport_kraj_uwagi, data_utworzenia)
			VALUES (src.id, src.operacja_tranzytowa_id, src.iteracja, src.data_rozladunku, src.wynik_rozladunku_zakonczenie, src.wynik_rozladunku_zgodny, src.wynik_rozladunku_zamkniecia_prawidlowe, src.podmiot_w_miejscu_przeznaczenia_nazwa, src.podmiot_w_miejscu_przeznaczenia_ulica_numer, src.podmiot_w_miejscu_przeznaczenia_kod_pocztowy, src.podmiot_w_miejscu_przeznaczenia_miejscowosc, src.podmiot_w_miejscu_przeznaczenia_kraj, src.podmiot_w_miejscu_przeznaczenia_tin, src.uwagi_rozladunkowe, src.karnet_tir_nie_dotyczy, src.karnet_tir_numer_strony, src.karnet_tir_typ_rozladunku, src.karnet_tir_numer_rozladunku, src.zwolnienie, src.zamkniecia_celne_ilosc, src.liczba_pozycji, src.liczba_opakowan, src.masa_brutto, src.transport_znaki, src.transport_kraj, src.liczba_pozycji_uwagi, src.masa_brutto_uwagi, src.liczba_opakowan_uwagi, src.transport_znaki_uwagi, src.transport_kraj_uwagi, src.data_utworzenia);
			SET @Merged = 1;
		END

		IF @TableName = 'uwagi_rozladunkowe_zamkniecia_celne' BEGIN
			MERGE INTO ncts2.uwagi_rozladunkowe_zamkniecia_celne AS tgt
			USING [WI_StageODS].ncts2.uwagi_rozladunkowe_zamkniecia_celne AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.uwagi_rozladunkowe_id=src.uwagi_rozladunkowe_id, tgt.poz_id=src.poz_id, tgt.numer=src.numer
			WHEN NOT MATCHED
			THEN INSERT (id, uwagi_rozladunkowe_id, poz_id, numer)
			VALUES (src.id, src.uwagi_rozladunkowe_id, src.poz_id, src.numer);
			SET @Merged = 1;
		END

		IF @TableName = 'uzytkownicy' BEGIN
			MERGE INTO ncts2.uzytkownicy AS tgt
			USING [WI_StageODS].ncts2.uzytkownicy AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.nazwisko=src.nazwisko, tgt.imie=src.imie, tgt.uc=src.uc, tgt.login=src.login, tgt.ostatni_tryb_urzedu=src.ostatni_tryb_urzedu, tgt.data_ostatniego_logowania=src.data_ostatniego_logowania, tgt.czy_zalogowany=src.czy_zalogowany, tgt.mail=src.mail, tgt.id_login=src.id_login, tgt.jednostka_organizacyjna=src.jednostka_organizacyjna, tgt.telefon=src.telefon
			WHEN NOT MATCHED
			THEN INSERT (id, nazwisko, imie, uc, login, ostatni_tryb_urzedu, data_ostatniego_logowania, czy_zalogowany, mail, id_login, jednostka_organizacyjna, telefon)
			VALUES (src.id, src.nazwisko, src.imie, src.uc, src.login, src.ostatni_tryb_urzedu, src.data_ostatniego_logowania, src.czy_zalogowany, src.mail, src.id_login, src.jednostka_organizacyjna, src.telefon);
			SET @Merged = 1;
		END

		IF @TableName = 'wnioski_o_aar' BEGIN
			MERGE INTO ncts2.wnioski_o_aar AS tgt
			USING [WI_StageODS].ncts2.wnioski_o_aar AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.uc_przedstawienia_wniosku=src.uc_przedstawienia_wniosku, tgt.status=src.status, tgt.mrn=src.mrn, tgt.zmiana_statusu_data=src.zmiana_statusu_data, tgt.tin=src.tin, tgt.przedstawiajacy_wniosek_nazwa=src.przedstawiajacy_wniosek_nazwa, tgt.procedura_uproszczona=src.procedura_uproszczona, tgt.komunikat_ie007_id=src.komunikat_ie007_id, tgt.komunikat_ie002_id=src.komunikat_ie002_id, tgt.komunikat_ie003_id=src.komunikat_ie003_id, tgt.przedstawiajacy_wniosek_ulica_numer=src.przedstawiajacy_wniosek_ulica_numer, tgt.przedstawiajacy_wniosek_kod_pocztowy=src.przedstawiajacy_wniosek_kod_pocztowy, tgt.przedstawiajacy_wniosek_miejscowosc=src.przedstawiajacy_wniosek_miejscowosc, tgt.przedstawiajacy_wniosek_kraj=src.przedstawiajacy_wniosek_kraj, tgt.przedstawiajacy_wniosek_tin=src.przedstawiajacy_wniosek_tin, tgt.opis_lokalizacji=src.opis_lokalizacji, tgt.kod_miejsca_uznanego=src.kod_miejsca_uznanego, tgt.miejsce_odpraw_celnych=src.miejsce_odpraw_celnych, tgt.miejsce_wskazane_w_pozwoleniu=src.miejsce_wskazane_w_pozwoleniu, tgt.data_powiadomienia=src.data_powiadomienia, tgt.miejsce_powiadomienia=src.miejsce_powiadomienia, tgt.rewizja=src.rewizja, tgt.data_utworzenia=src.data_utworzenia, tgt.data_modyfikacji=src.data_modyfikacji
			WHEN NOT MATCHED
			THEN INSERT (id, uc_przedstawienia_wniosku, status, mrn, zmiana_statusu_data, tin, przedstawiajacy_wniosek_nazwa, procedura_uproszczona, komunikat_ie007_id, komunikat_ie002_id, komunikat_ie003_id, przedstawiajacy_wniosek_ulica_numer, przedstawiajacy_wniosek_kod_pocztowy, przedstawiajacy_wniosek_miejscowosc, przedstawiajacy_wniosek_kraj, przedstawiajacy_wniosek_tin, opis_lokalizacji, kod_miejsca_uznanego, miejsce_odpraw_celnych, miejsce_wskazane_w_pozwoleniu, data_powiadomienia, miejsce_powiadomienia, rewizja, data_utworzenia, data_modyfikacji)
			VALUES (src.id, src.uc_przedstawienia_wniosku, src.status, src.mrn, src.zmiana_statusu_data, src.tin, src.przedstawiajacy_wniosek_nazwa, src.procedura_uproszczona, src.komunikat_ie007_id, src.komunikat_ie002_id, src.komunikat_ie003_id, src.przedstawiajacy_wniosek_ulica_numer, src.przedstawiajacy_wniosek_kod_pocztowy, src.przedstawiajacy_wniosek_miejscowosc, src.przedstawiajacy_wniosek_kraj, src.przedstawiajacy_wniosek_tin, src.opis_lokalizacji, src.kod_miejsca_uznanego, src.miejsce_odpraw_celnych, src.miejsce_wskazane_w_pozwoleniu, src.data_powiadomienia, src.miejsce_powiadomienia, src.rewizja, src.data_utworzenia, src.data_modyfikacji);
			SET @Merged = 1;
		END

		IF @TableName = 'wnioski_o_atr' BEGIN
			MERGE INTO ncts2.wnioski_o_atr AS tgt
			USING [WI_StageODS].ncts2.wnioski_o_atr AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.uc_wyjscia=src.uc_wyjscia, tgt.uc_przedstawienia_wniosku=src.uc_przedstawienia_wniosku, tgt.status=src.status, tgt.mrn=src.mrn, tgt.zmiana_statusu_data=src.zmiana_statusu_data, tgt.komunikat_ie114_id=src.komunikat_ie114_id, tgt.data_przekroczenia_granicy=src.data_przekroczenia_granicy, tgt.komunikat_ie115_id=src.komunikat_ie115_id, tgt.data_zwolnienia=src.data_zwolnienia, tgt.rewizja=src.rewizja, tgt.data_utworzenia=src.data_utworzenia, tgt.data_modyfikacji=src.data_modyfikacji
			WHEN NOT MATCHED
			THEN INSERT (id, uc_wyjscia, uc_przedstawienia_wniosku, status, mrn, zmiana_statusu_data, komunikat_ie114_id, data_przekroczenia_granicy, komunikat_ie115_id, data_zwolnienia, rewizja, data_utworzenia, data_modyfikacji)
			VALUES (src.id, src.uc_wyjscia, src.uc_przedstawienia_wniosku, src.status, src.mrn, src.zmiana_statusu_data, src.komunikat_ie114_id, src.data_przekroczenia_granicy, src.komunikat_ie115_id, src.data_zwolnienia, src.rewizja, src.data_utworzenia, src.data_modyfikacji);
			SET @Merged = 1;
		END

		IF @TableName = 'wnioski_o_procedure_awaryjna' BEGIN
			MERGE INTO ncts2.wnioski_o_procedure_awaryjna AS tgt
			USING [WI_StageODS].ncts2.wnioski_o_procedure_awaryjna AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.data_utworzenia=src.data_utworzenia, tgt.identyfikator=src.identyfikator, tgt.kod_przyczyny=src.kod_przyczyny, tgt.kod_urzedu=src.kod_urzedu, tgt.status=src.status, tgt.tin=src.tin, tgt.login=src.login, tgt.lrn=src.lrn, tgt.mrn=src.mrn, tgt.grn=src.grn, tgt.data_od=src.data_od, tgt.data_do=src.data_do, tgt.opis=src.opis, tgt.odpowiedz_odpowiadajacy=src.odpowiedz_odpowiadajacy, tgt.odpowiedz_uzasadnienie=src.odpowiedz_uzasadnienie, tgt.odpowiedz_data=src.odpowiedz_data, tgt.data_obowiazywania_od=src.data_obowiazywania_od, tgt.data_obowiazywania_do=src.data_obowiazywania_do, tgt.identyfikator_obowiazujacy=src.identyfikator_obowiazujacy
			WHEN NOT MATCHED
			THEN INSERT (id, data_utworzenia, identyfikator, kod_przyczyny, kod_urzedu, status, tin, login, lrn, mrn, grn, data_od, data_do, opis, odpowiedz_odpowiadajacy, odpowiedz_uzasadnienie, odpowiedz_data, data_obowiazywania_od, data_obowiazywania_do, identyfikator_obowiazujacy)
			VALUES (src.id, src.data_utworzenia, src.identyfikator, src.kod_przyczyny, src.kod_urzedu, src.status, src.tin, src.login, src.lrn, src.mrn, src.grn, src.data_od, src.data_do, src.opis, src.odpowiedz_odpowiadajacy, src.odpowiedz_uzasadnienie, src.odpowiedz_data, src.data_obowiazywania_od, src.data_obowiazywania_do, src.identyfikator_obowiazujacy);
			SET @Merged = 1;
		END

		IF @TableName = 'wnioski_o_uniewaznienie' BEGIN
			MERGE INTO ncts2.wnioski_o_uniewaznienie AS tgt
			USING [WI_StageODS].ncts2.wnioski_o_uniewaznienie AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.status=src.status, tgt.uzasadnienie_wniosku=src.uzasadnienie_wniosku, tgt.data_wniosku=src.data_wniosku, tgt.uzasadnienie_decyzji=src.uzasadnienie_decyzji, tgt.data_decyzji=src.data_decyzji, tgt.rejestrator_id=src.rejestrator_id, tgt.data_rejestracji=src.data_rejestracji, tgt.komunikat_przychodzacy_id=src.komunikat_przychodzacy_id, tgt.komunikat_odpowiedzi_id=src.komunikat_odpowiedzi_id, tgt.decydent_id=src.decydent_id
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, status, uzasadnienie_wniosku, data_wniosku, uzasadnienie_decyzji, data_decyzji, rejestrator_id, data_rejestracji, komunikat_przychodzacy_id, komunikat_odpowiedzi_id, decydent_id)
			VALUES (src.id, src.operacja_tranzytowa_id, src.status, src.uzasadnienie_wniosku, src.data_wniosku, src.uzasadnienie_decyzji, src.data_decyzji, src.rejestrator_id, src.data_rejestracji, src.komunikat_przychodzacy_id, src.komunikat_odpowiedzi_id, src.decydent_id);
			SET @Merged = 1;
		END

		IF @TableName = 'wyniki_kontroli' BEGIN
			MERGE INTO ncts2.wyniki_kontroli AS tgt
			USING [WI_StageODS].ncts2.wyniki_kontroli AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.data_kontroli=src.data_kontroli, tgt.kod_wyniku=src.kod_wyniku, tgt.wyjasnianie_niezgodnosci=src.wyjasnianie_niezgodnosci, tgt.zamkniecia_prawidlowe=src.zamkniecia_prawidlowe, tgt.losowe_typowanie=src.losowe_typowanie, tgt.zwolnienie_bez_zastrzezen=src.zwolnienie_bez_zastrzezen, tgt.karnet_tir_nie_dotyczy=src.karnet_tir_nie_dotyczy, tgt.karnet_tir_numer_strony=src.karnet_tir_numer_strony, tgt.karnet_tir_typ_rozladunku=src.karnet_tir_typ_rozladunku, tgt.karnet_tir_numer_rozladunku=src.karnet_tir_numer_rozladunku, tgt.skontrolowal=src.skontrolowal, tgt.uwagi=src.uwagi, tgt.uwagi_jezyk=src.uwagi_jezyk, tgt.liczba_pozycji=src.liczba_pozycji, tgt.liczba_pozycji_uwagi=src.liczba_pozycji_uwagi, tgt.masa_brutto=src.masa_brutto, tgt.masa_brutto_uwagi=src.masa_brutto_uwagi, tgt.liczba_opakowan=src.liczba_opakowan, tgt.liczba_opakowan_uwagi=src.liczba_opakowan_uwagi, tgt.transport_znaki=src.transport_znaki, tgt.transport_znaki_uwagi=src.transport_znaki_uwagi, tgt.transport_kraj=src.transport_kraj, tgt.transport_kraj_uwagi=src.transport_kraj_uwagi, tgt.data_utworzenia=src.data_utworzenia
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, data_kontroli, kod_wyniku, wyjasnianie_niezgodnosci, zamkniecia_prawidlowe, losowe_typowanie, zwolnienie_bez_zastrzezen, karnet_tir_nie_dotyczy, karnet_tir_numer_strony, karnet_tir_typ_rozladunku, karnet_tir_numer_rozladunku, skontrolowal, uwagi, uwagi_jezyk, liczba_pozycji, liczba_pozycji_uwagi, masa_brutto, masa_brutto_uwagi, liczba_opakowan, liczba_opakowan_uwagi, transport_znaki, transport_znaki_uwagi, transport_kraj, transport_kraj_uwagi, data_utworzenia)
			VALUES (src.id, src.operacja_tranzytowa_id, src.data_kontroli, src.kod_wyniku, src.wyjasnianie_niezgodnosci, src.zamkniecia_prawidlowe, src.losowe_typowanie, src.zwolnienie_bez_zastrzezen, src.karnet_tir_nie_dotyczy, src.karnet_tir_numer_strony, src.karnet_tir_typ_rozladunku, src.karnet_tir_numer_rozladunku, src.skontrolowal, src.uwagi, src.uwagi_jezyk, src.liczba_pozycji, src.liczba_pozycji_uwagi, src.masa_brutto, src.masa_brutto_uwagi, src.liczba_opakowan, src.liczba_opakowan_uwagi, src.transport_znaki, src.transport_znaki_uwagi, src.transport_kraj, src.transport_kraj_uwagi, src.data_utworzenia);
			SET @Merged = 1;
		END

		IF @TableName = 'zadania_systemy_zewnetrzne' BEGIN
			MERGE INTO ncts2.zadania_systemy_zewnetrzne AS tgt
			USING [WI_StageODS].ncts2.zadania_systemy_zewnetrzne AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.komunikat_id=src.komunikat_id, tgt.zrodlo=src.zrodlo, tgt.poz_id=src.poz_id, tgt.kod=src.kod, tgt.komunikat=src.komunikat, tgt.opis=src.opis, tgt.status=src.status, tgt.komentarz=src.komentarz, tgt.typ_uc=src.typ_uc
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, komunikat_id, zrodlo, poz_id, kod, komunikat, opis, status, komentarz, typ_uc)
			VALUES (src.id, src.operacja_tranzytowa_id, src.komunikat_id, src.zrodlo, src.poz_id, src.kod, src.komunikat, src.opis, src.status, src.komentarz, src.typ_uc);
			SET @Merged = 1;
		END

		IF @TableName = 'zamkniecia_celne' BEGIN
			MERGE INTO ncts2.zamkniecia_celne AS tgt
			USING [WI_StageODS].ncts2.zamkniecia_celne AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.nr=src.nr, tgt.poz_id=src.poz_id
			WHEN NOT MATCHED
			THEN INSERT (operacja_tranzytowa_id, nr, id, poz_id)
			VALUES (src.operacja_tranzytowa_id, src.nr, src.id, src.poz_id);
			SET @Merged = 1;
		END

		IF @TableName = 'zapytania_o_gwarancje' BEGIN
			MERGE INTO ncts2.zapytania_o_gwarancje AS tgt
			USING [WI_StageODS].ncts2.zapytania_o_gwarancje AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.data_utworzenia=src.data_utworzenia, tgt.komunikat_zapytania_id=src.komunikat_zapytania_id, tgt.komunikat_odpowiedzi_id=src.komunikat_odpowiedzi_id, tgt.komunikat_zapytania_osoz_id=src.komunikat_zapytania_osoz_id, tgt.komunikat_odpowiedzi_osoz_id=src.komunikat_odpowiedzi_osoz_id, tgt.komunikacja_odbiorca_nta=src.komunikacja_odbiorca_nta, tgt.kod_uc_pytajacego=src.kod_uc_pytajacego
			WHEN NOT MATCHED
			THEN INSERT (id, data_utworzenia, komunikat_zapytania_id, komunikat_odpowiedzi_id, komunikat_zapytania_osoz_id, komunikat_odpowiedzi_osoz_id, komunikacja_odbiorca_nta, kod_uc_pytajacego)
			VALUES (src.id, src.data_utworzenia, src.komunikat_zapytania_id, src.komunikat_odpowiedzi_id, src.komunikat_zapytania_osoz_id, src.komunikat_odpowiedzi_osoz_id, src.komunikacja_odbiorca_nta, src.kod_uc_pytajacego);
			SET @Merged = 1;
		END

		IF @TableName = 'zapytania_o_przesylki' BEGIN
			MERGE INTO ncts2.zapytania_o_przesylki AS tgt
			USING [WI_StageODS].ncts2.zapytania_o_przesylki AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.mrn=src.mrn, tgt.data_utworzenia=src.data_utworzenia, tgt.data_odpowiedzi=src.data_odpowiedzi, tgt.status_odpowiedzi=src.status_odpowiedzi, tgt.uzytkownik_id=src.uzytkownik_id, tgt.uc_przedstawienia_zapytania=src.uc_przedstawienia_zapytania, tgt.uc_wyslania_zapytania=src.uc_wyslania_zapytania, tgt.komunikat_ie027_id=src.komunikat_ie027_id, tgt.komunikat_odpowiedzi_ie038_id=src.komunikat_odpowiedzi_ie038_id, tgt.zapytanie_o_dodatkowe_informacje_o_przesylce=src.zapytanie_o_dodatkowe_informacje_o_przesylce, tgt.odpowiedz_na_zapytanie_o_dodatkowe_informacje_o_przesylce=src.odpowiedz_na_zapytanie_o_dodatkowe_informacje_o_przesylce, tgt.poinformowano_o_przeladunku=src.poinformowano_o_przeladunku, tgt.poinformowano_o_zdarzeniu=src.poinformowano_o_zdarzeniu
			WHEN NOT MATCHED
			THEN INSERT (id, mrn, data_utworzenia, data_odpowiedzi, status_odpowiedzi, uzytkownik_id, uc_przedstawienia_zapytania, uc_wyslania_zapytania, komunikat_ie027_id, komunikat_odpowiedzi_ie038_id, zapytanie_o_dodatkowe_informacje_o_przesylce, odpowiedz_na_zapytanie_o_dodatkowe_informacje_o_przesylce, poinformowano_o_przeladunku, poinformowano_o_zdarzeniu)
			VALUES (src.id, src.mrn, src.data_utworzenia, src.data_odpowiedzi, src.status_odpowiedzi, src.uzytkownik_id, src.uc_przedstawienia_zapytania, src.uc_wyslania_zapytania, src.komunikat_ie027_id, src.komunikat_odpowiedzi_ie038_id, src.zapytanie_o_dodatkowe_informacje_o_przesylce, src.odpowiedz_na_zapytanie_o_dodatkowe_informacje_o_przesylce, src.poinformowano_o_przeladunku, src.poinformowano_o_zdarzeniu);
			SET @Merged = 1;
		END

		IF @TableName = 'zdarzenia' BEGIN
			MERGE INTO ncts2.zdarzenia AS tgt
			USING [WI_StageODS].ncts2.zdarzenia AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.typ=src.typ, tgt.poz_id=src.poz_id, tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.miejsce=src.miejsce, tgt.kraj=src.kraj, tgt.czy_inne_zdarzenie=src.czy_inne_zdarzenie, tgt.czy_w_systemie=src.czy_w_systemie, tgt.zdarzenie_opis=src.zdarzenie_opis, tgt.zdarzenie_data_adnotacji=src.zdarzenie_data_adnotacji, tgt.zdarzenie_kraj_adnotacji=src.zdarzenie_kraj_adnotacji, tgt.zdarzenie_wladze_adnotacji=src.zdarzenie_wladze_adnotacji, tgt.zdarzenie_miejsce_adnotacji=src.zdarzenie_miejsce_adnotacji, tgt.przeladunek_znaki=src.przeladunek_znaki, tgt.przeladunek_kraj_srodka_transportu=src.przeladunek_kraj_srodka_transportu, tgt.przeladunek_data_adnotacji=src.przeladunek_data_adnotacji, tgt.przeladunek_kraj_adnotacji=src.przeladunek_kraj_adnotacji, tgt.przeladunek_wladze_adnotacji=src.przeladunek_wladze_adnotacji, tgt.przeladunek_miejsce_adnotacji=src.przeladunek_miejsce_adnotacji, tgt.ilosc_zamkniec=src.ilosc_zamkniec, tgt.wniosek_o_aar_id=src.wniosek_o_aar_id, tgt.wniosek_o_atr_id=src.wniosek_o_atr_id, tgt.kod_uc=src.kod_uc
			WHEN NOT MATCHED
			THEN INSERT (id, typ, poz_id, operacja_tranzytowa_id, miejsce, kraj, czy_inne_zdarzenie, czy_w_systemie, zdarzenie_opis, zdarzenie_data_adnotacji, zdarzenie_kraj_adnotacji, zdarzenie_wladze_adnotacji, zdarzenie_miejsce_adnotacji, przeladunek_znaki, przeladunek_kraj_srodka_transportu, przeladunek_data_adnotacji, przeladunek_kraj_adnotacji, przeladunek_wladze_adnotacji, przeladunek_miejsce_adnotacji, ilosc_zamkniec, wniosek_o_aar_id, wniosek_o_atr_id, kod_uc)
			VALUES (src.id, src.typ, src.poz_id, src.operacja_tranzytowa_id, src.miejsce, src.kraj, src.czy_inne_zdarzenie, src.czy_w_systemie, src.zdarzenie_opis, src.zdarzenie_data_adnotacji, src.zdarzenie_kraj_adnotacji, src.zdarzenie_wladze_adnotacji, src.zdarzenie_miejsce_adnotacji, src.przeladunek_znaki, src.przeladunek_kraj_srodka_transportu, src.przeladunek_data_adnotacji, src.przeladunek_kraj_adnotacji, src.przeladunek_wladze_adnotacji, src.przeladunek_miejsce_adnotacji, src.ilosc_zamkniec, src.wniosek_o_aar_id, src.wniosek_o_atr_id, src.kod_uc);
			SET @Merged = 1;
		END

		IF @TableName = 'zdarzenia_kontenery' BEGIN
			MERGE INTO ncts2.zdarzenia_kontenery AS tgt
			USING [WI_StageODS].ncts2.zdarzenia_kontenery AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.zdarzenie_id=src.zdarzenie_id, tgt.poz_id=src.poz_id, tgt.numer=src.numer
			WHEN NOT MATCHED
			THEN INSERT (id, zdarzenie_id, poz_id, numer)
			VALUES (src.id, src.zdarzenie_id, src.poz_id, src.numer);
			SET @Merged = 1;
		END

		IF @TableName = 'zdarzenia_krytyczne' BEGIN
			MERGE INTO ncts2.zdarzenia_krytyczne AS tgt
			USING [WI_StageODS].ncts2.zdarzenia_krytyczne AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.operacja_tranzytowa_id=src.operacja_tranzytowa_id, tgt.uzytkownik_id=src.uzytkownik_id, tgt.komunikat_id=src.komunikat_id, tgt.etykieta=src.etykieta, tgt.czas_wykrycia=src.czas_wykrycia, tgt.informacja=src.informacja
			WHEN NOT MATCHED
			THEN INSERT (id, operacja_tranzytowa_id, uzytkownik_id, komunikat_id, etykieta, czas_wykrycia, informacja)
			VALUES (src.id, src.operacja_tranzytowa_id, src.uzytkownik_id, src.komunikat_id, src.etykieta, src.czas_wykrycia, src.informacja);
			SET @Merged = 1;
		END

		IF @TableName = 'zdarzenia_krytyczne_konfiguracja' BEGIN
			MERGE INTO ncts2.zdarzenia_krytyczne_konfiguracja AS tgt
			USING [WI_StageODS].ncts2.zdarzenia_krytyczne_konfiguracja AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.uzytkownik_id=src.uzytkownik_id, tgt.etykieta=src.etykieta, tgt.czy_aktywne=src.czy_aktywne, tgt.wazne_do=src.wazne_do, tgt.procedura_uproszczona=src.procedura_uproszczona, tgt.tin_nadawcy=src.tin_nadawcy, tgt.tin_odbiorcy=src.tin_odbiorcy, tgt.tin_glownego_zobowiazanego=src.tin_glownego_zobowiazanego, tgt.numer_karnetu_tir=src.numer_karnetu_tir
			WHEN NOT MATCHED
			THEN INSERT (id, uzytkownik_id, etykieta, czy_aktywne, wazne_do, procedura_uproszczona, tin_nadawcy, tin_odbiorcy, tin_glownego_zobowiazanego, numer_karnetu_tir)
			VALUES (src.id, src.uzytkownik_id, src.etykieta, src.czy_aktywne, src.wazne_do, src.procedura_uproszczona, src.tin_nadawcy, src.tin_odbiorcy, src.tin_glownego_zobowiazanego, src.numer_karnetu_tir);
			SET @Merged = 1;
		END

		IF @TableName = 'zdarzenia_zamkniecia_celne' BEGIN
			MERGE INTO ncts2.zdarzenia_zamkniecia_celne AS tgt
			USING [WI_StageODS].ncts2.zdarzenia_zamkniecia_celne AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.zdarzenie_id=src.zdarzenie_id, tgt.poz_id=src.poz_id, tgt.numer=src.numer
			WHEN NOT MATCHED
			THEN INSERT (id, zdarzenie_id, poz_id, numer)
			VALUES (src.id, src.zdarzenie_id, src.poz_id, src.numer);
			SET @Merged = 1;
		END

		IF @TableName = 'parametry' BEGIN
			MERGE INTO ncts2.parametry AS tgt
			USING [WI_StageODS].ncts2.parametry AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.sekcja=src.sekcja, tgt.nazwa=src.nazwa, tgt.opis=src.opis, tgt.wartosc=src.wartosc
			WHEN NOT MATCHED
			THEN INSERT (id, sekcja, nazwa, opis, wartosc)
			VALUES (src.id, src.sekcja, src.nazwa, src.opis, src.wartosc);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_podmioty' BEGIN
			MERGE INTO ncts2.ref_podmioty AS tgt
			USING [WI_StageODS].ncts2.ref_podmioty AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.idsisc=src.idsisc, tgt.numereori=src.numereori, tgt.imie=src.imie, tgt.nazwisko=src.nazwisko, tgt.nazwa_pelna=src.nazwa_pelna, tgt.nazwa_skrocona=src.nazwa_skrocona, tgt.adres_ulica=src.adres_ulica, tgt.adres_kod_pocztowy=src.adres_kod_pocztowy, tgt.adres_miejscowosc=src.adres_miejscowosc, tgt.adres_kod_kraju=src.adres_kod_kraju, tgt.adres_kod_jezyka=src.adres_kod_jezyka, tgt.adres_telefon=src.adres_telefon, tgt.adres_fax=src.adres_fax, tgt.adres_email=src.adres_email, tgt.data_od=src.data_od, tgt.data_do=src.data_do
			WHEN NOT MATCHED
			THEN INSERT (id, idsisc, numereori, imie, nazwisko, nazwa_pelna, nazwa_skrocona, adres_ulica, adres_kod_pocztowy, adres_miejscowosc, adres_kod_kraju, adres_kod_jezyka, adres_telefon, adres_fax, adres_email, data_od, data_do)
			VALUES (src.id, src.idsisc, src.numereori, src.imie, src.nazwisko, src.nazwa_pelna, src.nazwa_skrocona, src.adres_ulica, src.adres_kod_pocztowy, src.adres_miejscowosc, src.adres_kod_kraju, src.adres_kod_jezyka, src.adres_telefon, src.adres_fax, src.adres_email, src.data_od, src.data_do);
			SET @Merged = 1;
		END

		IF @TableName = 'ref_reprezentanci' BEGIN
			MERGE INTO ncts2.ref_reprezentanci AS tgt
			USING [WI_StageODS].ncts2.ref_reprezentanci AS src
			ON (tgt.id=src.id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.imie=src.imie, tgt.nazwisko=src.nazwisko, tgt.data_od=src.data_od, tgt.data_do=src.data_do, tgt.idsisc_rof=src.idsisc_rof, tgt.status=src.status, tgt.pesel=src.pesel
			WHEN NOT MATCHED
			THEN INSERT (id, imie, nazwisko, data_od, data_do, idsisc_rof, status, pesel)
			VALUES (src.id, src.imie, src.nazwisko, src.data_od, src.data_do, src.idsisc_rof, src.status, src.pesel);
			SET @Merged = 1;
		END

		IF (@Merged = 0)
		BEGIN
				DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
				THROW 51002, @Info, 0;
					END
				END
			;