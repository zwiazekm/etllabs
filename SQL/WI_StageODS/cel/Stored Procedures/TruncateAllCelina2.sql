﻿-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-22
-- Modify date: 2015-11-23
-- Description:	Procedura czyści wszystkie tabele przygotowując je do zasilenia (przyrostowego) z systemu Celina
-- =============================================
CREATE PROCEDURE [cel].[TruncateAllCelina2]
AS
BEGIN
	SET NOCOUNT ON;
		TRUNCATE TABLE cel.dok_dhu;
		TRUNCATE TABLE cel.dok_dp;
		TRUNCATE TABLE cel.dok_dyrektywy;
		TRUNCATE TABLE cel.dok_info;
		TRUNCATE TABLE cel.dok_inny;
		TRUNCATE TABLE cel.dok_operacje;
		TRUNCATE TABLE cel.dok_powiazania;
		TRUNCATE TABLE cel.dok_psp;
		TRUNCATE TABLE cel.dok_pw;
		TRUNCATE TABLE cel.dok_sadg;
		TRUNCATE TABLE cel.dok_st;
		TRUNCATE TABLE cel.dok_tranzyt;
		TRUNCATE TABLE cel.kontenery;
		TRUNCATE TABLE cel.kontrahenci;
		TRUNCATE TABLE cel.kontrahenci_tmp;
		TRUNCATE TABLE cel.numer_rej;
		TRUNCATE TABLE cel.PozwolPU;
		TRUNCATE TABLE cel.ProcPU;
		TRUNCATE TABLE cel.sl_deklaracje;
		TRUNCATE TABLE cel.sl_dyrektyw;
		TRUNCATE TABLE cel.sl_dyrektywy;
		TRUNCATE TABLE cel.sl_kontr_rodz;
		TRUNCATE TABLE cel.sl_kraje;
		TRUNCATE TABLE cel.sl_kraje_grupy;
		TRUNCATE TABLE cel.sl_met_platn;
		TRUNCATE TABLE cel.sl_naleznosci;
		TRUNCATE TABLE cel.sl_p13;
		TRUNCATE TABLE cel.sl_pac;
		TRUNCATE TABLE cel.sl_pcn;
		TRUNCATE TABLE cel.sl_potwiwywóz;
		TRUNCATE TABLE cel.sl_pref;
		TRUNCATE TABLE cel.sl_preferencje;
		TRUNCATE TABLE cel.sl_procedury1zn;
		TRUNCATE TABLE cel.sl_procedury4zn;
		TRUNCATE TABLE cel.sl_SAD_typy;
		TRUNCATE TABLE cel.sl_status_dyr;
		TRUNCATE TABLE cel.sl_status_sad;
		TRUNCATE TABLE cel.sl_transakcje;
		TRUNCATE TABLE cel.sl_transport;
		TRUNCATE TABLE cel.sl_tranzyty;
		TRUNCATE TABLE cel.sl_war_dostaw;
		TRUNCATE TABLE cel.sl_wy_wartości;
		TRUNCATE TABLE cel.st_PrzyWy;
		TRUNCATE TABLE cel.towar;
		TRUNCATE TABLE cel.towar_oplaty;
		TRUNCATE TABLE cel.v2_dok_dpdz;
		TRUNCATE TABLE cel.v2_dok_ds;
		TRUNCATE TABLE cel.v2_dok_dyrektywy;
		TRUNCATE TABLE cel.v2_dok_info;
		TRUNCATE TABLE cel.v2_dok_operacje;
		TRUNCATE TABLE cel.v2_dok_pod;
		TRUNCATE TABLE cel.v2_dok_poprz;
		TRUNCATE TABLE cel.v2_dok_powiazania;
		TRUNCATE TABLE cel.v2_dok_ppzc;
		TRUNCATE TABLE cel.v2_dok_pwd;
		TRUNCATE TABLE cel.v2_dok_pzc;
		TRUNCATE TABLE cel.v2_dok_sad;
		TRUNCATE TABLE cel.v2_dok_wymagany;
		TRUNCATE TABLE cel.v2_dok_zrodl;
		TRUNCATE TABLE cel.v2_ds_dok_wymagany;
		TRUNCATE TABLE cel.v2_ds_odbiorca;
		TRUNCATE TABLE cel.v2_kontener;
		TRUNCATE TABLE cel.v2_kontener_zamkniecie;
		TRUNCATE TABLE cel.v2_kontrahenci;
		TRUNCATE TABLE cel.v2_pod_decyzja;
		TRUNCATE TABLE cel.v2_pod_oplata;
		TRUNCATE TABLE cel.v2_pod_towar;
		TRUNCATE TABLE cel.v2_pwd_inf_dod;
		TRUNCATE TABLE cel.v2_pwd_dok_wym;
		TRUNCATE TABLE cel.v2_pwd_dok_pop;
		TRUNCATE TABLE cel.v2_pwd_kontener;
		TRUNCATE TABLE cel.v2_pwd_zamkniecie;
		TRUNCATE TABLE cel.v2_sad_dok_poprzedni;
		TRUNCATE TABLE cel.v2_sad_dok_poprzedni_WPT;
		TRUNCATE TABLE cel.v2_sad_dok_wymaganyWPT;
		TRUNCATE TABLE cel.v2_sad_dpdz_dok_wymagany;
		TRUNCATE TABLE cel.v2_sad_dpdz_ilosc_towaru;
		TRUNCATE TABLE cel.v2_sad_dpdz_info_dodatkowa;
		TRUNCATE TABLE cel.v2_sad_dpdz_kod_dodatkowy_PL;
		TRUNCATE TABLE cel.v2_sad_dpdz_kod_dodatkowy_UE;
		TRUNCATE TABLE cel.v2_sad_dpdz_oplata;
		TRUNCATE TABLE cel.v2_sad_dpdz_podklasyfikacja;
		TRUNCATE TABLE cel.v2_sad_dpdz_srodek;
		TRUNCATE TABLE cel.v2_sad_dpdz_tow;
		TRUNCATE TABLE cel.v2_sad_gwar_niew_kraj;
		TRUNCATE TABLE cel.v2_sad_gwarancja;
		TRUNCATE TABLE cel.v2_sad_gwarancje;
		TRUNCATE TABLE cel.v2_sad_info_dodatkowaWPT;
		TRUNCATE TABLE cel.v2_sad_kontener;
		TRUNCATE TABLE cel.v2_sad_kontyngent;
		TRUNCATE TABLE cel.v2_sad_nadawca;
		TRUNCATE TABLE cel.v2_sad_odbiorca;
		TRUNCATE TABLE cel.v2_sad_opakowanie;
		TRUNCATE TABLE cel.v2_sad_szczegoly_wartosci;
		TRUNCATE TABLE cel.v2_sad_towar_wrazliwy;
		TRUNCATE TABLE cel.v2_sad_transport;
		TRUNCATE TABLE cel.v2_sad_UC;
		TRUNCATE TABLE cel.v2_sad_war_tow_korekta;
		TRUNCATE TABLE cel.v2_sad_zamkniecie;
		TRUNCATE TABLE cel.v2_skladajacy;
		TRUNCATE TABLE cel.v2_sl_bilansowanie;
		TRUNCATE TABLE cel.v2_sl_dok_pop_kategoria;
		TRUNCATE TABLE cel.v2_sl_dok_pop_kod;
		TRUNCATE TABLE cel.v2_sl_dok_popWPT_kod;
		TRUNCATE TABLE cel.v2_sl_dok_wym_kod;
		TRUNCATE TABLE cel.v2_sl_dok_wymWPT_kod;
		TRUNCATE TABLE cel.v2_sl_dok_zrodl;
		TRUNCATE TABLE cel.v2_sl_dostarczenie_SAD;
		TRUNCATE TABLE cel.v2_sl_dpdz_typ;
		TRUNCATE TABLE cel.v2_sl_Funkcjonariusze;
		TRUNCATE TABLE cel.v2_sl_gwar_rodzaj;
		TRUNCATE TABLE cel.v2_sl_info_dodatkowa_kod;
		TRUNCATE TABLE cel.v2_sl_info_dodatkowaWPT_kod;
		TRUNCATE TABLE cel.v2_sl_Jm;
		TRUNCATE TABLE cel.v2_sl_kont_Jm;
		TRUNCATE TABLE cel.v2_sl_KorektaWart;
		TRUNCATE TABLE cel.v2_sl_kraje;
		TRUNCATE TABLE cel.v2_sl_KwalifikatorJm;
		TRUNCATE TABLE cel.v2_sl_marki;
		TRUNCATE TABLE cel.v2_sl_met_platnosci;
		TRUNCATE TABLE cel.v2_sl_miejsce_dostawy;
		TRUNCATE TABLE cel.v2_sl_opakowania;
		TRUNCATE TABLE cel.v2_sl_oplaty;
		TRUNCATE TABLE cel.v2_sl_pac;
		TRUNCATE TABLE cel.v2_sl_pozw_proc_gosp;
		TRUNCATE TABLE cel.v2_sl_preferencje;
		TRUNCATE TABLE cel.v2_sl_procedura;
		TRUNCATE TABLE cel.v2_sl_procedura_2zn;
		TRUNCATE TABLE cel.v2_sl_procedura_szczegoly;
		TRUNCATE TABLE cel.v2_sl_przedstawicielstwo;
		TRUNCATE TABLE cel.v2_sl_rodz_dok;
		TRUNCATE TABLE cel.v2_sl_rodz_dyrektywy;
		TRUNCATE TABLE cel.v2_sl_rodz_transakcji;
		TRUNCATE TABLE cel.v2_sl_sad_metoda_wartosc;
		TRUNCATE TABLE cel.v2_sl_sad_P1a;
		TRUNCATE TABLE cel.v2_sl_sad_P1b;
		TRUNCATE TABLE cel.v2_sl_sad_P1c;
		TRUNCATE TABLE cel.v2_sl_sad_podtyp;
		TRUNCATE TABLE cel.v2_sl_sad_szczeg_wartosci;
		TRUNCATE TABLE cel.v2_sl_sad_typ;
		TRUNCATE TABLE cel.v2_sl_sklad_cel_typ;
		TRUNCATE TABLE cel.v2_sl_status;
		TRUNCATE TABLE cel.v2_sl_status_dyrektywy;
		TRUNCATE TABLE cel.v2_sl_szczegoly_wartosci;
		TRUNCATE TABLE cel.v2_sl_TQS;
		TRUNCATE TABLE cel.v2_sl_transport;
		TRUNCATE TABLE cel.v2_sl_tranzyt;
		TRUNCATE TABLE cel.v2_sl_UC;
		TRUNCATE TABLE cel.v2_sl_waluty;
		TRUNCATE TABLE cel.v2_sl_war_dostaw;
		TRUNCATE TABLE cel.v2_sl_war_tow_korekta;
		TRUNCATE TABLE cel.v2_sl_wskaznik;
		TRUNCATE TABLE cel.v2_sl_wynik_kontr;
		TRUNCATE TABLE cel.v2_sl_zefir;
		TRUNCATE TABLE cel.v2_sl_zwolnienie_towaru;
		TRUNCATE TABLE cel.v2_towar;
		TRUNCATE TABLE cel.v2_tqs_kontyngenty;
		TRUNCATE TABLE cel.v2_tqs_odprawy;
		TRUNCATE TABLE cel.v2_transport;
		TRUNCATE TABLE cel.v2_transport_zamkniecie;
		TRUNCATE TABLE cel.v2_zmiana;
		TRUNCATE TABLE cel.zamkn_celne;
END