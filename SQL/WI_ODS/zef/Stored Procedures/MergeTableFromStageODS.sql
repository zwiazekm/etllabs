-- ==============================================
-- Author:		Aleksander Łużny
-- Create date: 2014-10-10
-- Description:	
-- ===============================================

CREATE PROCEDURE [zef].[MergeTableFromStageODS] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
		END

		IF @TableName = 'kontrahenci' BEGIN
			MERGE INTO zef.kontrahenci AS tgt
			USING WI_StageODS.zef.kontrahenci AS src
			ON (tgt.id_komor=src.id_komor AND tgt.id_kontr=src.id_kontr)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.id_grp_kntr=src.id_grp_kntr, tgt.id_centr=src.id_centr, tgt.nazwa_pelna=src.nazwa_pelna, tgt.nazwa_krotka=src.nazwa_krotka, tgt.rodzaj=src.rodzaj, tgt.kraj=src.kraj, tgt.miejsc=src.miejsc, tgt.kpoczt=src.kpoczt, tgt.ulica=src.ulica, tgt.nr_domu=src.nr_domu, tgt.nr_lokalu=src.nr_lokalu, tgt.nip=src.nip, tgt.regon=src.regon, tgt.pesel=src.pesel, tgt.rodz_dzial=src.rodz_dzial, tgt.bank=src.bank, tgt.konto=src.konto, tgt.def1=src.def1, tgt.def2=src.def2, tgt.def3=src.def3, tgt.operator=src.operator, tgt.data_wprow=src.data_wprow, tgt.replika=src.replika, tgt.replika2=src.replika2, tgt.status=src.status, tgt.poczta=src.poczta, tgt.telefon=src.telefon, tgt.fax=src.fax, tgt.uwagi=src.uwagi, tgt.woj=src.woj, tgt.powiat=src.powiat, tgt.nr_paszportu=src.nr_paszportu, tgt.email=src.email, tgt.czas_zmiany=src.czas_zmiany, tgt.gmina=src.gmina, tgt.data_tokenu=src.data_tokenu, tgt.token=src.token, tgt.data_weryfikacji=src.data_weryfikacji
			WHEN NOT MATCHED
			THEN INSERT (id_komor, id_kontr, id_grp_kntr, id_centr, nazwa_pelna, nazwa_krotka, rodzaj, kraj, miejsc, kpoczt, ulica, nr_domu, nr_lokalu, nip, regon, pesel, rodz_dzial, bank, konto, def1, def2, def3, operator, data_wprow, replika, replika2, status, poczta, telefon, fax, uwagi, woj, powiat, nr_paszportu, email, czas_zmiany, gmina, data_tokenu, token, data_weryfikacji)
			VALUES (src.id_komor, src.id_kontr, src.id_grp_kntr, src.id_centr, src.nazwa_pelna, src.nazwa_krotka, src.rodzaj, src.kraj, src.miejsc, src.kpoczt, src.ulica, src.nr_domu, src.nr_lokalu, src.nip, src.regon, src.pesel, src.rodz_dzial, src.bank, src.konto, src.def1, src.def2, src.def3, src.operator, src.data_wprow, src.replika, src.replika2, src.status, src.poczta, src.telefon, src.fax, src.uwagi, src.woj, src.powiat, src.nr_paszportu, src.email, src.czas_zmiany, src.gmina, src.data_tokenu, src.token, src.data_weryfikacji);
			SET @Merged = 1;
		END
		
		IF @TableName = 'dokumenty' BEGIN
			MERGE INTO zef.dokumenty AS tgt
			USING WI_StageODS.zef.dokumenty AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.id_jedn=src.id_jedn, tgt.id_rodz_dok=src.id_rodz_dok, tgt.id_dok_stow=src.id_dok_stow, tgt.id_dok_nadrz=src.id_dok_nadrz, tgt.kntr_id_komor=src.kntr_id_komor, tgt.kntr_id_kontr=src.kntr_id_kontr, tgt.kntr_id_centr=src.kntr_id_centr, tgt.rok=src.rok, tgt.id_stanow=src.id_stanow, tgt.nr_dok=src.nr_dok, tgt.sym_dok=src.sym_dok, tgt.dat_wystaw_dok=src.dat_wystaw_dok, tgt.operator=src.operator, tgt.dat_ksieg=src.dat_ksieg, tgt.operat_ksieg=src.operat_ksieg, tgt.status=src.status, tgt.adnotacje=src.adnotacje, tgt.uwagi=src.uwagi, tgt.semafor=src.semafor, tgt.dat_zamkn=src.dat_zamkn, tgt.id_zrodla=src.id_zrodla, tgt.tyt_plat=src.tyt_plat, tgt.etap_przetw=src.etap_przetw, tgt.sym_dok_stow=src.sym_dok_stow, tgt.id_mod=src.id_mod, tgt.nr_pol_ksieg=src.nr_pol_ksieg, tgt.waluta=src.waluta, tgt.kurs=src.kurs
			WHEN NOT MATCHED
			THEN INSERT (id_dok, id_jedn, id_rodz_dok, id_dok_stow, id_dok_nadrz, kntr_id_komor, kntr_id_kontr, kntr_id_centr, rok, id_stanow, nr_dok, sym_dok, dat_wystaw_dok, operator, dat_ksieg, operat_ksieg, status, adnotacje, uwagi, semafor, dat_zamkn, id_zrodla, tyt_plat, etap_przetw, sym_dok_stow, id_mod, nr_pol_ksieg, waluta, kurs)
			VALUES (src.id_dok, src.id_jedn, src.id_rodz_dok, src.id_dok_stow, src.id_dok_nadrz, src.kntr_id_komor, src.kntr_id_kontr, src.kntr_id_centr, src.rok, src.id_stanow, src.nr_dok, src.sym_dok, src.dat_wystaw_dok, src.operator, src.dat_ksieg, src.operat_ksieg, src.status, src.adnotacje, src.uwagi, src.semafor, src.dat_zamkn, src.id_zrodla, src.tyt_plat, src.etap_przetw, src.sym_dok_stow, src.id_mod, src.nr_pol_ksieg, src.waluta, src.kurs);
			SET @Merged = 1;
		END

		IF @TableName = 'dl_kontr' BEGIN
			MERGE INTO zef.dl_kontr AS tgt
			USING WI_StageODS.zef.dl_kontr AS src
			ON (tgt.id_komor=src.id_komor AND tgt.id_kontr=src.id_kontr)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.nazwa_pelna=src.nazwa_pelna, tgt.nazwa_krotka=src.nazwa_krotka, tgt.kraj=src.kraj, tgt.miejsc=src.miejsc, tgt.kpoczt=src.kpoczt, tgt.ulica=src.ulica, tgt.nr_domu=src.nr_domu, tgt.nr_lokalu=src.nr_lokalu, tgt.nip=src.nip, tgt.regon=src.regon, tgt.pesel=src.pesel, tgt.status_kontr=src.status_kontr, tgt.nr_ubd_old=src.nr_ubd_old, tgt.replika=src.replika
			WHEN NOT MATCHED
			THEN INSERT (id_komor, id_kontr, nazwa_pelna, nazwa_krotka, kraj, miejsc, kpoczt, ulica, nr_domu, nr_lokalu, nip, regon, pesel, status_kontr, nr_ubd_old, replika)
			VALUES (src.id_komor, src.id_kontr, src.nazwa_pelna, src.nazwa_krotka, src.kraj, src.miejsc, src.kpoczt, src.ulica, src.nr_domu, src.nr_lokalu, src.nip, src.regon, src.pesel, src.status_kontr, src.nr_ubd_old, src.replika);
			SET @Merged = 1;
		END

		IF @TableName = 'dl_sprawy' BEGIN
			MERGE INTO zef.dl_sprawy AS tgt
			USING WI_StageODS.zef.dl_sprawy AS src
			ON (tgt.id_dok_sprawy=src.id_dok_sprawy)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.id_uc=src.id_uc, tgt.id_rodz_dok=src.id_rodz_dok, tgt.symbol_dok=src.symbol_dok, tgt.id_komor=src.id_komor, tgt.id_kontr=src.id_kontr, tgt.status_spr=src.status_spr, tgt.data_dok=src.data_dok, tgt.data_powst=src.data_powst, tgt.data_wyzer=src.data_wyzer, tgt.przycz_zadl=src.przycz_zadl, tgt.uwagi=src.uwagi, tgt.data_ksieg=src.data_ksieg, tgt.replika=src.replika, tgt.opis=src.opis, tgt.odsetka=src.odsetka
			WHEN NOT MATCHED
			THEN INSERT (id_dok_sprawy, id_uc, id_rodz_dok, symbol_dok, id_komor, id_kontr, status_spr, data_dok, data_powst, data_wyzer, przycz_zadl, uwagi, data_ksieg, replika, opis, odsetka)
			VALUES (src.id_dok_sprawy, src.id_uc, src.id_rodz_dok, src.symbol_dok, src.id_komor, src.id_kontr, src.status_spr, src.data_dok, src.data_powst, src.data_wyzer, src.przycz_zadl, src.uwagi, src.data_ksieg, src.replika, src.opis, src.odsetka);
			SET @Merged = 1;
		END

		IF @TableName = 'dl_kontr_solid' BEGIN
			MERGE INTO zef.dl_kontr_solid AS tgt
			USING WI_StageODS.zef.dl_kontr_solid AS src
			ON (tgt.id_dok_sprawy=src.id_dok_sprawy AND tgt.id_komor=src.id_komor AND tgt.id_kontr=src.id_kontr)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.termin_plat=src.termin_plat, tgt.replika=src.replika
			WHEN NOT MATCHED
			THEN INSERT (id_dok_sprawy, id_komor, id_kontr, termin_plat, replika)
			VALUES (src.id_dok_sprawy, src.id_komor, src.id_kontr, src.termin_plat, src.replika);
			SET @Merged = 1;
		END

		IF @TableName = 'dok_jednostka' BEGIN
			MERGE INTO zef.dok_jednostka AS tgt
			USING WI_StageODS.zef.dok_jednostka AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.id_jedn=src.id_jedn, tgt.id_jedn_nadrz=src.id_jedn_nadrz, tgt.replika2=src.replika2
			WHEN NOT MATCHED
			THEN INSERT (id_dok, id_jedn, id_jedn_nadrz, replika2)
			VALUES (src.id_dok, src.id_jedn, src.id_jedn_nadrz, src.replika2);
			SET @Merged = 1;
		END

		IF @TableName = 'dok_opal' BEGIN
			MERGE INTO zef.dok_opal AS tgt
			USING WI_StageODS.zef.dok_opal AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.plat_id_komor=src.plat_id_komor, tgt.plat_id_kontr=src.plat_id_kontr, tgt.nr_dok_spraw=src.nr_dok_spraw, tgt.rodz_nal=src.rodz_nal, tgt.form_plat=src.form_plat, tgt.term_plat=src.term_plat, tgt.nr_wyk_szczeg=src.nr_wyk_szczeg, tgt.poz_wyk_szczeg=src.poz_wyk_szczeg, tgt.typ=src.typ, tgt.id_jedn=src.id_jedn, tgt.okres=src.okres, tgt.dat_wypel=src.dat_wypel, tgt.dat_wplywu=src.dat_wplywu, tgt.id_komor=src.id_komor, tgt.id_kontr=src.id_kontr
			WHEN NOT MATCHED
			THEN INSERT (id_dok, plat_id_komor, plat_id_kontr, nr_dok_spraw, rodz_nal, form_plat, term_plat, nr_wyk_szczeg, poz_wyk_szczeg, typ, id_jedn, okres, dat_wypel, dat_wplywu, id_komor, id_kontr)
			VALUES (src.id_dok, src.plat_id_komor, src.plat_id_kontr, src.nr_dok_spraw, src.rodz_nal, src.form_plat, src.term_plat, src.nr_wyk_szczeg, src.poz_wyk_szczeg, src.typ, src.id_jedn, src.okres, src.dat_wypel, src.dat_wplywu, src.id_komor, src.id_kontr);
			SET @Merged = 1;
		END

		IF @TableName = 'dok_sad' BEGIN
			MERGE INTO zef.dok_sad AS tgt
			USING WI_StageODS.zef.dok_sad AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.id_dok=src.id_dok, tgt.plat_id_komor=src.plat_id_komor, tgt.plat_id_kontr=src.plat_id_kontr, tgt.gwar_id_komorki=src.gwar_id_komorki, tgt.gwar_id_kontr=src.gwar_id_kontr, tgt.plat_id_centr=src.plat_id_centr, tgt.gwar_id_centr=src.gwar_id_centr, tgt.nr_dok_spraw=src.nr_dok_spraw, tgt.id_proc=src.id_proc, tgt.data_powiad=src.data_powiad, tgt.form_plat=src.form_plat, tgt.term_plat=src.term_plat, tgt.poz_rej_dlug=src.poz_rej_dlug, tgt.data_wygas_dlugu=src.data_wygas_dlugu, tgt.nr_wyk_szczeg=src.nr_wyk_szczeg, tgt.poz_wyk_szczeg=src.poz_wyk_szczeg, tgt.typ=src.typ, tgt.id_jedn=src.id_jedn, tgt.dat_powst_dlugu=src.dat_powst_dlugu, tgt.data_zak=src.data_zak, tgt.kwota_zab=src.kwota_zab, tgt.okres_tor=src.okres_tor, tgt.typ_odroczenia=src.typ_odroczenia, tgt.termin_plat_odr=src.termin_plat_odr, tgt.id_dok_odroczenia=src.id_dok_odroczenia, tgt.sym_odroczenia=src.sym_odroczenia, tgt.data_od=src.data_od, tgt.data_do=src.data_do, tgt.okres_rozl=src.okres_rozl, tgt.ter_odrocz=src.ter_odrocz, tgt.id_proc_celina=src.id_proc_celina, tgt.data_zwol_towar=src.data_zwol_towar, tgt.celina_zwol_towar=src.celina_zwol_towar, tgt.rodzaj=src.rodzaj, tgt.kwota_dod_zab=src.kwota_dod_zab, tgt.flg_dod_zab=src.flg_dod_zab, tgt.cln_typ_sad=src.cln_typ_sad, tgt.data_zab=src.data_zab, tgt.us=src.us, tgt.sasp=src.sasp
			WHEN NOT MATCHED
			THEN INSERT (id_dok, plat_id_komor, plat_id_kontr, gwar_id_komorki, gwar_id_kontr, plat_id_centr, gwar_id_centr, nr_dok_spraw, id_proc, data_powiad, form_plat, term_plat, poz_rej_dlug, data_wygas_dlugu, nr_wyk_szczeg, poz_wyk_szczeg, typ, id_jedn, dat_powst_dlugu, data_zak, kwota_zab, okres_tor, typ_odroczenia, termin_plat_odr, id_dok_odroczenia, sym_odroczenia, data_od, data_do, okres_rozl, ter_odrocz, id_proc_celina, data_zwol_towar, celina_zwol_towar, rodzaj, kwota_dod_zab, flg_dod_zab, cln_typ_sad, data_zab, us, sasp)
			VALUES (src.id_dok, src.plat_id_komor, src.plat_id_kontr, src.gwar_id_komorki, src.gwar_id_kontr, src.plat_id_centr, src.gwar_id_centr, src.nr_dok_spraw, src.id_proc, src.data_powiad, src.form_plat, src.term_plat, src.poz_rej_dlug, src.data_wygas_dlugu, src.nr_wyk_szczeg, src.poz_wyk_szczeg, src.typ, src.id_jedn, src.dat_powst_dlugu, src.data_zak, src.kwota_zab, src.okres_tor, src.typ_odroczenia, src.termin_plat_odr, src.id_dok_odroczenia, src.sym_odroczenia, src.data_od, src.data_do, src.okres_rozl, src.ter_odrocz, src.id_proc_celina, src.data_zwol_towar, src.celina_zwol_towar, src.rodzaj, src.kwota_dod_zab, src.flg_dod_zab, src.cln_typ_sad, src.data_zab, src.us, src.sasp);
			SET @Merged = 1;
		END

		IF @TableName = 'dok_tytwyk' BEGIN
			MERGE INTO zef.dok_tytwyk AS tgt
			USING WI_StageODS.zef.dok_tytwyk AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.organ_egzek=src.organ_egzek, tgt.nr_dok_spraw=src.nr_dok_spraw, tgt.rok_okres=src.rok_okres, tgt.naleznosc=src.naleznosc, tgt.data_nal_odset=src.data_nal_odset, tgt.rodz_nal=src.rodz_nal, tgt.podst_praw=src.podst_praw, tgt.rodz_odset=src.rodz_odset, tgt.proc_odset1=src.proc_odset1, tgt.proc_odset2=src.proc_odset2, tgt.podst_praw_34=src.podst_praw_34, tgt.podst_praw_56=src.podst_praw_56, tgt.podst_praw_37=src.podst_praw_37, tgt.form_plat=src.form_plat, tgt.rodz_egzek=src.rodz_egzek, tgt.tresc_egz=src.tresc_egz, tgt.nr_upom=src.nr_upom, tgt.dat_dost_upom=src.dat_dost_upom, tgt.koszt_upom=src.koszt_upom, tgt.sposob_zapl=src.sposob_zapl, tgt.data_wnios=src.data_wnios, tgt.data_post=src.data_post, tgt.rok_okres2=src.rok_okres2, tgt.rok_okres3=src.rok_okres3, tgt.rok_okres4=src.rok_okres4, tgt.naleznosc2=src.naleznosc2, tgt.naleznosc3=src.naleznosc3, tgt.naleznosc4=src.naleznosc4, tgt.data_nal_odset2=src.data_nal_odset2, tgt.data_nal_odset3=src.data_nal_odset3, tgt.data_nal_odset4=src.data_nal_odset4, tgt.nal_zabezp=src.nal_zabezp, tgt.zabezp_forma=src.zabezp_forma, tgt.id_konta_wierz=src.id_konta_wierz, tgt.podst_praw_30=src.podst_praw_30, tgt.rodzaj_nal=src.rodzaj_nal, tgt.rodzaj_nal2=src.rodzaj_nal2, tgt.rodzaj_nal3=src.rodzaj_nal3, tgt.rodzaj_nal4=src.rodzaj_nal4, tgt.id_jedn=src.id_jedn, tgt.kwot_ods=src.kwot_ods, tgt.kwot_ods2=src.kwot_ods2, tgt.kwot_ods3=src.kwot_ods3, tgt.kwot_ods4=src.kwot_ods4, tgt.bank_wierz=src.bank_wierz, tgt.konto_wierz=src.konto_wierz, tgt.data_zaw_od=src.data_zaw_od, tgt.data_zaw_do=src.data_zaw_do, tgt.data_zaw_od2=src.data_zaw_od2, tgt.data_zaw_do2=src.data_zaw_do2, tgt.data_zaw_od3=src.data_zaw_od3, tgt.data_zaw_do3=src.data_zaw_do3, tgt.flg_zaw=src.flg_zaw, tgt.flg_zob=src.flg_zob, tgt.id_komor=src.id_komor, tgt.id_kontr=src.id_kontr, tgt.id_dok_pierw=src.id_dok_pierw, tgt.nr_dok_pierw=src.nr_dok_pierw
			WHEN NOT MATCHED
			THEN INSERT (id_dok, organ_egzek, nr_dok_spraw, rok_okres, naleznosc, data_nal_odset, rodz_nal, podst_praw, rodz_odset, proc_odset1, proc_odset2, podst_praw_34, podst_praw_56, podst_praw_37, form_plat, rodz_egzek, tresc_egz, nr_upom, dat_dost_upom, koszt_upom, sposob_zapl, data_wnios, data_post, rok_okres2, rok_okres3, rok_okres4, naleznosc2, naleznosc3, naleznosc4, data_nal_odset2, data_nal_odset3, data_nal_odset4, nal_zabezp, zabezp_forma, id_konta_wierz, podst_praw_30, rodzaj_nal, rodzaj_nal2, rodzaj_nal3, rodzaj_nal4, id_jedn, kwot_ods, kwot_ods2, kwot_ods3, kwot_ods4, bank_wierz, konto_wierz, data_zaw_od, data_zaw_do, data_zaw_od2, data_zaw_do2, data_zaw_od3, data_zaw_do3, flg_zaw, flg_zob, id_komor, id_kontr, id_dok_pierw, nr_dok_pierw)
			VALUES (src.id_dok, src.organ_egzek, src.nr_dok_spraw, src.rok_okres, src.naleznosc, src.data_nal_odset, src.rodz_nal, src.podst_praw, src.rodz_odset, src.proc_odset1, src.proc_odset2, src.podst_praw_34, src.podst_praw_56, src.podst_praw_37, src.form_plat, src.rodz_egzek, src.tresc_egz, src.nr_upom, src.dat_dost_upom, src.koszt_upom, src.sposob_zapl, src.data_wnios, src.data_post, src.rok_okres2, src.rok_okres3, src.rok_okres4, src.naleznosc2, src.naleznosc3, src.naleznosc4, src.data_nal_odset2, src.data_nal_odset3, src.data_nal_odset4, src.nal_zabezp, src.zabezp_forma, src.id_konta_wierz, src.podst_praw_30, src.rodzaj_nal, src.rodzaj_nal2, src.rodzaj_nal3, src.rodzaj_nal4, src.id_jedn, src.kwot_ods, src.kwot_ods2, src.kwot_ods3, src.kwot_ods4, src.bank_wierz, src.konto_wierz, src.data_zaw_od, src.data_zaw_do, src.data_zaw_od2, src.data_zaw_do2, src.data_zaw_od3, src.data_zaw_do3, src.flg_zaw, src.flg_zob, src.id_komor, src.id_kontr, src.id_dok_pierw, src.nr_dok_pierw);
			SET @Merged = 1;
		END

		IF @TableName = 'dok_wplaty' BEGIN
			MERGE INTO zef.dok_wplaty AS tgt
			USING WI_StageODS.zef.dok_wplaty AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.nr_poz=src.nr_poz, tgt.form_plat=src.form_plat, tgt.sernum=src.sernum, tgt.rodzaj=src.rodzaj, tgt.bank_dluz=src.bank_dluz, tgt.konto_dluz=src.konto_dluz, tgt.bank_wierz=src.bank_wierz, tgt.konto_wierz=src.konto_wierz, tgt.kwota=src.kwota, tgt.tyt_plat=src.tyt_plat, tgt.kwota_rozl=src.kwota_rozl, tgt.id_jedn=src.id_jedn, tgt.id_ksieg_kas=src.id_ksieg_kas, tgt.poz_wyk_szczeg=src.poz_wyk_szczeg, tgt.rozdzial=src.rozdzial, tgt.paragraf=src.paragraf, tgt.zad_inwest=src.zad_inwest
			WHEN NOT MATCHED
			THEN INSERT (id_dok, nr_poz, form_plat, sernum, rodzaj, bank_dluz, konto_dluz, bank_wierz, konto_wierz, kwota, tyt_plat, kwota_rozl, id_jedn, id_ksieg_kas, poz_wyk_szczeg, rozdzial, paragraf, zad_inwest)
			VALUES (src.id_dok, src.nr_poz, src.form_plat, src.sernum, src.rodzaj, src.bank_dluz, src.konto_dluz, src.bank_wierz, src.konto_wierz, src.kwota, src.tyt_plat, src.kwota_rozl, src.id_jedn, src.id_ksieg_kas, src.poz_wyk_szczeg, src.rozdzial, src.paragraf, src.zad_inwest);
			SET @Merged = 1;
		END

		IF @TableName = 'mand_kwal' BEGIN
			MERGE INTO zef.mand_kwal AS tgt
			USING WI_StageODS.zef.mand_kwal AS src
			ON (tgt.id_dok=src.id_dok AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.id_kwal=src.id_kwal, tgt.id_jedn=src.id_jedn
			WHEN NOT MATCHED
			THEN INSERT (id_dok, nr_poz, id_kwal, id_jedn)
			VALUES (src.id_dok, src.nr_poz, src.id_kwal, src.id_jedn);
			SET @Merged = 1;
		END

		IF @TableName = 'mand_kwot' BEGIN
			MERGE INTO zef.mand_kwot AS tgt
			USING WI_StageODS.zef.mand_kwot AS src
			ON (tgt.id_dok=src.id_dok AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.rodz_nal=src.rodz_nal, tgt.kwota=src.kwota, tgt.grupa=src.grupa, tgt.id_jedn=src.id_jedn
			WHEN NOT MATCHED
			THEN INSERT (id_dok, nr_poz, rodz_nal, kwota, grupa, id_jedn)
			VALUES (src.id_dok, src.nr_poz, src.rodz_nal, src.kwota, src.grupa, src.id_jedn);
			SET @Merged = 1;
		END

		IF @TableName = 'popal' BEGIN
			MERGE INTO zef.popal AS tgt
			USING WI_StageODS.zef.popal AS src
			ON (tgt.id_dok=src.id_dok AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.grupa=src.grupa, tgt.symbol=src.symbol, tgt.ilosc_litr=src.ilosc_litr, tgt.ilosc_tona=src.ilosc_tona, tgt.cena=src.cena, tgt.wartosc=src.wartosc, tgt.id_jedn=src.id_jedn, tgt.rodz_nal=src.rodz_nal, tgt.nazwa=src.nazwa, tgt.nr_poz_slow=src.nr_poz_slow, tgt.rodz_st=src.rodz_st
			WHEN NOT MATCHED
			THEN INSERT (id_dok, nr_poz, grupa, symbol, ilosc_litr, ilosc_tona, cena, wartosc, id_jedn, rodz_nal, nazwa, nr_poz_slow, rodz_st)
			VALUES (src.id_dok, src.nr_poz, src.grupa, src.symbol, src.ilosc_litr, src.ilosc_tona, src.cena, src.wartosc, src.id_jedn, src.rodz_nal, src.nazwa, src.nr_poz_slow, src.rodz_st);
			SET @Merged = 1;
		END

		IF @TableName = 'psad' BEGIN
			MERGE INTO zef.psad AS tgt
			USING WI_StageODS.zef.psad AS src
			ON (tgt.id_dok=src.id_dok AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.rodz_nal=src.rodz_nal, tgt.kwota_nal=src.kwota_nal, tgt.term_plat=src.term_plat, tgt.form_plat=src.form_plat, tgt.id_jedn=src.id_jedn, tgt.zwolnienie=src.zwolnienie, tgt.kwota_zab=src.kwota_zab, tgt.grupa=src.grupa, tgt.odroczenie=src.odroczenie
			WHEN NOT MATCHED
			THEN INSERT (id_dok, nr_poz, rodz_nal, kwota_nal, term_plat, form_plat, id_jedn, zwolnienie, kwota_zab, grupa, odroczenie)
			VALUES (src.id_dok, src.nr_poz, src.rodz_nal, src.kwota_nal, src.term_plat, src.form_plat, src.id_jedn, src.zwolnienie, src.kwota_zab, src.grupa, src.odroczenie);
			SET @Merged = 1;
		END

		IF @TableName = 'pwplat' BEGIN
			MERGE INTO zef.pwplat AS tgt
			USING WI_StageODS.zef.pwplat AS src
			ON (tgt.id_dok=src.id_dok AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.tyt_plat=src.tyt_plat, tgt.kwota=src.kwota, tgt.sym_dok_stow=src.sym_dok_stow, tgt.tresc=src.tresc, tgt.klasyf_budz=src.klasyf_budz, tgt.id_dok_stow=src.id_dok_stow, tgt.id_jedn=src.id_jedn, tgt.korekta=src.korekta, tgt.oper_kor=src.oper_kor, tgt.data_korekty=src.data_korekty, tgt.status=src.status, tgt.odprowadzona=src.odprowadzona, tgt.nr_poz_ewid=src.nr_poz_ewid, tgt.odsetki=src.odsetki, tgt.ods_do_poz=src.ods_do_poz, tgt.id_konta=src.id_konta, tgt.rodz_nal=src.rodz_nal, tgt.id_dok_odpr=src.id_dok_odpr, tgt.data_poz=src.data_poz, tgt.id_komor=src.id_komor, tgt.id_kontr=src.id_kontr, tgt.term_plat=src.term_plat, tgt.flag_wind=src.flag_wind, tgt.segment4=src.segment4, tgt.segment7=src.segment7, tgt.nw=src.nw, tgt.kntr_dodat=src.kntr_dodat, tgt.id_dok_zrod=src.id_dok_zrod, tgt.nr_poz_zrod=src.nr_poz_zrod
			WHEN NOT MATCHED
			THEN INSERT (id_dok, nr_poz, tyt_plat, kwota, sym_dok_stow, tresc, klasyf_budz, id_dok_stow, id_jedn, korekta, oper_kor, data_korekty, status, odprowadzona, nr_poz_ewid, odsetki, ods_do_poz, id_konta, rodz_nal, id_dok_odpr, data_poz, id_komor, id_kontr, term_plat, flag_wind, segment4, segment7, nw, kntr_dodat, id_dok_zrod, nr_poz_zrod)
			VALUES (src.id_dok, src.nr_poz, src.tyt_plat, src.kwota, src.sym_dok_stow, src.tresc, src.klasyf_budz, src.id_dok_stow, src.id_jedn, src.korekta, src.oper_kor, src.data_korekty, src.status, src.odprowadzona, src.nr_poz_ewid, src.odsetki, src.ods_do_poz, src.id_konta, src.rodz_nal, src.id_dok_odpr, src.data_poz, src.id_komor, src.id_kontr, src.term_plat, src.flag_wind, src.segment4, src.segment7, src.nw, src.kntr_dodat, src.id_dok_zrod, src.nr_poz_zrod);
			SET @Merged = 1;
		END
		
		IF @TableName = 'Slowniki' BEGIN
			MERGE INTO zef.slowniki AS tgt
			USING WI_StageODS.zef.slowniki AS src
			ON (tgt.id_rodz_slow=src.id_rodz_slow AND tgt.id_slown=src.id_slown)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.id_rodz_slow=src.id_rodz_slow, tgt.id_slown=src.id_slown, tgt.symbol=src.symbol, tgt.nazwa=src.nazwa, tgt.rodzaj=src.rodzaj, tgt.typ=src.typ, tgt.kwota=src.kwota, tgt.kwota2=src.kwota2, tgt.kwota3=src.kwota3, tgt.data=src.data, tgt.liczba=src.liczba, tgt.opis=src.opis, tgt.raport=src.raport, tgt.aktywny=src.aktywny, tgt.data_rejestracji=src.data_rejestracji, tgt.operator=src.operator, tgt.data_obowiazywania_od=src.data_obowiazywania_od, tgt.data_obowiazywania_do=src.data_obowiazywania_do, tgt.typ2=src.typ2, tgt.typ3=src.typ3
			WHEN NOT MATCHED
			THEN INSERT (id_rodz_slow, id_slown, symbol, nazwa, rodzaj, typ, kwota, kwota2, kwota3, data, liczba, opis, raport, aktywny, data_rejestracji, operator, data_obowiazywania_od, data_obowiazywania_do, typ2, typ3)
			VALUES (src.id_rodz_slow, src.id_slown, src.symbol, src.nazwa, src.rodzaj, src.typ, src.kwota, src.kwota2, src.kwota3, src.data, src.liczba, src.opis, src.raport, src.aktywny, src.data_rejestracji, src.operator, src.data_obowiazywania_od, src.data_obowiazywania_do, src.typ2, src.typ3);
			SET @Merged = 1;
		END
		
		IF @TableName = 'sprawoz_meld' BEGIN
			MERGE INTO zef.sprawoz_meld AS tgt
			USING WI_StageODS.zef.sprawoz_meld AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.dat_wykon=src.dat_wykon, tgt.miesiac=src.miesiac, tgt.rok=src.rok, tgt.data_od=src.data_od, tgt.data_do=src.data_do, tgt.adresat=src.adresat, tgt.okres_od=src.okres_od, tgt.okres_do=src.okres_do, tgt.symbol_ekd=src.symbol_ekd, tgt.regon=src.regon, tgt.miejsc=src.miejsc
			WHEN NOT MATCHED
			THEN INSERT (id_dok, dat_wykon, miesiac, rok, data_od, data_do, adresat, okres_od, okres_do, symbol_ekd, regon, miejsc)
			VALUES (src.id_dok, src.dat_wykon, src.miesiac, src.rok, src.data_od, src.data_do, src.adresat, src.okres_od, src.okres_do, src.symbol_ekd, src.regon, src.miejsc);
			SET @Merged = 1;		
		END
		
		IF @TableName = 'dok_ainf' BEGIN
			MERGE INTO zef.dok_ainf AS tgt
			USING WI_StageODS.zef.dok_ainf AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.status=src.status, tgt.dekl_za=src.dekl_za, tgt.us_id_komor=src.us_id_komor, tgt.us_id_kontr=src.us_id_kontr, tgt.us_id_centr=src.us_id_centr, tgt.dz_tyt_plat=src.dz_tyt_plat, tgt.dz_klasyf_budz=src.dz_klasyf_budz, tgt.rep_id_komor=src.rep_id_komor, tgt.rep_id_kontr=src.rep_id_kontr, tgt.rep_id_centr=src.rep_id_centr, tgt.dat_wypel=src.dat_wypel, tgt.dat_wplywu=src.dat_wplywu, tgt.term_plat=src.term_plat, tgt.nr_paczki=src.nr_paczki, tgt.czy_wewn=src.czy_wewn, tgt.seed_id_komor=src.seed_id_komor, tgt.seed_id_kontr=src.seed_id_kontr, tgt.form_plat=src.form_plat, tgt.korekta_pod=src.korekta_pod, tgt.dat_powst_dlugu=src.dat_powst_dlugu, tgt.termin=src.termin
			WHEN NOT MATCHED
			THEN INSERT (id_dok, status, dekl_za, us_id_komor, us_id_kontr, us_id_centr, dz_tyt_plat, dz_klasyf_budz, rep_id_komor, rep_id_kontr, rep_id_centr, dat_wypel, dat_wplywu, term_plat, nr_paczki, czy_wewn, seed_id_komor, seed_id_kontr, form_plat, korekta_pod, dat_powst_dlugu, termin)
			VALUES (src.id_dok, src.status, src.dekl_za, src.us_id_komor, src.us_id_kontr, src.us_id_centr, src.dz_tyt_plat, src.dz_klasyf_budz, src.rep_id_komor, src.rep_id_kontr, src.rep_id_centr, src.dat_wypel, src.dat_wplywu, src.term_plat, src.nr_paczki, src.czy_wewn, src.seed_id_komor, src.seed_id_kontr, src.form_plat, src.korekta_pod, src.dat_powst_dlugu, src.termin);
			SET @Merged = 1;
		END
		
		IF @TableName = 'dok_pog' BEGIN
			MERGE INTO zef.dok_pog AS tgt
			USING WI_StageODS.zef.dok_pog AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.okres=src.okres, tgt.id_kontr=src.id_kontr, tgt.id_komor=src.id_komor, tgt.p_1=src.p_1, tgt.p_2=src.p_2, tgt.p_3=src.p_3, tgt.p_4=src.p_4, tgt.p_5=src.p_5, tgt.p_6=src.p_6, tgt.p_7=src.p_7, tgt.p_8=src.p_8, tgt.p_9=src.p_9, tgt.p_10=src.p_10, tgt.term_plat=src.term_plat, tgt.dat_wypel=src.dat_wypel, tgt.dat_wplywu=src.dat_wplywu, tgt.nr_paczki=src.nr_paczki, tgt.flaga=src.flaga, tgt.flaga_a=src.flaga_a, tgt.flaga_b=src.flaga_b, tgt.rep_id_kontr=src.rep_id_kontr, tgt.rep_id_komor=src.rep_id_komor
			WHEN NOT MATCHED
			THEN INSERT (id_dok, okres, id_kontr, id_komor, p_1, p_2, p_3, p_4, p_5, p_6, p_7, p_8, p_9, p_10, term_plat, dat_wypel, dat_wplywu, nr_paczki, flaga, flaga_a, flaga_b, rep_id_kontr, rep_id_komor)
			VALUES (src.id_dok, src.okres, src.id_kontr, src.id_komor, src.p_1, src.p_2, src.p_3, src.p_4, src.p_5, src.p_6, src.p_7, src.p_8, src.p_9, src.p_10, src.term_plat, src.dat_wypel, src.dat_wplywu, src.nr_paczki, src.flaga, src.flaga_a, src.flaga_b, src.rep_id_kontr, src.rep_id_komor);		
			SET @Merged = 1;
		END
		
		IF @TableName = 'dok_akc' BEGIN
			MERGE INTO zef.dok_akc AS tgt
			USING WI_StageODS.zef.dok_akc AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.status=src.status, tgt.dekl_za=src.dekl_za, tgt.us_id_kontr=src.us_id_kontr, tgt.us_id_komor=src.us_id_komor, tgt.us_id_centr=src.us_id_centr, tgt.akca_og=src.akca_og, tgt.akcb_og=src.akcb_og, tgt.akcc_og=src.akcc_og, tgt.akcd_og=src.akcd_og, tgt.akce_og=src.akce_og, tgt.akcf_og=src.akcf_og, tgt.akcg_og=src.akcg_og, tgt.akch_og=src.akch_og, tgt.akc_og=src.akc_og, tgt.zal_zs=src.zal_zs, tgt.nal_kw_wd=src.nal_kw_wd, tgt.kw_nadw=src.kw_nadw, tgt.kw_nadw_pm=src.kw_nadw_pm, tgt.do_zaplaty=src.do_zaplaty, tgt.dz_tyt_plat=src.dz_tyt_plat, tgt.dz_klasyf_budz=src.dz_klasyf_budz, tgt.nadw_wpl=src.nadw_wpl, tgt.rep_id_kontr=src.rep_id_kontr, tgt.rep_id_komor=src.rep_id_komor, tgt.rep_id_centr=src.rep_id_centr, tgt.dat_wypel=src.dat_wypel, tgt.dat_wplywu=src.dat_wplywu, tgt.term_plat=src.term_plat, tgt.nr_paczki=src.nr_paczki, tgt.czy_wewn=src.czy_wewn, tgt.akci_og=src.akci_og, tgt.akcj_og=src.akcj_og, tgt.seed_id_kontr=src.seed_id_kontr, tgt.seed_id_komor=src.seed_id_komor, tgt.form_plat=src.form_plat, tgt.korekta_pod=src.korekta_pod, tgt.dat_powst_dlugu=src.dat_powst_dlugu, tgt.termin=src.termin, tgt.akck_og=src.akck_og, tgt.kw_nadw_pm_pa=src.kw_nadw_pm_pa, tgt.nadw_wpl_pa=src.nadw_wpl_pa, tgt.kw_wm=src.kw_wm, tgt.kw_pa=src.kw_pa, tgt.us=src.us, tgt.akcl_og=src.akcl_og, tgt.dekl_za_do=src.dekl_za_do
			WHEN NOT MATCHED
			THEN INSERT (id_dok, status, dekl_za, us_id_kontr, us_id_komor, us_id_centr, akca_og, akcb_og, akcc_og, akcd_og, akce_og, akcf_og, akcg_og, akch_og, akc_og, zal_zs, nal_kw_wd, kw_nadw, kw_nadw_pm, do_zaplaty, dz_tyt_plat, dz_klasyf_budz, nadw_wpl, rep_id_kontr, rep_id_komor, rep_id_centr, dat_wypel, dat_wplywu, term_plat, nr_paczki, czy_wewn, akci_og, akcj_og, seed_id_kontr, seed_id_komor, form_plat, korekta_pod, dat_powst_dlugu, termin, akck_og, kw_nadw_pm_pa, nadw_wpl_pa, kw_wm, kw_pa, us, akcl_og, dekl_za_do)
			VALUES (src.id_dok, src.status, src.dekl_za, src.us_id_kontr, src.us_id_komor, src.us_id_centr, src.akca_og, src.akcb_og, src.akcc_og, src.akcd_og, src.akce_og, src.akcf_og, src.akcg_og, src.akch_og, src.akc_og, src.zal_zs, src.nal_kw_wd, src.kw_nadw, src.kw_nadw_pm, src.do_zaplaty, src.dz_tyt_plat, src.dz_klasyf_budz, src.nadw_wpl, src.rep_id_kontr, src.rep_id_komor, src.rep_id_centr, src.dat_wypel, src.dat_wplywu, src.term_plat, src.nr_paczki, src.czy_wewn, src.akci_og, src.akcj_og, src.seed_id_kontr, src.seed_id_komor, src.form_plat, src.korekta_pod, src.dat_powst_dlugu, src.termin, src.akck_og, src.kw_nadw_pm_pa, src.nadw_wpl_pa, src.kw_wm, src.kw_pa, src.us, src.akcl_og, src.dekl_za_do);		
			SET @Merged = 1;
		END
		
		IF @TableName = 'pspraw' BEGIN
			MERGE INTO zef.pspraw AS tgt
			USING WI_StageODS.zef.pspraw AS src
			ON (tgt.id_dok=src.id_dok AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.kod_poz=src.kod_poz, tgt.dzial=src.dzial, tgt.rozdzial=src.rozdzial, tgt.paragraf=src.paragraf, tgt.tytul=src.tytul, tgt.kwota1=src.kwota1, tgt.kwota2=src.kwota2, tgt.kwota3=src.kwota3, tgt.kwota4=src.kwota4, tgt.kwota5=src.kwota5, tgt.kwota6=src.kwota6, tgt.kwota7=src.kwota7, tgt.kwota8=src.kwota8, tgt.kwota9=src.kwota9, tgt.sum_poz=src.sum_poz, tgt.czesc=src.czesc, tgt.opis=src.opis, tgt.opis2=src.opis2, tgt.kwota10=src.kwota10, tgt.kwota11=src.kwota11, tgt.kwota12=src.kwota12, tgt.data1=src.data1, tgt.data2=src.data2, tgt.data3=src.data3, tgt.data4=src.data4, tgt.data5=src.data5, tgt.data6=src.data6, tgt.data7=src.data7, tgt.data8=src.data8, tgt.kwota13=src.kwota13, tgt.kwota14=src.kwota14, tgt.kwota15=src.kwota15, tgt.kwota16=src.kwota16, tgt.kwota17=src.kwota17, tgt.kwota18=src.kwota18, tgt.kwota19=src.kwota19, tgt.kwota20=src.kwota20, tgt.activity=src.activity
			WHEN NOT MATCHED
			THEN INSERT (id_dok, nr_poz, kod_poz, dzial, rozdzial, paragraf, tytul, kwota1, kwota2, kwota3, kwota4, kwota5, kwota6, kwota7, kwota8, kwota9, sum_poz, czesc, opis, opis2, kwota10, kwota11, kwota12, data1, data2, data3, data4, data5, data6, data7, data8, kwota13, kwota14, kwota15, kwota16, kwota17, kwota18, kwota19, kwota20, activity)
			VALUES (src.id_dok, src.nr_poz, src.kod_poz, src.dzial, src.rozdzial, src.paragraf, src.tytul, src.kwota1, src.kwota2, src.kwota3, src.kwota4, src.kwota5, src.kwota6, src.kwota7, src.kwota8, src.kwota9, src.sum_poz, src.czesc, src.opis, src.opis2, src.kwota10, src.kwota11, src.kwota12, src.data1, src.data2, src.data3, src.data4, src.data5, src.data6, src.data7, src.data8, src.kwota13, src.kwota14, src.kwota15, src.kwota16, src.kwota17, src.kwota18, src.kwota19, src.kwota20, src.activity);		
			SET @Merged = 1;
		END
		
		IF @TableName = 'dok_akcz' BEGIN
			MERGE INTO zef.dok_akcz AS tgt
			USING WI_StageODS.zef.dok_akcz AS src
			ON (tgt.id_dok=src.id_dok AND tgt.zalacznik=src.zalacznik)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.p_7=src.p_7, tgt.p_8=src.p_8, tgt.p_9=src.p_9, tgt.p_10=src.p_10, tgt.p_11=src.p_11, tgt.p_12=src.p_12, tgt.p_13=src.p_13, tgt.p_9_tyt_plat=src.p_9_tyt_plat, tgt.p_9_klasyf_budz=src.p_9_klasyf_budz
			WHEN NOT MATCHED
			THEN INSERT (id_dok, zalacznik, p_7, p_8, p_9, p_10, p_11, p_12, p_13, p_9_tyt_plat, p_9_klasyf_budz)
			VALUES (src.id_dok, src.zalacznik, src.p_7, src.p_8, src.p_9, src.p_10, src.p_11, src.p_12, src.p_13, src.p_9_tyt_plat, src.p_9_klasyf_budz);
			SET @Merged = 1;
		END
		
		IF @TableName = 'pdok_akcz' BEGIN
			MERGE INTO zef.pdok_akcz AS tgt
			USING WI_StageODS.zef.pdok_akcz AS src
			ON (tgt.id_dok=src.id_dok AND tgt.nr_poz=src.nr_poz AND tgt.zalacznik=src.zalacznik)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.nazwa_grp=src.nazwa_grp, tgt.sym_sww=src.sym_sww, tgt.poz_st_pa=src.poz_st_pa, tgt.il_wyrob=src.il_wyrob, tgt.il_wyrob_proc=src.il_wyrob_proc, tgt.st_pod=src.st_pod, tgt.kw_pod=src.kw_pod, tgt.nr_poz_slow=src.nr_poz_slow, tgt.tytul=src.tytul, tgt.dat_powst_obow=src.dat_powst_obow, tgt.term_plat=src.term_plat, tgt.termin=src.termin, tgt.nr_poz_ewid=src.nr_poz_ewid, tgt.kw_zwol=src.kw_zwol, tgt.kw_znak=src.kw_znak, tgt.il_dod=src.il_dod
			WHEN NOT MATCHED
			THEN INSERT (id_dok, nr_poz, zalacznik, nazwa_grp, sym_sww, poz_st_pa, il_wyrob, il_wyrob_proc, st_pod, kw_pod, nr_poz_slow, tytul, dat_powst_obow, term_plat, termin, nr_poz_ewid, kw_zwol, kw_znak, il_dod)
			VALUES (src.id_dok, src.nr_poz, src.zalacznik, src.nazwa_grp, src.sym_sww, src.poz_st_pa, src.il_wyrob, src.il_wyrob_proc, src.st_pod, src.kw_pod, src.nr_poz_slow, src.tytul, src.dat_powst_obow, src.term_plat, src.termin, src.nr_poz_ewid, src.kw_zwol, src.kw_znak, src.il_dod);		
			SET @Merged = 1;
		END
		
		IF @TableName = 'dok_pok' BEGIN
			MERGE INTO zef.dok_pok AS tgt
			USING WI_StageODS.zef.dok_pok AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.okres=src.okres, tgt.id_kontr=src.id_kontr, tgt.id_komor=src.id_komor, tgt.p_1=src.p_1, tgt.p_2=src.p_2, tgt.p_3=src.p_3, tgt.p_4=src.p_4, tgt.p_5=src.p_5, tgt.term_plat=src.term_plat, tgt.dat_wypel=src.dat_wypel, tgt.dat_wplywu=src.dat_wplywu, tgt.nr_paczki=src.nr_paczki, tgt.flaga=src.flaga, tgt.flaga_a=src.flaga_a, tgt.flaga_b=src.flaga_b, tgt.rep_id_kontr=src.rep_id_kontr, tgt.rep_id_komor=src.rep_id_komor, tgt.tytul=src.tytul
			WHEN NOT MATCHED
			THEN INSERT (id_dok, okres, id_kontr, id_komor, p_1, p_2, p_3, p_4, p_5, term_plat, dat_wypel, dat_wplywu, nr_paczki, flaga, flaga_a, flaga_b, rep_id_kontr, rep_id_komor, tytul)
			VALUES (src.id_dok, src.okres, src.id_kontr, src.id_komor, src.p_1, src.p_2, src.p_3, src.p_4, src.p_5, src.term_plat, src.dat_wypel, src.dat_wplywu, src.nr_paczki, src.flaga, src.flaga_a, src.flaga_b, src.rep_id_kontr, src.rep_id_komor, src.tytul);
			SET @Merged = 1;
		END
		
		IF @TableName = 'pdok_pok' BEGIN
			MERGE INTO zef.pdok_pok AS tgt
			USING WI_StageODS.zef.pdok_pok AS src
			ON (tgt.id_dok=src.id_dok AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.nr_poz_slow=src.nr_poz_slow, tgt.nazwa=src.nazwa, tgt.symbol=src.symbol, tgt.podst_pod=src.podst_pod, tgt.wskaznik=src.wskaznik, tgt.staw_pod=src.staw_pod, tgt.kwota_pod=src.kwota_pod, tgt.tytul=src.tytul, tgt.nr_poz_ewid=src.nr_poz_ewid
			WHEN NOT MATCHED
			THEN INSERT (id_dok, nr_poz, nr_poz_slow, nazwa, symbol, podst_pod, wskaznik, staw_pod, kwota_pod, tytul, nr_poz_ewid)
			VALUES (src.id_dok, src.nr_poz, src.nr_poz_slow, src.nazwa, src.symbol, src.podst_pod, src.wskaznik, src.staw_pod, src.kwota_pod, src.tytul, src.nr_poz_ewid);		
			SET @Merged = 1;
		END
		
		IF @TableName = 'dok_ainf1' BEGIN
			MERGE INTO zef.dok_ainf1 AS tgt
			USING WI_StageODS.zef.dok_ainf1 AS src
			ON (tgt.id_dok=src.id_dok AND tgt.zalacznik=src.zalacznik AND tgt.nr_zal=src.nr_zal)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.seed_id_komor=src.seed_id_komor, tgt.seed_id_kontr=src.seed_id_kontr, tgt.p_21=src.p_21, tgt.p_22=src.p_22, tgt.p_23=src.p_23, tgt.p_24=src.p_24, tgt.p_25=src.p_25, tgt.p_26=src.p_26, tgt.p_27=src.p_27, tgt.p_28=src.p_28, tgt.p_29=src.p_29, tgt.p_30=src.p_30, tgt.p_31=src.p_31, tgt.numer=src.numer
			WHEN NOT MATCHED
			THEN INSERT (id_dok, zalacznik, nr_zal, seed_id_komor, seed_id_kontr, p_21, p_22, p_23, p_24, p_25, p_26, p_27, p_28, p_29, p_30, p_31, numer)
			VALUES (src.id_dok, src.zalacznik, src.nr_zal, src.seed_id_komor, src.seed_id_kontr, src.p_21, src.p_22, src.p_23, src.p_24, src.p_25, src.p_26, src.p_27, src.p_28, src.p_29, src.p_30, src.p_31, src.numer);			
			SET @Merged = 1;
		END
		
		IF @TableName = 'dok_ainf2' BEGIN
			MERGE INTO zef.dok_ainf2 AS tgt
			USING WI_StageODS.zef.dok_ainf2 AS src
			ON (tgt.id_dok=src.id_dok AND tgt.zalacznik=src.zalacznik AND tgt.nr_zal=src.nr_zal)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.p_32=src.p_32, tgt.p_33=src.p_33, tgt.p_34=src.p_34, tgt.p_35=src.p_35, tgt.p_36=src.p_36, tgt.p_37=src.p_37, tgt.p_38=src.p_38, tgt.p_39=src.p_39, tgt.p_40=src.p_40, tgt.p_41=src.p_41, tgt.p_42=src.p_42, tgt.p_43=src.p_43, tgt.p_44=src.p_44, tgt.p_45=src.p_45, tgt.p_46=src.p_46, tgt.p_47=src.p_47, tgt.p_48=src.p_48, tgt.p_49=src.p_49, tgt.p_50=src.p_50
			WHEN NOT MATCHED
			THEN INSERT (id_dok, zalacznik, nr_zal, p_32, p_33, p_34, p_35, p_36, p_37, p_38, p_39, p_40, p_41, p_42, p_43, p_44, p_45, p_46, p_47, p_48, p_49, p_50)
			VALUES (src.id_dok, src.zalacznik, src.nr_zal, src.p_32, src.p_33, src.p_34, src.p_35, src.p_36, src.p_37, src.p_38, src.p_39, src.p_40, src.p_41, src.p_42, src.p_43, src.p_44, src.p_45, src.p_46, src.p_47, src.p_48, src.p_49, src.p_50);		
			SET @Merged = 1;
		END
		
		IF @TableName = 'dok_akc3z' BEGIN
			MERGE INTO zef.dok_akc3z AS tgt
			USING WI_StageODS.zef.dok_akc3z AS src
			ON (tgt.id_dok=src.id_dok AND tgt.zalacznik=src.zalacznik AND tgt.nr_zal=src.nr_zal)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.numer=src.numer, tgt.seed_id_komor=src.seed_id_komor, tgt.seed_id_kontr=src.seed_id_kontr, tgt.p_7=src.p_7, tgt.p_8=src.p_8, tgt.p_9=src.p_9, tgt.p_10=src.p_10, tgt.p_11=src.p_11, tgt.p_12=src.p_12, tgt.p_13=src.p_13, tgt.p_14=src.p_14, tgt.p_15=src.p_15, tgt.p_16=src.p_16, tgt.p_17=src.p_17, tgt.p_18=src.p_18, tgt.p_19=src.p_19, tgt.p_20=src.p_20, tgt.p_21=src.p_21, tgt.p_22=src.p_22, tgt.p_23=src.p_23, tgt.p_24=src.p_24, tgt.rodzaj=src.rodzaj
			WHEN NOT MATCHED
			THEN INSERT (id_dok, zalacznik, nr_zal, numer, seed_id_komor, seed_id_kontr, p_7, p_8, p_9, p_10, p_11, p_12, p_13, p_14, p_15, p_16, p_17, p_18, p_19, p_20, p_21, p_22, p_23, p_24, rodzaj)
			VALUES (src.id_dok, src.zalacznik, src.nr_zal, src.numer, src.seed_id_komor, src.seed_id_kontr, src.p_7, src.p_8, src.p_9, src.p_10, src.p_11, src.p_12, src.p_13, src.p_14, src.p_15, src.p_16, src.p_17, src.p_18, src.p_19, src.p_20, src.p_21, src.p_22, src.p_23, src.p_24, src.rodzaj);		
			SET @Merged = 1;
		END
		
		IF @TableName = 'dok_akc3zf' BEGIN
			MERGE INTO zef.dok_akc3zf AS tgt
			USING WI_StageODS.zef.dok_akc3zf AS src
			ON (tgt.id_dok=src.id_dok AND tgt.zalacznik=src.zalacznik AND tgt.nr_zal=src.nr_zal)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.p_25=src.p_25, tgt.p_26=src.p_26, tgt.p_27=src.p_27, tgt.p_28=src.p_28, tgt.p_29=src.p_29, tgt.p_30=src.p_30, tgt.p_31=src.p_31, tgt.p_32=src.p_32, tgt.p_33=src.p_33, tgt.p_34=src.p_34, tgt.p_35=src.p_35, tgt.p_36=src.p_36, tgt.p_37=src.p_37, tgt.p_38=src.p_38, tgt.p_39=src.p_39, tgt.p_41=src.p_41, tgt.p_42=src.p_42, tgt.p_43=src.p_43, tgt.p_44=src.p_44, tgt.p_40=src.p_40
			WHEN NOT MATCHED
			THEN INSERT (id_dok, zalacznik, nr_zal, p_25, p_26, p_27, p_28, p_29, p_30, p_31, p_32, p_33, p_34, p_35, p_36, p_37, p_38, p_39, p_41, p_42, p_43, p_44, p_40)
			VALUES (src.id_dok, src.zalacznik, src.nr_zal, src.p_25, src.p_26, src.p_27, src.p_28, src.p_29, src.p_30, src.p_31, src.p_32, src.p_33, src.p_34, src.p_35, src.p_36, src.p_37, src.p_38, src.p_39, src.p_41, src.p_42, src.p_43, src.p_44, src.p_40);
			SET @Merged = 1;
		END
		
		IF @TableName = 'pdok_akc3z' BEGIN
			MERGE INTO zef.pdok_akc3z AS tgt
			USING WI_StageODS.zef.pdok_akc3z AS src
			ON (tgt.id_dok=src.id_dok AND tgt.zalacznik=src.zalacznik AND tgt.nr_zal=src.nr_zal AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.nr_poz_slow=src.nr_poz_slow, tgt.nazwa_grp=src.nazwa_grp, tgt.rodz_sym=src.rodz_sym, tgt.rodz_st=src.rodz_st, tgt.symbol=src.symbol, tgt.podst_pod=src.podst_pod, tgt.podst_pod_proc=src.podst_pod_proc, tgt.staw_pod=src.staw_pod, tgt.staw_pod_proc=src.staw_pod_proc, tgt.kwota_pod=src.kwota_pod, tgt.tytul=src.tytul
			WHEN NOT MATCHED
			THEN INSERT (id_dok, zalacznik, nr_zal, nr_poz, nr_poz_slow, nazwa_grp, rodz_sym, rodz_st, symbol, podst_pod, podst_pod_proc, staw_pod, staw_pod_proc, kwota_pod, tytul)
			VALUES (src.id_dok, src.zalacznik, src.nr_zal, src.nr_poz, src.nr_poz_slow, src.nazwa_grp, src.rodz_sym, src.rodz_st, src.symbol, src.podst_pod, src.podst_pod_proc, src.staw_pod, src.staw_pod_proc, src.kwota_pod, src.tytul);
			SET @Merged = 1;
		END
		
		IF @TableName = 'dok_pog4z' BEGIN
			MERGE INTO zef.dok_pog4z AS tgt
			USING WI_StageODS.zef.dok_pog4z AS src
			ON (tgt.id_dok=src.id_dok AND tgt.zalacznik=src.zalacznik AND tgt.nr_zal=src.nr_zal)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.numer=src.numer, tgt.okres=src.okres, tgt.rodzaj=src.rodzaj, tgt.id_dok_stow=src.id_dok_stow, tgt.sym_dok_stow=src.sym_dok_stow, tgt.data_wystaw_dok=src.data_wystaw_dok, tgt.opis=src.opis, tgt.p_1=src.p_1, tgt.p_2=src.p_2, tgt.p_3=src.p_3, tgt.p_4=src.p_4, tgt.p_5=src.p_5, tgt.p_6=src.p_6, tgt.nr_poz_ewid=src.nr_poz_ewid, tgt.nazwa=src.nazwa, tgt.data_wyd=src.data_wyd
			WHEN NOT MATCHED
			THEN INSERT (id_dok, zalacznik, nr_zal, numer, okres, rodzaj, id_dok_stow, sym_dok_stow, data_wystaw_dok, opis, p_1, p_2, p_3, p_4, p_5, p_6, nr_poz_ewid, nazwa, data_wyd)
			VALUES (src.id_dok, src.zalacznik, src.nr_zal, src.numer, src.okres, src.rodzaj, src.id_dok_stow, src.sym_dok_stow, src.data_wystaw_dok, src.opis, src.p_1, src.p_2, src.p_3, src.p_4, src.p_5, src.p_6, src.nr_poz_ewid, src.nazwa, src.data_wyd);
			SET @Merged = 1;
		END
		
		IF @TableName = 'pdok_pog4z' BEGIN
			MERGE INTO zef.pdok_pog4z AS tgt
			USING WI_StageODS.zef.pdok_pog4z AS src
			ON (tgt.id_dok=src.id_dok AND tgt.zalacznik=src.zalacznik AND tgt.nr_zal=src.nr_zal AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.nr_poz_slow=src.nr_poz_slow, tgt.nazwa_grp=src.nazwa_grp, tgt.rodz_sym=src.rodz_sym, tgt.rodz_st=src.rodz_st, tgt.symbol=src.symbol, tgt.podst_pod=src.podst_pod, tgt.podst_pod_proc=src.podst_pod_proc, tgt.staw_pod=src.staw_pod, tgt.staw_pod_proc=src.staw_pod_proc, tgt.kwota_pod=src.kwota_pod, tgt.tytul=src.tytul, tgt.nr_poz_ewid=src.nr_poz_ewid
			WHEN NOT MATCHED
			THEN INSERT (id_dok, zalacznik, nr_zal, nr_poz, nr_poz_slow, nazwa_grp, rodz_sym, rodz_st, symbol, podst_pod, podst_pod_proc, staw_pod, staw_pod_proc, kwota_pod, tytul, nr_poz_ewid)
			VALUES (src.id_dok, src.zalacznik, src.nr_zal, src.nr_poz, src.nr_poz_slow, src.nazwa_grp, src.rodz_sym, src.rodz_st, src.symbol, src.podst_pod, src.podst_pod_proc, src.staw_pod, src.staw_pod_proc, src.kwota_pod, src.tytul, src.nr_poz_ewid);		
			SET @Merged = 1;
		END
		
		IF @TableName = 'dok_akc4z' BEGIN
			MERGE INTO zef.dok_akc4z AS tgt
			USING WI_StageODS.zef.dok_akc4z AS src
			ON (tgt.id_dok=src.id_dok AND tgt.zalacznik=src.zalacznik AND tgt.nr_zal=src.nr_zal)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.numer=src.numer, tgt.rodzaj=src.rodzaj, tgt.seed_id_komor=src.seed_id_komor, tgt.seed_id_kontr=src.seed_id_kontr, tgt.seed_typ=src.seed_typ, tgt.p_7=src.p_7, tgt.p_8=src.p_8, tgt.p_9=src.p_9, tgt.p_10=src.p_10, tgt.p_11=src.p_11, tgt.p_12=src.p_12, tgt.p_13=src.p_13, tgt.p_14=src.p_14, tgt.p_15=src.p_15, tgt.p_16=src.p_16, tgt.p_17=src.p_17, tgt.okres=src.okres, tgt.okres_do=src.okres_do, tgt.nr_poz_ewid=src.nr_poz_ewid
			WHEN NOT MATCHED
			THEN INSERT (id_dok, zalacznik, nr_zal, numer, rodzaj, seed_id_komor, seed_id_kontr, seed_typ, p_7, p_8, p_9, p_10, p_11, p_12, p_13, p_14, p_15, p_16, p_17, okres, okres_do, nr_poz_ewid)
			VALUES (src.id_dok, src.zalacznik, src.nr_zal, src.numer, src.rodzaj, src.seed_id_komor, src.seed_id_kontr, src.seed_typ, src.p_7, src.p_8, src.p_9, src.p_10, src.p_11, src.p_12, src.p_13, src.p_14, src.p_15, src.p_16, src.p_17, src.okres, src.okres_do, src.nr_poz_ewid);
			SET @Merged = 1;
		END
		
		IF @TableName = 'pdok_akc4z' BEGIN
			MERGE INTO zef.pdok_akc4z AS tgt
			USING WI_StageODS.zef.pdok_akc4z AS src
			ON (tgt.id_dok=src.id_dok AND tgt.zalacznik=src.zalacznik AND tgt.nr_zal=src.nr_zal AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.nr_poz_slow=src.nr_poz_slow, tgt.nazwa_grp=src.nazwa_grp, tgt.rodz_sym=src.rodz_sym, tgt.rodz_st=src.rodz_st, tgt.symbol=src.symbol, tgt.podst_pod=src.podst_pod, tgt.podst_pod_proc=src.podst_pod_proc, tgt.staw_pod=src.staw_pod, tgt.staw_pod_proc=src.staw_pod_proc, tgt.kwota_pod=src.kwota_pod, tgt.tytul=src.tytul, tgt.nr_poz_ewid=src.nr_poz_ewid, tgt.podst_obn=src.podst_obn, tgt.staw_obn=src.staw_obn, tgt.kwota_obn=src.kwota_obn
			WHEN NOT MATCHED
			THEN INSERT (id_dok, zalacznik, nr_zal, nr_poz, nr_poz_slow, nazwa_grp, rodz_sym, rodz_st, symbol, podst_pod, podst_pod_proc, staw_pod, staw_pod_proc, kwota_pod, tytul, nr_poz_ewid, podst_obn, staw_obn, kwota_obn)
			VALUES (src.id_dok, src.zalacznik, src.nr_zal, src.nr_poz, src.nr_poz_slow, src.nazwa_grp, src.rodz_sym, src.rodz_st, src.symbol, src.podst_pod, src.podst_pod_proc, src.staw_pod, src.staw_pod_proc, src.kwota_pod, src.tytul, src.nr_poz_ewid, src.podst_obn, src.staw_obn, src.kwota_obn);
			SET @Merged = 1;
		END
		
		IF @TableName = 'ew_egz_agr' BEGIN
			MERGE INTO zef.ew_egz_agr AS tgt
			USING WI_StageODS.zef.ew_egz_agr AS src
			ON (tgt.id_dok=src.id_dok)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.sym_dok=src.sym_dok, tgt.dat_wystaw_dok=src.dat_wystaw_dok, tgt.archiwum=src.archiwum, tgt.id_dok_spraw=src.id_dok_spraw, tgt.nr_dok_spraw=src.nr_dok_spraw, tgt.stat_spraw=src.stat_spraw, tgt.stat_poprz=src.stat_poprz, tgt.id_rodz_dok=src.id_rodz_dok, tgt.id_komor=src.id_komor, tgt.id_kontr=src.id_kontr, tgt.id_komor3=src.id_komor3, tgt.id_kontr3=src.id_kontr3, tgt.data_wnios=src.data_wnios, tgt.data_przydz=src.data_przydz, tgt.data_zak=src.data_zak, tgt.sp_zak_egz=src.sp_zak_egz, tgt.kwot_nal=src.kwot_nal, tgt.kwot_nal_sc=src.kwot_nal_sc, tgt.saldo_nal=src.saldo_nal, tgt.kwot_ods=src.kwot_ods, tgt.kwot_ods_sc=src.kwot_ods_sc, tgt.saldo_ods=src.saldo_ods, tgt.kwot_upom=src.kwot_upom, tgt.kwot_upom_sc=src.kwot_upom_sc, tgt.saldo_upom=src.saldo_upom, tgt.kwot_egz=src.kwot_egz, tgt.kwot_egz_sc=src.kwot_egz_sc, tgt.saldo_egz=src.saldo_egz, tgt.kntr_dodat=src.kntr_dodat, tgt.kwot_we=src.kwot_we, tgt.kwot_we_sc=src.kwot_we_sc, tgt.saldo_we=src.saldo_we
			WHEN NOT MATCHED
			THEN INSERT (id_dok, sym_dok, dat_wystaw_dok, archiwum, id_dok_spraw, nr_dok_spraw, stat_spraw, stat_poprz, id_rodz_dok, id_komor, id_kontr, id_komor3, id_kontr3, data_wnios, data_przydz, data_zak, sp_zak_egz, kwot_nal, kwot_nal_sc, saldo_nal, kwot_ods, kwot_ods_sc, saldo_ods, kwot_upom, kwot_upom_sc, saldo_upom, kwot_egz, kwot_egz_sc, saldo_egz, kntr_dodat, kwot_we, kwot_we_sc, saldo_we)
			VALUES (src.id_dok, src.sym_dok, src.dat_wystaw_dok, src.archiwum, src.id_dok_spraw, src.nr_dok_spraw, src.stat_spraw, src.stat_poprz, src.id_rodz_dok, src.id_komor, src.id_kontr, src.id_komor3, src.id_kontr3, src.data_wnios, src.data_przydz, src.data_zak, src.sp_zak_egz, src.kwot_nal, src.kwot_nal_sc, src.saldo_nal, src.kwot_ods, src.kwot_ods_sc, src.saldo_ods, src.kwot_upom, src.kwot_upom_sc, src.saldo_upom, src.kwot_egz, src.kwot_egz_sc, src.saldo_egz, src.kntr_dodat, src.kwot_we, src.kwot_we_sc, src.saldo_we);		
			SET @Merged = 1;
		END
		
		IF @TableName = 'ew_nal_agr' BEGIN
			MERGE INTO zef.ew_nal_agr AS tgt
			USING WI_StageODS.zef.ew_nal_agr AS src
			ON (tgt.id_dok=src.id_dok AND tgt.id_komor=src.id_komor AND tgt.id_kontr=src.id_kontr)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.id_jedn=src.id_jedn, tgt.id_rodz_dok=src.id_rodz_dok, tgt.sym_dok=src.sym_dok, tgt.dat_wystaw_dok=src.dat_wystaw_dok, tgt.term_plat=src.term_plat, tgt.kwota_dok=src.kwota_dok, tgt.kwota_nal=src.kwota_nal, tgt.kwota_wpl=src.kwota_wpl, tgt.saldo=src.saldo, tgt.stat_spraw=src.stat_spraw, tgt.stat_poprz=src.stat_poprz, tgt.kntr_dodat=src.kntr_dodat, tgt.plat_id_komor=src.plat_id_komor, tgt.plat_id_kontr=src.plat_id_kontr, tgt.data_rozl=src.data_rozl, tgt.id_dok_stow=src.id_dok_stow, tgt.sym_dok_stow=src.sym_dok_stow
			WHEN NOT MATCHED
			THEN INSERT (id_dok, id_jedn, id_rodz_dok, id_komor, id_kontr, sym_dok, dat_wystaw_dok, term_plat, kwota_dok, kwota_nal, kwota_wpl, saldo, stat_spraw, stat_poprz, kntr_dodat, plat_id_komor, plat_id_kontr, data_rozl, id_dok_stow, sym_dok_stow)
			VALUES (src.id_dok, src.id_jedn, src.id_rodz_dok, src.id_komor, src.id_kontr, src.sym_dok, src.dat_wystaw_dok, src.term_plat, src.kwota_dok, src.kwota_nal, src.kwota_wpl, src.saldo, src.stat_spraw, src.stat_poprz, src.kntr_dodat, src.plat_id_komor, src.plat_id_kontr, src.data_rozl, src.id_dok_stow, src.sym_dok_stow);
			SET @Merged = 1;
		END
		
		IF @TableName = 'samochody' BEGIN
			MERGE INTO zef.samochody AS tgt
			USING WI_StageODS.zef.samochody AS src
			ON (tgt.id_dok=src.id_dok AND tgt.nr_poz=src.nr_poz)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.marka=src.marka, tgt.typ=src.typ, tgt.model=src.model, tgt.nr_identyfikacyjny=src.nr_identyfikacyjny, tgt.nr_silnika=src.nr_silnika, tgt.pojemnosc=src.pojemnosc, tgt.rok=src.rok, tgt.uwagi=src.uwagi
			WHEN NOT MATCHED
			THEN INSERT (id_dok, nr_poz, marka, typ, model, nr_identyfikacyjny, nr_silnika, pojemnosc, rok, uwagi)
			VALUES (src.id_dok, src.nr_poz, src.marka, src.typ, src.model, src.nr_identyfikacyjny, src.nr_silnika, src.pojemnosc, src.rok, src.uwagi);
			SET @Merged = 1;
		END
			
IF (@Merged = 0)
	BEGIN
			DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
			THROW 51002, @Info, 0;
				END
			END;