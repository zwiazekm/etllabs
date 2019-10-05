








-- =============================================
-- Author:		Paweł Roszkowski
-- Create date: 2018-01-10
-- Description:	Procedura merge'ująca operacje tranzytowe z archiwum w schemacie NCTS2.
-- =============================================

CREATE PROCEDURE [ncts2].[MergeAllArchiveNCTS2FromStageODS]
AS

BEGIN
SET NOCOUNT ON;
	--EXEC [ncts2].[MergeTableFromStageODS] 'ar_dokument';
	--EXEC [ncts2].[MergeTableFromStageODS] 'gwarancje';
	--EXEC [ncts2].[MergeTableFromStageODS] 'komunikaty_systemy_zewnetrzne_zawartosc'; --tabela do usuniecia
	--EXEC [ncts2].[MergeTableFromStageODS] 'komunikaty_zawartosc'; --tabela do usuniecia
	--EXEC [ncts2].[MergeTableFromStageODS] 'logi';
	--EXEC [ncts2].[MergeTableFromStageODS] 'niedostepnosci';
	EXEC [ncts2].[MergeTableFromStageODS] 'operacje_tranzytowe';
	--EXEC [ncts2].[MergeTableFromStageODS] 'operacje_typy';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ostrzezenia_systemy_zewnetrzne';
	--EXEC [ncts2].[MergeTableFromStageODS] 'parametry';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_miejsca_wyznaczone';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_podmioty';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_podmioty_aeo';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_pozwolenia_na_procedure_uproszczona';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_reprezentanci';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_swieta';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_urzedy_celne';
	--EXEC [ncts2].[MergeTableFromStageODS] 'safe_tir_rejestracje_awaryjne';
	--EXEC [ncts2].[MergeTableFromStageODS] 'slowniki_typy';
	--EXEC [ncts2].[MergeTableFromStageODS] 'timery_typy';
	--EXEC [ncts2].[MergeTableFromStageODS] 'uzytkownicy';
	--EXEC [ncts2].[MergeTableFromStageODS] 'wnioski_o_procedure_awaryjna';
	--EXEC [ncts2].[MergeTableFromStageODS] 'zapytania_o_przesylki';
	--EXEC [ncts2].[MergeTableFromStageODS] 'zdarzenia_krytyczne';
	--EXEC [ncts2].[MergeTableFromStageODS] 'zdarzenia_krytyczne_konfiguracja';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ar_obsluga_wskazan_kontroli';
	--EXEC [ncts2].[MergeTableFromStageODS] 'gwarancje_niewazne_kraje';
	--EXEC [ncts2].[MergeTableFromStageODS] 'historia_zmian_towarow';
	--EXEC [ncts2].[MergeTableFromStageODS] 'komunikaty';
	--EXEC [ncts2].[MergeTableFromStageODS] 'komunikaty_systemy_zewnetrzne';
	--EXEC [ncts2].[MergeTableFromStageODS] 'kraje_wyslane_informacje_o_operacji_tranzytowej';
	--EXEC [ncts2].[MergeTableFromStageODS] 'operacje_tranzytowe_gwarancje';
	--EXEC [ncts2].[MergeTableFromStageODS] 'operacje_tranzytowe_inne_informacje';
	--EXEC [ncts2].[MergeTableFromStageODS] 'operacje_tranzytowe_seap';
	--EXEC [ncts2].[MergeTableFromStageODS] 'operacje_tranzytowe_szczegoly';
	--EXEC [ncts2].[MergeTableFromStageODS] 'powiadomienia_komunikatow';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_kanaly_kom';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_procedura_uproszczona_miejsca_lokalizacji_towaru';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_swieta_daty';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_urzedy_celne_lsd';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_urzedy_celne_podmioty';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_urzedy_celne_sezony';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_urzedy_celne_uwagi';
	--EXEC [ncts2].[MergeTableFromStageODS] 'slowniki_wartosci';
	--EXEC [ncts2].[MergeTableFromStageODS] 'timery_instancje';
	--EXEC [ncts2].[MergeTableFromStageODS] 'towary';
	--EXEC [ncts2].[MergeTableFromStageODS] 'trasy_przewozu';
	--EXEC [ncts2].[MergeTableFromStageODS] 'uc_tranzytowe';
	--EXEC [ncts2].[MergeTableFromStageODS] 'uwagi_rozladunkowe';
	--EXEC [ncts2].[MergeTableFromStageODS] 'uzytkownicy_uprawnienia_oc';
	--EXEC [ncts2].[MergeTableFromStageODS] 'wyniki_kontroli';
	--EXEC [ncts2].[MergeTableFromStageODS] 'zamkniecia_celne';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ar_metody_kontroli';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ar_obsluga_wskazan_kontroli_pozycje';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ar_zespol_kontroli';
	--EXEC [ncts2].[MergeTableFromStageODS] 'dokumenty_poprzednie_wpt';
	--EXEC [ncts2].[MergeTableFromStageODS] 'dokumenty_wymagane_wpt';
	--EXEC [ncts2].[MergeTableFromStageODS] 'informacje_dodatkowe_wpt';
	--EXEC [ncts2].[MergeTableFromStageODS] 'kontenery';
	--EXEC [ncts2].[MergeTableFromStageODS] 'opakowania';
	--EXEC [ncts2].[MergeTableFromStageODS] 'poszukiwania_pobory';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_procedura_uproszczona_towary_wykluczone';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_swieta_daty_lsd';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_urzedy_celne_sezony_okresy';
	--EXEC [ncts2].[MergeTableFromStageODS] 'towary_uwagi';
	--EXEC [ncts2].[MergeTableFromStageODS] 'towary_wrazliwe';
	--EXEC [ncts2].[MergeTableFromStageODS] 'upowazniony_odbiorca';
	--EXEC [ncts2].[MergeTableFromStageODS] 'uwagi_rozladunkowe_zamkniecia_celne';
	--EXEC [ncts2].[MergeTableFromStageODS] 'wnioski_o_aar';
	--EXEC [ncts2].[MergeTableFromStageODS] 'wnioski_o_atr';
	--EXEC [ncts2].[MergeTableFromStageODS] 'wnioski_o_uniewaznienie';
	--EXEC [ncts2].[MergeTableFromStageODS] 'zadania_systemy_zewnetrzne';
	--EXEC [ncts2].[MergeTableFromStageODS] 'zapytania_o_gwarancje';
	--EXEC [ncts2].[MergeTableFromStageODS] 'pobory_naleznosci';
	--EXEC [ncts2].[MergeTableFromStageODS] 'poszukiwania_pobory_informacje_dodatkowe';
	--EXEC [ncts2].[MergeTableFromStageODS] 'ref_urzedy_celne_sezony_okresy_role';
	--EXEC [ncts2].[MergeTableFromStageODS] 'zdarzenia';
	--EXEC [ncts2].[MergeTableFromStageODS] 'zdarzenia_kontenery';
	--EXEC [ncts2].[MergeTableFromStageODS] 'zdarzenia_zamkniecia_celne';
END