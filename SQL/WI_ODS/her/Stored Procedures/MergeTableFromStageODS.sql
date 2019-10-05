-- ==============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-21
-- Description:	Procedura Merge'ująca w schemacie Hermes2
-- ===============================================

CREATE PROCEDURE [her].[MergeTableFromStageODS] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
		END

	IF @TableName = 'ad_org_typ' BEGIN
		MERGE INTO her.ad_org_typ AS tgt
		USING [WI_StageODS].her.ad_org_typ AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.kod=src.kod, tgt.nazwa=src.nazwa, tgt.normatyw=src.normatyw, tgt.normatyw_do=src.normatyw_do, tgt.wsk_st_prac=src.wsk_st_prac
		WHEN NOT MATCHED
		THEN INSERT (id, kod, nazwa, normatyw, normatyw_do, wsk_st_prac)
		VALUES (src.id, src.kod, src.nazwa, src.normatyw, src.normatyw_do, src.wsk_st_prac);
		SET @Merged = 1;
	END

	IF @TableName = 'ad_org_etat' BEGIN
		MERGE INTO her.ad_org_etat AS tgt
		USING [WI_StageODS].her.ad_org_etat AS src
		ON (tgt.id=src.id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.kat=src.kat, tgt.idwlas=src.idwlas, tgt.idstan=src.idstan, tgt.il_etat=src.il_etat, tgt.idzaw=src.idzaw, tgt.data_pow=src.data_pow, tgt.idroz_pow=src.idroz_pow, tgt.data_lik=src.data_lik, tgt.idroz_lik=src.idroz_lik, tgt.idprz_lik=src.idprz_lik, tgt.idstet=src.idstet, tgt.idstdoc=src.idstdoc, tgt.idgr_zaw=src.idgr_zaw, tgt.idwyk_og=src.idwyk_og, tgt.idwyk_res=src.idwyk_res, tgt.z_fin=src.z_fin, tgt.id_uz=src.id_uz, tgt.d_zap=src.d_zap, tgt.id_fun=src.id_fun, tgt.id_kat=src.id_kat, tgt.id_katD=src.id_katD, tgt.gr_zasz=src.gr_zasz, tgt.idspfin=src.idspfin, tgt.lp=src.lp, tgt.wyn_wart=src.wyn_wart, tgt.kod_dook=src.kod_dook, tgt.idBeforeTransfer=src.idBeforeTransfer, tgt.idWar=src.idWar, tgt.idEtatKier=src.idEtatKier, tgt.polozenieEtatKier=src.polozenieEtatKier, tgt.symbol=src.symbol
		WHEN NOT MATCHED
		THEN INSERT (id, kat, idwlas, idstan, il_etat, idzaw, data_pow, idroz_pow, data_lik, idroz_lik, idprz_lik, idstet, idstdoc, idgr_zaw, idwyk_og, idwyk_res, z_fin, id_uz, d_zap, id_fun, id_kat, id_katD, gr_zasz, idspfin, lp, wyn_wart, kod_dook, idBeforeTransfer, idWar, idEtatKier, polozenieEtatKier, symbol)
		VALUES (src.id, src.kat, src.idwlas, src.idstan, src.il_etat, src.idzaw, src.data_pow, src.idroz_pow, src.data_lik, src.idroz_lik, src.idprz_lik, src.idstet, src.idstdoc, src.idgr_zaw, src.idwyk_og, src.idwyk_res, src.z_fin, src.id_uz, src.d_zap, src.id_fun, src.id_kat, src.id_katD, src.gr_zasz, src.idspfin, src.lp, src.wyn_wart, src.kod_dook, src.idBeforeTransfer, src.idWar, src.idEtatKier, src.polozenieEtatKier, src.symbol);
		SET @Merged = 1;
	END

	IF @TableName = 'ka_dp25' BEGIN
		MERGE INTO her.ka_dp25 AS tgt
		USING [WI_StageODS].her.ka_dp25 AS src
		ON (tgt.tr=src.tr and tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id=src.id, tgt.skrot=src.skrot, tgt.nazwa=src.nazwa, tgt.nazwa1=src.nazwa1, tgt.nazwa2=src.nazwa2, tgt.nazwa3=src.nazwa3, tgt.nazwa4=src.nazwa4, tgt.nazwa5=src.nazwa5, tgt.nazwa6=src.nazwa6, tgt.nazwap=src.nazwap, tgt.wsk=src.wsk, tgt.zastrz=src.zastrz, tgt.wsk1=src.wsk1, tgt.wsk2=src.wsk2, tgt.wsk3=src.wsk3, tgt.wsk_arch=src.wsk_arch, tgt.wsk_tr=src.wsk_tr, tgt.wsk_kod=src.wsk_kod, tgt.wsk_nr_kol=src.wsk_nr_kol
		WHEN NOT MATCHED
		THEN INSERT (id, tr, kod, skrot, nazwa, nazwa1, nazwa2, nazwa3, nazwa4, nazwa5, nazwa6, nazwap, wsk, zastrz, wsk1, wsk2, wsk3, wsk_arch, wsk_tr, wsk_kod, wsk_nr_kol)
		VALUES (src.id, src.tr, src.kod, src.skrot, src.nazwa, src.nazwa1, src.nazwa2, src.nazwa3, src.nazwa4, src.nazwa5, src.nazwa6, src.nazwap, src.wsk, src.zastrz, src.wsk1, src.wsk2, src.wsk3, src.wsk_arch, src.wsk_tr, src.wsk_kod, src.wsk_nr_kol);
		SET @Merged = 1;
	END

	IF @TableName = 'ad_kat_org' BEGIN
		MERGE INTO her.ad_kat_org AS tgt
		USING [WI_StageODS].her.ad_kat_org AS src
		ON (tgt.iduni=src.iduni)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id0=src.id0, tgt.id=src.id, tgt.idpow=src.idpow, tgt.idwar=src.idwar, tgt.poz=src.poz, tgt.poziom=src.poziom, tgt.polozenie=src.polozenie, tgt.symbol=src.symbol, tgt.nazwa=src.nazwa, tgt.stan=src.stan, tgt.status=src.status, tgt.idprac=src.idprac, tgt.dataod=src.dataod, tgt.datado=src.datado, tgt.idroz_od=src.idroz_od, tgt.idroz_do=src.idroz_do, tgt.idkod_od=src.idkod_od, tgt.idkod_do=src.idkod_do, tgt.idrodz=src.idrodz, tgt.idpion=src.idpion, tgt.idtyp=src.idtyp, tgt.idpoczta=src.idpoczta, tgt.idgmina=src.idgmina, tgt.idpowiat=src.idpowiat, tgt.idwoj=src.idwoj, tgt.idkraj=src.idkraj, tgt.miejscowosc=src.miejscowosc, tgt.ulica=src.ulica, tgt.dom=src.dom, tgt.lokal=src.lokal, tgt.nuts=src.nuts, tgt.opis=src.opis, tgt.idzak=src.idzak, tgt.k_zak=src.k_zak, tgt.k_je=src.k_je, tgt.k_fi=src.k_fi, tgt.k_dod=src.k_dod, tgt.idstru=src.idstru, tgt.k_pl=src.k_pl, tgt.k_gm=src.k_gm, tgt.k_pr=src.k_pr, tgt.k_wi=src.k_wi, tgt.k_cz=src.k_cz, tgt.k_pz=src.k_pz, tgt.k_pt=src.k_pt, tgt.add_user=src.add_user, tgt.add_data=src.add_data, tgt.up_user=src.up_user, tgt.up_data=src.up_data, tgt.opis2=src.opis2, tgt.email=src.email, tgt.link=src.link, tgt.tery=src.tery, tgt.idteryt=src.idteryt, tgt.idobszar=src.idobszar, tgt.idregion=src.idregion, tgt.szczebel=src.szczebel, tgt.tel=src.tel, tgt.tel2=src.tel2, tgt.fax=src.fax, tgt.datalik=src.datalik, tgt.poczta=src.poczta, tgt.gmina=src.gmina, tgt.powiat=src.powiat, tgt.idjo=src.idjo, tgt.pozycja_mld=src.pozycja_mld, tgt.kodSowa=src.kodSowa, tgt.idPionSzkol=src.idPionSzkol, tgt.isOddzial=src.isOddzial, tgt.idOddzTyp=src.idOddzTyp, tgt.idOddzRodzaj=src.idOddzRodzaj, tgt.idOddzRuch=src.idOddzRuch, tgt.isDaily=src.isDaily, tgt.timeFrom=src.timeFrom, tgt.timeTo=src.timeTo, tgt.idEtatKier=src.idEtatKier, tgt.polozenieEtatKier=src.polozenieEtatKier, tgt.idWorkMode=src.idWorkMode
		WHEN NOT MATCHED
		THEN INSERT (iduni, id0, id, idpow, idwar, poz, poziom, polozenie, symbol, nazwa, stan, status, idprac, dataod, datado, idroz_od, idroz_do, idkod_od, idkod_do, idrodz, idpion, idtyp, idpoczta, idgmina, idpowiat, idwoj, idkraj, miejscowosc, ulica, dom, lokal, nuts, opis, idzak, k_zak, k_je, k_fi, k_dod, idstru, k_pl, k_gm, k_pr, k_wi, k_cz, k_pz, k_pt, add_user, add_data, up_user, up_data, opis2, email, link, tery, idteryt, idobszar, idregion, szczebel, tel, tel2, fax, datalik, poczta, gmina, powiat, idjo, pozycja_mld, kodSowa, idPionSzkol, isOddzial, idOddzTyp, idOddzRodzaj, idOddzRuch, isDaily, timeFrom, timeTo, idEtatKier, polozenieEtatKier, idWorkMode)
		VALUES (src.iduni, src.id0, src.id, src.idpow, src.idwar, src.poz, src.poziom, src.polozenie, src.symbol, src.nazwa, src.stan, src.status, src.idprac, src.dataod, src.datado, src.idroz_od, src.idroz_do, src.idkod_od, src.idkod_do, src.idrodz, src.idpion, src.idtyp, src.idpoczta, src.idgmina, src.idpowiat, src.idwoj, src.idkraj, src.miejscowosc, src.ulica, src.dom, src.lokal, src.nuts, src.opis, src.idzak, src.k_zak, src.k_je, src.k_fi, src.k_dod, src.idstru, src.k_pl, src.k_gm, src.k_pr, src.k_wi, src.k_cz, src.k_pz, src.k_pt, src.add_user, src.add_data, src.up_user, src.up_data, src.opis2, src.email, src.link, src.tery, src.idteryt, src.idobszar, src.idregion, src.szczebel, src.tel, src.tel2, src.fax, src.datalik, src.poczta, src.gmina, src.powiat, src.idjo, src.pozycja_mld, src.kodSowa, src.idPionSzkol, src.isOddzial, src.idOddzTyp, src.idOddzRodzaj, src.idOddzRuch, src.isDaily, src.timeFrom, src.timeTo, src.idEtatKier, src.polozenieEtatKier, src.idWorkMode);
		SET @Merged = 1;
	END

	IF @TableName = 'ka_dp001' BEGIN
		MERGE INTO her.ka_dp001 AS tgt
		USING [WI_StageODS].her.ka_dp001 AS src
		ON (tgt.IdPrac=src.IdPrac)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdKodPlec=src.IdKodPlec, tgt.DataUr=src.DataUr
		WHEN NOT MATCHED
		THEN INSERT (IdPrac, IdKodPlec, DataUr)
		VALUES (src.IdPrac, src.IdKodPlec, src.DataUr);
		SET @Merged = 1;
	END

	IF @TableName = 'ka_dp002' BEGIN
		MERGE INTO her.ka_dp002 AS tgt
		USING [WI_StageODS].her.ka_dp002 AS src
		ON (tgt.IdUmowy=src.IdUmowy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RV=src.RV, tgt.DataZap=src.DataZap, tgt.IdUzZap=src.IdUzZap, tgt.IdPrac=src.IdPrac, tgt.IdUmowyPowiaz=src.IdUmowyPowiaz, tgt.NrKolUmowy=src.NrKolUmowy, tgt.NrUmowy=src.NrUmowy, tgt.NrAkt=src.NrAkt, tgt.IdKodEp=src.IdKodEp, tgt.IdPracodawca=src.IdPracodawca, tgt.KodRodzStosPrac=src.KodRodzStosPrac, tgt.IdKodRodzStosPrac=src.IdKodRodzStosPrac, tgt.KodRodzUmowy=src.KodRodzUmowy, tgt.IdKodRodzUmowy=src.IdKodRodzUmowy, tgt.KodSposPrzyj=src.KodSposPrzyj, tgt.IdKodSposPrzyj=src.IdKodSposPrzyj, tgt.KodStatusPrzyj=src.KodStatusPrzyj, tgt.IdKodStatusPrzyj=src.IdKodStatusPrzyj, tgt.KodStatusCzKSC=src.KodStatusCzKSC, tgt.IdKodStatusCzKSC=src.IdKodStatusCzKSC, tgt.DataZawUmowy=src.DataZawUmowy, tgt.DataRozpPracy=src.DataRozpPracy, tgt.DataZakUmowy=src.DataZakUmowy, tgt.DataOkrUmowyOd=src.DataOkrUmowyOd, tgt.DataOkrUmowyDo=src.DataOkrUmowyDo, tgt.DataMianSluzbSC=src.DataMianSluzbSC, tgt.KodZwol=src.KodZwol, tgt.IdKodZwol=src.IdKodZwol, tgt.KodPowZwol=src.KodPowZwol, tgt.IdKodPowZwol=src.IdKodPowZwol, tgt.MiejWykPracy=src.MiejWykPracy, tgt.WarunkiZatr=src.WarunkiZatr, tgt.WskPrzejNaEmeryt=src.WskPrzejNaEmeryt, tgt.WskPrzywDoPracy=src.WskPrzywDoPracy, tgt.ZalDoStazuMcy=src.ZalDoStazuMcy, tgt.ZalDoStazuDni=src.ZalDoStazuDni
		WHEN NOT MATCHED
		THEN INSERT (RV, DataZap, IdUzZap, IdPrac, IdUmowy, IdUmowyPowiaz, NrKolUmowy, NrUmowy, NrAkt, IdKodEp, IdPracodawca, KodRodzStosPrac, IdKodRodzStosPrac, KodRodzUmowy, IdKodRodzUmowy, KodSposPrzyj, IdKodSposPrzyj, KodStatusPrzyj, IdKodStatusPrzyj, KodStatusCzKSC, IdKodStatusCzKSC, DataZawUmowy, DataRozpPracy, DataZakUmowy, DataOkrUmowyOd, DataOkrUmowyDo, DataMianSluzbSC, KodZwol, IdKodZwol, KodPowZwol, IdKodPowZwol, MiejWykPracy, WarunkiZatr, WskPrzejNaEmeryt, WskPrzywDoPracy, ZalDoStazuMcy, ZalDoStazuDni)
		VALUES (src.RV, src.DataZap, src.IdUzZap, src.IdPrac, src.IdUmowy, src.IdUmowyPowiaz, src.NrKolUmowy, src.NrUmowy, src.NrAkt, src.IdKodEp, src.IdPracodawca, src.KodRodzStosPrac, src.IdKodRodzStosPrac, src.KodRodzUmowy, src.IdKodRodzUmowy, src.KodSposPrzyj, src.IdKodSposPrzyj, src.KodStatusPrzyj, src.IdKodStatusPrzyj, src.KodStatusCzKSC, src.IdKodStatusCzKSC, src.DataZawUmowy, src.DataRozpPracy, src.DataZakUmowy, src.DataOkrUmowyOd, src.DataOkrUmowyDo, src.DataMianSluzbSC, src.KodZwol, src.IdKodZwol, src.KodPowZwol, src.IdKodPowZwol, src.MiejWykPracy, src.WarunkiZatr, src.WskPrzejNaEmeryt, src.WskPrzywDoPracy, src.ZalDoStazuMcy, src.ZalDoStazuDni);
		SET @Merged = 1;
	END

	IF @TableName = 'ka_dp004' BEGIN
		MERGE INTO her.ka_dp004 AS tgt
		USING [WI_StageODS].her.ka_dp004 AS src
		ON (tgt.IdDp004=src.IdDp004)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdPrac=src.IdPrac, tgt.IdKodPoziomWyksz=src.IdKodPoziomWyksz
		WHEN NOT MATCHED
		THEN INSERT (IdDp004, IdPrac, IdKodPoziomWyksz)
		VALUES (src.IdDp004, src.IdPrac, src.IdKodPoziomWyksz);
		SET @Merged = 1;
	END

	IF @TableName = 'ka_dp010f' BEGIN
		MERGE INTO her.ka_dp010f AS tgt
		USING [WI_StageODS].her.ka_dp010f AS src
		ON (tgt.IdDp010f=src.IdDp010f)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RV=src.RV, tgt.DataZap=src.DataZap, tgt.IdUzZap=src.IdUzZap, tgt.IdPrac=src.IdPrac, tgt.DataOd=src.DataOd, tgt.KodKorpus=src.KodKorpus, tgt.IdKodKorpus=src.IdKodKorpus, tgt.KodStopien=src.KodStopien, tgt.IdKodStopien=src.IdKodStopien, tgt.KodTrybMian=src.KodTrybMian, tgt.IdKodTrybMian=src.IdKodTrybMian, tgt.DataNastMian=src.DataNastMian, tgt.DataNastMianDo=src.DataNastMianDo, tgt.Wyroznienie=src.Wyroznienie
		WHEN NOT MATCHED
		THEN INSERT (RV, DataZap, IdUzZap, IdDp010f, IdPrac, DataOd, KodKorpus, IdKodKorpus, KodStopien, IdKodStopien, KodTrybMian, IdKodTrybMian, DataNastMian, DataNastMianDo, Wyroznienie)
		VALUES (src.RV, src.DataZap, src.IdUzZap, src.IdDp010f, src.IdPrac, src.DataOd, src.KodKorpus, src.IdKodKorpus, src.KodStopien, src.IdKodStopien, src.KodTrybMian, src.IdKodTrybMian, src.DataNastMian, src.DataNastMianDo, src.Wyroznienie);
		SET @Merged = 1;
	END

	IF @TableName = 'ka_sl001' BEGIN
		MERGE INTO her.ka_sl001 AS tgt
		USING [WI_StageODS].her.ka_sl001 AS src
		ON (tgt.IdKodEp=src.IdKodEp)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RV=src.RV, tgt.DataZap=src.DataZap, tgt.IdUzZap=src.IdUzZap, tgt.KodEp=src.KodEp, tgt.NazwaEp=src.NazwaEp, tgt.IdKodRodzEp=src.IdKodRodzEp, tgt.DataObowOd=src.DataObowOd, tgt.DataObowDo=src.DataObowDo, tgt.PodstPraw=src.PodstPraw, tgt.Opis=src.Opis, tgt.PodstPrawWynagr=src.PodstPrawWynagr, tgt.IdPodstPrawWynagr=src.IdPodstPrawWynagr
		WHEN NOT MATCHED
		THEN INSERT (RV, DataZap, IdUzZap, IdKodEp, KodEp, NazwaEp, IdKodRodzEp, DataObowOd, DataObowDo, PodstPraw, Opis, PodstPrawWynagr, IdPodstPrawWynagr)
		VALUES (src.RV, src.DataZap, src.IdUzZap, src.IdKodEp, src.KodEp, src.NazwaEp, src.IdKodRodzEp, src.DataObowOd, src.DataObowDo, src.PodstPraw, src.Opis, src.PodstPrawWynagr, src.IdPodstPrawWynagr);
		SET @Merged = 1;
	END

	IF @TableName = 'ka_dp020' BEGIN
		MERGE INTO her.ka_dp020 AS tgt
		USING [WI_StageODS].her.ka_dp020 AS src
		ON (tgt.IdDp020=src.IdDp020)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RV=src.RV, tgt.DataZap=src.DataZap, tgt.IdUzZap=src.IdUzZap, tgt.IdPrac=src.IdPrac, tgt.IdUmowy=src.IdUmowy, tgt.DataOd=src.DataOd, tgt.KodGrPrac=src.KodGrPrac, tgt.IdKodGrPrac=src.IdKodGrPrac, tgt.IdPracodawca=src.IdPracodawca, tgt.IdJednOrg=src.IdJednOrg, tgt.IdKomOrg=src.IdKomOrg, tgt.IdStanEtat=src.IdStanEtat, tgt.IdKomOrgMian=src.IdKomOrgMian, tgt.IdStan=src.IdStan, tgt.KodPowZmianStan=src.KodPowZmianStan, tgt.IdKodPowZmianStan=src.IdKodPowZmianStan, tgt.WskZmianStrOrg=src.WskZmianStrOrg, tgt.KodPodstPraw=src.KodPodstPraw, tgt.IdKodPodstPraw=src.IdKodPodstPraw
		WHEN NOT MATCHED
		THEN INSERT (RV, DataZap, IdUzZap, IdDp020, IdPrac, IdUmowy, DataOd, KodGrPrac, IdKodGrPrac, IdPracodawca, IdJednOrg, IdKomOrg, IdStanEtat, IdKomOrgMian, IdStan, KodPowZmianStan, IdKodPowZmianStan, WskZmianStrOrg, KodPodstPraw, IdKodPodstPraw)
		VALUES (src.RV, src.DataZap, src.IdUzZap, src.IdDp020, src.IdPrac, src.IdUmowy, src.DataOd, src.KodGrPrac, src.IdKodGrPrac, src.IdPracodawca, src.IdJednOrg, src.IdKomOrg, src.IdStanEtat, src.IdKomOrgMian, src.IdStan, src.KodPowZmianStan, src.IdKodPowZmianStan, src.WskZmianStrOrg, src.KodPodstPraw, src.IdKodPodstPraw);
		SET @Merged = 1;
	END

	IF @TableName = 'ka_dp020wym' BEGIN
		MERGE INTO her.ka_dp020wym AS tgt
		USING [WI_StageODS].her.ka_dp020wym AS src
		ON (tgt.IdDp020wym=src.IdDp020wym)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RV=src.RV, tgt.DataZap=src.DataZap, tgt.IdUzZap=src.IdUzZap, tgt.IdPrac=src.IdPrac, tgt.IdUmowy=src.IdUmowy, tgt.DataOd=src.DataOd, tgt.KodWymCzasPrac=src.KodWymCzasPrac, tgt.IdKodWymCzasPrac=src.IdKodWymCzasPrac, tgt.KodDobNormCzasPrac=src.KodDobNormCzasPrac, tgt.IdKodDobNormCzasPrac=src.IdKodDobNormCzasPrac, tgt.DobNormCzasPrac=src.DobNormCzasPrac, tgt.TygNormCzasPrac=src.TygNormCzasPrac, tgt.KodPowZmiany=src.KodPowZmiany, tgt.IdKodPowZmiany=src.IdKodPowZmiany
		WHEN NOT MATCHED
		THEN INSERT (RV, DataZap, IdUzZap, IdDp020wym, IdPrac, IdUmowy, DataOd, KodWymCzasPrac, IdKodWymCzasPrac, KodDobNormCzasPrac, IdKodDobNormCzasPrac, DobNormCzasPrac, TygNormCzasPrac, KodPowZmiany, IdKodPowZmiany)
		VALUES (src.RV, src.DataZap, src.IdUzZap, src.IdDp020wym, src.IdPrac, src.IdUmowy, src.DataOd, src.KodWymCzasPrac, src.IdKodWymCzasPrac, src.KodDobNormCzasPrac, src.IdKodDobNormCzasPrac, src.DobNormCzasPrac, src.TygNormCzasPrac, src.KodPowZmiany, src.IdKodPowZmiany);
		SET @Merged = 1;
	END

	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
			END
		END
	;