





-- =============================================
-- Author:		Magdalena Nocoń
-- Create date: 2015-09-01
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego).
-- =============================================
CREATE PROCEDURE [ncts2].[TruncateAllNCTS2]
AS
BEGIN
	SET NOCOUNT ON;
		TRUNCATE TABLE ncts2.ar_dokument
		TRUNCATE TABLE ncts2.ar_metody_kontroli
		TRUNCATE TABLE ncts2.ar_obsluga_wskazan_kontroli
		TRUNCATE TABLE ncts2.ar_obsluga_wskazan_kontroli_pozycje
		TRUNCATE TABLE ncts2.ar_zespol_kontroli
		TRUNCATE TABLE ncts2.uzytkownicy_uprawnienia_oc
		TRUNCATE TABLE ncts2.dokumenty_poprzednie_wpt;
		TRUNCATE TABLE ncts2.dokumenty_wymagane_wpt;
		TRUNCATE TABLE ncts2.gwarancje;
		TRUNCATE TABLE ncts2.gwarancje_niewazne_kraje;
		TRUNCATE TABLE ncts2.historia_zmian_towarow;
		TRUNCATE TABLE ncts2.informacje_dodatkowe_wpt;
		TRUNCATE TABLE ncts2.komunikaty;
		TRUNCATE TABLE ncts2.komunikaty_systemy_zewnetrzne;
		TRUNCATE TABLE ncts2.komunikaty_zawartosc; -- tabele do usuniecia
		TRUNCATE TABLE ncts2.komunikaty_systemy_zewnetrzne_zawartosc; -- tabele do usuniecia
		TRUNCATE TABLE ncts2.kontenery;
		TRUNCATE TABLE ncts2.kraje_wyslane_informacje_o_operacji_tranzytowej;
		TRUNCATE TABLE ncts2.logi;
		TRUNCATE TABLE ncts2.niedostepnosci;
		TRUNCATE TABLE ncts2.opakowania;
		TRUNCATE TABLE ncts2.operacje_tranzytowe;
		TRUNCATE TABLE ncts2.operacje_tranzytowe_gwarancje;
		TRUNCATE TABLE ncts2.operacje_tranzytowe_inne_informacje;
		TRUNCATE TABLE ncts2.operacje_tranzytowe_seap;
		TRUNCATE TABLE ncts2.operacje_tranzytowe_szczegoly;
		TRUNCATE TABLE ncts2.operacje_typy;
		TRUNCATE TABLE ncts2.ostrzezenia_systemy_zewnetrzne;
		TRUNCATE TABLE ncts2.parametry;
		TRUNCATE TABLE ncts2.pobory_naleznosci;
		TRUNCATE TABLE ncts2.poszukiwania_pobory;
		TRUNCATE TABLE ncts2.poszukiwania_pobory_informacje_dodatkowe;
		TRUNCATE TABLE ncts2.powiadomienia_komunikatow;
		TRUNCATE TABLE ncts2.ref_kanaly_kom;
		TRUNCATE TABLE ncts2.ref_miejsca_wyznaczone;
		TRUNCATE TABLE ncts2.ref_podmioty;
		TRUNCATE TABLE ncts2.ref_podmioty_aeo;
		TRUNCATE TABLE ncts2.ref_pozwolenia_na_procedure_uproszczona;
		TRUNCATE TABLE ncts2.ref_procedura_uproszczona_miejsca_lokalizacji_towaru;
		TRUNCATE TABLE ncts2.ref_procedura_uproszczona_towary_wykluczone;
		TRUNCATE TABLE ncts2.ref_reprezentanci;
		TRUNCATE TABLE ncts2.ref_swieta;
		TRUNCATE TABLE ncts2.ref_swieta_daty;
		TRUNCATE TABLE ncts2.ref_swieta_daty_lsd;
		TRUNCATE TABLE ncts2.ref_urzedy_celne;
		TRUNCATE TABLE ncts2.ref_urzedy_celne_lsd;
		TRUNCATE TABLE ncts2.ref_urzedy_celne_podmioty;
		TRUNCATE TABLE ncts2.ref_urzedy_celne_sezony;
		TRUNCATE TABLE ncts2.ref_urzedy_celne_sezony_okresy;
		TRUNCATE TABLE ncts2.ref_urzedy_celne_sezony_okresy_role;
		TRUNCATE TABLE ncts2.ref_urzedy_celne_uwagi;
		TRUNCATE TABLE ncts2.safe_tir_rejestracje_awaryjne;
		TRUNCATE TABLE ncts2.slowniki_typy;
		TRUNCATE TABLE ncts2.slowniki_wartosci;
		TRUNCATE TABLE ncts2.timery_instancje;
		TRUNCATE TABLE ncts2.timery_typy;
		TRUNCATE TABLE ncts2.towary;
		TRUNCATE TABLE ncts2.towary_uwagi;
		TRUNCATE TABLE ncts2.towary_wrazliwe;
		TRUNCATE TABLE ncts2.trasy_przewozu;
		TRUNCATE TABLE ncts2.uc_tranzytowe;
		TRUNCATE TABLE ncts2.upowazniony_odbiorca;
		TRUNCATE TABLE ncts2.uwagi_rozladunkowe;
		TRUNCATE TABLE ncts2.uwagi_rozladunkowe_zamkniecia_celne;
		TRUNCATE TABLE ncts2.uzytkownicy;
		TRUNCATE TABLE ncts2.wnioski_o_aar;
		TRUNCATE TABLE ncts2.wnioski_o_atr;
		TRUNCATE TABLE ncts2.wnioski_o_procedure_awaryjna;
		TRUNCATE TABLE ncts2.wnioski_o_uniewaznienie;
		TRUNCATE TABLE ncts2.wyniki_kontroli;
		TRUNCATE TABLE ncts2.zadania_systemy_zewnetrzne;
		TRUNCATE TABLE ncts2.zamkniecia_celne;
		TRUNCATE TABLE ncts2.zapytania_o_gwarancje;
		TRUNCATE TABLE ncts2.zapytania_o_przesylki;
		TRUNCATE TABLE ncts2.zdarzenia;
		TRUNCATE TABLE ncts2.zdarzenia_kontenery;
		TRUNCATE TABLE ncts2.zdarzenia_krytyczne;
		TRUNCATE TABLE ncts2.zdarzenia_krytyczne_konfiguracja;
		TRUNCATE TABLE ncts2.zdarzenia_zamkniecia_celne;

END