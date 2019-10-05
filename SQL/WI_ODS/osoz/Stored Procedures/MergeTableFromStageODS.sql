-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2014-05-29
-- Description:	
-- =============================================

CREATE PROCEDURE [osoz].[MergeTableFromStageODS] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'kontrahenci' BEGIN
		MERGE INTO osoz.kontrahenci AS tgt
		USING [WI_StageODS].osoz.kontrahenci AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.adres_kod_pocztowy=src.adres_kod_pocztowy, tgt.adres_kraj=src.adres_kraj, tgt.adres_miejscowosc=src.adres_miejscowosc, tgt.adres_numer_budynku=src.adres_numer_budynku, tgt.adres_numer_lokalu=src.adres_numer_lokalu, tgt.adres_ulica=src.adres_ulica, tgt.eori=src.eori, tgt.nazwa=src.nazwa, tgt.nip=src.nip, tgt.otrzymywanie_powiadomien=src.otrzymywanie_powiadomien, tgt.regon=src.regon, tgt.tin=src.tin
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, adres_kod_pocztowy, adres_kraj, adres_miejscowosc, adres_numer_budynku, adres_numer_lokalu, adres_ulica, eori, nazwa, nip, otrzymywanie_powiadomien, regon, tin)
		VALUES (src.id, src.czas_modyfikacji, src.adres_kod_pocztowy, src.adres_kraj, src.adres_miejscowosc, src.adres_numer_budynku, src.adres_numer_lokalu, src.adres_ulica, src.eori, src.nazwa, src.nip, src.otrzymywanie_powiadomien, src.regon, src.tin);
	END
	ELSE IF @TableName = 'pozwolenia' BEGIN
		MERGE INTO osoz.pozwolenia AS tgt
		USING [WI_StageODS].osoz.pozwolenia AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.data_wydania_pozwolenia=src.data_wydania_pozwolenia, tgt.kwota_referencyjna=src.kwota_referencyjna, tgt.numer_pozwolenia=src.numer_pozwolenia, tgt.numer_sprawy=src.numer_sprawy, tgt.procent_kwoty_referencyjnej=src.procent_kwoty_referencyjnej
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, data_wydania_pozwolenia, kwota_referencyjna, numer_pozwolenia, numer_sprawy, procent_kwoty_referencyjnej)
		VALUES (src.id, src.czas_modyfikacji, src.data_wydania_pozwolenia, src.kwota_referencyjna, src.numer_pozwolenia, src.numer_sprawy, src.procent_kwoty_referencyjnej);
	END
	ELSE IF @TableName = 'sl_waluty' BEGIN
		MERGE INTO osoz.sl_waluty  AS tgt
		USING [WI_StageODS].osoz.sl_waluty AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.aktywna=src.aktywna, tgt.kod=src.kod, tgt.nazwa=src.nazwa, tgt.opis=src.opis, tgt.id_pdr=src.id_pdr
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, aktywna, kod, nazwa, opis, id_pdr)
		VALUES (src.id, src.czas_modyfikacji, src.aktywna, src.kod, src.nazwa, src.opis, src.id_pdr);
	END
	ELSE IF @TableName = 'sl_kraje_ue' BEGIN
		MERGE INTO osoz.sl_kraje_ue AS tgt
		USING [WI_StageODS].osoz.sl_kraje_ue AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.aktywna=src.aktywna, tgt.kod=src.kod, tgt.nazwa=src.nazwa, tgt.opis=src.opis, tgt.waznosc_komunikatow=src.waznosc_komunikatow, tgt.id_pdr=src.id_pdr
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, aktywna, kod, nazwa, opis, waznosc_komunikatow, id_pdr)
		VALUES (src.id, src.czas_modyfikacji, src.aktywna, src.kod, src.nazwa, src.opis, src.waznosc_komunikatow, src.id_pdr);
	END
	ELSE IF @TableName = 'struktura_organizacyjna' BEGIN
		MERGE INTO osoz.struktura_organizacyjna AS tgt
		USING [WI_StageODS].osoz.struktura_organizacyjna AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.aktywna=src.aktywna, tgt.kod=src.kod, tgt.nazwa=src.nazwa, tgt.opis=src.opis, tgt.adres_kod_pocztowy=src.adres_kod_pocztowy, tgt.adres_kraj=src.adres_kraj, tgt.adres_miejscowosc=src.adres_miejscowosc, tgt.adres_numer_lokalu=src.adres_numer_lokalu, tgt.email=src.email, tgt.kod_kraju_jednostki=src.kod_kraju_jednostki, tgt.organ_jednostki=src.organ_jednostki, tgt.poziom_jednostki=src.poziom_jednostki, tgt.rodzaj_jednostki=src.rodzaj_jednostki, tgt.jednostka_nadrzedna_id=src.jednostka_nadrzedna_id, tgt.id_pdr=src.id_pdr, tgt.adres_ulica_nr_budynku=src.adres_ulica_nr_budynku
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, aktywna, kod, nazwa, opis, adres_kod_pocztowy, adres_kraj, adres_miejscowosc, adres_numer_lokalu, email, kod_kraju_jednostki, organ_jednostki, poziom_jednostki, rodzaj_jednostki, jednostka_nadrzedna_id, id_pdr, adres_ulica_nr_budynku)
		VALUES (src.id, src.czas_modyfikacji, src.aktywna, src.kod, src.nazwa, src.opis, src.adres_kod_pocztowy, src.adres_kraj, src.adres_miejscowosc, src.adres_numer_lokalu, src.email, src.kod_kraju_jednostki, src.organ_jednostki, src.poziom_jednostki, src.rodzaj_jednostki, src.jednostka_nadrzedna_id, src.id_pdr, src.adres_ulica_nr_budynku);
	END
	ELSE IF @TableName = 'towary_potencjalnie_wrazliwe' BEGIN
		MERGE INTO osoz.towary_potencjalnie_wrazliwe AS tgt
		USING [WI_StageODS].osoz.towary_potencjalnie_wrazliwe AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.kod_towaru=src.kod_towaru, tgt.opis=src.opis, tgt.aktywna=src.aktywna, tgt.id_pdr=src.id_pdr
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, kod_towaru, opis, aktywna, id_pdr)
		VALUES (src.id, src.czas_modyfikacji, src.kod_towaru, src.opis, src.aktywna, src.id_pdr);
	END
	ELSE IF @TableName = 'gwaranci' BEGIN
		MERGE INTO osoz.gwaranci AS tgt
		USING [WI_StageODS].osoz.gwaranci AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.adres_kod_pocztowy=src.adres_kod_pocztowy, tgt.adres_kraj=src.adres_kraj, tgt.adres_miejscowosc=src.adres_miejscowosc, tgt.adres_numer_budynku=src.adres_numer_budynku, tgt.adres_numer_lokalu=src.adres_numer_lokalu, tgt.adres_ulica=src.adres_ulica, tgt.nazwa=src.nazwa, tgt.nip=src.nip, tgt.tin=src.tin, tgt.aktywna=src.aktywna, tgt.id_pdr=src.id_pdr
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, adres_kod_pocztowy, adres_kraj, adres_miejscowosc, adres_numer_budynku, adres_numer_lokalu, adres_ulica, nazwa, nip, tin, aktywna, id_pdr)
		VALUES (src.id, src.czas_modyfikacji, src.adres_kod_pocztowy, src.adres_kraj, src.adres_miejscowosc, src.adres_numer_budynku, src.adres_numer_lokalu, src.adres_ulica, src.nazwa, src.nip, src.tin, src.aktywna, src.id_pdr);
	END
	ELSE IF @TableName = 'forma_zabezpieczenia' BEGIN
		MERGE INTO osoz.forma_zabezpieczenia AS tgt
		USING [WI_StageODS].osoz.forma_zabezpieczenia AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.kod=src.kod, tgt.nazwa=src.nazwa
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, kod, nazwa)
		VALUES (src.id, src.czas_modyfikacji, src.kod, src.nazwa);
	END
	ELSE IF @TableName = 'gwarancje' BEGIN
		MERGE INTO osoz.gwarancje AS tgt
		USING [WI_StageODS].osoz.gwarancje AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.data_wystawienia_gwarancji=src.data_wystawienia_gwarancji, tgt.numer_gwarancji=src.numer_gwarancji, tgt.gwarancja_wazna_do=src.gwarancja_wazna_do, tgt.gwarancja_wazna_od=src.gwarancja_wazna_od, tgt.forma_zabezpieczenia_id=src.forma_zabezpieczenia_id, tgt.gwarant_id=src.gwarant_id, tgt.kwota_gwarancji=src.kwota_gwarancji
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, data_wystawienia_gwarancji, numer_gwarancji, gwarancja_wazna_do, gwarancja_wazna_od, forma_zabezpieczenia_id, gwarant_id, kwota_gwarancji)
		VALUES (src.id, src.czas_modyfikacji, src.data_wystawienia_gwarancji, src.numer_gwarancji, src.gwarancja_wazna_do, src.gwarancja_wazna_od, src.forma_zabezpieczenia_id, src.gwarant_id, src.kwota_gwarancji);
	END
	ELSE IF @TableName = 'zabezpieczenia' BEGIN
		MERGE INTO osoz.zabezpieczenia AS tgt
		USING [WI_StageODS].osoz.zabezpieczenia AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.data_decyzji_zgody_na_ryczalt=src.data_decyzji_zgody_na_ryczalt, tgt.data_ostatniej_windykacji=src.data_ostatniej_windykacji, tgt.data_przyjecia_zabezpieczenia_gry=src.data_przyjecia_zabezpieczenia_gry, tgt.data_rejestracji_zabezpieczenia=src.data_rejestracji_zabezpieczenia, tgt.data_wydania_karnetu=src.data_wydania_karnetu, tgt.data_wydania_potwierdzenia=src.data_wydania_potwierdzenia, tgt.data_wydania_zwolnienia=src.data_wydania_zwolnienia, tgt.grn=src.grn, tgt.karnet_papierowy_porzekazany=src.karnet_papierowy_porzekazany, tgt.karnet_tir=src.karnet_tir, tgt.kod_dostepu=src.kod_dostepu, tgt.kontrahent_windykowany=src.kontrahent_windykowany, tgt.kraj_zlozenia_zabezpieczenia=src.kraj_zlozenia_zabezpieczenia, tgt.krotnosc_zlozonych_zabezpieczen=src.krotnosc_zlozonych_zabezpieczen, tgt.kwota_windykacji=src.kwota_windykacji, tgt.kwota_zabezpieczenia=src.kwota_zabezpieczenia, tgt.liczba_kasyn_punktow_przyjmowania_zakladow=src.liczba_kasyn_punktow_przyjmowania_zakladow, tgt.nabywca_wewnetrzny_z_zaplacona_akcyza=src.nabywca_wewnetrzny_z_zaplacona_akcyza, tgt.niewazne_na_terenie_ue=src.niewazne_na_terenie_ue, tgt.nr_decyzji_naczelnika_urzedu=src.nr_decyzji_naczelnika_urzedu, tgt.nr_decyzji_zgoda_na_ryczalt=src.nr_decyzji_zgoda_na_ryczalt, tgt.obcy_sklad_podatkowy=src.obcy_sklad_podatkowy, tgt.obszar_waznosci_akcyza=src.obszar_waznosci_akcyza, tgt.podatnik_okreslony_w_art_13_ust_3=src.podatnik_okreslony_w_art_13_ust_3, tgt.powod_uniewaznienia=src.powod_uniewaznienia, tgt.przedstawiciel_podatkowy=src.przedstawiciel_podatkowy, tgt.rodzaj=src.rodzaj, tgt.saldo_zabezpieczenia=src.saldo_zabezpieczenia, tgt.status=src.status, tgt.typ=src.typ, tgt.urzad_przeznaczenia=src.urzad_przeznaczenia, tgt.urzad_wyjscia=src.urzad_wyjscia, tgt.wariant=src.wariant, tgt.wazne_do=src.wazne_do, tgt.wazne_na_towary_wrazliwe=src.wazne_na_towary_wrazliwe, tgt.wazne_na_towary_zawieszone=src.wazne_na_towary_zawieszone, tgt.wazne_od=src.wazne_od, tgt.wskaznik_uzycia=src.wskaznik_uzycia, tgt.zgoda_naczelnika=src.zgoda_naczelnika, tgt.kontrahent_id=src.kontrahent_id, tgt.pozwolenie_id=src.pozwolenie_id, tgt.urzad_zlozenia_zabezpieczenia_id=src.urzad_zlozenia_zabezpieczenia_id, tgt.sl_waluty_id=src.sl_waluty_id, tgt.nr_decyzji_kancelaryjny=src.nr_decyzji_kancelaryjny, tgt.opl_paliw=src.opl_paliw, tgt.w_tym_opl_paliw=src.w_tym_opl_paliw
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, data_decyzji_zgody_na_ryczalt, data_ostatniej_windykacji, data_przyjecia_zabezpieczenia_gry, data_rejestracji_zabezpieczenia, data_wydania_karnetu, data_wydania_potwierdzenia, data_wydania_zwolnienia, grn, karnet_papierowy_porzekazany, karnet_tir, kod_dostepu, kontrahent_windykowany, kraj_zlozenia_zabezpieczenia, krotnosc_zlozonych_zabezpieczen, kwota_windykacji, kwota_zabezpieczenia, liczba_kasyn_punktow_przyjmowania_zakladow, nabywca_wewnetrzny_z_zaplacona_akcyza, niewazne_na_terenie_ue, nr_decyzji_naczelnika_urzedu, nr_decyzji_zgoda_na_ryczalt, obcy_sklad_podatkowy, obszar_waznosci_akcyza, podatnik_okreslony_w_art_13_ust_3, powod_uniewaznienia, przedstawiciel_podatkowy, rodzaj, saldo_zabezpieczenia, status, typ, urzad_przeznaczenia, urzad_wyjscia, wariant, wazne_do, wazne_na_towary_wrazliwe, wazne_na_towary_zawieszone, wazne_od, wskaznik_uzycia, zgoda_naczelnika, kontrahent_id, pozwolenie_id, urzad_zlozenia_zabezpieczenia_id, sl_waluty_id, nr_decyzji_kancelaryjny, opl_paliw, w_tym_opl_paliw)
		VALUES (src.id, src.czas_modyfikacji, src.data_decyzji_zgody_na_ryczalt, src.data_ostatniej_windykacji, src.data_przyjecia_zabezpieczenia_gry, src.data_rejestracji_zabezpieczenia, src.data_wydania_karnetu, src.data_wydania_potwierdzenia, src.data_wydania_zwolnienia, src.grn, src.karnet_papierowy_porzekazany, src.karnet_tir, src.kod_dostepu, src.kontrahent_windykowany, src.kraj_zlozenia_zabezpieczenia, src.krotnosc_zlozonych_zabezpieczen, src.kwota_windykacji, src.kwota_zabezpieczenia, src.liczba_kasyn_punktow_przyjmowania_zakladow, src.nabywca_wewnetrzny_z_zaplacona_akcyza, src.niewazne_na_terenie_ue, src.nr_decyzji_naczelnika_urzedu, src.nr_decyzji_zgoda_na_ryczalt, src.obcy_sklad_podatkowy, src.obszar_waznosci_akcyza, src.podatnik_okreslony_w_art_13_ust_3, src.powod_uniewaznienia, src.przedstawiciel_podatkowy, src.rodzaj, src.saldo_zabezpieczenia, src.status, src.typ, src.urzad_przeznaczenia, src.urzad_wyjscia, src.wariant, src.wazne_do, src.wazne_na_towary_wrazliwe, src.wazne_na_towary_zawieszone, src.wazne_od, src.wskaznik_uzycia, src.zgoda_naczelnika, src.kontrahent_id, src.pozwolenie_id, src.urzad_zlozenia_zabezpieczenia_id, src.sl_waluty_id, src.nr_decyzji_kancelaryjny, src.opl_paliw, src.w_tym_opl_paliw);
	END
	ELSE IF @TableName = 'zwrot_kwoty_zabezpieczenia' BEGIN
		MERGE INTO osoz.zwrot_kwoty_zabezpieczenia AS tgt
		USING [WI_StageODS].osoz.zwrot_kwoty_zabezpieczenia AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.calosciowy=src.calosciowy, tgt.data_zwrotu=src.data_zwrotu, tgt.kwota_glowna=src.kwota_glowna, tgt.kwota_zwrotu=src.kwota_zwrotu, tgt.oprocentowanie=src.oprocentowanie, tgt.podstawa_zwrotu=src.podstawa_zwrotu, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, calosciowy, data_zwrotu, kwota_glowna, kwota_zwrotu, oprocentowanie, podstawa_zwrotu, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.calosciowy, src.data_zwrotu, src.kwota_glowna, src.kwota_zwrotu, src.oprocentowanie, src.podstawa_zwrotu, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'zezwolenia_gry_hazardowe' BEGIN
		MERGE INTO osoz.zezwolenia_gry_hazardowe AS tgt
		USING [WI_StageODS].osoz.zezwolenia_gry_hazardowe AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.data_zezwolenia_do=src.data_zezwolenia_do, tgt.data_zezwolenia_od=src.data_zezwolenia_od, tgt.data_wydania_zezwolenia=src.data_wydania_zezwolenia, tgt.numer_zezwolenia=src.numer_zezwolenia, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, data_zezwolenia_do, data_zezwolenia_od, data_wydania_zezwolenia, numer_zezwolenia, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.data_zezwolenia_do, src.data_zezwolenia_od, src.data_wydania_zezwolenia, src.numer_zezwolenia, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'rodzaje_dzialalnosci_dla_koncesji_zezwolen' BEGIN
		MERGE INTO osoz.rodzaje_dzialalnosci_dla_koncesji_zezwolen AS tgt
		USING [WI_StageODS].osoz.rodzaje_dzialalnosci_dla_koncesji_zezwolen AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.rodzaj_dzialalnosci_dla_koncesji_zezwolenia=src.rodzaj_dzialalnosci_dla_koncesji_zezwolenia, tgt.zezwolenie_gry_hazardowe_id=src.zezwolenie_gry_hazardowe_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, rodzaj_dzialalnosci_dla_koncesji_zezwolenia, zezwolenie_gry_hazardowe_id)
		VALUES (src.id, src.czas_modyfikacji, src.rodzaj_dzialalnosci_dla_koncesji_zezwolenia, src.zezwolenie_gry_hazardowe_id);
	END
	ELSE IF @TableName = 'towary' BEGIN
		MERGE INTO osoz.towary AS tgt
		USING [WI_StageODS].osoz.towary AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.kod_towaru=src.kod_towaru, tgt.opis=src.opis, tgt.potencjalnie_wrazliwy=src.potencjalnie_wrazliwy
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, kod_towaru, opis, potencjalnie_wrazliwy)
		VALUES (src.id, src.czas_modyfikacji, src.kod_towaru, src.opis, src.potencjalnie_wrazliwy);
	END
	ELSE IF @TableName = 'zabezpieczenia_towary' BEGIN
		MERGE INTO osoz.zabezpieczenia_towary AS tgt
		USING [WI_StageODS].osoz.zabezpieczenia_towary AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.wykluczony=src.wykluczony, tgt.towar_id=src.towar_id, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, wykluczony, towar_id, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.wykluczony, src.towar_id, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'zabezpieczenia_generalne_procedury' BEGIN
		MERGE INTO osoz.zabezpieczenia_generalne_procedury AS tgt
		USING [WI_StageODS].osoz.zabezpieczenia_generalne_procedury AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.jednostka_id=src.jednostka_id, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, jednostka_id, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.jednostka_id, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'procedury_celne' BEGIN
		MERGE INTO osoz.procedury_celne AS tgt
		USING [WI_StageODS].osoz.procedury_celne AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.aktywna=src.aktywna, tgt.kod=src.kod, tgt.nazwa=src.nazwa, tgt.opis=src.opis, tgt.typ=src.typ
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, aktywna, kod, nazwa, opis, typ)
		VALUES (src.id, src.czas_modyfikacji, src.aktywna, src.kod, src.nazwa, src.opis, src.typ);
	END
	ELSE IF @TableName = 'procedury_pdr' BEGIN
		MERGE INTO osoz.procedury_pdr AS tgt
		USING [WI_StageODS].osoz.procedury_pdr AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.kod=src.kod, tgt.nazwa=src.nazwa, tgt.procedura_celna_id=src.procedura_celna_id, tgt.aktywna=src.aktywna, tgt.id_pdr=src.id_pdr
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, kod, nazwa, procedura_celna_id, aktywna, id_pdr)
		VALUES (src.id, src.czas_modyfikacji, src.kod, src.nazwa, src.procedura_celna_id, src.aktywna, src.id_pdr);
	END
	ELSE IF @TableName = 'zabezpieczenia_generalne_procedury_procedury' BEGIN
		MERGE INTO osoz.zabezpieczenia_generalne_procedury_procedury AS tgt
		USING [WI_StageODS].osoz.zabezpieczenia_generalne_procedury_procedury AS src
		ON (tgt.zabezpieczenia_generalne_procedury_id=src.zabezpieczenia_generalne_procedury_id AND tgt.procedury_id=src.procedury_id)
		WHEN NOT MATCHED
		THEN INSERT (zabezpieczenia_generalne_procedury_id, procedury_id)
		VALUES (src.zabezpieczenia_generalne_procedury_id, src.procedury_id);
	END
	ELSE IF @TableName = 'sl_ograniczenie_waznosci' BEGIN
		MERGE INTO osoz.sl_ograniczenie_waznosci AS tgt
		USING [WI_StageODS].osoz.sl_ograniczenie_waznosci AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.aktywna=src.aktywna, tgt.kod=src.kod, tgt.nazwa=src.nazwa, tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, aktywna, kod, nazwa, opis)
		VALUES (src.id, src.czas_modyfikacji, src.aktywna, src.kod, src.nazwa, src.opis);
	END
	ELSE IF @TableName = 'zabezpieczenia_sl_ograniczenie_waznosci' BEGIN
		MERGE INTO osoz.zabezpieczenia_sl_ograniczenie_waznosci AS tgt
		USING [WI_StageODS].osoz.zabezpieczenia_sl_ograniczenie_waznosci AS src
		ON (tgt.zabezpieczenie_id=src.zabezpieczenie_id AND tgt.sl_ograniczenie_waznosci_id=src.sl_ograniczenie_waznosci_id)
		WHEN NOT MATCHED
		THEN INSERT (zabezpieczenie_id, sl_ograniczenie_waznosci_id)
		VALUES (src.zabezpieczenie_id, src.sl_ograniczenie_waznosci_id);
	END
	ELSE IF @TableName = 'sl_nazwy_seed' BEGIN
		MERGE INTO osoz.sl_nazwy_seed AS tgt
		USING [WI_StageODS].osoz.sl_nazwy_seed AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.aktywna=src.aktywna, tgt.kod=src.kod, tgt.nazwa=src.nazwa, tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, aktywna, kod, nazwa, opis)
		VALUES (src.id, src.czas_modyfikacji, src.aktywna, src.kod, src.nazwa, src.opis);
	END
	ELSE IF @TableName = 'status_kontrahenta' BEGIN
		MERGE INTO osoz.status_kontrahenta AS tgt
		USING [WI_StageODS].osoz.status_kontrahenta AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.seed=src.seed, tgt.kontrahent_id=src.kontrahent_id, tgt.nazwa_seed_id=src.nazwa_seed_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, seed, kontrahent_id, nazwa_seed_id)
		VALUES (src.id, src.czas_modyfikacji, src.seed, src.kontrahent_id, src.nazwa_seed_id);
	END
	ELSE IF @TableName = 'zabezpieczenia_status_kontrahenta' BEGIN
		MERGE INTO osoz.zabezpieczenia_status_kontrahenta tgt
		USING [WI_StageODS].osoz.zabezpieczenia_status_kontrahenta src
		ON (tgt.zabezpieczenie_id=src.zabezpieczenie_id AND tgt.status_kontrahenta_id=src.status_kontrahenta_id)
		WHEN NOT MATCHED
		THEN INSERT (zabezpieczenie_id, status_kontrahenta_id)
		VALUES (src.zabezpieczenie_id, src.status_kontrahenta_id);
	END
	ELSE IF @TableName = 'decyzje_w_sprawie_zwolnienia' BEGIN
		MERGE INTO osoz.decyzje_w_sprawie_zwolnienia tgt
		USING [WI_StageODS].osoz.decyzje_w_sprawie_zwolnienia AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.data_rejestracji_zwolnienia=src.data_rejestracji_zwolnienia, tgt.data_zmiany_decyzji=src.data_zmiany_decyzji, tgt.kwota_zwolnienia=src.kwota_zwolnienia, tgt.numer_decyzji_kancelaryjny=src.numer_decyzji_kancelaryjny, tgt.obcy_sklad_podatkowy=src.obcy_sklad_podatkowy, tgt.status_decyzji=src.status_decyzji, tgt.wazne_do=src.wazne_do, tgt.wazne_od=src.wazne_od, tgt.zabezpieczenie_id=src.zabezpieczenie_id, tgt.numer_decyzji_naczelnika_urzedu=src.numer_decyzji_naczelnika_urzedu, tgt.urzad_zmieniajacy_decyzje_id=src.urzad_zmieniajacy_decyzje_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, data_rejestracji_zwolnienia, data_zmiany_decyzji, kwota_zwolnienia, numer_decyzji_kancelaryjny, obcy_sklad_podatkowy, status_decyzji, wazne_do, wazne_od, zabezpieczenie_id, numer_decyzji_naczelnika_urzedu, urzad_zmieniajacy_decyzje_id)
		VALUES (src.id, src.czas_modyfikacji, src.data_rejestracji_zwolnienia, src.data_zmiany_decyzji, src.kwota_zwolnienia, src.numer_decyzji_kancelaryjny, src.obcy_sklad_podatkowy, src.status_decyzji, src.wazne_do, src.wazne_od, src.zabezpieczenie_id, src.numer_decyzji_naczelnika_urzedu, src.urzad_zmieniajacy_decyzje_id);
	END
	ELSE IF @TableName = 'decyzcje_zwolnienia_seed' BEGIN
		MERGE INTO osoz.decyzcje_zwolnienia_seed AS tgt
		USING [WI_StageODS].osoz.decyzcje_zwolnienia_seed AS src
		ON (tgt.decyzja_zwolnienia_id=src.decyzja_zwolnienia_id AND tgt.seed_id=src.seed_id)
		WHEN NOT MATCHED
		THEN INSERT (decyzja_zwolnienia_id, seed_id)
		VALUES (src.decyzja_zwolnienia_id, src.seed_id);
	END
	ELSE IF @TableName = 'dokumenty_obciazajace' BEGIN
		MERGE INTO osoz.dokumenty_obciazajace AS tgt
		USING [WI_StageODS].osoz.dokumenty_obciazajace AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.kwota_naleznosci=src.kwota_naleznosci, tgt.numer_dokumentu=src.numer_dokumentu, tgt.termin_zaplaty_dokumentu=src.termin_zaplaty_dokumentu
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, kwota_naleznosci, numer_dokumentu, termin_zaplaty_dokumentu)
		VALUES (src.id, src.czas_modyfikacji, src.kwota_naleznosci, src.numer_dokumentu, src.termin_zaplaty_dokumentu);
	END
	ELSE IF @TableName = 'uzycia_zabezpieczenia' BEGIN
		MERGE INTO osoz.uzycia_zabezpieczenia AS tgt
		USING [WI_StageODS].osoz.uzycia_zabezpieczenia AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.data_uzycia=src.data_uzycia, tgt.kod_urzedu_wyjscia=src.kod_urzedu_wyjscia, tgt.kwota_uzycia=src.kwota_uzycia, tgt.saldo_uzycia=src.saldo_uzycia, tgt.status=src.status, tgt.wycofane=src.wycofane, tgt.dokument_obciazajacy_id=src.dokument_obciazajacy_id, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, data_uzycia, kod_urzedu_wyjscia, kwota_uzycia, saldo_uzycia, status, wycofane, dokument_obciazajacy_id, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.data_uzycia, src.kod_urzedu_wyjscia, src.kwota_uzycia, src.saldo_uzycia, src.status, src.wycofane, src.dokument_obciazajacy_id, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'procedury_akcyzowe' BEGIN
		MERGE INTO osoz.procedury_akcyzowe AS tgt
		USING [WI_StageODS].osoz.procedury_akcyzowe AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.aktywna=src.aktywna, tgt.kod=src.kod, tgt.nazwa=src.nazwa, tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, aktywna, kod, nazwa, opis)
		VALUES (src.id, src.czas_modyfikacji, src.aktywna, src.kod, src.nazwa, src.opis);
	END
	ELSE IF @TableName = 'zabezpieczenia_procedury_akcyzowe' BEGIN
		MERGE INTO osoz.zabezpieczenia_procedury_akcyzowe AS tgt
		USING [WI_StageODS].osoz.zabezpieczenia_procedury_akcyzowe AS src
		ON (tgt.zabezpieczenie_id=src.zabezpieczenie_id AND tgt.procedura_akcyzowa_id=src.procedura_akcyzowa_id)
		WHEN NOT MATCHED
		THEN INSERT (zabezpieczenie_id, procedura_akcyzowa_id)
		VALUES (src.zabezpieczenie_id, src.procedura_akcyzowa_id);
	END
	ELSE IF @TableName = 'hipoteki' BEGIN
		MERGE INTO osoz.hipoteki AS tgt
		USING [WI_StageODS].osoz.hipoteki AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.adres_hipoteki_kod_pocztowy=src.adres_hipoteki_kod_pocztowy, tgt.adres_hipoteki_miejscowosc=src.adres_hipoteki_miejscowosc, tgt.adres_hipoteki_numer_budynku=src.adres_hipoteki_numer_budynku, tgt.adres_hipoteki_numer_lokalu=src.adres_hipoteki_numer_lokalu, tgt.adres_hipoteki_ulica=src.adres_hipoteki_ulica, tgt.numer_ksiegi_wieczystej=src.numer_ksiegi_wieczystej, tgt.wartosc_hipoteki=src.wartosc_hipoteki
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, adres_hipoteki_kod_pocztowy, adres_hipoteki_miejscowosc, adres_hipoteki_numer_budynku, adres_hipoteki_numer_lokalu, adres_hipoteki_ulica, numer_ksiegi_wieczystej, wartosc_hipoteki)
		VALUES (src.id, src.czas_modyfikacji, src.adres_hipoteki_kod_pocztowy, src.adres_hipoteki_miejscowosc, src.adres_hipoteki_numer_budynku, src.adres_hipoteki_numer_lokalu, src.adres_hipoteki_ulica, src.numer_ksiegi_wieczystej, src.wartosc_hipoteki);
	END
	ELSE IF @TableName = 'zabezpieczenie_forma_zabezpieczenia_gier' BEGIN
		MERGE INTO osoz.zabezpieczenie_forma_zabezpieczenia_gier AS tgt
		USING [WI_StageODS].osoz.zabezpieczenie_forma_zabezpieczenia_gier AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.status_wpisu=src.status_wpisu, tgt.wartosc_zabezpieczenia=src.wartosc_zabezpieczenia, tgt.forma_zabezpieczenia_id=src.forma_zabezpieczenia_id, tgt.gwarancja_id=src.gwarancja_id, tgt.hipoteka_id=src.hipoteka_id, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, status_wpisu, wartosc_zabezpieczenia, forma_zabezpieczenia_id, gwarancja_id, hipoteka_id, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.status_wpisu, src.wartosc_zabezpieczenia, src.forma_zabezpieczenia_id, src.gwarancja_id, src.hipoteka_id, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'uzupelnienia_kwoty' BEGIN
		MERGE INTO osoz.uzupelnienia_kwoty AS tgt
		USING [WI_StageODS].osoz.uzupelnienia_kwoty AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.data_uzupelnienia=src.data_uzupelnienia, tgt.kwota_uzupelnienia=src.kwota_uzupelnienia, tgt.forma_zabezpieczenia_id=src.forma_zabezpieczenia_id, tgt.sl_waluty_id=src.sl_waluty_id, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, data_uzupelnienia, kwota_uzupelnienia, forma_zabezpieczenia_id, sl_waluty_id, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.data_uzupelnienia, src.kwota_uzupelnienia, src.forma_zabezpieczenia_id, src.sl_waluty_id, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'pokwitowania' BEGIN
		MERGE INTO osoz.pokwitowania AS tgt
		USING [WI_StageODS].osoz.pokwitowania AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.bezterminowe=src.bezterminowe, tgt.data_rejestracji=src.data_rejestracji, tgt.data_wydania_pokwitowania=src.data_wydania_pokwitowania, tgt.data_wydania_potwierdzenia=src.data_wydania_potwierdzenia, tgt.kwota_pokwitowania_potwierdzenia=src.kwota_pokwitowania_potwierdzenia, tgt.nabywca_wewnetrzny_z_zaplacona_akcyza=src.nabywca_wewnetrzny_z_zaplacona_akcyza, tgt.nr=src.nr, tgt.numer_pokwitowania=src.numer_pokwitowania, tgt.numer_potwierdzenia=src.numer_potwierdzenia, tgt.numer_sprawy=src.numer_sprawy, tgt.obcy_sklad_podatkowy=src.obcy_sklad_podatkowy, tgt.podatnik_okreslony_w_art_13_ust_3=src.podatnik_okreslony_w_art_13_ust_3, tgt.powod_odrzucenia=src.powod_odrzucenia, tgt.powod_uniewaznienia=src.powod_uniewaznienia, tgt.przedstawiciel_podatkowy=src.przedstawiciel_podatkowy, tgt.rodzaj=src.rodzaj, tgt.rodzaj_zabezpieczenia=src.rodzaj_zabezpieczenia, tgt.saldo=src.saldo, tgt.seria=src.seria, tgt.status=src.status, tgt.typ_zabezpieczenia=src.typ_zabezpieczenia, tgt.wazne_do=src.wazne_do, tgt.wazne_od=src.wazne_od, tgt.zlozenie_zab_przez_os_trzecia=src.zlozenie_zab_przez_os_trzecia, tgt.zwrocone_srodki=src.zwrocone_srodki, tgt.forma_zabezpieczenia_id=src.forma_zabezpieczenia_id, tgt.kontrahent_skladajacy_id=src.kontrahent_skladajacy_id, tgt.kontrahent_zobowiazany_id=src.kontrahent_zobowiazany_id, tgt.urzad_zlozenia_zabezpieczenia_id=src.urzad_zlozenia_zabezpieczenia_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, bezterminowe, data_rejestracji, data_wydania_pokwitowania, data_wydania_potwierdzenia, kwota_pokwitowania_potwierdzenia, nabywca_wewnetrzny_z_zaplacona_akcyza, nr, numer_pokwitowania, numer_potwierdzenia, numer_sprawy, obcy_sklad_podatkowy, podatnik_okreslony_w_art_13_ust_3, powod_odrzucenia, powod_uniewaznienia, przedstawiciel_podatkowy, rodzaj, rodzaj_zabezpieczenia, saldo, seria, status, typ_zabezpieczenia, wazne_do, wazne_od, zlozenie_zab_przez_os_trzecia, zwrocone_srodki, forma_zabezpieczenia_id, kontrahent_skladajacy_id, kontrahent_zobowiazany_id, urzad_zlozenia_zabezpieczenia_id)
		VALUES (src.id, src.czas_modyfikacji, src.bezterminowe, src.data_rejestracji, src.data_wydania_pokwitowania, src.data_wydania_potwierdzenia, src.kwota_pokwitowania_potwierdzenia, src.nabywca_wewnetrzny_z_zaplacona_akcyza, src.nr, src.numer_pokwitowania, src.numer_potwierdzenia, src.numer_sprawy, src.obcy_sklad_podatkowy, src.podatnik_okreslony_w_art_13_ust_3, src.powod_odrzucenia, src.powod_uniewaznienia, src.przedstawiciel_podatkowy, src.rodzaj, src.rodzaj_zabezpieczenia, src.saldo, src.seria, src.status, src.typ_zabezpieczenia, src.wazne_do, src.wazne_od, src.zlozenie_zab_przez_os_trzecia, src.zwrocone_srodki, src.forma_zabezpieczenia_id, src.kontrahent_skladajacy_id, src.kontrahent_zobowiazany_id, src.urzad_zlozenia_zabezpieczenia_id);
	END
	ELSE IF @TableName = 'kwoty_na_zabezpieczeniach' BEGIN
		MERGE INTO osoz.kwoty_na_zabezpieczeniach AS tgt
		USING [WI_StageODS].osoz.kwoty_na_zabezpieczeniach AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.kwota_na_zabezpieczeniu=src.kwota_na_zabezpieczeniu, tgt.pokwitowanie_id=src.pokwitowanie_id, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, kwota_na_zabezpieczeniu, pokwitowanie_id, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.kwota_na_zabezpieczeniu, src.pokwitowanie_id, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'inna_forma' BEGIN
		MERGE INTO osoz.inna_forma AS tgt
		USING [WI_StageODS].osoz.inna_forma AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.kwota=src.kwota, tgt.opis_innej_formy=src.opis_innej_formy, tgt.status_wpisu=src.status_wpisu, tgt.forma_zabezpieczenia_id=src.forma_zabezpieczenia_id, tgt.pokwitowanie_id=src.pokwitowanie_id, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, kwota, opis_innej_formy, status_wpisu, forma_zabezpieczenia_id, pokwitowanie_id, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.kwota, src.opis_innej_formy, src.status_wpisu, src.forma_zabezpieczenia_id, src.pokwitowanie_id, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'dokumenty_windykacyjne' BEGIN
		MERGE INTO osoz.dokumenty_windykacyjne AS tgt
		USING [WI_StageODS].osoz.dokumenty_windykacyjne AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.data_windykacji=src.data_windykacji, tgt.kwota_ogolem=src.kwota_ogolem, tgt.numer_decyzji_deklaracji=src.numer_decyzji_deklaracji, tgt.odsetki=src.odsetki, tgt.suma=src.suma, tgt.upomnienie_tytul_wykonawczy=src.upomnienie_tytul_wykonawczy, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, data_windykacji, kwota_ogolem, numer_decyzji_deklaracji, odsetki, suma, upomnienie_tytul_wykonawczy, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.data_windykacji, src.kwota_ogolem, src.numer_decyzji_deklaracji, src.odsetki, src.suma, src.upomnienie_tytul_wykonawczy, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'potwierdzenia' BEGIN
		MERGE INTO osoz.potwierdzenia AS tgt
		USING [WI_StageODS].osoz.potwierdzenia AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.data_wystawienia_potwierdzenia=src.data_wystawienia_potwierdzenia, tgt.kwota_na_potwierdzeniu=src.kwota_na_potwierdzeniu, tgt.numer_potwierdzenia=src.numer_potwierdzenia, tgt.potwierdzenie_wazne_do=src.potwierdzenie_wazne_do, tgt.potwierdzenie_wazne_od=src.potwierdzenie_wazne_od, tgt.forma_zabezpieczenia_id=src.forma_zabezpieczenia_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, data_wystawienia_potwierdzenia, kwota_na_potwierdzeniu, numer_potwierdzenia, potwierdzenie_wazne_do, potwierdzenie_wazne_od, forma_zabezpieczenia_id)
		VALUES (src.id, src.czas_modyfikacji, src.data_wystawienia_potwierdzenia, src.kwota_na_potwierdzeniu, src.numer_potwierdzenia, src.potwierdzenie_wazne_do, src.potwierdzenie_wazne_od, src.forma_zabezpieczenia_id);
	END
	ELSE IF @TableName = 'potwierdzenia_na_zabezpieczeniu' BEGIN
		MERGE INTO osoz.potwierdzenia_na_zabezpieczeniu AS tgt
		USING WI_StageODS.osoz.potwierdzenia_na_zabezpieczeniu AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.kwota_na_potwierdzeniu=src.kwota_na_potwierdzeniu, tgt.status_wpisu=src.status_wpisu, tgt.potwierdzenie_id=src.potwierdzenie_id, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, kwota_na_potwierdzeniu, status_wpisu, potwierdzenie_id, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.kwota_na_potwierdzeniu, src.status_wpisu, src.potwierdzenie_id, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'gwarancje_na_pokwitowaniach' BEGIN
		MERGE INTO osoz.gwarancje_na_pokwitowaniach AS tgt
		USING [WI_StageODS].osoz.gwarancje_na_pokwitowaniach AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.kwota_gwarancji_na_pokwitowaniu=src.kwota_gwarancji_na_pokwitowaniu, tgt.gwarancja_id=src.gwarancja_id, tgt.pokwitowanie_id=src.pokwitowanie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, kwota_gwarancji_na_pokwitowaniu, gwarancja_id, pokwitowanie_id)
		VALUES (src.id, src.czas_modyfikacji, src.kwota_gwarancji_na_pokwitowaniu, src.gwarancja_id, src.pokwitowanie_id);
	END
	ELSE IF @TableName = 'zaswiadczenia_tc' BEGIN
		MERGE INTO osoz.zaswiadczenia_tc AS tgt
		USING [WI_StageODS].osoz.zaswiadczenia_tc AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.numer_seryjny_druku=src.numer_seryjny_druku, tgt.rodzaj_druku=src.rodzaj_druku, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, numer_seryjny_druku, rodzaj_druku, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.numer_seryjny_druku, src.rodzaj_druku, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'gwarancje_na_zabezpieczeniach' BEGIN
		MERGE INTO osoz.gwarancje_na_zabezpieczeniach AS tgt
		USING [WI_StageODS].osoz.gwarancje_na_zabezpieczeniach AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.czas_modyfikacji=src.czas_modyfikacji, tgt.kwota_gwarancji_na_zabezpieczeniu=src.kwota_gwarancji_na_zabezpieczeniu, tgt.status_wpisu=src.status_wpisu, tgt.gwarancja_id=src.gwarancja_id, tgt.zabezpieczenie_id=src.zabezpieczenie_id
		WHEN NOT MATCHED
		THEN INSERT (id, czas_modyfikacji, kwota_gwarancji_na_zabezpieczeniu, status_wpisu, gwarancja_id, zabezpieczenie_id)
		VALUES (src.id, src.czas_modyfikacji, src.kwota_gwarancji_na_zabezpieczeniu, src.status_wpisu, src.gwarancja_id, src.zabezpieczenie_id);
	END
	ELSE IF @TableName = 'pokwitowania_procedury_akcyzowe' BEGIN
		MERGE INTO osoz.pokwitowania_procedury_akcyzowe AS tgt
		USING [WI_StageODS].osoz.pokwitowania_procedury_akcyzowe AS src
		ON (tgt.pokwitowanie_id=src.pokwitowanie_id AND tgt.procedura_akcyzowa_id=src.procedura_akcyzowa_id)
		WHEN NOT MATCHED
		THEN INSERT (pokwitowanie_id, procedura_akcyzowa_id)
		VALUES (src.pokwitowanie_id, src.procedura_akcyzowa_id);
	END
	ELSE IF @TableName = 'pokwitowanie_seed' BEGIN
		MERGE INTO osoz.pokwitowanie_seed AS tgt
		USING [WI_StageODS].osoz.pokwitowanie_seed AS src
		ON (tgt.pokwitowanie_id=src.pokwitowanie_id AND tgt.seed_id=src.seed_id)
		WHEN NOT MATCHED
		THEN INSERT (pokwitowanie_id, seed_id)
		VALUES (src.pokwitowanie_id, src.seed_id);
	END
	ELSE IF @TableName = 'zabezpieczenia_procedury_celne' BEGIN
		MERGE INTO osoz.zabezpieczenia_procedury_celne AS tgt
		USING [WI_StageODS].osoz.zabezpieczenia_procedury_celne AS src
		ON (tgt.zabezpieczenie_id=src.zabezpieczenie_id AND tgt.procedura_id=src.procedura_id)
		--WHEN MATCHED
		--THEN UPDATE SET
		--tgt.zabezpieczenie_id=src.zabezpieczenie_id, tgt.procedura_id=src.procedura_id
		WHEN NOT MATCHED
		THEN INSERT (zabezpieczenie_id, procedura_id)
		VALUES (src.zabezpieczenie_id, src.procedura_id);
	END
	ELSE IF @TableName = 'zabezpieczenia_struktury_organizacyjne' BEGIN
		MERGE INTO osoz.zabezpieczenia_struktury_organizacyjne AS tgt
		USING [WI_StageODS].osoz.zabezpieczenia_struktury_organizacyjne AS src
		ON (src.zabezpieczenie_id=tgt.zabezpieczenie_id AND src.struktura_organizacyjna_id = tgt.struktura_organizacyjna_id)
		--WHEN MATCHED
		--THEN UPDATE SET
		--tgt.zabezpieczenie_id=src.zabezpieczenie_id, tgt.struktura_organizacyjna_id=src.struktura_organizacyjna_id
		WHEN NOT MATCHED
		THEN INSERT (zabezpieczenie_id, struktura_organizacyjna_id)
		VALUES (src.zabezpieczenie_id, src.struktura_organizacyjna_id);
	END

	ELSE BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END