-- ==============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-22
-- Modify date: 2015-11-23
-- Description:	Procedura Merge'ująca w schemacie Celina.
-- ===============================================

CREATE PROCEDURE [cel].[MergeTableFromStageODS] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
		END

	IF @TableName = 'dok_dhu' BEGIN
		MERGE INTO cel.dok_dhu AS tgt
		USING [WI_StageODS].cel.dok_dhu AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.EtapBilans=src.EtapBilans, tgt.status=src.status, tgt.NrAkt=src.NrAkt, tgt.Uwagi=src.Uwagi, tgt.FirmaNazwaPU=src.FirmaNazwaPU, tgt.FirmaRegonPU=src.FirmaRegonPU, tgt.NazwiskoImie=src.NazwiskoImie, tgt.NrDowOs=src.NrDowOs, tgt.PotwWyw=src.PotwWyw, tgt.SymDokZ=src.SymDokZ
		WHEN NOT MATCHED
		THEN INSERT (id_dok, EtapBilans, status, NrAkt, Uwagi, FirmaNazwaPU, FirmaRegonPU, NazwiskoImie, NrDowOs, PotwWyw, SymDokZ)
		VALUES (src.id_dok, src.EtapBilans, src.status, src.NrAkt, src.Uwagi, src.FirmaNazwaPU, src.FirmaRegonPU, src.NazwiskoImie, src.NrDowOs, src.PotwWyw, src.SymDokZ);
		SET @Merged = 1;
	END

	IF @TableName = 'dok_dp' BEGIN
		MERGE INTO cel.dok_dp AS tgt
		USING [WI_StageODS].cel.dok_dp AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DataWyd=src.DataWyd, tgt.Opis=src.Opis, tgt.Status=src.Status, tgt.Odwolanie=src.Odwolanie
		WHEN NOT MATCHED
		THEN INSERT (id_dok, DataWyd, Opis, Status, Odwolanie)
		VALUES (src.id_dok, src.DataWyd, src.Opis, src.Status, src.Odwolanie);
		SET @Merged = 1;
	END

	IF @TableName = 'dok_dyrektywy' BEGIN
		MERGE INTO cel.dok_dyrektywy AS tgt
		USING [WI_StageODS].cel.dok_dyrektywy AS src
		ON (tgt.id_dok=src.id_dok and tgt.NrDyrektywy=src.NrDyrektywy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdProfilu=src.IdProfilu, tgt.AutorProf=src.AutorProf, tgt.RodzDyr=src.RodzDyr, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Tresc=src.Tresc, tgt.Koment=src.Koment, tgt.KomentDysp=src.KomentDysp
		WHEN NOT MATCHED
		THEN INSERT (id_dok, NrDyrektywy, IdProfilu, AutorProf, RodzDyr, Adresat, Status, Tresc, Koment, KomentDysp)
		VALUES (src.id_dok, src.NrDyrektywy, src.IdProfilu, src.AutorProf, src.RodzDyr, src.Adresat, src.Status, src.Tresc, src.Koment, src.KomentDysp);
		SET @Merged = 1;
	END

	IF @TableName = 'dok_info' BEGIN
		MERGE INTO cel.dok_info AS tgt
		USING [WI_StageODS].cel.dok_info AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzDok=src.RodzDok, tgt.SymDok=src.SymDok, tgt.XMLVer=src.XMLVer, tgt.ExtractDate=src.ExtractDate, tgt.IdJedn=src.IdJedn, tgt.Pas=src.Pas, tgt.DataPrzyjEwid=src.DataPrzyjEwid, tgt.DataRej=src.DataRej, tgt.Flaga=src.Flaga
		WHEN NOT MATCHED
		THEN INSERT (id_dok, RodzDok, SymDok, XMLVer, ExtractDate, IdJedn, Pas, DataPrzyjEwid, DataRej, Flaga)
		VALUES (src.id_dok, src.RodzDok, src.SymDok, src.XMLVer, src.ExtractDate, src.IdJedn, src.Pas, src.DataPrzyjEwid, src.DataRej, src.Flaga);
		SET @Merged = 1;
	END

	IF @TableName = 'dok_inny' BEGIN
		MERGE INTO cel.dok_inny AS tgt
		USING [WI_StageODS].cel.dok_inny AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzDokZrd=src.RodzDokZrd, tgt.SymDokZrd=src.SymDokZrd, tgt.Procedura=src.Procedura, tgt.Uwagi=src.Uwagi, tgt.Status=src.Status, tgt.Wartosc=src.Wartosc, tgt.Waluta=src.Waluta, tgt.Pozwolenie=src.Pozwolenie, tgt.OdbiorcaEORI=src.OdbiorcaEORI, tgt.OdbiorcaTIN=src.OdbiorcaTIN, tgt.ZglaszajacyEORI=src.ZglaszajacyEORI, tgt.ZglaszajacyTIN=src.ZglaszajacyTIN, tgt.ZglaszajacyPrzedstawicielstwo=src.ZglaszajacyPrzedstawicielstwo
		WHEN NOT MATCHED
		THEN INSERT (id_dok, RodzDokZrd, SymDokZrd, Procedura, Uwagi, Status, Wartosc, Waluta, Pozwolenie, OdbiorcaEORI, OdbiorcaTIN, ZglaszajacyEORI, ZglaszajacyTIN, ZglaszajacyPrzedstawicielstwo)
		VALUES (src.id_dok, src.RodzDokZrd, src.SymDokZrd, src.Procedura, src.Uwagi, src.Status, src.Wartosc, src.Waluta, src.Pozwolenie, src.OdbiorcaEORI, src.OdbiorcaTIN, src.ZglaszajacyEORI, src.ZglaszajacyTIN, src.ZglaszajacyPrzedstawicielstwo);
		SET @Merged = 1;
	END

	IF @TableName = 'dok_operacje' BEGIN
		MERGE INTO cel.dok_operacje AS tgt
		USING [WI_StageODS].cel.dok_operacje AS src
		ON (tgt.id_dok=src.id_dok and tgt.IdPoz=src.IdPoz and tgt.DataZm=src.DataZm)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdJedn=src.IdJedn, tgt.IdUsr=src.IdUsr, tgt.SymbolOperacji=src.SymbolOperacji, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (id_dok, IdPoz, DataZm, IdJedn, IdUsr, SymbolOperacji, Adnotacja, RodzAdnotacji)
		VALUES (src.id_dok, src.IdPoz, src.DataZm, src.IdJedn, src.IdUsr, src.SymbolOperacji, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END

	IF @TableName = 'dok_powiazania' BEGIN
		MERGE INTO cel.dok_powiazania AS tgt
		USING [WI_StageODS].cel.dok_powiazania AS src
		ON (tgt.id_dok=src.id_dok and tgt.typ=src.typ and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SymDok=src.SymDok, tgt.RodzDok=src.RodzDok
		WHEN NOT MATCHED
		THEN INSERT (id_dok, typ, PozId, SymDok, RodzDok)
		VALUES (src.id_dok, src.typ, src.PozId, src.SymDok, src.RodzDok);
		SET @Merged = 1;
	END

	IF @TableName = 'dok_psp' BEGIN
		MERGE INTO cel.dok_psp AS tgt
		USING [WI_StageODS].cel.dok_psp AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.id_przewoznik=src.id_przewoznik, tgt.kierunek=src.kierunek, tgt.KodTransp=src.KodTransp, tgt.Uwagi=src.Uwagi
		WHEN NOT MATCHED
		THEN INSERT (id_dok, Status, id_przewoznik, kierunek, KodTransp, Uwagi)
		VALUES (src.id_dok, src.Status, src.id_przewoznik, src.kierunek, src.KodTransp, src.Uwagi);
		SET @Merged = 1;	
	END

	IF @TableName = 'dok_pw' BEGIN
		MERGE INTO cel.dok_pw AS tgt
		USING [WI_StageODS].cel.dok_pw AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.KodTransp=src.KodTransp
		WHEN NOT MATCHED
		THEN INSERT (id_dok, Status, KodTransp)
		VALUES (src.id_dok, src.Status, src.KodTransp);
		SET @Merged = 1;
	END

	IF @TableName = 'dok_sadg' BEGIN
		MERGE INTO cel.dok_sadg AS tgt
		USING [WI_StageODS].cel.dok_sadg AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SymDokZ=src.SymDokZ, tgt.PotwWywozu=src.PotwWywozu, tgt.EtapBilans=src.EtapBilans, tgt.P37=src.P37, tgt.Uwagi=src.Uwagi, tgt.Status=src.Status
		WHEN NOT MATCHED
		THEN INSERT (id_dok, SymDokZ, PotwWywozu, EtapBilans, P37, Uwagi, Status)
		VALUES (src.id_dok, src.SymDokZ, src.PotwWywozu, src.EtapBilans, src.P37, src.Uwagi, src.Status);
		SET @Merged = 1;
	END

	IF @TableName = 'dok_st' BEGIN
		MERGE INTO cel.dok_st AS tgt
		USING [WI_StageODS].cel.dok_st AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZglaszWe=src.ZglaszWe, tgt.ZglaszWy=src.ZglaszWy, tgt.NazwaJedn=src.NazwaJedn, tgt.KodTransp=src.KodTransp, tgt.NrRej=src.NrRej, tgt.Kraj=src.Kraj, tgt.Bandera=src.Bandera, tgt.Wypor=src.Wypor, tgt.EtapPort=src.EtapPort, tgt.Status=src.Status, tgt.DataZamknEST=src.DataZamknEST
		WHEN NOT MATCHED
		THEN INSERT (id_dok, ZglaszWe, ZglaszWy, NazwaJedn, KodTransp, NrRej, Kraj, Bandera, Wypor, EtapPort, Status, DataZamknEST)
		VALUES (src.id_dok, src.ZglaszWe, src.ZglaszWy, src.NazwaJedn, src.KodTransp, src.NrRej, src.Kraj, src.Bandera, src.Wypor, src.EtapPort, src.Status, src.DataZamknEST);
		SET @Merged = 1;
	END

	IF @TableName = 'dok_tranzyt' BEGIN
		MERGE INTO cel.dok_tranzyt AS tgt
		USING [WI_StageODS].cel.dok_tranzyt AS src
		ON (tgt.id_dok=src.id_dok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_kntr=src.id_kntr, tgt.TypDok=src.TypDok, tgt.SymDokZ=src.SymDokZ, tgt.DataRej=src.DataRej, tgt.DataPrzyjEwid=src.DataPrzyjEwid, tgt.TermDostTow=src.TermDostTow, tgt.EtapTranz=src.EtapTranz, tgt.Status=src.Status, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajDocelowy=src.KrajDocelowy, tgt.IdJednPrzezn=src.IdJednPrzezn, tgt.NrAkt=src.NrAkt, tgt.RodzDokZrd=src.RodzDokZrd, tgt.SymDokZrd=src.SymDokZrd, tgt.MasaBrutto=src.MasaBrutto, tgt.LiczbaOpak=src.LiczbaOpak, tgt.EtapBilans=src.EtapBilans, tgt.CharaktTow=src.CharaktTow, tgt.DataOtwTranz=src.DataOtwTranz, tgt.DataZamk=src.DataZamk
		WHEN NOT MATCHED
		THEN INSERT (id_dok, id_kntr, TypDok, SymDokZ, DataRej, DataPrzyjEwid, TermDostTow, EtapTranz, Status, KrajWysylki, KrajDocelowy, IdJednPrzezn, NrAkt, RodzDokZrd, SymDokZrd, MasaBrutto, LiczbaOpak, EtapBilans, CharaktTow, DataOtwTranz, DataZamk)
		VALUES (src.id_dok, src.id_kntr, src.TypDok, src.SymDokZ, src.DataRej, src.DataPrzyjEwid, src.TermDostTow, src.EtapTranz, src.Status, src.KrajWysylki, src.KrajDocelowy, src.IdJednPrzezn, src.NrAkt, src.RodzDokZrd, src.SymDokZrd, src.MasaBrutto, src.LiczbaOpak, src.EtapBilans, src.CharaktTow, src.DataOtwTranz, src.DataZamk);
		SET @Merged = 1;
	END

	IF @TableName = 'kontenery' BEGIN
		MERGE INTO cel.kontenery AS tgt
		USING [WI_StageODS].cel.kontenery AS src
		ON (tgt.id_dok=src.id_dok and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nr=src.Nr
		WHEN NOT MATCHED
		THEN INSERT (id_dok, PozId, Nr)
		VALUES (src.id_dok, src.PozId, src.Nr);
		SET @Merged = 1;
	END

	IF @TableName = 'kontrahenci' BEGIN
		MERGE INTO cel.kontrahenci AS tgt
		USING [WI_StageODS].cel.kontrahenci AS src
		ON (tgt.id_kntr=src.id_kntr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.rodz_kntr=src.rodz_kntr, tgt.nazwa=src.nazwa, tgt.kraj=src.kraj, tgt.kod=src.kod, tgt.miejscowosc=src.miejscowosc, tgt.adres=src.adres, tgt.nip=src.nip, tgt.regon=src.regon, tgt.pesel=src.pesel, tgt.nrdowos=src.nrdowos, tgt.BNazwa=src.BNazwa, tgt.BKonto=src.BKonto, tgt.IdKntr=src.IdKntr, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (id_kntr, rodz_kntr, nazwa, kraj, kod, miejscowosc, adres, nip, regon, pesel, nrdowos, BNazwa, BKonto, IdKntr, QuasiId)
		VALUES (src.id_kntr, src.rodz_kntr, src.nazwa, src.kraj, src.kod, src.miejscowosc, src.adres, src.nip, src.regon, src.pesel, src.nrdowos, src.BNazwa, src.BKonto, src.IdKntr, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'numer_rej' BEGIN
		MERGE INTO cel.numer_rej AS tgt
		USING [WI_StageODS].cel.numer_rej AS src
		ON (tgt.id_dok=src.id_dok and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Numer=src.Numer, tgt.Kraj=src.Kraj
		WHEN NOT MATCHED
		THEN INSERT (id_dok, PozId, Numer, Kraj)
		VALUES (src.id_dok, src.PozId, src.Numer, src.Kraj);
		SET @Merged = 1;
	END

	IF @TableName = 'PozwolPU' BEGIN
		MERGE INTO cel.PozwolPU AS tgt
		USING [WI_StageODS].cel.PozwolPU AS src
		ON (tgt.id_dok=src.id_dok and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Numer=src.Numer
		WHEN NOT MATCHED
		THEN INSERT (id_dok, PozId, Numer)
		VALUES (src.id_dok, src.PozId, src.Numer);
		SET @Merged = 1;
	END

	IF @TableName = 'ProcPU' BEGIN
		MERGE INTO cel.ProcPU AS tgt
		USING [WI_StageODS].cel.ProcPU AS src
		ON (tgt.id_dok=src.id_dok and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodProc=src.KodProc
		WHEN NOT MATCHED
		THEN INSERT (id_dok, PozId, KodProc)
		VALUES (src.id_dok, src.PozId, src.KodProc);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_deklaracje' BEGIN
		MERGE INTO cel.sl_deklaracje AS tgt
		USING [WI_StageODS].cel.sl_deklaracje AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_dyrektyw' BEGIN
		MERGE INTO cel.sl_dyrektyw AS tgt
		USING [WI_StageODS].cel.sl_dyrektyw AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_dyrektywy' BEGIN
		MERGE INTO cel.sl_dyrektywy AS tgt
		USING [WI_StageODS].cel.sl_dyrektywy AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_kontr_rodz' BEGIN
		MERGE INTO cel.sl_kontr_rodz AS tgt
		USING [WI_StageODS].cel.sl_kontr_rodz AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_kraje' BEGIN
		MERGE INTO cel.sl_kraje AS tgt
		USING [WI_StageODS].cel.sl_kraje AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.nazwa=src.nazwa, tgt.kontynent=src.kontynent
		WHEN NOT MATCHED
		THEN INSERT (kod, nazwa, kontynent)
		VALUES (src.kod, src.nazwa, src.kontynent);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_kraje_grupy' BEGIN
		MERGE INTO cel.sl_kraje_grupy AS tgt
		USING [WI_StageODS].cel.sl_kraje_grupy AS src
		ON (tgt.grupa=src.grupa and tgt.kraj=src.kraj)
		WHEN NOT MATCHED
		THEN INSERT (grupa, kraj)
		VALUES (src.grupa, src.kraj);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_met_platn' BEGIN
		MERGE INTO cel.sl_met_platn AS tgt
		USING [WI_StageODS].cel.sl_met_platn AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_naleznosci' BEGIN
		MERGE INTO cel.sl_naleznosci AS tgt
		USING [WI_StageODS].cel.sl_naleznosci AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_p13' BEGIN
		MERGE INTO cel.sl_p13 AS tgt
		USING [WI_StageODS].cel.sl_p13 AS src
		ON (tgt.code=src.code)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.description=src.description
		WHEN NOT MATCHED
		THEN INSERT (code, description)
		VALUES (src.code, src.description);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_pac' BEGIN
		MERGE INTO cel.sl_pac AS tgt
		USING [WI_StageODS].cel.sl_pac AS src
		ON (tgt.id_jedn=src.id_jedn)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_jedn_nad=src.id_jedn_nad, tgt.nazwa_jedn=src.nazwa_jedn, tgt.nazwa=src.nazwa, tgt.granica=src.granica
		WHEN NOT MATCHED
		THEN INSERT (id_jedn, id_jedn_nad, nazwa_jedn, nazwa, granica)
		VALUES (src.id_jedn, src.id_jedn_nad, src.nazwa_jedn, src.nazwa, src.granica);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_pcn' BEGIN
		MERGE INTO cel.sl_pcn AS tgt
		USING [WI_StageODS].cel.sl_pcn AS src
		ON (tgt.id_pcn=src.id_pcn)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.data_od=src.data_od, tgt.aktywny=src.aktywny, tgt.kod_pcn=src.kod_pcn, tgt.jest_stawka=src.jest_stawka, tgt.kod_pcn_nadrz=src.kod_pcn_nadrz, tgt.id_pcn_nadrz=src.id_pcn_nadrz, tgt.kolejnosc=src.kolejnosc, tgt.opis1=src.opis1, tgt.opis2=src.opis2, tgt.opis3=src.opis3, tgt.id_poz=src.id_poz
		WHEN NOT MATCHED
		THEN INSERT (id_pcn, data_od, aktywny, kod_pcn, jest_stawka, kod_pcn_nadrz, id_pcn_nadrz, kolejnosc, opis1, opis2, opis3, id_poz)
		VALUES (src.id_pcn, src.data_od, src.aktywny, src.kod_pcn, src.jest_stawka, src.kod_pcn_nadrz, src.id_pcn_nadrz, src.kolejnosc, src.opis1, src.opis2, src.opis3, src.id_poz);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_potwiwywóz' BEGIN
		MERGE INTO cel.sl_potwiwywóz AS tgt
		USING [WI_StageODS].cel.sl_potwiwywóz AS src
		ON (tgt.PotwWywozu=src.PotwWywozu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (PotwWywozu, opis)
		VALUES (src.PotwWywozu, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_pref' BEGIN
		MERGE INTO cel.sl_pref AS tgt
		USING [WI_StageODS].cel.sl_pref AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_preferencje' BEGIN
		MERGE INTO cel.sl_preferencje AS tgt
		USING [WI_StageODS].cel.sl_preferencje AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_procedury1zn' BEGIN
		MERGE INTO cel.sl_procedury1zn AS tgt
		USING [WI_StageODS].cel.sl_procedury1zn AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_procedury4zn' BEGIN
		MERGE INTO cel.sl_procedury4zn AS tgt
		USING [WI_StageODS].cel.sl_procedury4zn AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_SAD_typy' BEGIN
		MERGE INTO cel.sl_SAD_typy AS tgt
		USING [WI_StageODS].cel.sl_SAD_typy AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_status_sad' BEGIN
		MERGE INTO cel.sl_status_sad AS tgt
		USING [WI_StageODS].cel.sl_status_sad AS src
		ON (tgt.status=src.status)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (status, opis)
		VALUES (src.status, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_status_dyr' BEGIN
		MERGE INTO cel.sl_status_dyr AS tgt
		USING [WI_StageODS].cel.sl_status_dyr AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_transakcje' BEGIN
		MERGE INTO cel.sl_transakcje AS tgt
		USING [WI_StageODS].cel.sl_transakcje AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_transport' BEGIN
		MERGE INTO cel.sl_transport AS tgt
		USING [WI_StageODS].cel.sl_transport AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_tranzyty' BEGIN
		MERGE INTO cel.sl_tranzyty AS tgt
		USING [WI_StageODS].cel.sl_tranzyty AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_war_dostaw' BEGIN
		MERGE INTO cel.sl_war_dostaw AS tgt
		USING [WI_StageODS].cel.sl_war_dostaw AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_wy_wartości' BEGIN
		MERGE INTO cel.sl_wy_wartości AS tgt
		USING [WI_StageODS].cel.sl_wy_wartości AS src
		ON (tgt.kod=src.kod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.opis=src.opis
		WHEN NOT MATCHED
		THEN INSERT (kod, opis)
		VALUES (src.kod, src.opis);
		SET @Merged = 1;
	END

	IF @TableName = 'st_PrzyWy' BEGIN
		MERGE INTO cel.st_PrzyWy AS tgt
		USING [WI_StageODS].cel.st_PrzyWy AS src
		ON (tgt.id_dok=src.id_dok and tgt.typ=src.typ)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Port=src.Port, tgt.LiczbaPas=src.LiczbaPas, tgt.Zaloga=src.Zaloga, tgt.LiczPozTow=src.LiczPozTow, tgt.Kont=src.Kont, tgt.KontPust=src.KontPust, tgt.Tranzyt=src.Tranzyt, tgt.OpisTow=src.OpisTow
		WHEN NOT MATCHED
		THEN INSERT (id_dok, typ, Port, LiczbaPas, Zaloga, LiczPozTow, Kont, KontPust, Tranzyt, OpisTow)
		VALUES (src.id_dok, src.typ, src.Port, src.LiczbaPas, src.Zaloga, src.LiczPozTow, src.Kont, src.KontPust, src.Tranzyt, src.OpisTow);
		SET @Merged = 1;
	END

	IF @TableName = 'towar' BEGIN
		MERGE INTO cel.towar AS tgt
		USING [WI_StageODS].cel.towar AS src
		ON (tgt.id_dok=src.id_dok AND tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OpisTowaru=src.OpisTowaru, tgt.LiczbaOpak=src.LiczbaOpak, tgt.OpisOpak=src.OpisOpak, tgt.MasaNetto=src.MasaNetto, tgt.MasaBrutto=src.MasaBrutto, tgt.WarTowaru=src.WarTowaru, tgt.IloscTowaru=src.IloscTowaru, tgt.JednMiary=src.JednMiary, tgt.MiejscZlozTow=src.MiejscZlozTow, tgt.KrajPoch=src.KrajPoch, tgt.KodTowaru=src.KodTowaru, tgt.Procedura=src.Procedura, tgt.KrajWysylki=src.KrajWysylki
		WHEN NOT MATCHED
		THEN INSERT (id_dok, PozId, OpisTowaru, LiczbaOpak, OpisOpak, MasaNetto, MasaBrutto, WarTowaru, IloscTowaru, JednMiary, MiejscZlozTow, KrajPoch, KodTowaru, Procedura, KrajWysylki)
		VALUES (src.id_dok, src.PozId, src.OpisTowaru, src.LiczbaOpak, src.OpisOpak, src.MasaNetto, src.MasaBrutto, src.WarTowaru, src.IloscTowaru, src.JednMiary, src.MiejscZlozTow, src.KrajPoch, src.KodTowaru, src.Procedura, src.KrajWysylki);
		SET @Merged = 1;
	END

	IF @TableName = 'towar_oplaty' BEGIN
		MERGE INTO cel.towar_oplaty AS tgt
		USING [WI_StageODS].cel.towar_oplaty AS src
		ON (tgt.id_dok=src.id_dok and tgt.PozId=src.PozId and tgt.OplatyPozID=src.OplatyPozID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Typ=src.Typ, tgt.Podst=src.Podst, tgt.Stawka=src.Stawka, tgt.Kwota=src.Kwota
		WHEN NOT MATCHED
		THEN INSERT (id_dok, PozId, OplatyPozID, Typ, Podst, Stawka, Kwota)
		VALUES (src.id_dok, src.PozId, src.OplatyPozID, src.Typ, src.Podst, src.Stawka, src.Kwota);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_dpdz' BEGIN
		MERGE INTO cel.v2_dok_dpdz AS tgt
		USING [WI_StageODS].cel.v2_dok_dpdz AS src
		ON (tgt.idDokNr=src.idDokNr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.idZglaszajacy=src.IdZglaszajacy, tgt.LiczbaPozycji=src.LiczbaPozycji, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.MasaBrutto=src.MasaBrutto, tgt.ZwolnienieTowaru=src.ZwolnienieTowaru, tgt.PotwierdzenieWywozu=src.PotwierdzenieWywozu, tgt.NrCelina2=src.NrCelina2, tgt.Zefir=src.Zefir, tgt.RejestrDluguCelnego=src.RejestrDluguCelnego, tgt.Wykaz=src.Wykaz, tgt.PozycjaWykazu=src.PozycjaWykazu, tgt.Typ=src.Typ, tgt.UCZgloszenia=src.UCZgloszenia, tgt.Lokalizacja_Miejsce=src.Lokalizacja_Miejsce, tgt.Lokalizacja_UC=src.Lokalizacja_UC, tgt.Lokalizacja_Opis=src.Lokalizacja_Opis, tgt.Waluta=src.Waluta, tgt.Wartosc=src.Wartosc, tgt.KursWaluty=src.KursWaluty, tgt.idNadawca=src.idNadawca, tgt.idOdbiorca=src.idOdbiorca
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, idZglaszajacy, LiczbaPozycji, LiczbaOpakowan, KrajWysylki, KrajPrzeznaczenia, MasaBrutto, ZwolnienieTowaru, PotwierdzenieWywozu, NrCelina2, Zefir, RejestrDluguCelnego, Wykaz, PozycjaWykazu, Typ, UCZgloszenia, Lokalizacja_Miejsce, Lokalizacja_UC, Lokalizacja_Opis, Waluta, Wartosc, KursWaluty, idNadawca, idOdbiorca)
		VALUES (src.idDokNr, src.IdZglaszajacy, src.LiczbaPozycji, src.LiczbaOpakowan, src.KrajWysylki, src.KrajPrzeznaczenia, src.MasaBrutto, src.ZwolnienieTowaru, src.PotwierdzenieWywozu, src.NrCelina2, src.Zefir, src.RejestrDluguCelnego, src.Wykaz, src.PozycjaWykazu, src.Typ, src.UCZgloszenia, src.Lokalizacja_Miejsce, src.Lokalizacja_UC, src.Lokalizacja_Opis, src.Waluta, src.Wartosc, src.KursWaluty, src.idNadawca, src.idOdbiorca);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_ds' BEGIN
		MERGE INTO cel.v2_dok_ds AS tgt
		USING [WI_StageODS].cel.v2_dok_ds AS src
		ON (tgt.idDokNr=src.idDokNr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.UCDeklaracji=src.UCDeklaracji, tgt.Lokalizacja_Miejsce=src.Lokalizacja_Miejsce, tgt.Lokalizacja_UC=src.Lokalizacja_UC, tgt.Lokalizacja_Opis=src.Lokalizacja_Opis, tgt.idPrzedstawiajacy=src.idPrzedstawiajacy, tgt.TerminNaPrzeznaczenie=src.TerminNaPrzeznaczenie, tgt.PotwierdzenieWywozu=src.PotwierdzenieWywozu, tgt.NrCelina2=src.NrCelina2, tgt.Sprostowanie_NrCelina=src.Sprostowanie_NrCelina, tgt.Sprostowanie_Nr=src.Sprostowanie_Nr, tgt.Sprostowanie_Data=src.Sprostowanie_Data, tgt.idPrzedstawiajacyEORI=src.idPrzedstawiajacyEORI, tgt.MiejsceZlozeniaTowaru_UlicaNumer=src.MiejsceZlozeniaTowaru_UlicaNumer, tgt.MiejsceZlozeniaTowaru_KodPocztowy=src.MiejsceZlozeniaTowaru_KodPocztowy, tgt.MiejsceZlozeniaTowaru_Miejscowosc=src.MiejsceZlozeniaTowaru_Miejscowosc, tgt.TelefonFaks=src.TelefonFaks, tgt.AEO=src.AEO, tgt.Uwagi=src.Uwagi
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, UCDeklaracji, Lokalizacja_Miejsce, Lokalizacja_UC, Lokalizacja_Opis, idPrzedstawiajacy, TerminNaPrzeznaczenie, PotwierdzenieWywozu, NrCelina2, Sprostowanie_NrCelina, Sprostowanie_Nr, Sprostowanie_Data, idPrzedstawiajacyEORI, MiejsceZlozeniaTowaru_UlicaNumer, MiejsceZlozeniaTowaru_KodPocztowy, MiejsceZlozeniaTowaru_Miejscowosc, TelefonFaks, AEO, Uwagi)
		VALUES (src.idDokNr, src.UCDeklaracji, src.Lokalizacja_Miejsce, src.Lokalizacja_UC, src.Lokalizacja_Opis, src.idPrzedstawiajacy, src.TerminNaPrzeznaczenie, src.PotwierdzenieWywozu, src.NrCelina2, src.Sprostowanie_NrCelina, src.Sprostowanie_Nr, src.Sprostowanie_Data, src.idPrzedstawiajacyEORI, src.MiejsceZlozeniaTowaru_UlicaNumer, src.MiejsceZlozeniaTowaru_KodPocztowy, src.MiejsceZlozeniaTowaru_Miejscowosc, src.TelefonFaks, src.AEO, src.Uwagi);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_dyrektywy' BEGIN
		MERGE INTO cel.v2_dok_dyrektywy AS tgt
		USING [WI_StageODS].cel.v2_dok_dyrektywy AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdProfilu=src.IdProfilu, tgt.AutorProfilu=src.AutorProfilu, tgt.Rodzaj=src.Rodzaj, tgt.Parametr=src.Parametr, tgt.Pozycja=src.Pozycja, tgt.Tresc=src.Tresc, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Komentarz=src.Komentarz, tgt.PobranoProbki=src.PobranoProbki, tgt.KomentarzDyspozytora=src.KomentarzDyspozytora, tgt.CzasKontroli=src.CzasKontroli, tgt.UwagiDlaPodmiotu=src.UwagiDlaPodmiotu
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, IdProfilu, AutorProfilu, Rodzaj, Parametr, Pozycja, Tresc, Adresat, Status, Komentarz, PobranoProbki, KomentarzDyspozytora, CzasKontroli, UwagiDlaPodmiotu)
		VALUES (src.idDokNr, src.PozId, src.IdProfilu, src.AutorProfilu, src.Rodzaj, src.Parametr, src.Pozycja, src.Tresc, src.Adresat, src.Status, src.Komentarz, src.PobranoProbki, src.KomentarzDyspozytora, src.CzasKontroli, src.UwagiDlaPodmiotu);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_info' BEGIN
		MERGE INTO cel.v2_dok_info AS tgt
		USING [WI_StageODS].cel.v2_dok_info AS src
		ON (tgt.idDokNr=src.idDokNr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.idDok=src.idDok, tgt.RodzDok=src.RodzDok, tgt.Status=src.Status, tgt.NrCelina=src.NrCelina, tgt.XMLVer=src.XMLVer, tgt.ExtractDate=src.ExtractDate, tgt.UC=src.UC, tgt.Pas=src.Pas, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.DataPrzedstawienia=src.DataPrzedstawienia, tgt.EmailPodmiotu=src.EmailPodmiotu, tgt.NrWlasny=src.NrWlasny, tgt.Miejsce=src.Miejsce, tgt.Data=src.Data, tgt.idSkladajacy=src.idSkladajacy, tgt.Bilansowanie=src.Bilansowanie, tgt.TerminBilansowania=src.TerminBilansowania, tgt.Flaga=src.Flaga, tgt.PodpisanyElektronicznie=src.PodpisanyElektronicznie
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, idDok, RodzDok, Status, NrCelina, XMLVer, ExtractDate, UC, Pas, DataPrzyjecia, DataPrzedstawienia, EmailPodmiotu, NrWlasny, Miejsce, Data, idSkladajacy, Bilansowanie, TerminBilansowania, Flaga, PodpisanyElektronicznie)
		VALUES (src.idDokNr, src.idDok, src.RodzDok, src.Status, src.NrCelina, src.XMLVer, src.ExtractDate, src.UC, src.Pas, src.DataPrzyjecia, src.DataPrzedstawienia, src.EmailPodmiotu, src.NrWlasny, src.Miejsce, src.Data, src.idSkladajacy, src.Bilansowanie, src.TerminBilansowania, src.Flaga, src.PodpisanyElektronicznie);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_operacje' BEGIN
		MERGE INTO cel.v2_dok_operacje AS tgt
		USING [WI_StageODS].cel.v2_dok_operacje AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DataZm=src.DataZm, tgt.UC=src.UC, tgt.IdUsr=src.IdUsr, tgt.SymbolOperacji=src.SymbolOperacji, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, DataZm, UC, IdUsr, SymbolOperacji, Adnotacja, RodzAdnotacji)
		VALUES (src.idDokNr, src.PozId, src.DataZm, src.UC, src.IdUsr, src.SymbolOperacji, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_pod' BEGIN
		MERGE INTO cel.v2_dok_pod AS tgt
		USING [WI_StageODS].cel.v2_dok_pod AS src
		ON (tgt.idDokNr=src.idDokNr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TIN=src.TIN, tgt.DodatkowaKwotaZabezpieczenia=src.DodatkowaKwotaZabezpieczenia, tgt.Informacja=src.Informacja
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, TIN, DodatkowaKwotaZabezpieczenia, Informacja)
		VALUES (src.idDokNr, src.TIN, src.DodatkowaKwotaZabezpieczenia, src.Informacja);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_poprz' BEGIN
		MERGE INTO cel.v2_dok_poprz AS tgt
		USING [WI_StageODS].cel.v2_dok_poprz AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nr=src.Nr, tgt.NrCelina=src.NrCelina
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Kod, Nr, NrCelina)
		VALUES (src.idDokNr, src.PozId, src.Kod, src.Nr, src.NrCelina);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_powiazania' BEGIN
		MERGE INTO cel.v2_dok_powiazania AS tgt
		USING [WI_StageODS].cel.v2_dok_powiazania AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.Typ=src.Typ and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzDok=src.RodzDok, tgt.Nr=src.Nr, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, Typ, PozId, RodzDok, Nr, LiczbaOpakowan, MasaBrutto)
		VALUES (src.idDokNr, src.Typ, src.PozId, src.RodzDok, src.Nr, src.LiczbaOpakowan, src.MasaBrutto);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_ppzc' BEGIN
		MERGE INTO cel.v2_dok_ppzc AS tgt
		USING [WI_StageODS].cel.v2_dok_ppzc AS src
		ON (tgt.idDokNr=src.idDokNr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Tresc=src.Tresc, tgt.ZgloszenieNrWlasny=src.ZgloszenieNrWlasny, tgt.ZgloszenieNrCelina=src.ZgloszenieNrCelina, tgt.NrPZC=src.NrPZC, tgt.DataPotwierdzenia=src.DataPotwierdzenia
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, Tresc, ZgloszenieNrWlasny, ZgloszenieNrCelina, NrPZC, DataPotwierdzenia)
		VALUES (src.idDokNr, src.Tresc, src.ZgloszenieNrWlasny, src.ZgloszenieNrCelina, src.NrPZC, src.DataPotwierdzenia);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_pwd' BEGIN
		MERGE INTO cel.v2_dok_pwd AS tgt
		USING [WI_StageODS].cel.v2_dok_pwd AS src
		ON (tgt.idDokNr=src.idDokNr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Procedura=src.Procedura, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto, tgt.WartoscStatystyczna=src.WartoscStatystyczna, tgt.Zbiorcze=src.Zbiorcze, tgt.UCPowiadomienia=src.UCPowiadomienia, tgt.Lokalizacja_Miejsce=src.Lokalizacja_Miejsce, tgt.idUpowazniony=src.idUpowazniony, tgt.idOdbiorca=src.idOdbiorca, tgt.Tranzyt_Rodzaj=src.Tranzyt_Rodzaj, tgt.TerminDostarczenia=src.TerminDostarczenia, tgt.Zamkniecia_Ilosc=src.Zamkniecia_Ilosc, tgt.Zamkniecia_Zdejmujacy=src.Zamkniecia_Zdejmujacy, tgt.ZwolnienieTowaru=src.ZwolnienieTowaru, tgt.TerminPU=src.TerminPU, tgt.Zefir=src.Zefir, tgt.Sprostowanie_NrCelina=src.Sprostowanie_NrCelina, tgt.Sprostowanie_Nr=src.Sprostowanie_Nr, tgt.Sprostowanie_Data=src.Sprostowanie_Data, tgt.idUpowaznionyEORI=src.idUpowaznionyEORI, tgt.idOdbiorcaEORI=src.idOdbiorcaEori
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, Procedura, LiczbaOpakowan, MasaBrutto, WartoscStatystyczna, Zbiorcze, UCPowiadomienia, Lokalizacja_Miejsce, idUpowazniony, idOdbiorca, Tranzyt_Rodzaj, TerminDostarczenia, Zamkniecia_Ilosc, Zamkniecia_Zdejmujacy, ZwolnienieTowaru, TerminPU, Zefir, Sprostowanie_NrCelina, Sprostowanie_Nr, Sprostowanie_Data, idUpowaznionyEORI, idOdbiorcaEORI)
		VALUES (src.idDokNr, src.Procedura, src.LiczbaOpakowan, src.MasaBrutto, src.WartoscStatystyczna, src.Zbiorcze, src.UCPowiadomienia, src.Lokalizacja_Miejsce, src.idUpowazniony, src.idOdbiorca, src.Tranzyt_Rodzaj, src.TerminDostarczenia, src.Zamkniecia_Ilosc, src.Zamkniecia_Zdejmujacy, src.ZwolnienieTowaru, src.TerminPU, src.Zefir, src.Sprostowanie_NrCelina, src.Sprostowanie_Nr, src.Sprostowanie_Data, src.idUpowaznionyEORI, src.idOdbiorcaEori);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_pzc' BEGIN
		MERGE INTO cel.v2_dok_pzc AS tgt
		USING [WI_StageODS].cel.v2_dok_pzc AS src
		ON (tgt.idDokNr=src.idDokNr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdDok=src.IdDok, tgt.Typ=src.Typ, tgt.Podtyp=src.Podtyp, tgt.Powiadomienie=src.Powiadomienie, tgt.TypWPR1=src.TypWPR1, tgt.P1a=src.P1a, tgt.P1b=src.P1b, tgt.P1c=src.P1c, tgt.ListyTowarowe=src.ListyTowarowe, tgt.LiczbaPozycji=src.LiczbaPozycji, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.Kontenery=src.Kontenery, tgt.RodzajTransakcji=src.RodzajTransakcji, tgt.MasaBrutto=src.MasaBrutto, tgt.PlatnoscOdroczona=src.PlatnoscOdroczona, tgt.idGlownyZobowiazany=src.idGlownyZobowiazany, tgt.idOdbiorcaKarty3=src.idOdbiorcaKarty3, tgt.idUpowaznionyOdbiorca=src.idUpowaznionyOdbiorca, tgt.KodDost=src.KodDost, tgt.MiejsceDost=src.MiejsceDost, tgt.MiejsceKodDost=src.MiejsceKodDost, tgt.SzczegolyWartosci=src.SzczegolyWartosci, tgt.Waluta=src.Waluta, tgt.Wartosc=src.Wartosc, tgt.KursWaluty=src.KursWaluty, tgt.KodWynKontr=src.KodWynKontr, tgt.TerminDostarczenia=src.TerminDostarczenia, tgt.IloscZamkniec=src.IloscZamkniec, tgt.idZglaszajacy=src.idZglaszajacy, tgt.Zgla_Przedstawicielstwo=src.Zgla_Przedstawicielstwo, tgt.Zgla_Wskaznik=src.Zgla_Wskaznik, tgt.Zgla_NrWpisu=src.Zgla_NRWpisu, tgt.Zgla_DataWpisu=src.Zgla_dataWpisu, tgt.AdnotacjeUrzedowe=src.AdnotacjeUrzedowe
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, IdDok, Typ, Podtyp, Powiadomienie, TypWPR1, P1a, P1b, P1c, ListyTowarowe, LiczbaPozycji, LiczbaOpakowan, KrajWysylki, KrajPrzeznaczenia, Kontenery, RodzajTransakcji, MasaBrutto, PlatnoscOdroczona, idGlownyZobowiazany, idOdbiorcaKarty3, idUpowaznionyOdbiorca, KodDost, MiejsceDost, MiejsceKodDost, SzczegolyWartosci, Waluta, Wartosc, KursWaluty, KodWynKontr, TerminDostarczenia, IloscZamkniec, idZglaszajacy, Zgla_Przedstawicielstwo, Zgla_Wskaznik, Zgla_NrWpisu, Zgla_DataWpisu, AdnotacjeUrzedowe)
		VALUES (src.idDokNr, src.IdDok, src.Typ, src.Podtyp, src.Powiadomienie, src.TypWPR1, src.P1a, src.P1b, src.P1c, src.ListyTowarowe, src.LiczbaPozycji, src.LiczbaOpakowan, src.KrajWysylki, src.KrajPrzeznaczenia, src.Kontenery, src.RodzajTransakcji, src.MasaBrutto, src.PlatnoscOdroczona, src.idGlownyZobowiazany, src.idOdbiorcaKarty3, src.idUpowaznionyOdbiorca, src.KodDost, src.MiejsceDost, src.MiejsceKodDost, src.SzczegolyWartosci, src.Waluta, src.Wartosc, src.KursWaluty, src.KodWynKontr, src.TerminDostarczenia, src.IloscZamkniec, src.idZglaszajacy, src.Zgla_Przedstawicielstwo, src.Zgla_Wskaznik, src.Zgla_NRWpisu, src.Zgla_dataWpisu, src.AdnotacjeUrzedowe);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_sad' BEGIN
		MERGE INTO cel.v2_dok_sad AS tgt
		USING [WI_StageODS].cel.v2_dok_sad AS src
		ON (tgt.idDokNr=src.idDokNr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdDok=src.IdDok, tgt.Typ=src.Typ, tgt.Podtyp=src.Podtyp, tgt.Powiadomienie=src.Powiadomienie, tgt.TypWPR1=src.TypWPR1, tgt.P1a=src.P1a, tgt.P1b=src.P1b, tgt.P1c=src.P1c, tgt.ListyTowarowe=src.ListyTowarowe, tgt.LiczbaPozycji=src.LiczbaPozycji, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.Kontenery=src.Kontenery, tgt.RodzajTransakcji=src.RodzajTransakcji, tgt.MasaBrutto=src.MasaBrutto, tgt.PlatnoscOdroczona=src.PlatnoscOdroczona, tgt.idGlownyZobowiazany=src.idGlownyZobowiazany, tgt.idOdbiorcaKarty3=src.idOdbiorcaKarty3, tgt.idUpowaznionyOdbiorca=src.idUpowaznionyOdbiorca, tgt.KodDost=src.KodDost, tgt.MiejsceDost=src.MiejsceDost, tgt.MiejsceKodDost=src.MiejsceKodDost, tgt.SzczegolyWartosci=src.SzczegolyWartosci, tgt.Waluta=src.Waluta, tgt.Wartosc=src.Wartosc, tgt.KursWaluty=src.KursWaluty, tgt.KodWynKontr=src.KodWynKontr, tgt.TerminDostarczenia=src.TerminDostarczenia, tgt.IloscZamkniec=src.IloscZamkniec, tgt.TerminPU=src.TerminPU, tgt.ZwolnienieTowaru=src.ZwolnienieTowaru, tgt.PotwierdzenieWywozu=src.PotwierdzenieWywozu, tgt.NrCelina2=src.NrCelina2, tgt.Zefir=src.Zefir, tgt.RejestrDluguCelnego=src.RejestrDluguCelnego, tgt.Wykaz=src.Wykaz, tgt.PozycjaWykazu=src.PozycjaWykazu, tgt.DostarczenieSAD=src.DostarczenieSAD, tgt.TerminNaSAD=src.TerminNaSAD, tgt.idZglaszajacy=src.idZglaszajacy, tgt.Zgla_Przedstawicielstwo=src.Zgla_Przedstawicielstwo, tgt.Zgla_Wskaznik=src.Zgla_Wskaznik, tgt.Zgla_NrWpisu=src.Zgla_NrWpisu, tgt.Zgla_DataWpisu=src.Zgla_DataWpisu, tgt.Sprostowanie_NrCelina=src.Sprostowanie_NrCelina, tgt.Sprostowanie_Nr=src.Sprostowanie_Nr, tgt.Sprostowanie_Data=src.Sprostowanie_Data, tgt.DataDoKalkulacji=src.DataDoKalkulacji, tgt.DataPowiadomienia=src.DataPowiadomienia, tgt.IDPowiadomieniaODlugu=src.IDPowiadomieniaODlugu, tgt.AdnotacjeUrzedowe=src.AdnotacjeUrzedowe, tgt.idZglaszajacyEORI=src.idZglaszajacyEori
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, IdDok, Typ, Podtyp, Powiadomienie, TypWPR1, P1a, P1b, P1c, ListyTowarowe, LiczbaPozycji, LiczbaOpakowan, KrajWysylki, KrajPrzeznaczenia, Kontenery, RodzajTransakcji, MasaBrutto, PlatnoscOdroczona, idGlownyZobowiazany, idOdbiorcaKarty3, idUpowaznionyOdbiorca, KodDost, MiejsceDost, MiejsceKodDost, SzczegolyWartosci, Waluta, Wartosc, KursWaluty, KodWynKontr, TerminDostarczenia, IloscZamkniec, TerminPU, ZwolnienieTowaru, PotwierdzenieWywozu, NrCelina2, Zefir, RejestrDluguCelnego, Wykaz, PozycjaWykazu, DostarczenieSAD, TerminNaSAD, idZglaszajacy, Zgla_Przedstawicielstwo, Zgla_Wskaznik, Zgla_NrWpisu, Zgla_DataWpisu, Sprostowanie_NrCelina, Sprostowanie_Nr, Sprostowanie_Data, DataDoKalkulacji, DataPowiadomienia, IDPowiadomieniaODlugu, AdnotacjeUrzedowe, idZglaszajacyEORI)
		VALUES (src.idDokNr, src.IdDok, src.Typ, src.Podtyp, src.Powiadomienie, src.TypWPR1, src.P1a, src.P1b, src.P1c, src.ListyTowarowe, src.LiczbaPozycji, src.LiczbaOpakowan, src.KrajWysylki, src.KrajPrzeznaczenia, src.Kontenery, src.RodzajTransakcji, src.MasaBrutto, src.PlatnoscOdroczona, src.idGlownyZobowiazany, src.idOdbiorcaKarty3, src.idUpowaznionyOdbiorca, src.KodDost, src.MiejsceDost, src.MiejsceKodDost, src.SzczegolyWartosci, src.Waluta, src.Wartosc, src.KursWaluty, src.KodWynKontr, src.TerminDostarczenia, src.IloscZamkniec, src.TerminPU, src.ZwolnienieTowaru, src.PotwierdzenieWywozu, src.NrCelina2, src.Zefir, src.RejestrDluguCelnego, src.Wykaz, src.PozycjaWykazu, src.DostarczenieSAD, src.TerminNaSAD, src.idZglaszajacy, src.Zgla_Przedstawicielstwo, src.Zgla_Wskaznik, src.Zgla_NrWpisu, src.Zgla_DataWpisu, src.Sprostowanie_NrCelina, src.Sprostowanie_Nr, src.Sprostowanie_Data, src.DataDoKalkulacji, src.DataPowiadomienia, src.IDPowiadomieniaODlugu, src.AdnotacjeUrzedowe, src.idZglaszajacyEori);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_wymagany' BEGIN
		MERGE INTO cel.v2_dok_wymagany AS tgt
		USING [WI_StageODS].cel.v2_dok_wymagany AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nr=src.Nr
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Kod, Nr)
		VALUES (src.idDokNr, src.PozId, src.Kod, src.Nr);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_dok_zrodl' BEGIN
		MERGE INTO cel.v2_dok_zrodl AS tgt
		USING [WI_StageODS].cel.v2_dok_zrodl AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nr=src.Nr
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Kod, Nr)
		VALUES (src.idDokNr, src.PozId, src.Kod, src.Nr);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_ds_dok_wymagany' BEGIN
		MERGE INTO cel.v2_ds_dok_wymagany AS tgt
		USING [WI_StageODS].cel.v2_ds_dok_wymagany AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nr=src.Nr, tgt.Uwagi=src.Uwagi
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Kod, Nr, Uwagi)
		VALUES (src.idDokNr, src.PozId, src.Kod, src.Nr, src.Uwagi);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_ds_odbiorca' BEGIN
		MERGE INTO cel.v2_ds_odbiorca AS tgt
		USING [WI_StageODS].cel.v2_ds_odbiorca AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc)
		VALUES (src.idDokNr, src.PozId, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_kontener' BEGIN
		MERGE INTO cel.v2_kontener AS tgt
		USING [WI_StageODS].cel.v2_kontener AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nr=src.Nr
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Nr)
		VALUES (src.idDokNr, src.PozId, src.Nr);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_kontener_zamkniecie' BEGIN
		MERGE INTO cel.v2_kontener_zamkniecie AS tgt
		USING [WI_StageODS].cel.v2_kontener_zamkniecie AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Zamkniecie_PozId=src.Zamkniecie_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Ilosc=src.Ilosc, tgt.Nr=src.Nr, tgt.Rodzaj=src.Rodzaj
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Zamkniecie_PozId, Ilosc, Nr, Rodzaj)
		VALUES (src.idDokNr, src.PozId, src.Zamkniecie_PozId, src.Ilosc, src.Nr, src.Rodzaj);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_kontrahenci' BEGIN
		MERGE INTO cel.v2_kontrahenci AS tgt
		USING [WI_StageODS].cel.v2_kontrahenci AS src
		ON (tgt.idKntr=src.idKntr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.TIN=src.TIN, tgt.Regon=src.Regon, tgt.Pesel=src.Pesel, tgt.CRP=src.CRP, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (idKntr, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, TIN, Regon, Pesel, CRP, QuasiId)
		VALUES (src.idKntr, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.TIN, src.Regon, src.Pesel, src.CRP, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'sl_v2_kontrahenci' BEGIN
		MERGE INTO cel.v2_kontrahenci AS tgt
		USING [WI_StageODS].cel.v2_kontrahenci AS src
		ON (tgt.idKntr=src.idKntr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.TIN=src.TIN, tgt.Regon=src.Regon, tgt.Pesel=src.Pesel, tgt.CRP=src.CRP, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (idKntr, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, TIN, Regon, Pesel, CRP, QuasiId)
		VALUES (src.idKntr, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.TIN, src.Regon, src.Pesel, src.CRP, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_pod_decyzja' BEGIN
		MERGE INTO cel.v2_pod_decyzja AS tgt
		USING [WI_StageODS].cel.v2_pod_decyzja AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nr=src.Nr, tgt.Data=src.Data
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Nr, Data)
		VALUES (src.idDokNr, src.PozId, src.Nr, src.Data);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_pod_oplata' BEGIN
		MERGE INTO cel.v2_pod_oplata AS tgt
		USING [WI_StageODS].cel.v2_pod_oplata AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Typ=src.Typ, tgt.Kwota=src.Kwota, tgt.MP=src.MP
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Typ, Kwota, MP)
		VALUES (src.idDokNr, src.PozId, src.Typ, src.Kwota, src.MP);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_pod_towar' BEGIN
		MERGE INTO cel.v2_pod_towar AS tgt
		USING [WI_StageODS].cel.v2_pod_towar AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodTowarowy=src.KodTowarowy, tgt.KodTaric=src.KodTaric
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, KodTowarowy, KodTaric)
		VALUES (src.idDokNr, src.PozId, src.KodTowarowy, src.KodTaric);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_pwd_kontener' BEGIN
		MERGE INTO cel.v2_pwd_kontener AS tgt
		USING [WI_StageODS].cel.v2_pwd_kontener AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Kontener_PozId=src.Kontener_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nr=src.Nr
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Kontener_PozId, Nr)
		VALUES (src.idDokNr, src.PozId, src.Kontener_PozId, src.Nr);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_pwd_inf_dod' BEGIN
		MERGE INTO cel.v2_pwd_inf_dod AS tgt
		USING WI_StageODS.cel.v2_pwd_inf_dod AS src
		ON (tgt.idDokNr=src.idDokNr AND tgt.PozId=src.PozId AND tgt.Towar_PozId=src.Towar_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Tekst=src.Tekst
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Towar_PozId, Kod, Tekst)
		VALUES (src.idDokNr, src.PozId, src.Towar_PozId, src.Kod, src.Tekst);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_pwd_dok_wym' BEGIN
		MERGE INTO cel.v2_pwd_dok_wym AS tgt
		USING WI_StageODS.cel.v2_pwd_dok_wym AS src
		ON (tgt.idDokNr=src.idDokNr AND tgt.PozId=src.PozId AND tgt.Towar_PozId=src.Towar_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nr=src.Nr
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Towar_PozId, Kod, Nr)
		VALUES (src.idDokNr, src.PozId, src.Towar_PozId, src.Kod, src.Nr);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_pwd_dok_pop' BEGIN
		MERGE INTO cel.v2_pwd_dok_pop AS tgt
		USING WI_StageODS.cel.v2_pwd_dok_pop AS src
		ON (tgt.idDokNr=src.idDokNr AND tgt.PozId=src.PozId AND tgt.Towar_PozId=src.Towar_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nr=src.Nr, tgt.NrCelina=src.NrCelina
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Towar_PozId, Kod, Nr, NrCelina)
		VALUES (src.idDokNr, src.PozId, src.Towar_PozId, src.Kod, src.Nr, src.NrCelina);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_pwd_zamkniecie' BEGIN
		MERGE INTO cel.v2_pwd_zamkniecie AS tgt
		USING [WI_StageODS].cel.v2_pwd_zamkniecie AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nr=src.Nr
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Nr)
		VALUES (src.idDokNr, src.PozId, src.Nr);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dok_poprzedni' BEGIN
		MERGE INTO cel.v2_sad_dok_poprzedni AS tgt
		USING [WI_StageODS].cel.v2_sad_dok_poprzedni AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.DokumentPoprzedni_PozId=src.DokumentPoprzedni_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kategoria=src.Kategoria, tgt.Kod=src.Kod, tgt.TypSAD=src.TypSAD, tgt.Nr=src.Nr, tgt.NrCelina=src.NrCelina
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, DokumentPoprzedni_PozId, Kategoria, Kod, TypSAD, Nr, NrCelina)
		VALUES (src.idDokNr, src.PozId, src.DokumentPoprzedni_PozId, src.Kategoria, src.Kod, src.TypSAD, src.Nr, src.NrCelina);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dok_poprzedni_WPT' BEGIN
		MERGE INTO cel.v2_sad_dok_poprzedni_WPT AS tgt
		USING [WI_StageODS].cel.v2_sad_dok_poprzedni_WPT AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.DokumentPoprzedniWPT_PozId=src.DokumentPoprzedniWPT_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nr=src.Nr, tgt.Uwagi=src.Uwagi
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, DokumentPoprzedniWPT_PozId, Kod, Nr, Uwagi)
		VALUES (src.idDokNr, src.PozId, src.DokumentPoprzedniWPT_PozId, src.Kod, src.Nr, src.Uwagi);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dok_wymaganyWPT' BEGIN
		MERGE INTO cel.v2_sad_dok_wymaganyWPT AS tgt
		USING [WI_StageODS].cel.v2_sad_dok_wymaganyWPT AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.DokWymWPT_PozId=src.DokWymWPT_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nr=src.Nr, tgt.Uwagi=src.Uwagi
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, DokWymWPT_PozId, Kod, Nr, Uwagi)
		VALUES (src.idDokNr, src.PozId, src.DokWymWPT_PozId, src.Kod, src.Nr, src.Uwagi);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dpdz_dok_wymagany' BEGIN
		MERGE INTO cel.v2_sad_dpdz_dok_wymagany AS tgt
		USING [WI_StageODS].cel.v2_sad_dpdz_dok_wymagany AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.DokWym_PozId=src.DokWym_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nr=src.Nr
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, DokWym_PozId, Kod, Nr)
		VALUES (src.idDokNr, src.PozId, src.DokWym_PozId, src.Kod, src.Nr);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dpdz_ilosc_towaru' BEGIN
		MERGE INTO cel.v2_sad_dpdz_ilosc_towaru AS tgt
		USING [WI_StageODS].cel.v2_sad_dpdz_ilosc_towaru AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.IloscTowaru_PozId=src.IloscTowaru_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Jm=src.Jm, tgt.KwalifikatorJm=src.KwalifikatorJm, tgt.Ilosc=src.Ilosc
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, IloscTowaru_PozId, Jm, KwalifikatorJm, Ilosc)
		VALUES (src.idDokNr, src.PozId, src.IloscTowaru_PozId, src.Jm, src.KwalifikatorJm, src.Ilosc);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dpdz_info_dodatkowa' BEGIN
		MERGE INTO cel.v2_sad_dpdz_info_dodatkowa AS tgt
		USING [WI_StageODS].cel.v2_sad_dpdz_info_dodatkowa AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.InfoDod_PozId=src.InfoDod_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Tekst=src.Tekst
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, InfoDod_PozId, Kod, Tekst)
		VALUES (src.idDokNr, src.PozId, src.InfoDod_PozId, src.Kod, src.Tekst);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dpdz_kod_dodatkowy_PL' BEGIN
		MERGE INTO cel.v2_sad_dpdz_kod_dodatkowy_PL AS tgt
		USING [WI_StageODS].cel.v2_sad_dpdz_kod_dodatkowy_PL AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.KodDodatkowyPL_PozId=src.KodDodatkowyPL_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, KodDodatkowyPL_PozId, Kod)
		VALUES (src.idDokNr, src.PozId, src.KodDodatkowyPL_PozId, src.Kod);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dpdz_kod_dodatkowy_UE' BEGIN
		MERGE INTO cel.v2_sad_dpdz_kod_dodatkowy_UE AS tgt
		USING [WI_StageODS].cel.v2_sad_dpdz_kod_dodatkowy_UE AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.KodDodatkowyUE_PozId=src.KodDodatkowyUE_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, KodDodatkowyUE_PozId, Kod)
		VALUES (src.idDokNr, src.PozId, src.KodDodatkowyUE_PozId, src.Kod);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dpdz_oplata' BEGIN
		MERGE INTO cel.v2_sad_dpdz_oplata AS tgt
		USING [WI_StageODS].cel.v2_sad_dpdz_oplata AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Oplata_PozId=src.Oplata_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Typ=src.Typ, tgt.Podstawa=src.Podstawa, tgt.Stawka=src.Stawka, tgt.Kwota=src.Kwota, tgt.MP=src.Mp
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Oplata_PozId, Typ, Podstawa, Stawka, Kwota, MP)
		VALUES (src.idDokNr, src.PozId, src.Oplata_PozId, src.Typ, src.Podstawa, src.Stawka, src.Kwota, src.Mp);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dpdz_podklasyfikacja' BEGIN
		MERGE INTO cel.v2_sad_dpdz_podklasyfikacja AS tgt
		USING [WI_StageODS].cel.v2_sad_dpdz_podklasyfikacja AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Atrybut_PozId=src.Atrybut_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodAtrybutu=src.KodAtrybutu, tgt.KodWartosci=src.KodWartosci
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Atrybut_PozId, KodAtrybutu, KodWartosci)
		VALUES (src.idDokNr, src.PozId, src.Atrybut_PozId, src.KodAtrybutu, src.KodWartosci);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dpdz_srodek' BEGIN
		MERGE INTO cel.v2_sad_dpdz_srodek AS tgt
		USING [WI_StageODS].cel.v2_sad_dpdz_srodek AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Srodek_PozId=src.Srodek_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SID=src.SID, tgt.Seria=src.Seria, tgt.Typ=src.Typ, tgt.ObszarGeograficzny=src.ObszarGeograficzny, tgt.NrPorzadkowy=src.NrPorzadkowy, tgt.Ujm=src.Ujm, tgt.KwalifikatorUjm=src.KwalifikatorUjm, tgt.NJm=src.Njm, tgt.RaportowanaIlosc=src.RaportowanaIlosc
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Srodek_PozId, SID, Seria, Typ, ObszarGeograficzny, NrPorzadkowy, Ujm, KwalifikatorUjm, NJm, RaportowanaIlosc)
		VALUES (src.idDokNr, src.PozId, src.Srodek_PozId, src.SID, src.Seria, src.Typ, src.ObszarGeograficzny, src.NrPorzadkowy, src.Ujm, src.KwalifikatorUjm, src.Njm, src.RaportowanaIlosc);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_dpdz_tow' BEGIN
		MERGE INTO cel.v2_sad_dpdz_tow AS tgt
		USING [WI_StageODS].cel.v2_sad_dpdz_tow AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.P1c=src.P1c, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.OpisTowaru=src.OpisTowaru, tgt.KodTowarowy=src.KodTowarowy, tgt.KodTaric=src.KodTaric, tgt.KrajPochodzenia=src.KrajPochodzenia, tgt.MasaBrutto=src.MasaBrutto, tgt.Preferencje=src.Preferencje, tgt.Procedura=src.Procedura, tgt.ProceduraSzczegoly=src.ProceduraSzczegoly, tgt.MasaNetto=src.MasaNetto, tgt.IloscUzupelniajacaJm=src.IloscUzupelniajacaJm, tgt.idNadawca=src.idNadawca, tgt.idOdbiorca=src.idOdbiorca, tgt.WartoscPozycji=src.WartoscPozycji, tgt.MetodaWartosciowania=src.MetodaWartosciowania, tgt.WartoscStatystyczna=src.WartoscStatystyczna, tgt.TowarStrategiczny=src.TowarStrategiczny, tgt.Podklasyf_IdWzorca=src.Podklasyf_IdWzorca, tgt.Samochod_Marka=src.Samochod_Marka, tgt.Samochod_NrNadwozia=src.Samochod_NrNadwozia, tgt.Samochod_NrSilnika=src.Samochod_NrSilnika, tgt.Samochod_Pojemnosc=src.Samochod_Pojemnosc, tgt.Samochod_RodzajPaliwa=src.Samochod_RodzajPaliwa, tgt.Samochod_RokProdukcji=src.Samochod_RokProdukcji, tgt.KodReceptury=src.KodReceptury, tgt.Pochodzenie=src.Pochodzenie, tgt.Przeladunek=src.Przeladunek, tgt.KrajPrzeladunku=src.KrajPrzeladunku
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, P1c, KrajWysylki, KrajPrzeznaczenia, OpisTowaru, KodTowarowy, KodTaric, KrajPochodzenia, MasaBrutto, Preferencje, Procedura, ProceduraSzczegoly, MasaNetto, IloscUzupelniajacaJm, idNadawca, idOdbiorca, WartoscPozycji, MetodaWartosciowania, WartoscStatystyczna, TowarStrategiczny, Podklasyf_IdWzorca, Samochod_Marka, Samochod_NrNadwozia, Samochod_NrSilnika, Samochod_Pojemnosc, Samochod_RodzajPaliwa, Samochod_RokProdukcji, KodReceptury, Pochodzenie, Przeladunek, KrajPrzeladunku)
		VALUES (src.idDokNr, src.PozId, src.P1c, src.KrajWysylki, src.KrajPrzeznaczenia, src.OpisTowaru, src.KodTowarowy, src.KodTaric, src.KrajPochodzenia, src.MasaBrutto, src.Preferencje, src.Procedura, src.ProceduraSzczegoly, src.MasaNetto, src.IloscUzupelniajacaJm, src.idNadawca, src.idOdbiorca, src.WartoscPozycji, src.MetodaWartosciowania, src.WartoscStatystyczna, src.TowarStrategiczny, src.Podklasyf_IdWzorca, src.Samochod_Marka, src.Samochod_NrNadwozia, src.Samochod_NrSilnika, src.Samochod_Pojemnosc, src.Samochod_RodzajPaliwa, src.Samochod_RokProdukcji, src.KodReceptury, src.Pochodzenie, src.Przeladunek, src.KrajPrzeladunku);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_gwar_niew_kraj' BEGIN
		MERGE INTO cel.v2_sad_gwar_niew_kraj AS tgt
		USING [WI_StageODS].cel.v2_sad_gwar_niew_kraj AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Gwarancja_PozId=src.Gwarancja_PozId and tgt.GwarNiewKraj_PozId=src.GwarNiewKraj_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kraj=src.Kraj
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Gwarancja_PozId, GwarNiewKraj_PozId, Kraj)
		VALUES (src.idDokNr, src.PozId, src.Gwarancja_PozId, src.GwarNiewKraj_PozId, src.Kraj);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_gwarancja' BEGIN
		MERGE INTO cel.v2_sad_gwarancja AS tgt
		USING [WI_StageODS].cel.v2_sad_gwarancja AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Gwarancja_PozId=src.Gwarancja_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nr=src.Nr, tgt.GRN=src.GRN, tgt.KodDostepu=src.KodDostepu, tgt.NiewaznaNaUE=src.NiewaznaNaUE
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Gwarancja_PozId, Nr, GRN, KodDostepu, NiewaznaNaUE)
		VALUES (src.idDokNr, src.PozId, src.Gwarancja_PozId, src.Nr, src.GRN, src.KodDostepu, src.NiewaznaNaUE);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_gwarancje' BEGIN
		MERGE INTO cel.v2_sad_gwarancje AS tgt
		USING [WI_StageODS].cel.v2_sad_gwarancje AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Rodzaj=src.Rodzaj
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Rodzaj)
		VALUES (src.idDokNr, src.PozId, src.Rodzaj);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_info_dodatkowaWPT' BEGIN
		MERGE INTO cel.v2_sad_info_dodatkowaWPT AS tgt
		USING [WI_StageODS].cel.v2_sad_info_dodatkowaWPT AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.InfoDodWPT_PozId=src.InfoDodWPT_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.WywozZUE=src.WywozZUE, tgt.KrajWywozu=src.KrajWywozu, tgt.Tekst=src.Tekst
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, InfoDodWPT_PozId, Kod, WywozZUE, KrajWywozu, Tekst)
		VALUES (src.idDokNr, src.PozId, src.InfoDodWPT_PozId, src.Kod, src.WywozZUE, src.KrajWywozu, src.Tekst);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_kontener' BEGIN
		MERGE INTO cel.v2_sad_kontener AS tgt
		USING [WI_StageODS].cel.v2_sad_kontener AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Kontener_PozId=src.Kontener_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nr=src.Nr
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Kontener_PozId, Nr)
		VALUES (src.idDokNr, src.PozId, src.Kontener_PozId, src.Nr);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_kontyngent' BEGIN
		MERGE INTO cel.v2_sad_kontyngent AS tgt
		USING [WI_StageODS].cel.v2_sad_kontyngent AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Kontyngent_PozId=src.Kontyngent_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPorzadkowy=src.NrPorzadkowy, tgt.WnioskowanaIlosc=src.WnioskowanaIlosc, tgt.Jm=src.Jm, tgt.TQS=src.TQS, tgt.PrzyznanaIlosc=src.PrzyznanaIlosc, tgt.WykorzystanaIlosc=src.WykorzystanaIlosc, tgt.NrWniosku=src.NrWniosku, tgt.NrDecyzji=src.NrDecyzji, tgt.nNrPorzadkowy=src.nNrPorzadkowy, tgt.nWnioskowanaIlosc=src.nWnioskowanaIlosc, tgt.nJm=src.nJm, tgt.Korekta=src.Korekta, tgt.Err=src.Err, tgt.JednostkaMiary=src.JednostkaMiary, tgt.KwalifikatorJednostkiMiary=src.KwalifikatorJednostkiMiary, tgt.nJednostkaMiary=src.nJednostkaMiary, tgt.nKwalifikatorJednostkiMiary=src.nKwalifikatorJednostkiMiary
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Kontyngent_PozId, NrPorzadkowy, WnioskowanaIlosc, Jm, TQS, PrzyznanaIlosc, WykorzystanaIlosc, NrWniosku, NrDecyzji, nNrPorzadkowy, nWnioskowanaIlosc, nJm, Korekta, Err, JednostkaMiary, KwalifikatorJednostkiMiary, nJednostkaMiary, nKwalifikatorJednostkiMiary)
		VALUES (src.idDokNr, src.PozId, src.Kontyngent_PozId, src.NrPorzadkowy, src.WnioskowanaIlosc, src.Jm, src.TQS, src.PrzyznanaIlosc, src.WykorzystanaIlosc, src.NrWniosku, src.NrDecyzji, src.nNrPorzadkowy, src.nWnioskowanaIlosc, src.nJm, src.Korekta, src.Err, src.JednostkaMiary, src.KwalifikatorJednostkiMiary, src.nJednostkaMiary, src.nKwalifikatorJednostkiMiary);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_nadawca' BEGIN
		MERGE INTO cel.v2_sad_nadawca AS tgt
		USING [WI_StageODS].cel.v2_sad_nadawca AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.idKntr=src.idKntr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.EORI=src.EORI
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, idKntr, PozId, EORI)
		VALUES (src.idDokNr, src.idKntr, src.PozId, src.EORI);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_odbiorca' BEGIN
		MERGE INTO cel.v2_sad_odbiorca AS tgt
		USING [WI_StageODS].cel.v2_sad_odbiorca AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.idKntr=src.idKntr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.EORI=src.EORI
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, idKntr, PozId, EORI)
		VALUES (src.idDokNr, src.idKntr, src.PozId, src.EORI);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_opakowanie' BEGIN
		MERGE INTO cel.v2_sad_opakowanie AS tgt
		USING [WI_StageODS].cel.v2_sad_opakowanie AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Opakowanie_PozId=src.Opakowanie_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Rodzaj=src.Rodzaj, tgt.Znaki=src.Znaki, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.IloscSztuk=src.IloscSztuk
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Opakowanie_PozId, Rodzaj, Znaki, LiczbaOpakowan, IloscSztuk)
		VALUES (src.idDokNr, src.PozId, src.Opakowanie_PozId, src.Rodzaj, src.Znaki, src.LiczbaOpakowan, src.IloscSztuk);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_szczegoly_wartosci' BEGIN
		MERGE INTO cel.v2_sad_szczegoly_wartosci AS tgt
		USING [WI_StageODS].cel.v2_sad_szczegoly_wartosci AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.SzczegWar_PozId=src.SzczegWar_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, SzczegWar_PozId, Kod)
		VALUES (src.idDokNr, src.PozId, src.SzczegWar_PozId, src.Kod);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_towar_wrazliwy' BEGIN
		MERGE INTO cel.v2_sad_towar_wrazliwy AS tgt
		USING [WI_StageODS].cel.v2_sad_towar_wrazliwy AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.TowarWrazliwy_PozId=src.TowarWrazliwy_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Ilosc=src.Ilosc
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, TowarWrazliwy_PozId, Kod, Ilosc)
		VALUES (src.idDokNr, src.PozId, src.TowarWrazliwy_PozId, src.Kod, src.Ilosc);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_transport' BEGIN
		MERGE INTO cel.v2_sad_transport AS tgt
		USING [WI_StageODS].cel.v2_sad_transport AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.Wewn_Granica=src.Wewn_Granica)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Rodzaj=src.Rodzaj, tgt.Znaki=src.Znaki, tgt.Kraj=src.Kraj
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, Wewn_Granica, Rodzaj, Znaki, Kraj)
		VALUES (src.idDokNr, src.Wewn_Granica, src.Rodzaj, src.Znaki, src.Kraj);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_UC' BEGIN
		MERGE INTO cel.v2_sad_UC AS tgt
		USING [WI_StageODS].cel.v2_sad_UC AS src
		ON (tgt.idDokNr=src.idDokNr)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.UCZgloszenia=src.UCZgloszenia, tgt.UCGraniczny=src.UCGraniczny, tgt.UCPrzeznaczenia=src.UCPrzeznaczenia, tgt.UCKontrolny=src.UCKontrolny, tgt.Lokalizacja_Miejsce=src.Lokalizacja_Miejsce, tgt.Lokalizacja_UC=src.Lokalizacja_UC, tgt.Lokalizacja_Opis=src.Lokalizacja_Opis, tgt.SkladCelny_Miejsce=src.SkladCelny_Miejsce, tgt.SkladCelny_Typ=src.SkladCelny_Typ, tgt.SkladCelny_Kraj=src.SkladCelny_Kraj, tgt.UCK_Nazwa=src.UCK_Nazwa, tgt.UCK_UlicaNumer=src.UCK_UlicaNumer, tgt.UCK_KodPocztowy=src.UCK_KodPocztowy, tgt.UCK_Miejscowosc=src.UCK_Miejscowosc, tgt.UCK_Kraj=src.UCK_Kraj
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, UCZgloszenia, UCGraniczny, UCPrzeznaczenia, UCKontrolny, Lokalizacja_Miejsce, Lokalizacja_UC, Lokalizacja_Opis, SkladCelny_Miejsce, SkladCelny_Typ, SkladCelny_Kraj, UCK_Nazwa, UCK_UlicaNumer, UCK_KodPocztowy, UCK_Miejscowosc, UCK_Kraj)
		VALUES (src.idDokNr, src.UCZgloszenia, src.UCGraniczny, src.UCPrzeznaczenia, src.UCKontrolny, src.Lokalizacja_Miejsce, src.Lokalizacja_UC, src.Lokalizacja_Opis, src.SkladCelny_Miejsce, src.SkladCelny_Typ, src.SkladCelny_Kraj, src.UCK_Nazwa, src.UCK_UlicaNumer, src.UCK_KodPocztowy, src.UCK_Miejscowosc, src.UCK_Kraj);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_war_tow_korekta' BEGIN
		MERGE INTO cel.v2_sad_war_tow_korekta AS tgt
		USING [WI_StageODS].cel.v2_sad_war_tow_korekta AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Korekta_PozId=src.Korekta_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Wartosc=src.Wartosc
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Korekta_PozId, Kod, Wartosc)
		VALUES (src.idDokNr, src.PozId, src.Korekta_PozId, src.Kod, src.Wartosc);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sad_zamkniecie' BEGIN
		MERGE INTO cel.v2_sad_zamkniecie AS tgt
		USING [WI_StageODS].cel.v2_sad_zamkniecie AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nr=src.Nr
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Nr)
		VALUES (src.idDokNr, src.PozId, src.Nr);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_skladajacy' BEGIN
		MERGE INTO cel.v2_skladajacy AS tgt
		USING [WI_StageODS].cel.v2_skladajacy AS src
		ON (tgt.idSkladajacy=src.idSkladajacy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwiskoImie=src.NazwiskoImie, tgt.Identyfikator=src.Identyfikator, tgt.Stanowisko=src.Stanowisko, tgt.Telefon=src.Telefon, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (idSkladajacy, NazwiskoImie, Identyfikator, Stanowisko, Telefon, QuasiId)
		VALUES (src.idSkladajacy, src.NazwiskoImie, src.Identyfikator, src.Stanowisko, src.Telefon, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_bilansowanie' BEGIN
		DELETE FROM cel.v2_sl_bilansowanie
		MERGE INTO cel.v2_sl_bilansowanie AS tgt
		USING [WI_StageODS].cel.v2_sl_bilansowanie AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Bilansowanie=src.Bilansowanie, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Bilansowanie, Opis)
		VALUES (src.Bilansowanie, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_dok_pop_kategoria' BEGIN
		DELETE FROM cel.v2_sl_dok_pop_kategoria
		MERGE INTO cel.v2_sl_dok_pop_kategoria AS tgt
		USING [WI_StageODS].cel.v2_sl_dok_pop_kategoria AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kategoria=src.Kategoria, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kategoria, Opis)
		VALUES (src.Kategoria, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_dok_pop_kod' BEGIN
		DELETE FROM cel.v2_sl_dok_pop_kod
		MERGE INTO cel.v2_sl_dok_pop_kod AS tgt
		USING [WI_StageODS].cel.v2_sl_dok_pop_kod AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_dok_popWPT_kod' BEGIN
		DELETE FROM cel.v2_sl_dok_popWPT_kod
		MERGE INTO cel.v2_sl_dok_popWPT_kod AS tgt
		USING [WI_StageODS].cel.v2_sl_dok_popWPT_kod AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_dok_wym_kod' BEGIN
		DELETE FROM cel.v2_sl_dok_wym_kod
		MERGE INTO cel.v2_sl_dok_wym_kod AS tgt
		USING [WI_StageODS].cel.v2_sl_dok_wym_kod AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_dok_wymWPT_kod' BEGIN
		DELETE FROM cel.v2_sl_dok_wymWPT_kod
		MERGE INTO cel.v2_sl_dok_wymWPT_kod AS tgt
		USING [WI_StageODS].cel.v2_sl_dok_wymWPT_kod AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_dok_zrodl' BEGIN
		DELETE FROM cel.v2_sl_dok_zrodl
		MERGE INTO cel.v2_sl_dok_zrodl AS tgt
		USING [WI_StageODS].cel.v2_sl_dok_zrodl AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_dostarczenie_SAD' BEGIN
		DELETE FROM cel.v2_sl_dostarczenie_SAD
		MERGE INTO cel.v2_sl_dostarczenie_SAD AS tgt
		USING [WI_StageODS].cel.v2_sl_dostarczenie_SAD AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DostarczenieSAD=src.DostarczenieSAD, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (DostarczenieSAD, Opis)
		VALUES (src.DostarczenieSAD, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_dpdz_typ' BEGIN
		DELETE FROM cel.v2_sl_dpdz_typ
		MERGE INTO cel.v2_sl_dpdz_typ AS tgt
		USING [WI_StageODS].cel.v2_sl_dpdz_typ AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Typ=src.Typ, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Typ, Opis)
		VALUES (src.Typ, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_Funkcjonariusze' BEGIN
		DELETE FROM cel.v2_sl_Funkcjonariusze
		MERGE INTO cel.v2_sl_Funkcjonariusze AS tgt
		USING [WI_StageODS].cel.v2_sl_Funkcjonariusze AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Funkcjonariusz=src.Funkcjonariusz, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Funkcjonariusz, Opis)
		VALUES (src.Funkcjonariusz, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_gwar_rodzaj' BEGIN
		DELETE FROM cel.v2_sl_gwar_rodzaj
		MERGE INTO cel.v2_sl_gwar_rodzaj AS tgt
		USING [WI_StageODS].cel.v2_sl_gwar_rodzaj AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Rodzaj=src.Rodzaj, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Rodzaj, Opis)
		VALUES (src.Rodzaj, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_info_dodatkowa_kod' BEGIN
		DELETE FROM cel.v2_sl_info_dodatkowa_kod
		MERGE INTO cel.v2_sl_info_dodatkowa_kod AS tgt
		USING [WI_StageODS].cel.v2_sl_info_dodatkowa_kod AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_info_dodatkowaWPT_kod' BEGIN
		DELETE FROM cel.v2_sl_info_dodatkowaWPT_kod
		MERGE INTO cel.v2_sl_info_dodatkowaWPT_kod AS tgt
		USING [WI_StageODS].cel.v2_sl_info_dodatkowaWPT_kod AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_Jm' BEGIN
		DELETE FROM cel.v2_sl_Jm
		MERGE INTO cel.v2_sl_Jm AS tgt
		USING [WI_StageODS].cel.v2_sl_Jm AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Jm=src.Jm, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Jm, Opis)
		VALUES (src.Jm, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_kont_Jm' BEGIN
		DELETE FROM cel.v2_sl_kont_Jm
		MERGE INTO cel.v2_sl_kont_Jm AS tgt
		USING [WI_StageODS].cel.v2_sl_kont_Jm AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Jm=src.Jm, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Jm, Opis)
		VALUES (src.Jm, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_KorektaWart' BEGIN
		DELETE FROM cel.v2_sl_KorektaWart
		MERGE INTO cel.v2_sl_KorektaWart AS tgt
		USING [WI_StageODS].cel.v2_sl_KorektaWart AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.typ_korekty_wart=src.typ_korekty_wart, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (typ_korekty_wart, Opis)
		VALUES (src.typ_korekty_wart, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_kraje' BEGIN
		DELETE FROM cel.v2_sl_kraje
		MERGE INTO cel.v2_sl_kraje AS tgt
		USING [WI_StageODS].cel.v2_sl_kraje AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Nazwa=src.Nazwa
		WHEN NOT MATCHED
		THEN INSERT (Kod, Nazwa)
		VALUES (src.Kod, src.Nazwa);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_KwalifikatorJm' BEGIN
		DELETE FROM cel.v2_sl_KwalifikatorJm
		MERGE INTO cel.v2_sl_KwalifikatorJm AS tgt
		USING [WI_StageODS].cel.v2_sl_KwalifikatorJm AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KwalifikatorJm=src.KwalifikatorJm, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (KwalifikatorJm, Opis)
		VALUES (src.KwalifikatorJm, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_marki' BEGIN
		DELETE FROM cel.v2_sl_marki
		MERGE INTO cel.v2_sl_marki AS tgt
		USING [WI_StageODS].cel.v2_sl_marki AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_met_platnosci' BEGIN
		DELETE FROM cel.v2_sl_met_platnosci
		MERGE INTO cel.v2_sl_met_platnosci AS tgt
		USING [WI_StageODS].cel.v2_sl_met_platnosci AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.MP=src.MP, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (MP, Opis)
		VALUES (src.MP, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_miejsce_dostawy' BEGIN
		DELETE FROM cel.v2_sl_miejsce_dostawy
		MERGE INTO cel.v2_sl_miejsce_dostawy AS tgt
		USING [WI_StageODS].cel.v2_sl_miejsce_dostawy AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.MiejsceKod=src.MiejsceKod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (MiejsceKod, Opis)
		VALUES (src.MiejsceKod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_opakowania' BEGIN
		DELETE FROM cel.v2_sl_opakowania
		MERGE INTO cel.v2_sl_opakowania AS tgt
		USING [WI_StageODS].cel.v2_sl_opakowania AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Rodzaj=src.Rodzaj, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Rodzaj, Opis)
		VALUES (src.Rodzaj, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_oplaty' BEGIN
		DELETE FROM cel.v2_sl_oplaty
		MERGE INTO cel.v2_sl_oplaty AS tgt
		USING [WI_StageODS].cel.v2_sl_oplaty AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Typ=src.Typ, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Typ, Opis)
		VALUES (src.Typ, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_pac' BEGIN
		DELETE FROM cel.v2_sl_pac
		MERGE INTO cel.v2_sl_pac AS tgt
		USING [WI_StageODS].cel.v2_sl_pac AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.id_jedn=src.id_jedn, tgt.id_jedn_nad=src.id_jedn_nad, tgt.nazwa_jedn=src.nazwa_jedn, tgt.nazwa=src.nazwa, tgt.granica=src.granica
		WHEN NOT MATCHED
		THEN INSERT (id_jedn, id_jedn_nad, nazwa_jedn, nazwa, granica)
		VALUES (src.id_jedn, src.id_jedn_nad, src.nazwa_jedn, src.nazwa, src.granica);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_pozw_proc_gosp' BEGIN
		DELETE FROM cel.v2_sl_pozw_proc_gosp
		MERGE INTO cel.v2_sl_pozw_proc_gosp AS tgt
		USING [WI_StageODS].cel.v2_sl_pozw_proc_gosp AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPozw=src.NrPozw, tgt.UCKontrolny=src.UCKontrolny
		WHEN NOT MATCHED
		THEN INSERT (NrPozw, UCKontrolny)
		VALUES (src.NrPozw, src.UCKontrolny);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_preferencje' BEGIN
		DELETE FROM cel.v2_sl_preferencje
		MERGE INTO cel.v2_sl_preferencje AS tgt
		USING [WI_StageODS].cel.v2_sl_preferencje AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Preferencje=src.Preferencje, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Preferencje, Opis)
		VALUES (src.Preferencje, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_procedura_2zn' BEGIN
		DELETE FROM cel.v2_sl_procedura_2zn
		MERGE INTO cel.v2_sl_procedura_2zn AS tgt
		USING [WI_StageODS].cel.v2_sl_procedura_2zn AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Procedura=src.Procedura, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Procedura, Opis)
		VALUES (src.Procedura, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_procedura' BEGIN
		DELETE FROM cel.v2_sl_procedura
		MERGE INTO cel.v2_sl_procedura AS tgt
		USING [WI_StageODS].cel.v2_sl_procedura AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Procedura=src.Procedura, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Procedura, Opis)
		VALUES (src.Procedura, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_procedura_szczegoly' BEGIN
		DELETE FROM cel.v2_sl_procedura_szczegoly
		MERGE INTO cel.v2_sl_procedura_szczegoly AS tgt
		USING [WI_StageODS].cel.v2_sl_procedura_szczegoly AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ProceduraSzczegoly=src.ProceduraSzczegoly, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (ProceduraSzczegoly, Opis)
		VALUES (src.ProceduraSzczegoly, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_przedstawicielstwo' BEGIN
		DELETE FROM cel.v2_sl_przedstawicielstwo
		MERGE INTO cel.v2_sl_przedstawicielstwo AS tgt
		USING [WI_StageODS].cel.v2_sl_przedstawicielstwo AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Przedstawicielstwo=src.Przedstawicielstwo, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Przedstawicielstwo, Opis)
		VALUES (src.Przedstawicielstwo, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_rodz_dok' BEGIN
		DELETE FROM cel.v2_sl_rodz_dok
		MERGE INTO cel.v2_sl_rodz_dok AS tgt
		USING [WI_StageODS].cel.v2_sl_rodz_dok AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzDok=src.RodzDok, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (RodzDok, Opis)
		VALUES (src.RodzDok, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_rodz_dyrektywy' BEGIN
		DELETE FROM cel.v2_sl_rodz_dyrektywy
		MERGE INTO cel.v2_sl_rodz_dyrektywy AS tgt
		USING [WI_StageODS].cel.v2_sl_rodz_dyrektywy AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Rodzaj=src.Rodzaj, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Rodzaj, Opis)
		VALUES (src.Rodzaj, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_rodz_transakcji' BEGIN
		DELETE FROM cel.v2_sl_rodz_transakcji
		MERGE INTO cel.v2_sl_rodz_transakcji AS tgt
		USING [WI_StageODS].cel.v2_sl_rodz_transakcji AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajTransakcji=src.RodzajTransakcji, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (RodzajTransakcji, Opis)
		VALUES (src.RodzajTransakcji, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_sad_metoda_wartosc' BEGIN
		DELETE FROM cel.v2_sl_sad_metoda_wartosc
		MERGE INTO cel.v2_sl_sad_metoda_wartosc AS tgt
		USING [WI_StageODS].cel.v2_sl_sad_metoda_wartosc AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.MetodaWartosciowania=src.MetodaWartosciowania, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (MetodaWartosciowania, Opis)
		VALUES (src.MetodaWartosciowania, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_sad_P1a' BEGIN
		DELETE FROM cel.v2_sl_sad_P1a
		MERGE INTO cel.v2_sl_sad_P1a AS tgt
		USING [WI_StageODS].cel.v2_sl_sad_P1a AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.P1a=src.P1a, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (P1a, Opis)
		VALUES (src.P1a, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_sad_P1b' BEGIN
		DELETE FROM cel.v2_sl_sad_P1b
		MERGE INTO cel.v2_sl_sad_P1b AS tgt
		USING [WI_StageODS].cel.v2_sl_sad_P1b AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.P1b=src.P1b, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (P1b, Opis)
		VALUES (src.P1b, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_sad_P1c' BEGIN
		DELETE FROM cel.v2_sl_sad_P1c
		MERGE INTO cel.v2_sl_sad_P1c AS tgt
		USING [WI_StageODS].cel.v2_sl_sad_P1c AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.P1c=src.P1c, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (P1c, Opis)
		VALUES (src.P1c, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_sad_podtyp' BEGIN
		DELETE FROM cel.v2_sl_sad_podtyp
		MERGE INTO cel.v2_sl_sad_podtyp AS tgt
		USING [WI_StageODS].cel.v2_sl_sad_podtyp AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Podtyp=src.Podtyp, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Podtyp, Opis)
		VALUES (src.Podtyp, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_sad_szczeg_wartosci' BEGIN
		DELETE FROM cel.v2_sl_sad_szczeg_wartosci
		MERGE INTO cel.v2_sl_sad_szczeg_wartosci AS tgt
		USING [WI_StageODS].cel.v2_sl_sad_szczeg_wartosci AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_sad_typ' BEGIN
		DELETE FROM cel.v2_sl_sad_typ
		MERGE INTO cel.v2_sl_sad_typ AS tgt
		USING [WI_StageODS].cel.v2_sl_sad_typ AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Typ=src.Typ, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Typ, Opis)
		VALUES (src.Typ, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_sklad_cel_typ' BEGIN
		DELETE FROM cel.v2_sl_sklad_cel_typ
		MERGE INTO cel.v2_sl_sklad_cel_typ AS tgt
		USING [WI_StageODS].cel.v2_sl_sklad_cel_typ AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SkladCelny_Typ=src.SkladCelny_Typ, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (SkladCelny_Typ, Opis)
		VALUES (src.SkladCelny_Typ, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_status' BEGIN
		DELETE FROM cel.v2_sl_status
		MERGE INTO cel.v2_sl_status AS tgt
		USING [WI_StageODS].cel.v2_sl_status AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDok=src.RodzajDok, tgt.status=src.status, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (RodzajDok, status, Opis)
		VALUES (src.RodzajDok, src.status, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_status_dyrektywy' BEGIN
		DELETE FROM cel.v2_sl_status_dyrektywy
		MERGE INTO cel.v2_sl_status_dyrektywy AS tgt
		USING [WI_StageODS].cel.v2_sl_status_dyrektywy AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Status=src.Status, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Status, Opis)
		VALUES (src.Status, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_szczegoly_wartosci' BEGIN
		DELETE FROM cel.v2_sl_szczegoly_wartosci
		MERGE INTO cel.v2_sl_szczegoly_wartosci AS tgt
		USING [WI_StageODS].cel.v2_sl_szczegoly_wartosci AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SzczegolyWartosci=src.SzczegolyWartosci, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (SzczegolyWartosci, Opis)
		VALUES (src.SzczegolyWartosci, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_TQS' BEGIN
		DELETE FROM cel.v2_sl_TQS
		MERGE INTO cel.v2_sl_TQS AS tgt
		USING [WI_StageODS].cel.v2_sl_TQS AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TQS=src.TQS, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (TQS, Opis)
		VALUES (src.TQS, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_transport' BEGIN
		DELETE FROM cel.v2_sl_transport
		MERGE INTO cel.v2_sl_transport AS tgt
		USING [WI_StageODS].cel.v2_sl_transport AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Rodzaj=src.Rodzaj, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Rodzaj, Opis)
		VALUES (src.Rodzaj, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_tranzyt' BEGIN
		DELETE FROM cel.v2_sl_tranzyt
		MERGE INTO cel.v2_sl_tranzyt AS tgt
		USING [WI_StageODS].cel.v2_sl_tranzyt AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Rodzaj=src.Rodzaj, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Rodzaj, Opis)
		VALUES (src.Rodzaj, src."Opis");
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_UC' BEGIN
		DELETE FROM cel.v2_sl_UC
		MERGE INTO cel.v2_sl_UC AS tgt
		USING [WI_StageODS].cel.v2_sl_UC AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.UC=src.UC, tgt.UCNad=src.UCNad, tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.kod_izby_celnej=src.kod_izby_celnej
		WHEN NOT MATCHED
		THEN INSERT (UC, UCNad, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, kod_izby_celnej)
		VALUES (src.UC, src.UCNad, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.kod_izby_celnej);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_waluty' BEGIN
		DELETE FROM cel.v2_sl_waluty
		MERGE INTO cel.v2_sl_waluty AS tgt
		USING [WI_StageODS].cel.v2_sl_waluty AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Waluta=src.Waluta, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Waluta, Opis)
		VALUES (src.Waluta, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_war_dostaw' BEGIN
		DELETE FROM cel.v2_sl_war_dostaw
		MERGE INTO cel.v2_sl_war_dostaw AS tgt
		USING [WI_StageODS].cel.v2_sl_war_dostaw AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_war_tow_korekta' BEGIN
		DELETE FROM cel.v2_sl_war_tow_korekta
		MERGE INTO cel.v2_sl_war_tow_korekta AS tgt
		USING [WI_StageODS].cel.v2_sl_war_tow_korekta AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_wskaznik' BEGIN
		DELETE FROM cel.v2_sl_wskaznik
		MERGE INTO cel.v2_sl_wskaznik AS tgt
		USING [WI_StageODS].cel.v2_sl_wskaznik AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Wskaznik=src.Wskaznik, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Wskaznik, Opis)
		VALUES (src.Wskaznik, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_wynik_kontr' BEGIN
		DELETE FROM cel.v2_sl_wynik_kontr
		MERGE INTO cel.v2_sl_wynik_kontr AS tgt
		USING [WI_StageODS].cel.v2_sl_wynik_kontr AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kod=src.Kod, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Kod, Opis)
		VALUES (src.Kod, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_zefir' BEGIN
		DELETE FROM cel.v2_sl_zefir
		MERGE INTO cel.v2_sl_zefir AS tgt
		USING [WI_StageODS].cel.v2_sl_zefir AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Zefir=src.Zefir, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (Zefir, Opis)
		VALUES (src.Zefir, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_sl_zwolnienie_towaru' BEGIN
		DELETE FROM cel.v2_sl_zwolnienie_towaru
		MERGE INTO cel.v2_sl_zwolnienie_towaru AS tgt
		USING [WI_StageODS].cel.v2_sl_zwolnienie_towaru AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZwolnienieTowaru=src.ZwolnienieTowaru, tgt.Opis=src.Opis
		WHEN NOT MATCHED
		THEN INSERT (ZwolnienieTowaru, Opis)
		VALUES (src.ZwolnienieTowaru, src.Opis);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_towar' BEGIN
		MERGE INTO cel.v2_towar AS tgt
		USING [WI_StageODS].cel.v2_towar AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OpisTowaru=src.OpisTowaru, tgt.KodTowarowy=src.KodTowarowy, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajPochodzenia=src.KrajPochodzenia, tgt.MasaNetto=src.MasaNetto, tgt.IloscUzupelniajacaJM=src.IloscUzupelniajacaJM, tgt.WartoscStatystyczna=src.WartoscStatystyczna, tgt.NrRejestru=src.NrRejestru, tgt.DataRejestru=src.DataRejestru, tgt.Opakowanie=src.Opakowanie
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, OpisTowaru, KodTowarowy, LiczbaOpakowan, MasaBrutto, KrajWysylki, KrajPochodzenia, MasaNetto, IloscUzupelniajacaJM, WartoscStatystyczna, NrRejestru, DataRejestru, Opakowanie)
		VALUES (src.idDokNr, src.PozId, src.OpisTowaru, src.KodTowarowy, src.LiczbaOpakowan, src.MasaBrutto, src.KrajWysylki, src.KrajPochodzenia, src.MasaNetto, src.IloscUzupelniajacaJM, src.WartoscStatystyczna, src.NrRejestru, src.DataRejestru, src.Opakowanie);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_tqs_kontyngenty' BEGIN
		DELETE FROM cel.v2_tqs_kontyngenty
		MERGE INTO cel.v2_tqs_kontyngenty AS tgt
		USING [WI_StageODS].cel.v2_tqs_kontyngenty AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nr_porzadkowy=src.Nr_porzadkowy, tgt.Kraj_pochodzenia=src.Kraj_pochodzenia, tgt.Data_otwarcia=src.Data_otwarcia, tgt.Data_koncowa=src.Data_koncowa, tgt.Status=src.Status, tgt.Data_zablokowania=src.Data_zablokowania, tgt.Data_wyczerpania=src.Data_wyczerpania, tgt.Wielkosc_poczatkowa=src.Wielkosc_poczatkowa, tgt.Aktualne_saldo=src.Aktualne_saldo, tgt.Procent_wykorzystania=src.Procent_wykorzystania, tgt."data otw"=src."data otw"
		WHEN NOT MATCHED
		THEN INSERT (Nr_porzadkowy, Kraj_pochodzenia, Data_otwarcia, Data_koncowa, Status, Data_zablokowania, Data_wyczerpania, Wielkosc_poczatkowa, Aktualne_saldo, Procent_wykorzystania, "data otw")
		VALUES (src.Nr_porzadkowy, src.Kraj_pochodzenia, src.Data_otwarcia, src.Data_koncowa, src.Status, src.Data_zablokowania, src.Data_wyczerpania, src.Wielkosc_poczatkowa, src.Aktualne_saldo, src.Procent_wykorzystania, src."data otw");
		SET @Merged = 1;
	END

	IF @TableName = 'v2_tqs_odprawy' BEGIN
		DELETE FROM cel.v2_tqs_odprawy
		MERGE INTO cel.v2_tqs_odprawy AS tgt
		USING [WI_StageODS].cel.v2_tqs_odprawy AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nr_zgloszenia=src.Nr_zgloszenia, tgt.Nr_pozycji=src.Nr_pozycji, tgt.Typ_zgloszenia=src.Typ_zgloszenia, tgt.Nr_wniosku=src.Nr_wniosku, tgt.UC_zgloszenia=src.UC_zgloszenia, tgt.Login_funkcjonariusza=src.Login_funkcjonariusza, tgt.Nr_srodka=src.Nr_srodka, tgt.Typ_srodka=src.Typ_srodka, tgt.Nr_porzadkowy=src.Nr_porzadkowy, tgt.Rodzaj_nr_porzadkowego=src.Rodzaj_nr_porzadkowego, tgt.TIN_podmiotu=src.TIN_podmiotu, tgt.Kod_towarowy=src.Kod_towarowy, tgt.Kraj_pochodzenia=src.Kraj_pochodzenia, tgt.Data_odprawy=src.Data_odprawy, tgt.Wnioskowana_ilosc=src.Wnioskowana_ilosc, tgt.Przyznana_ilosc=src.Przyznana_ilosc, tgt.Wykorzystana_ilosc=src.Wykorzystana_ilosc, tgt.Wykorzystanie=src.Wykorzystanie, tgt.Status_TQS=src.Status_TQS, tgt.Przyczyna_odrzucenia=src.Przyczyna_odrzucenia, tgt.Raportowana_ilosc=src.Raportowana_ilosc, tgt.Kontyngent_PozId=src.Kontyngent_PozId, tgt.Powod_odrzucenia=src.Powod_odrzucenia
		WHEN NOT MATCHED
		THEN INSERT (Nr_zgloszenia, Nr_pozycji, Typ_zgloszenia, Nr_wniosku, UC_zgloszenia, Login_funkcjonariusza, Nr_srodka, Typ_srodka, Nr_porzadkowy, Rodzaj_nr_porzadkowego, TIN_podmiotu, Kod_towarowy, Kraj_pochodzenia, Data_odprawy, Wnioskowana_ilosc, Przyznana_ilosc, Wykorzystana_ilosc, Wykorzystanie, Status_TQS, Przyczyna_odrzucenia, Raportowana_ilosc, Kontyngent_PozId, Powod_odrzucenia)
		VALUES (src.Nr_zgloszenia, src.Nr_pozycji, src.Typ_zgloszenia, src.Nr_wniosku, src.UC_zgloszenia, src.Login_funkcjonariusza, src.Nr_srodka, src.Typ_srodka, src.Nr_porzadkowy, src.Rodzaj_nr_porzadkowego, src.TIN_podmiotu, src.Kod_towarowy, src.Kraj_pochodzenia, src.Data_odprawy, src.Wnioskowana_ilosc, src.Przyznana_ilosc, src.Wykorzystana_ilosc, src.Wykorzystanie, src.Status_TQS, src.Przyczyna_odrzucenia, src.Raportowana_ilosc, src.Kontyngent_PozId, src.Powod_odrzucenia);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_transport' BEGIN
		MERGE INTO cel.v2_transport AS tgt
		USING [WI_StageODS].cel.v2_transport AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Rodzaj=src.Rodzaj, tgt.Znaki=src.Znaki, tgt.Kraj=src.Kraj
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Rodzaj, Znaki, Kraj)
		VALUES (src.idDokNr, src.PozId, src.Rodzaj, src.Znaki, src.Kraj);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_transport_zamkniecie' BEGIN
		MERGE INTO cel.v2_transport_zamkniecie AS tgt
		USING [WI_StageODS].cel.v2_transport_zamkniecie AS src
		ON (tgt.idDokNr=src.idDokNr and tgt.PozId=src.PozId and tgt.Zamkniecie_PozId=src.Zamkniecie_PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Ilosc=src.Ilosc, tgt.Nr=src.Nr, tgt.Rodzaj=src.Rodzaj
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, PozId, Zamkniecie_PozId, Ilosc, Nr, Rodzaj)
		VALUES (src.idDokNr, src.PozId, src.Zamkniecie_PozId, src.Ilosc, src.Nr, src.Rodzaj);
		SET @Merged = 1;
	END

	IF @TableName = 'v2_zmiana' BEGIN
		DELETE FROM cel.v2_zmiana
		MERGE INTO cel.v2_zmiana AS tgt
		USING [WI_StageODS].cel.v2_zmiana AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.idDokNr=src.idDokNr, tgt.Operacja=src.Operacja, tgt.XQLPath=src.XQLPath, tgt.Nazwa=src.Nazwa, tgt.przed=src.przed, tgt.po=src.po
		WHEN NOT MATCHED
		THEN INSERT (idDokNr, Operacja, XQLPath, Nazwa, przed, po)
		VALUES (src.idDokNr, src.Operacja, src.XQLPath, src.Nazwa, src.przed, src.po);
		SET @Merged = 1;
	END

	IF @TableName = 'zamkn_celne' BEGIN
		MERGE INTO cel.zamkn_celne AS tgt
		USING [WI_StageODS].cel.zamkn_celne AS src
		ON (tgt.id_dok=src.id_dok and tgt.PozId=src.PozId)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Rodzaj=src.Rodzaj, tgt.Nr=src.Nr, tgt.Ilosc=src.Ilosc
		WHEN NOT MATCHED
		THEN INSERT (id_dok, PozId, Rodzaj, Nr, Ilosc)
		VALUES (src.id_dok, src.PozId, src.Rodzaj, src.Nr, src.Ilosc);
		SET @Merged = 1;
	END

	IF (@Merged = 0)
	BEGIN
			DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
			THROW 51002, @Info, 0;
				END
			END
		;