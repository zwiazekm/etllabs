

-- =============================================
-- Author:
-- Create date: 2014-08-26
-- Description:	Merge z [$(WA_StageHurtownia)] do WA_Hurtownia. 
-- =============================================

CREATE PROCEDURE [zc].[MergeTableFromStageHurtownia_Celina] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END
	
	-- grupa DT --

	IF @TableName = 'DT_Podmiot' BEGIN
		MERGE INTO zc.DT_Podmiot AS tgt
		USING [WA_StageHurtownia].zc.DT_Podmiot AS src
		ON (tgt.IdPodmiotu=src.IdPodmiotu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajPodmiotu=src.RodzajPodmiotu, tgt.Nazwa=src.Nazwa, tgt.Kraj=src.Kraj, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Adres=src.Adres, tgt.NIP=src.NIP, tgt.REGON=src.REGON, tgt.PESEL=src.PESEL, tgt.NrDowodu=src.NrDowodu, tgt.Bnazwa=src.Bnazwa, tgt.Bkonto=src.Bkonto, tgt.IdKntr=src.IdKntr, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (IdPodmiotu, RodzajPodmiotu, Nazwa, Kraj, KodPocztowy, Miejscowosc, Adres, NIP, REGON, PESEL, NrDowodu, Bnazwa, Bkonto, IdKntr, QuasiId)
		VALUES (src.IdPodmiotu, src.RodzajPodmiotu, src.Nazwa, src.Kraj, src.KodPocztowy, src.Miejscowosc, src.Adres, src.NIP, src.REGON, src.PESEL, src.NrDowodu, src.Bnazwa, src.Bkonto, src.IdKntr, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'DT_Dokument' BEGIN
		MERGE INTO zc.DT_Dokument AS tgt
		USING [WA_StageHurtownia].zc.DT_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.WersjaXML=src.WersjaXML, tgt.DataWyeksportowania=src.DataWyeksportowania, tgt.RodzajDok=src.RodzajDok, tgt.UrzadWyjsciaId=src.UrzadWyjsciaId, tgt.UrzadWyjsciaIdPid=src.UrzadWyjsciaIdPid, tgt.UrzadWyjsciaPas=src.UrzadWyjsciaPas, tgt.DataRejestracji=src.DataRejestracji, tgt.DataZatwierdzenia=src.DataZatwierdzenia, tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.TypDok=src.TypDok, tgt.TranzytOtwarcie=src.TranzytOtwarcie, tgt.TranzytZamkniecie=src.TranzytZamkniecie, tgt.TranzytEtap=src.TranzytEtap, tgt.RodzajDokZrodl=src.RodzajDokZrodl, tgt.NrDokZrodl=src.NrDokZrodl, tgt.NrEwidencjiZamykajacy=src.NrEwidencjiZamykajacy, tgt.Status=src.Status, tgt.EtapBilansowania=src.EtapBilansowania, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajWysylkiPid=src.KrajWysylkiPid, tgt.KrajDocelowy=src.KrajDocelowy, tgt.KrajDocelowyPid=src.KrajDocelowyPid, tgt.IdJednPrzezn=src.IdJednPrzezn, tgt.IdJednPrzeznPid=src.IdJednPrzeznPid, tgt.NrAkt=src.NrAkt, tgt.CharaktTowaru=src.CharaktTowaru, tgt.IdPodmiotu=src.IdPodmiotu
		WHEN NOT MATCHED
		THEN INSERT (IdDok, WersjaXML, DataWyeksportowania, RodzajDok, UrzadWyjsciaId, UrzadWyjsciaIdPid, UrzadWyjsciaPas, DataRejestracji, DataZatwierdzenia, NrEwidencyjny, TypDok, TranzytOtwarcie, TranzytZamkniecie, TranzytEtap, RodzajDokZrodl, NrDokZrodl, NrEwidencjiZamykajacy, Status, EtapBilansowania, KrajWysylki, KrajWysylkiPid, KrajDocelowy, KrajDocelowyPid, IdJednPrzezn, IdJednPrzeznPid, NrAkt, CharaktTowaru, IdPodmiotu)
		VALUES (src.IdDok, src.WersjaXML, src.DataWyeksportowania, src.RodzajDok, src.UrzadWyjsciaId, src.UrzadWyjsciaIdPid, src.UrzadWyjsciaPas, src.DataRejestracji, src.DataZatwierdzenia, src.NrEwidencyjny, src.TypDok, src.TranzytOtwarcie, src.TranzytZamkniecie, src.TranzytEtap, src.RodzajDokZrodl, src.NrDokZrodl, src.NrEwidencjiZamykajacy, src.Status, src.EtapBilansowania, src.KrajWysylki, src.KrajWysylkiPid, src.KrajDocelowy, src.KrajDocelowyPid, src.IdJednPrzezn, src.IdJednPrzeznPid, src.NrAkt, src.CharaktTowaru, src.IdPodmiotu);
		SET @Merged = 1;
	END

	IF @TableName = 'DT_Dyrektywa' BEGIN
		MERGE INTO zc.DT_Dyrektywa AS tgt
		USING [WA_StageHurtownia].zc.DT_Dyrektywa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NrDyrektywy=src.NrDyrektywy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.AutorProfilu=src.AutorProfilu, tgt.RodzajDyrektywy=src.RodzajDyrektywy, tgt.RodzajDyrektywyPid=src.RodzajDyrektywyPid, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Tresc=src.Tresc, tgt.IdProfilu=src.IdProfilu, tgt.KomentarzDyspozytora=src.KomentarzDyspozytora, tgt.KomentarzPoRealizacji=src.KomentarzPoRealizacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, AutorProfilu, RodzajDyrektywy, RodzajDyrektywyPid, Adresat, Status, Tresc, NrDyrektywy, IdProfilu, KomentarzDyspozytora, KomentarzPoRealizacji)
		VALUES (src.IdDok, src.AutorProfilu, src.RodzajDyrektywy, src.RodzajDyrektywyPid, src.Adresat, src.Status, src.Tresc, src.NrDyrektywy, src.IdProfilu, src.KomentarzDyspozytora, src.KomentarzPoRealizacji);
		SET @Merged = 1;
	END

	IF @TableName = 'DT_Historia' BEGIN
		MERGE INTO zc.DT_Historia AS tgt
		USING [WA_StageHurtownia].zc.DT_Historia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.DataZmiany=src.DataZmiany)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdJednostki=src.IdJednostki, tgt.IdJednostkiPid=src.IdJednostkiPid, tgt.Operator=src.Operator, tgt.SymbolOperacji=src.SymbolOperacji, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, DataZmiany, IdJednostki, IdJednostkiPid, Operator, SymbolOperacji, Adnotacja, RodzAdnotacji)
		VALUES (src.IdDok, src.IdPozycji, src.DataZmiany, src.IdJednostki, src.IdJednostkiPid, src.Operator, src.SymbolOperacji, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END

	IF @TableName = 'DT_SrodekPrzewozowy' BEGIN
		MERGE INTO zc.DT_SrodekPrzewozowy AS tgt
		USING [WA_StageHurtownia].zc.DT_SrodekPrzewozowy AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrSrodkaPrzewoz=src.NrSrodkaPrzewoz, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, NrSrodkaPrzewoz, Kraj, KrajPid)
		VALUES (src.IdDok, src.IdPozycji, src.NrSrodkaPrzewoz, src.Kraj, src.KrajPid);
		SET @Merged = 1;
	END

	IF @TableName = 'DT_Kontener' BEGIN
		MERGE INTO zc.DT_Kontener AS tgt
		USING [WA_StageHurtownia].zc.DT_Kontener AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, NrKontenera)
		VALUES (src.IdDok, src.IdPozycji, src.NrKontenera);
		SET @Merged = 1;
	END

	IF @TableName = 'DT_Powiazanie' BEGIN
		MERGE INTO zc.DT_Powiazanie AS tgt
		USING [WA_StageHurtownia].zc.DT_Powiazanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.RodzajDok=src.RodzajDok
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, NrEwidencyjny, RodzajDok)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.NrEwidencyjny, src.RodzajDok);
		SET @Merged = 1;
	END

	IF @TableName = 'DT_Towar' BEGIN
		MERGE INTO zc.DT_Towar AS tgt
		USING [WA_StageHurtownia].zc.DT_Towar AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OpisTowaru=src.OpisTowaru, tgt.MasaBrutto=src.MasaBrutto, tgt.Ilosc=src.Ilosc, tgt.JednostkaMiary=src.JednostkaMiary, tgt.JednostkaMiaryPid=src.JednostkaMiaryPid, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.OpisOpakowan=src.OpisOpakowan, tgt.OpisWartosci=src.OpisWartosci
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, OpisTowaru, MasaBrutto, Ilosc, JednostkaMiary, JednostkaMiaryPid, LiczbaOpakowan, OpisOpakowan, OpisWartosci)
		VALUES (src.IdDok, src.IdPozycji, src.OpisTowaru, src.MasaBrutto, src.Ilosc, src.JednostkaMiary, src.JednostkaMiaryPid, src.LiczbaOpakowan, src.OpisOpakowan, src.OpisWartosci);
		SET @Merged = 1;
	END

	IF @TableName = 'DT_ZamkniecieCelne' BEGIN
		MERGE INTO zc.DT_ZamkniecieCelne AS tgt
		USING [WA_StageHurtownia].zc.DT_ZamkniecieCelne AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajZamkniecia=src.RodzajZamkniecia, tgt.Ilosc=src.Ilosc, tgt.NrZamkniecia=src.NrZamkniecia
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, RodzajZamkniecia, Ilosc, NrZamkniecia)
		VALUES (src.IdDok, src.IdPozycji, src.RodzajZamkniecia, src.Ilosc, src.NrZamkniecia);
		SET @Merged = 1;
	END


	-- grupa INNY --

	IF @TableName = 'INNY_Dokument' BEGIN
		MERGE INTO zc.INNY_Dokument AS tgt
		USING [WA_StageHurtownia].zc.INNY_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.WersjaXML=src.WersjaXML, tgt.DataWyeksportowania=src.DataWyeksportowania, tgt.RodzajDok=src.RodzajDok, tgt.PlacowkaId=src.PlacowkaId, tgt.PlacowkaIdPid=src.PlacowkaIdPid, tgt.PlacowkaPas=src.PlacowkaPas, tgt.DataRejestracji=src.DataRejestracji, tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.Status=src.Status, tgt.NrWlasny=src.NrWlasny, tgt.TypDok=src.TypDok, tgt.ProceduraBiezaca=src.ProceduraBiezaca, tgt.ProceduraBiezacaPid=src.ProceduraBiezacaPid, tgt.ProceduraPoprzednia=src.ProceduraPoprzednia, tgt.ProceduraPoprzedniaPid=src.ProceduraPoprzedniaPid, tgt.Uwagi=src.Uwagi, tgt.WartoscTowarow=src.WartoscTowarow, tgt.SymbolWaluty=src.SymbolWaluty, tgt.SymbolWalutyPid=src.SymbolWalutyPid, tgt.Pozwolenie=src.Pozwolenie, tgt.OdbiorcaEORI=src.OdbiorcaEORI, tgt.OdbiorcaTIN=src.OdbiorcaTIN, tgt.ZglaszajacyEORI=src.ZglaszajacyEORI, tgt.ZglaszajacyTIN=src.ZglaszajacyTIN, tgt.ZglaszajacyPrzedstawicielstwo=src.ZglaszajacyPrzedstawicielstwo
		WHEN NOT MATCHED
		THEN INSERT (IdDok, WersjaXML, DataWyeksportowania, RodzajDok, PlacowkaId, PlacowkaIdPid, PlacowkaPas, DataRejestracji, NrEwidencyjny, DataPrzyjecia, Status, NrWlasny, TypDok, ProceduraBiezaca, ProceduraBiezacaPid, ProceduraPoprzednia, ProceduraPoprzedniaPid, Uwagi, WartoscTowarow, SymbolWaluty, SymbolWalutyPid, Pozwolenie, OdbiorcaEORI, OdbiorcaTIN, ZglaszajacyEORI, ZglaszajacyTIN, ZglaszajacyPrzedstawicielstwo)
		VALUES (src.IdDok, src.WersjaXML, src.DataWyeksportowania, src.RodzajDok, src.PlacowkaId, src.PlacowkaIdPid, src.PlacowkaPas, src.DataRejestracji, src.NrEwidencyjny, src.DataPrzyjecia, src.Status, src.NrWlasny, src.TypDok, src.ProceduraBiezaca, src.ProceduraBiezacaPid, src.ProceduraPoprzednia, src.ProceduraPoprzedniaPid, src.Uwagi, src.WartoscTowarow, src.SymbolWaluty, src.SymbolWalutyPid, src.Pozwolenie, src.OdbiorcaEORI, src.OdbiorcaTIN, src.ZglaszajacyEORI, src.ZglaszajacyTIN, src.ZglaszajacyPrzedstawicielstwo);
		SET @Merged = 1;
	END

	IF @TableName = 'INNY_Towar' BEGIN
		MERGE INTO zc.INNY_Towar AS tgt
		USING [WA_StageHurtownia].zc.INNY_Towar AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto, tgt.KodTowaru=src.KodTowaru, tgt.Procedura=src.Procedura, tgt.KrajWysylki=src.KrajWysylki, tgt.OpisTowaru=src.OpisTowaru, tgt.KrajPoch=src.KrajPoch, tgt.WarTowaru=src.WarTowaru, tgt.MasaNetto=src.MasaNetto
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, LiczbaOpakowan, MasaBrutto, KodTowaru, Procedura, KrajWysylki, OpisTowaru, KrajPoch, WarTowaru, MasaNetto)
		VALUES (src.IdDok, src.IdPozycji, src.LiczbaOpakowan, src.MasaBrutto, src.KodTowaru, src.Procedura, src.KrajWysylki, src.OpisTowaru, src.KrajPoch, src.WarTowaru, src.MasaNetto);	
		SET @Merged = 1;
	END

	IF @TableName = 'INNY_Powiazanie' BEGIN
		MERGE INTO zc.INNY_Powiazanie AS tgt
		USING [WA_StageHurtownia].zc.INNY_Powiazanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.RodzajDok=src.RodzajDok
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, NrEwidencyjny, RodzajDok)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.NrEwidencyjny, src.RodzajDok);
		SET @Merged = 1;
	END

	IF @TableName = 'INNY_Dyrektywa' BEGIN
		MERGE INTO zc.INNY_Dyrektywa AS tgt
		USING [WA_StageHurtownia].zc.INNY_Dyrektywa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NrDyrektywy=src.NrDyrektywy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.AutorProfilu=src.AutorProfilu, tgt.RodzajDyrektywy=src.RodzajDyrektywy, tgt.RodzajDyrektywyPid=src.RodzajDyrektywyPid, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Tresc=src.Tresc, tgt.KomentarzDyspozytora=src.KomentarzDyspozytora, tgt.KomentarzPoRealizacji=src.KomentarzPoRealizacji, tgt.IdProfilu=src.IdProfilu
		WHEN NOT MATCHED
		THEN INSERT (IdDok, AutorProfilu, RodzajDyrektywy, RodzajDyrektywyPid, Adresat, Status, Tresc, KomentarzDyspozytora, KomentarzPoRealizacji, IdProfilu, NrDyrektywy)
		VALUES (src.IdDok, src.AutorProfilu, src.RodzajDyrektywy, src.RodzajDyrektywyPid, src.Adresat, src.Status, src.Tresc, src.KomentarzDyspozytora, src.KomentarzPoRealizacji, src.IdProfilu, src.NrDyrektywy);
		SET @Merged = 1;
	END

	IF @TableName = 'INNY_Historia' BEGIN
		MERGE INTO zc.INNY_Historia AS tgt
		USING [WA_StageHurtownia].zc.INNY_Historia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.DataZmiany=src.DataZmiany)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdJednostki=src.IdJednostki, tgt.IdJednostkiPid=src.IdJednostkiPid, tgt.Operator=src.Operator, tgt.SymbolOperacji=src.SymbolOperacji, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, DataZmiany, IdJednostki, IdJednostkiPid, Operator, SymbolOperacji, Adnotacja, RodzAdnotacji)
		VALUES (src.IdDok, src.IdPozycji, src.DataZmiany, src.IdJednostki, src.IdJednostkiPid, src.Operator, src.SymbolOperacji, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END


	-- grupa PSP --	

	IF @TableName = 'PSP_Dokument' BEGIN
		MERGE INTO zc.PSP_Dokument AS tgt
		USING [WA_StageHurtownia].zc.PSP_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.WersjaXML=src.WersjaXML, tgt.DataWyeksportowania=src.DataWyeksportowania, tgt.RodzajDok=src.RodzajDok, tgt.PlacowkaId=src.PlacowkaId, tgt.PlacowkaIdPid=src.PlacowkaIdPid, tgt.PlacowkaPas=src.PlacowkaPas, tgt.DataRejestracji=src.DataRejestracji, tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.StatusDok=src.StatusDok, tgt.IdPrzewoznik=src.IdPrzewoznik, tgt.Kierunek=src.Kierunek, tgt.Transport=src.Transport, tgt.TransportPid=src.TransportPid, tgt.Uwagi=src.Uwagi
		WHEN NOT MATCHED
		THEN INSERT (IdDok, WersjaXML, DataWyeksportowania, RodzajDok, PlacowkaId, PlacowkaIdPid, PlacowkaPas, DataRejestracji, NrEwidencyjny, DataPrzyjecia, StatusDok, IdPrzewoznik, Kierunek, Transport, TransportPid, Uwagi)
		VALUES (src.IdDok, src.WersjaXML, src.DataWyeksportowania, src.RodzajDok, src.PlacowkaId, src.PlacowkaIdPid, src.PlacowkaPas, src.DataRejestracji, src.NrEwidencyjny, src.DataPrzyjecia, src.StatusDok, src.IdPrzewoznik, src.Kierunek, src.Transport, src.TransportPid, src.Uwagi);
		SET @Merged = 1;
	END

	IF @TableName = 'PSP_Dyrektywa' BEGIN
		MERGE INTO zc.PSP_Dyrektywa AS tgt
		USING [WA_StageHurtownia].zc.PSP_Dyrektywa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NrDyrektywy=src.NrDyrektywy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.AutorProfilu=src.AutorProfilu, tgt.RodzajDyrektywy=src.RodzajDyrektywy, tgt.RodzajDyrektywyPid=src.RodzajDyrektywyPid, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Tresc=src.Tresc, tgt.IdProfilu=src.IdProfilu, tgt.KomentarzDyspozytora=src.KomentarzDyspozytora, tgt.KomentarzPoRealizacji=src.KomentarzPoRealizacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, AutorProfilu, RodzajDyrektywy, RodzajDyrektywyPid, Adresat, Status, Tresc, NrDyrektywy, IdProfilu, KomentarzDyspozytora, KomentarzPoRealizacji)
		VALUES (src.IdDok, src.AutorProfilu, src.RodzajDyrektywy, src.RodzajDyrektywyPid, src.Adresat, src.Status, src.Tresc, src.NrDyrektywy, src.IdProfilu, src.KomentarzDyspozytora, src.KomentarzPoRealizacji);
		SET @Merged = 1;
	END

	IF @TableName = 'PSP_Historia' BEGIN
		MERGE INTO zc.PSP_Historia AS tgt
		USING [WA_StageHurtownia].zc.PSP_Historia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.DataZmiany=src.DataZmiany)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdJednostki=src.IdJednostki, tgt.IdJednostkiPid=src.IdJednostkiPid, tgt.Operator=src.Operator, tgt.SymbolOperacji=src.SymbolOperacji, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, DataZmiany, IdJednostki, IdJednostkiPid, Operator, SymbolOperacji, Adnotacja, RodzAdnotacji)
		VALUES (src.IdDok, src.IdPozycji, src.DataZmiany, src.IdJednostki, src.IdJednostkiPid, src.Operator, src.SymbolOperacji, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END

	IF @TableName = 'PSP_Podmiot' BEGIN
		MERGE INTO zc.PSP_Podmiot AS tgt
		USING [WA_StageHurtownia].zc.PSP_Podmiot AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajPodmiotu=src.RodzajPodmiotu, tgt.Nazwa=src.Nazwa, tgt.Kraj=src.Kraj, tgt.KodPoczt=src.KodPoczt, tgt.Miejscowosc=src.Miejscowosc, tgt.Adres=src.Adres, tgt.NIP=src.NIP, tgt.REGON=src.REGON, tgt.PESEL=src.PESEL, tgt.NrDowodu=src.NrDowodu, tgt.BNazwa=src.BNazwa, tgt.BKonto=src.BKonto
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, RodzajPodmiotu, Nazwa, Kraj, KodPoczt, Miejscowosc, Adres, NIP, REGON, PESEL, NrDowodu, BNazwa, BKonto)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.RodzajPodmiotu, src.Nazwa, src.Kraj, src.KodPoczt, src.Miejscowosc, src.Adres, src.NIP, src.REGON, src.PESEL, src.NrDowodu, src.BNazwa, src.BKonto);
		SET @Merged = 1;
	END

	IF @TableName = 'PSP_Powiazanie' BEGIN
		MERGE INTO zc.PSP_Powiazanie AS tgt
		USING [WA_StageHurtownia].zc.PSP_Powiazanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.RodzajDok=src.RodzajDok
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, NrEwidencyjny, RodzajDok)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.NrEwidencyjny, src.RodzajDok);
		SET @Merged = 1;
	END

	IF @TableName = 'PSP_SrodekPrzewozowy' BEGIN
		MERGE INTO zc.PSP_SrodekPrzewozowy AS tgt
		USING [WA_StageHurtownia].zc.PSP_SrodekPrzewozowy AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrSrodkaPrzewoz=src.NrSrodkaPrzewoz, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, NrSrodkaPrzewoz, Kraj, KrajPid)
		VALUES (src.IdDok, src.IdPozycji, src.NrSrodkaPrzewoz, src.Kraj, src.KrajPid);
		SET @Merged = 1;
	END


	-- grupa PW --	

	IF @TableName = 'PW_Dokument' BEGIN
		MERGE INTO zc.PW_Dokument AS tgt
		USING [WA_StageHurtownia].zc.PW_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.WersjaXML=src.WersjaXML, tgt.DataWyeksportowania=src.DataWyeksportowania, tgt.RodzajDok=src.RodzajDok, tgt.UrzadWyjsciaId=src.UrzadWyjsciaId, tgt.UrzadWyjsciaIdPid=src.UrzadWyjsciaIdPid, tgt.UrzadWyjsciaPas=src.UrzadWyjsciaPas, tgt.DataRejestracji=src.DataRejestracji, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.Status=src.Status, tgt.Transport=src.Transport, tgt.TransportPid=src.TransportPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, WersjaXML, DataWyeksportowania, RodzajDok, UrzadWyjsciaId, UrzadWyjsciaIdPid, UrzadWyjsciaPas, DataRejestracji, DataPrzyjecia, NrEwidencyjny, Status, Transport, TransportPid)
		VALUES (src.IdDok, src.WersjaXML, src.DataWyeksportowania, src.RodzajDok, src.UrzadWyjsciaId, src.UrzadWyjsciaIdPid, src.UrzadWyjsciaPas, src.DataRejestracji, src.DataPrzyjecia, src.NrEwidencyjny, src.Status, src.Transport, src.TransportPid);
		SET @Merged = 1;
	END

	IF @TableName = 'PW_SrodekPrzewozowy' BEGIN
		MERGE INTO zc.PW_SrodekPrzewozowy AS tgt
		USING [WA_StageHurtownia].zc.PW_SrodekPrzewozowy AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrSrodkaPrzewoz=src.NrSrodkaPrzewoz, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, NrSrodkaPrzewoz, Kraj, KrajPid)
		VALUES (src.IdDok, src.IdPozycji, src.NrSrodkaPrzewoz, src.Kraj, src.KrajPid);
		SET @Merged = 1;
	END

	IF @TableName = 'PW_Kontener' BEGIN
		MERGE INTO zc.PW_Kontener AS tgt
		USING [WA_StageHurtownia].zc.PW_Kontener AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, NrKontenera)
		VALUES (src.IdDok, src.IdPozycji, src.NrKontenera);
		SET @Merged = 1;
	END

	IF @TableName = 'PW_Powiazanie' BEGIN
		MERGE INTO zc.PW_Powiazanie AS tgt
		USING [WA_StageHurtownia].zc.PW_Powiazanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.RodzajDok=src.RodzajDok
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, NrEwidencyjny, RodzajDok)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.NrEwidencyjny, src.RodzajDok);
		SET @Merged = 1;
	END

	IF @TableName = 'PW_Historia' BEGIN
		MERGE INTO zc.PW_Historia AS tgt
		USING [WA_StageHurtownia].zc.PW_Historia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.DataZmiany=src.DataZmiany)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdJednostki=src.IdJednostki, tgt.IdJednostkiPid=src.IdJednostkiPid, tgt.Operator=src.Operator, tgt.SymbolOperacji=src.SymbolOperacji, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, DataZmiany, IdJednostki, IdJednostkiPid, Operator, SymbolOperacji, Adnotacja, RodzAdnotacji)
		VALUES (src.IdDok, src.IdPozycji, src.DataZmiany, src.IdJednostki, src.IdJednostkiPid, src.Operator, src.SymbolOperacji, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END


	-- grupa SADG --	

	IF @TableName = 'SADG_Dokument' BEGIN
		MERGE INTO zc.SADG_Dokument AS tgt
		USING [WA_StageHurtownia].zc.SADG_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.WersjaXML=src.WersjaXML, tgt.DataWyeksportowania=src.DataWyeksportowania, tgt.RodzajDok=src.RodzajDok, tgt.JednWyjsciaId=src.JednWyjsciaId, tgt.JednWyjsciaIdPid=src.JednWyjsciaIdPid, tgt.JednWyjsciaPas=src.JednWyjsciaPas, tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.DataRejestracji=src.DataRejestracji, tgt.Status=src.Status, tgt.NrEwidencjiWywoz=src.NrEwidencjiWywoz, tgt.PotwierdzenieWywoz=src.PotwierdzenieWywoz, tgt.EtapBilansowania=src.EtapBilansowania, tgt.KodProcedury=src.KodProcedury, tgt.Uwagi=src.Uwagi
		WHEN NOT MATCHED
		THEN INSERT (IdDok, WersjaXML, DataWyeksportowania, RodzajDok, JednWyjsciaId, JednWyjsciaIdPid, JednWyjsciaPas, NrEwidencyjny, DataPrzyjecia, DataRejestracji, Status, NrEwidencjiWywoz, PotwierdzenieWywoz, EtapBilansowania, KodProcedury, Uwagi)
		VALUES (src.IdDok, src.WersjaXML, src.DataWyeksportowania, src.RodzajDok, src.JednWyjsciaId, src.JednWyjsciaIdPid, src.JednWyjsciaPas, src.NrEwidencyjny, src.DataPrzyjecia, src.DataRejestracji, src.Status, src.NrEwidencjiWywoz, src.PotwierdzenieWywoz, src.EtapBilansowania, src.KodProcedury, src.Uwagi);
		SET @Merged = 1;
	END


	IF @TableName = 'SADG_Dyrektywa' BEGIN
		MERGE INTO zc.SADG_Dyrektywa AS tgt
		USING [WA_StageHurtownia].zc.SADG_Dyrektywa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NrDyrektywy=src.NrDyrektywy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.AutorProfilu=src.AutorProfilu, tgt.RodzajDyrektywy=src.RodzajDyrektywy, tgt.RodzajDyrektywyPid=src.RodzajDyrektywyPid, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Tresc=src.Tresc, tgt.IdProfilu=src.IdProfilu, tgt.KomentarzDyspozytora=src.KomentarzDyspozytora, tgt.KomentarzPoRealizacji=src.KomentarzPoRealizacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, AutorProfilu, RodzajDyrektywy, RodzajDyrektywyPid, Adresat, Status, Tresc, NrDyrektywy, IdProfilu, KomentarzDyspozytora, KomentarzPoRealizacji)
		VALUES (src.IdDok, src.AutorProfilu, src.RodzajDyrektywy, src.RodzajDyrektywyPid, src.Adresat, src.Status, src.Tresc, src.NrDyrektywy, src.IdProfilu, src.KomentarzDyspozytora, src.KomentarzPoRealizacji);
		SET @Merged = 1;
	END

	IF @TableName = 'SADG_Historia' BEGIN
		MERGE INTO zc.SADG_Historia AS tgt
		USING [WA_StageHurtownia].zc.SADG_Historia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.DataZmiany=src.DataZmiany)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdJednostki=src.IdJednostki, tgt.IdJednostkiPid=src.IdJednostkiPid, tgt.Operator=src.Operator, tgt.SymbolOperacji=src.SymbolOperacji, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, DataZmiany, IdJednostki, IdJednostkiPid, Operator, SymbolOperacji, Adnotacja, RodzAdnotacji)
		VALUES (src.IdDok, src.IdPozycji, src.DataZmiany, src.IdJednostki, src.IdJednostkiPid, src.Operator, src.SymbolOperacji, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END

	IF @TableName = 'SADG_SrodekPrzewozowy' BEGIN
		MERGE INTO zc.SADG_SrodekPrzewozowy AS tgt
		USING [WA_StageHurtownia].zc.SADG_SrodekPrzewozowy AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrSrodkaPrzewoz=src.NrSrodkaPrzewoz, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, NrSrodkaPrzewoz, Kraj, KrajPid)
		VALUES (src.IdDok, src.IdPozycji, src.NrSrodkaPrzewoz, src.Kraj, src.KrajPid);
		SET @Merged = 1;
	END

	IF @TableName = 'SADG_Kontener' BEGIN
		MERGE INTO zc.SADG_Kontener AS tgt
		USING [WA_StageHurtownia].zc.SADG_Kontener AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, NrKontenera)
		VALUES (src.IdDok, src.IdPozycji, src.NrKontenera);
		SET @Merged = 1;
	END

	IF @TableName = 'SADG_Powiazanie' BEGIN
		MERGE INTO zc.SADG_Powiazanie AS tgt
		USING [WA_StageHurtownia].zc.SADG_Powiazanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.RodzajDok=src.RodzajDok
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, NrEwidencyjny, RodzajDok)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.NrEwidencyjny, src.RodzajDok);
		SET @Merged = 1;
	END

	IF @TableName = 'SADG_Towar' BEGIN
		MERGE INTO zc.SADG_Towar AS tgt
		USING [WA_StageHurtownia].zc.SADG_Towar AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OpisTowaru=src.OpisTowaru, tgt.MasaBrutto=src.MasaBrutto, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.OpisOpakowan=src.OpisOpakowan
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, OpisTowaru, MasaBrutto, LiczbaOpakowan, OpisOpakowan)
		VALUES (src.IdDok, src.IdPozycji, src.OpisTowaru, src.MasaBrutto, src.LiczbaOpakowan, src.OpisOpakowan);
		SET @Merged = 1;
	END


	-- grupa ST --	

	IF @TableName = 'ST_Dokument' BEGIN
		MERGE INTO zc.ST_Dokument AS tgt
		USING [WA_StageHurtownia].zc.ST_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.WersjaXML=src.WersjaXML, tgt.DataWyeksportowania=src.DataWyeksportowania, tgt.RodzajDok=src.RodzajDok, tgt.UrzadWyjsciaId=src.UrzadWyjsciaId, tgt.UrzadWyjsciaIdPid=src.UrzadWyjsciaIdPid, tgt.UrzadWyjsciaPas=src.UrzadWyjsciaPas, tgt.DataRejestracji=src.DataRejestracji, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.ZglaszajacyWejscie=src.ZglaszajacyWejscie, tgt.ZglaszajacyWyjscie=src.ZglaszajacyWyjscie, tgt.NazwaJednostki=src.NazwaJednostki, tgt.Transport=src.Transport, tgt.TransportPid=src.TransportPid, tgt.NrRejLloyda=src.NrRejLloyda, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid, tgt.Bandera=src.Bandera, tgt.BanderaPid=src.BanderaPid, tgt.Wypornosc=src.Wypornosc, tgt.EtapObslugiPort=src.EtapObslugiPort, tgt.Status=src.Status, tgt.DataZamknEwidencji=src.DataZamknEwidencji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, WersjaXML, DataWyeksportowania, RodzajDok, UrzadWyjsciaId, UrzadWyjsciaIdPid, UrzadWyjsciaPas, DataRejestracji, DataPrzyjecia, NrEwidencyjny, ZglaszajacyWejscie, ZglaszajacyWyjscie, NazwaJednostki, Transport, TransportPid, NrRejLloyda, Kraj, KrajPid, Bandera, BanderaPid, Wypornosc, EtapObslugiPort, Status, DataZamknEwidencji)
		VALUES (src.IdDok, src.WersjaXML, src.DataWyeksportowania, src.RodzajDok, src.UrzadWyjsciaId, src.UrzadWyjsciaIdPid, src.UrzadWyjsciaPas, src.DataRejestracji, src.DataPrzyjecia, src.NrEwidencyjny, src.ZglaszajacyWejscie, src.ZglaszajacyWyjscie, src.NazwaJednostki, src.Transport, src.TransportPid, src.NrRejLloyda, src.Kraj, src.KrajPid, src.Bandera, src.BanderaPid, src.Wypornosc, src.EtapObslugiPort, src.Status, src.DataZamknEwidencji);
		SET @Merged = 1;
	END

	IF @TableName = 'ST_DanePrzywozuWywozu' BEGIN
		MERGE INTO zc.ST_DanePrzywozuWywozu AS tgt
		USING [WA_StageHurtownia].zc.ST_DanePrzywozuWywozu AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Port=src.Port, tgt.LiczbaPasazerow=src.LiczbaPasazerow, tgt.LiczbaZalogi=src.LiczbaZalogi, tgt.LiczbaPozTowarowych=src.LiczbaPozTowarowych, tgt.CzyKontenery=src.CzyKontenery, tgt.CzyKonteneryPuste=src.CzyKonteneryPuste, tgt.CzyTowarTranzyt=src.CzyTowarTranzyt, tgt.OpisTowaru=src.OpisTowaru
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, Port, LiczbaPasazerow, LiczbaZalogi, LiczbaPozTowarowych, CzyKontenery, CzyKonteneryPuste, CzyTowarTranzyt, OpisTowaru)
		VALUES (src.IdDok, src.Typ, src.Port, src.LiczbaPasazerow, src.LiczbaZalogi, src.LiczbaPozTowarowych, src.CzyKontenery, src.CzyKonteneryPuste, src.CzyTowarTranzyt, src.OpisTowaru);
		SET @Merged = 1;
	END

	IF @TableName = 'ST_Dyrektywa' BEGIN
		MERGE INTO zc.ST_Dyrektywa AS tgt
		USING [WA_StageHurtownia].zc.ST_Dyrektywa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.NrDyrektywy=src.NrDyrektywy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.AutorProfilu=src.AutorProfilu, tgt.RodzajDyrektywy=src.RodzajDyrektywy, tgt.RodzajDyrektywyPid=src.RodzajDyrektywyPid, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Tresc=src.Tresc, tgt.IdProfilu=src.IdProfilu, tgt.KomentarzDyspozytora=src.KomentarzDyspozytora, tgt.KomentarzPoRealizacji=src.KomentarzPoRealizacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, AutorProfilu, RodzajDyrektywy, RodzajDyrektywyPid, Adresat, Status, Tresc, NrDyrektywy, IdProfilu, KomentarzDyspozytora, KomentarzPoRealizacji)
		VALUES (src.IdDok, src.AutorProfilu, src.RodzajDyrektywy, src.RodzajDyrektywyPid, src.Adresat, src.Status, src.Tresc, src.NrDyrektywy, src.IdProfilu, src.KomentarzDyspozytora, src.KomentarzPoRealizacji);
		SET @Merged = 1;
	END

	IF @TableName = 'ST_Historia' BEGIN
		MERGE INTO zc.ST_Historia AS tgt
		USING [WA_StageHurtownia].zc.ST_Historia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.DataZmiany=src.DataZmiany)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdJednostki=src.IdJednostki, tgt.IdJednostkiPid=src.IdJednostkiPid, tgt.Operator=src.Operator, tgt.SymbolOperacji=src.SymbolOperacji, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, DataZmiany, IdJednostki, IdJednostkiPid, Operator, SymbolOperacji, Adnotacja, RodzAdnotacji)
		VALUES (src.IdDok, src.IdPozycji, src.DataZmiany, src.IdJednostki, src.IdJednostkiPid, src.Operator, src.SymbolOperacji, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END

	IF @TableName = 'ST_Podmiot' BEGIN
		MERGE INTO zc.ST_Podmiot AS tgt
		USING [WA_StageHurtownia].zc.ST_Podmiot AS src
		ON (tgt.IdDok=src.IdDok AND  tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajPodmiotu=src.RodzajPodmiotu, tgt.Nazwa=src.Nazwa, tgt.Kraj=src.Kraj, tgt.KodPoczt=src.KodPoczt, tgt.Miejscowosc=src.Miejscowosc, tgt.Adres=src.Adres, tgt.NIP=src.NIP, tgt.REGON=src.REGON, tgt.PESEL=src.PESEL, tgt.NrDowodu=src.NrDowodu, tgt.BNazwa=src.BNazwa, tgt.BKonto=src.BKonto
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, RodzajPodmiotu, Nazwa, Kraj, KodPoczt, Miejscowosc, Adres, NIP, REGON, PESEL, NrDowodu, BNazwa, BKonto)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.RodzajPodmiotu, src.Nazwa, src.Kraj, src.KodPoczt, src.Miejscowosc, src.Adres, src.NIP, src.REGON, src.PESEL, src.NrDowodu, src.BNazwa, src.BKonto);
		SET @Merged = 1;
	END

	IF @TableName = 'ST_Powiazanie' BEGIN
		MERGE INTO zc.ST_Powiazanie AS tgt
		USING [WA_StageHurtownia].zc.ST_Powiazanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.RodzajDok=src.RodzajDok
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, NrEwidencyjny, RodzajDok)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.NrEwidencyjny, src.RodzajDok);
		SET @Merged = 1;
	END


	-- grupa DPDZ--	

	IF @TableName = 'DPDZ_Skladajacy' BEGIN
		MERGE INTO zc.DPDZ_Skladajacy AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_Skladajacy AS src
		ON (tgt.idSkladajacy=src.idSkladajacy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwiskoImie=src.NazwiskoImie, tgt.Identyfikator=src.Identyfikator, tgt.Stanowisko=src.Stanowisko, tgt.Telefon=src.Telefon, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (idSkladajacy, NazwiskoImie, Identyfikator, Stanowisko, Telefon, QuasiId)
		VALUES (src.idSkladajacy, src.NazwiskoImie, src.Identyfikator, src.Stanowisko, src.Telefon, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_Kontrahent' BEGIN
		MERGE INTO zc.DPDZ_Kontrahent AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_Kontrahent AS src
		ON (tgt.idKontrahenta=src.idKontrahenta)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid, tgt.TIN=src.TIN, tgt.REGON=src.REGON, tgt.PESEL=src.PESEL, tgt.CRP=src.CRP, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (idKontrahenta, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, KrajPid, TIN, REGON, PESEL, CRP, QuasiId)
		VALUES (src.idKontrahenta, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.KrajPid, src.TIN, src.REGON, src.PESEL, src.CRP, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_Dokument' BEGIN
		MERGE INTO zc.DPDZ_Dokument AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDok=src.RodzajDok, tgt.Identyfikator=src.Identyfikator, tgt.WersjaXML=src.WersjaXML, tgt.DataPrzeslania=src.DataPrzeslania, tgt.UrzadRejestracji=src.UrzadRejestracji, tgt.UrzadRejestracjiPid=src.UrzadRejestracjiPid, tgt.PasRejestracji=src.PasRejestracji, tgt.Status=src.Status, tgt.DataZlozeniaPac=src.DataZlozeniaPac, tgt.Placowka=src.Placowka, tgt.PlacowkaPid=src.PlacowkaPid, tgt.NrCelina=src.NrCelina, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.Zefir=src.Zefir, tgt.ZwolnienieTowaru=src.ZwolnienieTowaru, tgt.Wykaz=src.Wykaz, tgt.PotwierdzenieWywozu=src.PotwierdzenieWywozu, tgt.PozycjaWykazu=src.PozycjaWykazu, tgt.NrCelina2=src.NrCelina2, tgt.TypDok=src.TypDok, tgt.RejestrDluguCelnego=src.RejestrDluguCelnego, tgt.LiczbaPozycji=src.LiczbaPozycji, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajWysylkiPid=src.KrajWysylkiPid, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.KrajPrzeznaczeniaPid=src.KrajPrzeznaczeniaPid, tgt.LokalizacjaMiejsce=src.LokalizacjaMiejsce, tgt.LokalizacjaUC=src.LokalizacjaUC, tgt.LokalizacjaUCPid=src.LokalizacjaUCPid, tgt.LokalizacjaOpis=src.LokalizacjaOpis, tgt.Waluta=src.Waluta, tgt.WalutaPid=src.WalutaPid, tgt.Wartosc=src.Wartosc, tgt.KursWaluty=src.KursWaluty, tgt.Miejsce=src.Miejsce, tgt.Data=src.Data, tgt.IdSkladajacy=src.IdSkladajacy, tgt.IdZglaszajacy=src.IdZglaszajacy
		WHEN NOT MATCHED
		THEN INSERT (IdDok, RodzajDok, Identyfikator, WersjaXML, DataPrzeslania, UrzadRejestracji, UrzadRejestracjiPid, PasRejestracji, Status, DataZlozeniaPac, Placowka, PlacowkaPid, NrCelina, DataPrzyjecia, Zefir, ZwolnienieTowaru, Wykaz, PotwierdzenieWywozu, PozycjaWykazu, NrCelina2, TypDok, RejestrDluguCelnego, LiczbaPozycji, LiczbaOpakowan, MasaBrutto, KrajWysylki, KrajWysylkiPid, KrajPrzeznaczenia, KrajPrzeznaczeniaPid, LokalizacjaMiejsce, LokalizacjaUC, LokalizacjaUCPid, LokalizacjaOpis, Waluta, WalutaPid, Wartosc, KursWaluty, Miejsce, Data, IdSkladajacy, IdZglaszajacy)
		VALUES (src.IdDok, src.RodzajDok, src.Identyfikator, src.WersjaXML, src.DataPrzeslania, src.UrzadRejestracji, src.UrzadRejestracjiPid, src.PasRejestracji, src.Status, src.DataZlozeniaPac, src.Placowka, src.PlacowkaPid, src.NrCelina, src.DataPrzyjecia, src.Zefir, src.ZwolnienieTowaru, src.Wykaz, src.PotwierdzenieWywozu, src.PozycjaWykazu, src.NrCelina2, src.TypDok, src.RejestrDluguCelnego, src.LiczbaPozycji, src.LiczbaOpakowan, src.MasaBrutto, src.KrajWysylki, src.KrajWysylkiPid, src.KrajPrzeznaczenia, src.KrajPrzeznaczeniaPid, src.LokalizacjaMiejsce, src.LokalizacjaUC, src.LokalizacjaUCPid, src.LokalizacjaOpis, src.Waluta, src.WalutaPid, src.Wartosc, src.KursWaluty, src.Miejsce, src.Data, src.IdSkladajacy, src.IdZglaszajacy);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_Towar' BEGIN
		MERGE INTO zc.DPDZ_Towar AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_Towar AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.OpisTowaru=src.OpisTowaru, tgt.KodTowarowy=src.KodTowarowy, tgt.KodTowarowyPid=src.KodTowarowyPid, tgt.KodTaric=src.KodTaric, tgt.KrajPochodzenia=src.KrajPochodzenia, tgt.KrajPochodzeniaPid=src.KrajPochodzeniaPid, tgt.Preferencje=src.Preferencje, tgt.MasaNetto=src.MasaNetto, tgt.IloscUzupelniajacaJm=src.IloscUzupelniajacaJm, tgt.CzyTowarStrategiczny=src.CzyTowarStrategiczny, tgt.WartoscPozycji=src.WartoscPozycji, tgt.MetodaWartosciowania=src.MetodaWartosciowania, tgt.MetodaWartosciowaniaPid=src.MetodaWartosciowaniaPid, tgt.WartoscStatystyczna=src.WartoscStatystyczna
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, OpisTowaru, KodTowarowy, KodTowarowyPid, KodTaric, KrajPochodzenia, KrajPochodzeniaPid, Preferencje, MasaNetto, IloscUzupelniajacaJm, CzyTowarStrategiczny, WartoscPozycji, MetodaWartosciowania, MetodaWartosciowaniaPid, WartoscStatystyczna)
		VALUES (src.IdDok, src.IdPozycji, src.OpisTowaru, src.KodTowarowy, src.KodTowarowyPid, src.KodTaric, src.KrajPochodzenia, src.KrajPochodzeniaPid, src.Preferencje, src.MasaNetto, src.IloscUzupelniajacaJm, src.CzyTowarStrategiczny, src.WartoscPozycji, src.MetodaWartosciowania, src.MetodaWartosciowaniaPid, src.WartoscStatystyczna);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_DokumentWymagany' BEGIN
		MERGE INTO zc.DPDZ_DokumentWymagany AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_DokumentWymagany AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiDokWymagany=src.IdPozycjiDokWymagany)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokWym=src.KodDokWym, tgt.KodDokWymPid=src.KodDokWymPid, tgt.NrDokWym=src.NrDokWym
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiDokWymagany, KodDokWym, KodDokWymPid, NrDokWym)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiDokWymagany, src.KodDokWym, src.KodDokWymPid, src.NrDokWym);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_Dyrektywa' BEGIN
		MERGE INTO zc.DPDZ_Dyrektywa AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_Dyrektywa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdProfilu=src.IdProfilu, tgt.Autor=src.Autor, tgt.RodzajDyrektywy=src.RodzajDyrektywy, tgt.RodzajDyrektywyPid=src.RodzajDyrektywyPid, tgt.Parametr=src.Parametr, tgt.Tresc=src.Tresc, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Komentarz=src.Komentarz, tgt.KomentarzDyspozytora=src.KomentarzDyspozytora
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdProfilu, Autor, RodzajDyrektywy, RodzajDyrektywyPid, Parametr, Tresc, Adresat, Status, Komentarz, KomentarzDyspozytora)
		VALUES (src.IdDok, src.IdPozycji, src.IdProfilu, src.Autor, src.RodzajDyrektywy, src.RodzajDyrektywyPid, src.Parametr, src.Tresc, src.Adresat, src.Status, src.Komentarz, src.KomentarzDyspozytora);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_Historia' BEGIN
		MERGE INTO zc.DPDZ_Historia AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_Historia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DataZmiany=src.DataZmiany, tgt.UC=src.UC, tgt.UCPid=src.UCPid, tgt.Operator=src.Operator, tgt.Akcja=src.Akcja, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, DataZmiany, UC, UCPid, Operator, Akcja, Adnotacja, RodzAdnotacji)
		VALUES (src.IdDok, src.IdPozycji, src.DataZmiany, src.UC, src.UCPid, src.Operator, src.Akcja, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_IloscTowaru' BEGIN
		MERGE INTO zc.DPDZ_IloscTowaru AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_IloscTowaru AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiIloscTowaru=src.IdPozycjiIloscTowaru)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Jm=src.Jm, tgt.JmPid=src.JmPid, tgt.KwalifikatorJm=src.KwalifikatorJm, tgt.KwalifikatorJmPid=src.KwalifikatorJmPid, tgt.Ilosc=src.Ilosc
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiIloscTowaru, Jm, JmPid, KwalifikatorJm, KwalifikatorJmPid, Ilosc)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiIloscTowaru, src.Jm, src.JmPid, src.KwalifikatorJm, src.KwalifikatorJmPid, src.Ilosc);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_InformacjaDodatkowa' BEGIN
		MERGE INTO zc.DPDZ_InformacjaDodatkowa AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_InformacjaDodatkowa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiInfDod=src.IdPozycjiInfDod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodInfDod=src.KodInfDod, tgt.KodInfDodPid=src.KodInfDodPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiInfDod, KodInfDod, KodInfDodPid)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiInfDod, src.KodInfDod, src.KodInfDodPid);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_KodDodatkowyPL' BEGIN
		MERGE INTO zc.DPDZ_KodDodatkowyPL AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_KodDodatkowyPL AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiKodDodPL=src.IdPozycjiKodDodPL)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodPL=src.KodPL, tgt.KodPLPid=src.KodPLPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiKodDodPL, KodPL, KodPLPid)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiKodDodPL, src.KodPL, src.KodPLPid);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_KodDodatkowyUE' BEGIN
		MERGE INTO zc.DPDZ_KodDodatkowyUE AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_KodDodatkowyUE AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiKodDodUE=src.IdPozycjiKodDodUE)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodUE=src.KodUE, tgt.KodUEPid=src.KodUEPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiKodDodUE, KodUE, KodUEPid)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiKodDodUE, src.KodUE, src.KodUEPid);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_OplataDoPozycji' BEGIN
		MERGE INTO zc.DPDZ_OplataDoPozycji AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_OplataDoPozycji AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiOplata=src.IdPozycjiOplata)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Typ=src.Typ, tgt.TypPid=src.TypPid, tgt.Podstawa=src.Podstawa, tgt.Stawka=src.Stawka, tgt.Kwota=src.Kwota, tgt.MetodaPlatnosci=src.MetodaPlatnosci, tgt.MetodaPlatnosciPid=src.MetodaPlatnosciPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiOplata, Typ, TypPid, Podstawa, Stawka, Kwota, MetodaPlatnosci, MetodaPlatnosciPid)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiOplata, src.Typ, src.TypPid, src.Podstawa, src.Stawka, src.Kwota, src.MetodaPlatnosci, src.MetodaPlatnosciPid);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_Powiazanie' BEGIN
		MERGE INTO zc.DPDZ_Powiazanie AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_Powiazanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDok=src.RodzajDok, tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, RodzajDok, NrEwidencyjny, LiczbaOpakowan, MasaBrutto)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.RodzajDok, src.NrEwidencyjny, src.LiczbaOpakowan, src.MasaBrutto);
		SET @Merged = 1;
	END

	IF @TableName = 'DPDZ_Srodek' BEGIN
		MERGE INTO zc.DPDZ_Srodek AS tgt
		USING [WA_StageHurtownia].zc.DPDZ_Srodek AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiSrodek=src.IdPozycjiSrodek)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdSrodka=src.IdSrodka, tgt.Seria=src.Seria, tgt.Typ=src.Typ, tgt.GEO=src.GEO, tgt.GEOPid=src.GEOPid, tgt.NrPorzadkowy=src.NrPorzadkowy, tgt.KodUjm=src.KodUjm, tgt.KodUjmPid=src.KodUjmPid, tgt.KwalifikatorUjm=src.KwalifikatorUjm, tgt.KwalifikatorUjmPid=src.KwalifikatorUjmPid, tgt.ZdefiniowanaJm=src.ZdefiniowanaJm, tgt.RaportowanaIlosc=src.RaportowanaIlosc
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiSrodek, IdSrodka, Seria, Typ, GEO, GEOPid, NrPorzadkowy, KodUjm, KodUjmPid, KwalifikatorUjm, KwalifikatorUjmPid, ZdefiniowanaJm, RaportowanaIlosc)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiSrodek, src.IdSrodka, src.Seria, src.Typ, src.GEO, src.GEOPid, src.NrPorzadkowy, src.KodUjm, src.KodUjmPid, src.KwalifikatorUjm, src.KwalifikatorUjmPid, src.ZdefiniowanaJm, src.RaportowanaIlosc);
		SET @Merged = 1;
	END


	-- grupa DS --	

	IF @TableName = 'DS_Kontrahent' BEGIN
		MERGE INTO zc.DS_Kontrahent AS tgt
		USING [WA_StageHurtownia].zc.DS_Kontrahent AS src
		ON (tgt.idKontrahenta=src.idKontrahenta)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid, tgt.TIN=src.TIN, tgt.REGON=src.REGON, tgt.PESEL=src.PESEL, tgt.CRP=src.CRP, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (idKontrahenta, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, KrajPid, TIN, REGON, PESEL, CRP, QuasiId)
		VALUES (src.idKontrahenta, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.KrajPid, src.TIN, src.REGON, src.PESEL, src.CRP, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_Skladajacy' BEGIN
		MERGE INTO zc.DS_Skladajacy AS tgt
		USING [WA_StageHurtownia].zc.DS_Skladajacy AS src
		ON (tgt.idSkladajacy=src.idSkladajacy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwiskoImie=src.NazwiskoImie, tgt.Identyfikator=src.Identyfikator, tgt.Stanowisko=src.Stanowisko, tgt.Telefon=src.Telefon, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (idSkladajacy, NazwiskoImie, Identyfikator, Stanowisko, Telefon, QuasiId)
		VALUES (src.idSkladajacy, src.NazwiskoImie, src.Identyfikator, src.Stanowisko, src.Telefon, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_Dokument' BEGIN
		MERGE INTO zc.DS_Dokument AS tgt
		USING [WA_StageHurtownia].zc.DS_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Identyfikator=src.Identyfikator, tgt.RodzajDok=src.RodzajDok, tgt.WersjaXML=src.WersjaXML, tgt.DataPrzeslania=src.DataPrzeslania, tgt.UrzadRejestracji=src.UrzadRejestracji, tgt.UrzadRejestracjiPid=src.UrzadRejestracjiPid, tgt.PasRejestracji=src.PasRejestracji, tgt.Status=src.Status, tgt.Placowka=src.Placowka, tgt.PlacowkaPid=src.PlacowkaPid, tgt.NrCelina=src.NrCelina, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.NrWlasny=src.NrWlasny, tgt.LokalizacjaMiejsce=src.LokalizacjaMiejsce, tgt.LokalizacjaUC=src.LokalizacjaUC, tgt.LokalizacjaUCPid=src.LokalizacjaUCPid, tgt.LokalizacjaOpis=src.LokalizacjaOpis, tgt.TowarDataPrzedst=src.TowarDataPrzedst, tgt.TerminNaPrzeznaczenie=src.TerminNaPrzeznaczenie, tgt.PotwierdzenieWywozu=src.PotwierdzenieWywozu, tgt.NrCelina2=src.NrCelina2, tgt.SkladajacyMiejsce=src.SkladajacyMiejsce, tgt.SkladajacyData=src.SkladajacyData, tgt.SprostowanieNrCelina=src.SprostowanieNrCelina, tgt.SprostowanieNr=src.SprostowanieNr, tgt.SprostowanieData=src.SprostowanieData, tgt.IdPrzedstawiajacy=src.IdPrzedstawiajacy, tgt.IdSkladajacy=src.IdSkladajacy
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Identyfikator, RodzajDok, WersjaXML, DataPrzeslania, UrzadRejestracji, UrzadRejestracjiPid, PasRejestracji, Status, Placowka, PlacowkaPid, NrCelina, DataPrzyjecia, NrWlasny, LokalizacjaMiejsce, LokalizacjaUC, LokalizacjaUCPid, LokalizacjaOpis, TowarDataPrzedst, TerminNaPrzeznaczenie, PotwierdzenieWywozu, NrCelina2, SkladajacyMiejsce, SkladajacyData, SprostowanieNrCelina, SprostowanieNr, SprostowanieData, IdPrzedstawiajacy, IdSkladajacy)
		VALUES (src.IdDok, src.Identyfikator, src.RodzajDok, src.WersjaXML, src.DataPrzeslania, src.UrzadRejestracji, src.UrzadRejestracjiPid, src.PasRejestracji, src.Status, src.Placowka, src.PlacowkaPid, src.NrCelina, src.DataPrzyjecia, src.NrWlasny, src.LokalizacjaMiejsce, src.LokalizacjaUC, src.LokalizacjaUCPid, src.LokalizacjaOpis, src.TowarDataPrzedst, src.TerminNaPrzeznaczenie, src.PotwierdzenieWywozu, src.NrCelina2, src.SkladajacyMiejsce, src.SkladajacyData, src.SprostowanieNrCelina, src.SprostowanieNr, src.SprostowanieData, src.IdPrzedstawiajacy, src.IdSkladajacy);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_DokumentPoprzedni' BEGIN
		MERGE INTO zc.DS_DokumentPoprzedni AS tgt
		USING [WA_StageHurtownia].zc.DS_DokumentPoprzedni AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokPoprz=src.KodDokPoprz, tgt.KodDokPoprzPid=src.KodDokPoprzPid, tgt.NrDokPoprz=src.NrDokPoprz, tgt.NrCelina=src.NrCelina
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, KodDokPoprz, KodDokPoprzPid, NrDokPoprz, NrCelina)
		VALUES (src.IdDok, src.IdPozycji, src.KodDokPoprz, src.KodDokPoprzPid, src.NrDokPoprz, src.NrCelina);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_Dyrektywa' BEGIN
		MERGE INTO zc.DS_Dyrektywa AS tgt
		USING [WA_StageHurtownia].zc.DS_Dyrektywa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Autor=src.Autor, tgt.RodzajDyrektywy=src.RodzajDyrektywy, tgt.RodzajDyrektywyPid=src.RodzajDyrektywyPid, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Tresc=src.Tresc, tgt.KomentarzDyspozytora=src.KomentarzDyspozytora, tgt.Komentarz=src.Komentarz, tgt.IdProfilu=src.IdProfilu, tgt.Parametr=src.Parametr
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, Autor, RodzajDyrektywy, RodzajDyrektywyPid, Adresat, Status, Tresc, KomentarzDyspozytora, Komentarz, IdProfilu, Parametr)
		VALUES (src.IdDok, src.IdPozycji, src.Autor, src.RodzajDyrektywy, src.RodzajDyrektywyPid, src.Adresat, src.Status, src.Tresc, src.KomentarzDyspozytora, src.Komentarz, src.IdProfilu, src.Parametr);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_Historia' BEGIN
		MERGE INTO zc.DS_Historia AS tgt
		USING [WA_StageHurtownia].zc.DS_Historia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DataOperacji=src.DataOperacji, tgt.UC=src.UC, tgt.UCPid=src.UCPid, tgt.Operator=src.Operator, tgt.Operacja=src.Operacja, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, DataOperacji, UC, UCPid, Operator, Operacja, Adnotacja, RodzAdnotacji)
		VALUES (src.IdDok, src.IdPozycji, src.DataOperacji, src.UC, src.UCPid, src.Operator, src.Operacja, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_Kontener' BEGIN
		MERGE INTO zc.DS_Kontener AS tgt
		USING [WA_StageHurtownia].zc.DS_Kontener AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, NrKontenera)
		VALUES (src.IdDok, src.IdPozycji, src.NrKontenera);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_KontenerZamkniecie' BEGIN
		MERGE INTO zc.DS_KontenerZamkniecie AS tgt
		USING [WA_StageHurtownia].zc.DS_KontenerZamkniecie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiZamkniecie=src.IdPozycjiZamkniecie)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Ilosc=src.Ilosc, tgt.NrZamknieciaCelnKont=src.NrZamknieciaCelnKont
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiZamkniecie, Ilosc, NrZamknieciaCelnKont)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiZamkniecie, src.Ilosc, src.NrZamknieciaCelnKont);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_Powiazanie' BEGIN
		MERGE INTO zc.DS_Powiazanie AS tgt
		USING [WA_StageHurtownia].zc.DS_Powiazanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.MasaBrutto=src.MasaBrutto, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.RodzajDok=src.RodzajDok, tgt.NrEwiden=src.NrEwiden
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, MasaBrutto, LiczbaOpakowan, RodzajDok, NrEwiden)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.MasaBrutto, src.LiczbaOpakowan, src.RodzajDok, src.NrEwiden);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_SrodekPrzewozowy' BEGIN
		MERGE INTO zc.DS_SrodekPrzewozowy AS tgt
		USING [WA_StageHurtownia].zc.DS_SrodekPrzewozowy AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajTransp=src.RodzajTransp, tgt.RodzajTranspPid=src.RodzajTranspPid, tgt.ZnakiSrodkaPrzewoz=src.ZnakiSrodkaPrzewoz, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, RodzajTransp, RodzajTranspPid, ZnakiSrodkaPrzewoz, Kraj, KrajPid)
		VALUES (src.IdDok, src.IdPozycji, src.RodzajTransp, src.RodzajTranspPid, src.ZnakiSrodkaPrzewoz, src.Kraj, src.KrajPid);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_Towar' BEGIN
		MERGE INTO zc.DS_Towar AS tgt
		USING WA_StageHurtownia.zc.DS_Towar AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto, tgt.OpisTowaru=src.OpisTowaru
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, LiczbaOpakowan, MasaBrutto, OpisTowaru)
		VALUES (src.IdDok, src.IdPozycji, src.LiczbaOpakowan, src.MasaBrutto, src.OpisTowaru);
		SET @Merged = 1;
	END

	IF @TableName = 'DS_TransportZamkniecie' BEGIN
		MERGE INTO zc.DS_TransportZamkniecie AS tgt
		USING [WA_StageHurtownia].zc.DS_TransportZamkniecie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiZamkniecie=src.IdPozycjiZamkniecie)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Ilosc=src.Ilosc, tgt.NrZamknieciaCeln=src.NrZamknieciaCeln
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiZamkniecie, Ilosc, NrZamknieciaCeln)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiZamkniecie, src.Ilosc, src.NrZamknieciaCeln);
		SET @Merged = 1;
	END



	-- grupa PWD --	

	IF @TableName = 'PWD_Skladajacy' BEGIN
		MERGE INTO zc.PWD_Skladajacy AS tgt
		USING [WA_StageHurtownia].zc.PWD_Skladajacy AS src
		ON (tgt.idSkladajacy=src.idSkladajacy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwiskoImie=src.NazwiskoImie, tgt.Identyfikator=src.Identyfikator, tgt.Stanowisko=src.Stanowisko, tgt.Telefon=src.Telefon, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (idSkladajacy, NazwiskoImie, Identyfikator, Stanowisko, Telefon, QuasiId)
		VALUES (src.idSkladajacy, src.NazwiskoImie, src.Identyfikator, src.Stanowisko, src.Telefon, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_Kontrahent' BEGIN
		MERGE INTO zc.PWD_Kontrahent AS tgt
		USING [WA_StageHurtownia].zc.PWD_Kontrahent AS src
		ON (tgt.idKontrahenta=src.idKontrahenta)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid, tgt.TIN=src.TIN, tgt.REGON=src.REGON, tgt.PESEL=src.PESEL, tgt.CRP=src.CRP, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (idKontrahenta, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, KrajPid, TIN, REGON, PESEL, CRP, QuasiId)
		VALUES (src.idKontrahenta, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.KrajPid, src.TIN, src.REGON, src.PESEL, src.CRP, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_Dokument' BEGIN
		MERGE INTO zc.PWD_Dokument AS tgt
		USING [WA_StageHurtownia].zc.PWD_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDok=src.RodzajDok, tgt.Identyfikator=src.Identyfikator, tgt.WersjaXML=src.WersjaXML, tgt.DataPrzeslania=src.DataPrzeslania, tgt.UrzadRejestracji=src.UrzadRejestracji, tgt.UrzadRejestracjiPid=src.UrzadRejestracjiPid, tgt.PasRejestracji=src.PasRejestracji, tgt.Status=src.Status, tgt.IdJedn=src.IdJedn, tgt.IdJednPid=src.IdJednPid, tgt.NrCelina=src.NrCelina, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.Decyzja=src.Decyzja, tgt.TerminOdpowiedzi=src.TerminOdpowiedzi, tgt.Zefir=src.Zefir, tgt.CzyZbiorcze=src.CzyZbiorcze, tgt.NrWlasny=src.NrWlasny, tgt.Miejsce=src.Miejsce, tgt.Data=src.Data, tgt.TowarLokalizacja=src.TowarLokalizacja, tgt.TerminDostarczenia=src.TerminDostarczenia, tgt.MasaBrutto=src.MasaBrutto, tgt.TranzytRodzaj=src.TranzytRodzaj, tgt.TranzytRodzajPid=src.TranzytRodzajPid, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.Procedura=src.Procedura, tgt.ProceduraPid=src.ProceduraPid, tgt.WartoscStatystyczna=src.WartoscStatystyczna, tgt.SprostowanieNrCelina=src.SprostowanieNrCelina, tgt.SprostowanieNr=src.SprostowanieNr, tgt.SprostowanieData=src.SprostowanieData, tgt.ZamkniecieIlosc=src.ZamkniecieIlosc, tgt.ZamkniecieZdejmujacy=src.ZamkniecieZdejmujacy, tgt.IdSkladajacy=src.IdSkladajacy, tgt.IdUpowazniony=src.IdUpowazniony
		WHEN NOT MATCHED
		THEN INSERT (IdDok, RodzajDok, Identyfikator, WersjaXML, DataPrzeslania, UrzadRejestracji, UrzadRejestracjiPid, PasRejestracji, Status, IdJedn, IdJednPid, NrCelina, DataPrzyjecia, Decyzja, TerminOdpowiedzi, Zefir, CzyZbiorcze, NrWlasny, Miejsce, Data, TowarLokalizacja, TerminDostarczenia, MasaBrutto, TranzytRodzaj, TranzytRodzajPid, LiczbaOpakowan, Procedura, ProceduraPid, WartoscStatystyczna, SprostowanieNrCelina, SprostowanieNr, SprostowanieData, ZamkniecieIlosc, ZamkniecieZdejmujacy, IdSkladajacy, IdUpowazniony)
		VALUES (src.IdDok, src.RodzajDok, src.Identyfikator, src.WersjaXML, src.DataPrzeslania, src.UrzadRejestracji, src.UrzadRejestracjiPid, src.PasRejestracji, src.Status, src.IdJedn, src.IdJednPid, src.NrCelina, src.DataPrzyjecia, src.Decyzja, src.TerminOdpowiedzi, src.Zefir, src.CzyZbiorcze, src.NrWlasny, src.Miejsce, src.Data, src.TowarLokalizacja, src.TerminDostarczenia, src.MasaBrutto, src.TranzytRodzaj, src.TranzytRodzajPid, src.LiczbaOpakowan, src.Procedura, src.ProceduraPid, src.WartoscStatystyczna, src.SprostowanieNrCelina, src.SprostowanieNr, src.SprostowanieData, src.ZamkniecieIlosc, src.ZamkniecieZdejmujacy, src.IdSkladajacy, src.IdUpowazniony);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_DokumentPoprzedni' BEGIN
		MERGE INTO zc.PWD_DokumentPoprzedni AS tgt
		USING [WA_StageHurtownia].zc.PWD_DokumentPoprzedni AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiTowar = src.IdPozycjiTowar)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokPoprz=src.KodDokPoprz, tgt.KodDokPoprzPid=src.KodDokPoprzPid, tgt.NrDokPoprz=src.NrDokPoprz, tgt.NrCelina=src.NrCelina
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiTowar, KodDokPoprz, KodDokPoprzPid, NrDokPoprz, NrCelina)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiTowar, src.KodDokPoprz, src.KodDokPoprzPid, src.NrDokPoprz, src.NrCelina);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_DokumentWymagany' BEGIN
		MERGE INTO zc.PWD_DokumentWymagany AS tgt
		USING [WA_StageHurtownia].zc.PWD_DokumentWymagany AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiTowar = src.IdPozycjiTowar)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokWym=src.KodDokWym, tgt.NrDokWym=src.NrDokWym, tgt.KodDokWymPid=src.KodDokWymPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, KodDokWym, NrDokWym, KodDokWymPid, IdPozycjiTowar)
		VALUES (src.IdDok, src.IdPozycji, src.KodDokWym, src.NrDokWym, src.KodDokWymPid, src.IdPozycjiTowar);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_InformacjaDodatkowa' BEGIN
		MERGE INTO zc.PWD_InformacjaDodatkowa AS tgt
		USING [WA_StageHurtownia].zc.PWD_InformacjaDodatkowa AS src
		ON (tgt.IdDok = src.IdDok AND tgt.IdPozycji = src.IdPozycji AND tgt.IdPozycjiTowar = src.IdPozycjiTowar)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdPozycji = src.IdPozycji, tgt.IdPozycjiTowar = src.IdPozycjiTowar, tgt.KodInfDod = src.KodInfDod, tgt.Tekst = src.Tekst
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiTowar, KodInfDod, Tekst)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiTowar, src.KodInfDod, src.Tekst);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_Dyrektywa' BEGIN
		MERGE INTO zc.PWD_Dyrektywa AS tgt
		USING [WA_StageHurtownia].zc.PWD_Dyrektywa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdProfilu=src.IdProfilu, tgt.Autor=src.Autor, tgt.RodzajDyrektywy=src.RodzajDyrektywy, tgt.RodzajDyrektywyPid=src.RodzajDyrektywyPid, tgt.Parametr=src.Parametr, tgt.Tresc=src.Tresc, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Komentarz=src.Komentarz, tgt.KomentarzDyspozytora=src.KomentarzDyspozytora
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdProfilu, Autor, RodzajDyrektywy, RodzajDyrektywyPid, Parametr, Tresc, Adresat, Status, Komentarz, KomentarzDyspozytora)
		VALUES (src.IdDok, src.IdPozycji, src.IdProfilu, src.Autor, src.RodzajDyrektywy, src.RodzajDyrektywyPid, src.Parametr, src.Tresc, src.Adresat, src.Status, src.Komentarz, src.KomentarzDyspozytora);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_Historia' BEGIN
		MERGE INTO zc.PWD_Historia AS tgt
		USING [WA_StageHurtownia].zc.PWD_Historia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DataOperacji=src.DataOperacji, tgt.UC=src.UC, tgt.UCPid=src.UCPid, tgt.Operator=src.Operator, tgt.Operacja=src.Operacja, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, DataOperacji, UC, UCPid, Operator, Operacja, Adnotacja, RodzAdnotacji)
		VALUES (src.IdDok, src.IdPozycji, src.DataOperacji, src.UC, src.UCPid, src.Operator, src.Operacja, src.Adnotacja, src.RodzAdnotacji);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_Towar' BEGIN
		MERGE INTO zc.PWD_Towar AS tgt
		USING [WA_StageHurtownia].zc.PWD_Towar AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodTowarowy=src.KodTowarowy, tgt.KodTowarowyPid=src.KodTowarowyPid, tgt.KrajPochodzenia=src.KrajPochodzenia, tgt.KrajPochodzeniaPid=src.KrajPochodzeniaPid, tgt.OpisTowaru=src.OpisTowaru, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajWysylkiPid=src.KrajWysylkiPid, tgt.IloscUzupelniajacaJm=src.IloscUzupelniajacaJm, tgt.MasaNetto=src.MasaNetto, tgt.WartoscStatystyczna=src.WartoscStatystyczna, tgt.DataRejestru=src.DataRejestru, tgt.NrRejestru=src.NrRejestru
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, KodTowarowy, KodTowarowyPid, KrajPochodzenia, KrajPochodzeniaPid, OpisTowaru, KrajWysylki, KrajWysylkiPid, IloscUzupelniajacaJm, MasaNetto, WartoscStatystyczna, DataRejestru, NrRejestru)
		VALUES (src.IdDok, src.IdPozycji, src.KodTowarowy, src.KodTowarowyPid, src.KrajPochodzenia, src.KrajPochodzeniaPid, src.OpisTowaru, src.KrajWysylki, src.KrajWysylkiPid, src.IloscUzupelniajacaJm, src.MasaNetto, src.WartoscStatystyczna, src.DataRejestru, src.NrRejestru);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_Kontener' BEGIN
		MERGE INTO zc.PWD_Kontener AS tgt
		USING [WA_StageHurtownia].zc.PWD_Kontener AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiKontener=src.IdPozycjiKontener)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiKontener, NrKontenera)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiKontener, src.NrKontenera);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_Powiazanie' BEGIN
		MERGE INTO zc.PWD_Powiazanie AS tgt
		USING [WA_StageHurtownia].zc.PWD_Powiazanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDok=src.RodzajDok, tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, RodzajDok, NrEwidencyjny, LiczbaOpakowan, MasaBrutto)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.RodzajDok, src.NrEwidencyjny, src.LiczbaOpakowan, src.MasaBrutto);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_Transport' BEGIN
		MERGE INTO zc.PWD_Transport AS tgt
		USING [WA_StageHurtownia].zc.PWD_Transport AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajTransportu=src.RodzajTransportu, tgt.RodzajTransportuPid=src.RodzajTransportuPid, tgt.ZnakiTransportu=src.ZnakiTransportu, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, RodzajTransportu, RodzajTransportuPid, ZnakiTransportu, Kraj, KrajPid)
		VALUES (src.IdDok, src.IdPozycji, src.RodzajTransportu, src.RodzajTransportuPid, src.ZnakiTransportu, src.Kraj, src.KrajPid);
		SET @Merged = 1;
	END

	IF @TableName = 'PWD_TransportZamkniecie' BEGIN
		MERGE INTO zc.PWD_TransportZamkniecie AS tgt
		USING [WA_StageHurtownia].zc.PWD_TransportZamkniecie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiZamkniecie=src.IdPozycjiZamkniecie)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrZamknieciaCeln=src.NrZamknieciaCeln
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiZamkniecie, NrZamknieciaCeln)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiZamkniecie, src.NrZamknieciaCeln);
		SET @Merged = 1;
	END


	-- grupa SAD --	

	IF @TableName = 'SAD_Skladajacy' BEGIN
		MERGE INTO zc.SAD_Skladajacy AS tgt
		USING [WA_StageHurtownia].zc.SAD_Skladajacy AS src
		ON (tgt.IdSkladajacy=src.IdSkladajacy)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ImieNazwisko=src.ImieNazwisko, tgt.Stanowisko=src.Stanowisko, tgt.Telefon=src.Telefon
		WHEN NOT MATCHED
		THEN INSERT (IdSkladajacy, ImieNazwisko, Stanowisko, Telefon)
		VALUES (src.IdSkladajacy, src.ImieNazwisko, src.Stanowisko, src.Telefon);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Kontrahent' BEGIN
		MERGE INTO zc.SAD_Kontrahent AS tgt
		USING [WA_StageHurtownia].zc.SAD_Kontrahent AS src
		ON (tgt.IdKontrahenta=src.IdKontrahenta)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Nazwa=src.Nazwa, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid, tgt.TIN=src.TIN, tgt.REGON=src.REGON, tgt.PESEL=src.PESEL, tgt.CRP=src.CRP, tgt.QuasiId=src.QuasiId
		WHEN NOT MATCHED
		THEN INSERT (IdKontrahenta, Nazwa, UlicaNumer, KodPocztowy, Miejscowosc, Kraj, KrajPid, TIN, REGON, PESEL, CRP, QuasiId)
		VALUES (src.IdKontrahenta, src.Nazwa, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.Kraj, src.KrajPid, src.TIN, src.REGON, src.PESEL, src.CRP, src.QuasiId);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Dokument' BEGIN
		MERGE INTO zc.SAD_Dokument AS tgt
		USING [WA_StageHurtownia].zc.SAD_Dokument AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDok=src.RodzajDok, tgt.Typ=src.Typ, tgt.TypPid=src.TypPid, tgt.Podtyp=src.Podtyp, tgt.PodtypPid=src.PodtypPid, tgt.CzyPowiadomienie=src.CzyPowiadomienie, tgt.NrCelina=src.NrCelina, tgt.IdentDok=src.IdentDok, tgt.WersjaXML=src.WersjaXML, tgt.IdSkladajacy=src.IdSkladajacy, tgt.DataPrzeslania=src.DataPrzeslania, tgt.UrzadRejestracji=src.UrzadRejestracji, tgt.UrzadRejestracjiPid=src.UrzadRejestracjiPid, tgt.PasRejestracji=src.PasRejestracji, tgt.DataPrzedstawienia=src.DataPrzedstawienia, tgt.NrCelina2=src.NrCelina2, tgt.Status=src.Status, tgt.DataPrzyjecia=src.DataPrzyjecia, tgt.TerminPU=src.TerminPU, tgt.TerminNaSAD=src.TerminNaSAD, tgt.DostarczenieSAD=src.DostarczenieSAD, tgt.ZwolnienieTowaru=src.ZwolnienieTowaru, tgt.PotwierdzenieWywozu=src.PotwierdzenieWywozu, tgt.TerminBilansowania=src.TerminBilansowania, tgt.EtapBilansowania=src.EtapBilansowania, tgt.Zefir=src.Zefir, tgt.RejestrDluguCelnego=src.RejestrDluguCelnego, tgt.Wykaz=src.Wykaz, tgt.PozycjaWykazu=src.PozycjaWykazu, tgt.DataRejestracji=src.DataRejestracji, tgt.P1a=src.P1a, tgt.P1aPid=src.P1aPid, tgt.P1b=src.P1b, tgt.P1bPid=src.P1bPid, tgt.P1c=src.P1c, tgt.P1cPid=src.P1cPid, tgt.ListyTowarowe=src.ListyTowarowe, tgt.Pozycje=src.Pozycje, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.NrAkt=src.NrAkt, tgt.SzczegolyWartosci=src.SzczegolyWartosci, tgt.SzczegolyWartosciPid=src.SzczegolyWartosciPid, tgt.Przedstawicielstwo=src.Przedstawicielstwo, tgt.PrzedstawicielstwoPid=src.PrzedstawicielstwoPid, tgt.Wskaznik=src.Wskaznik, tgt.WskaznikPid=src.WskaznikPid, tgt.IdZglaszajacy=src.IdZglaszajacy, tgt.DataWpisu=src.DataWpisu, tgt.NrWpisu=src.NrWpisu, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajWysylkiPid=src.KrajWysylkiPid, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.KrajPrzeznaczeniaPid=src.KrajPrzeznaczeniaPid, tgt.CzyKontenery=src.CzyKontenery, tgt.KodDost=src.KodDost, tgt.KodDostPid=src.KodDostPid, tgt.MiejsceDost=src.MiejsceDost, tgt.MiejsceKodDost=src.MiejsceKodDost, tgt.MiejsceKodDostPid=src.MiejsceKodDostPid, tgt.Waluta=src.Waluta, tgt.WalutaPid=src.WalutaPid, tgt.WartoscFaktury=src.WartoscFaktury, tgt.KursWaluty=src.KursWaluty, tgt.RodzTransakcji=src.RodzTransakcji, tgt.RodzTransakcjiPid=src.RodzTransakcjiPid, tgt.MasaBrutto=src.MasaBrutto, tgt.PlatnoscOdroczona=src.PlatnoscOdroczona, tgt.IdOdbiorcaKarty3=src.IdOdbiorcaKarty3, tgt.KodWynikuKontroli=src.KodWynikuKontroli, tgt.TerminDostarczenia=src.TerminDostarczenia, tgt.IloscZamkniec=src.IloscZamkniec, tgt.Miejsce=src.Miejsce, tgt.Data=src.Data, tgt.IdGlownyZobowiazany=src.IdGlownyZobowiazany, tgt.IdUpowaznionyOdbiorca=src.IdUpowaznionyOdbiorca
		WHEN NOT MATCHED
		THEN INSERT (IdDok, RodzajDok, Typ, TypPid, Podtyp, PodtypPid, CzyPowiadomienie, NrCelina, IdentDok, WersjaXML, IdSkladajacy, DataPrzeslania, UrzadRejestracji, UrzadRejestracjiPid, PasRejestracji, DataPrzedstawienia, NrCelina2, Status, DataPrzyjecia, TerminPU, TerminNaSAD, DostarczenieSAD, ZwolnienieTowaru, PotwierdzenieWywozu, TerminBilansowania, EtapBilansowania, Zefir, RejestrDluguCelnego, Wykaz, PozycjaWykazu, DataRejestracji, P1a, P1aPid, P1b, P1bPid, P1c, P1cPid, ListyTowarowe, Pozycje, LiczbaOpakowan, NrAkt, SzczegolyWartosci, SzczegolyWartosciPid, Przedstawicielstwo, PrzedstawicielstwoPid, Wskaznik, WskaznikPid, IdZglaszajacy, DataWpisu, NrWpisu, KrajWysylki, KrajWysylkiPid, KrajPrzeznaczenia, KrajPrzeznaczeniaPid, CzyKontenery, KodDost, KodDostPid, MiejsceDost, MiejsceKodDost, MiejsceKodDostPid, Waluta, WalutaPid, WartoscFaktury, KursWaluty, RodzTransakcji, RodzTransakcjiPid, MasaBrutto, PlatnoscOdroczona, IdOdbiorcaKarty3, KodWynikuKontroli, TerminDostarczenia, IloscZamkniec, Miejsce, Data, IdGlownyZobowiazany, IdUpowaznionyOdbiorca)
		VALUES (src.IdDok, src.RodzajDok, src.Typ, src.TypPid, src.Podtyp, src.PodtypPid, src.CzyPowiadomienie, src.NrCelina, src.IdentDok, src.WersjaXML, src.IdSkladajacy, src.DataPrzeslania, src.UrzadRejestracji, src.UrzadRejestracjiPid, src.PasRejestracji, src.DataPrzedstawienia, src.NrCelina2, src.Status, src.DataPrzyjecia, src.TerminPU, src.TerminNaSAD, src.DostarczenieSAD, src.ZwolnienieTowaru, src.PotwierdzenieWywozu, src.TerminBilansowania, src.EtapBilansowania, src.Zefir, src.RejestrDluguCelnego, src.Wykaz, src.PozycjaWykazu, src.DataRejestracji, src.P1a, src.P1aPid, src.P1b, src.P1bPid, src.P1c, src.P1cPid, src.ListyTowarowe, src.Pozycje, src.LiczbaOpakowan, src.NrAkt, src.SzczegolyWartosci, src.SzczegolyWartosciPid, src.Przedstawicielstwo, src.PrzedstawicielstwoPid, src.Wskaznik, src.WskaznikPid, src.IdZglaszajacy, src.DataWpisu, src.NrWpisu, src.KrajWysylki, src.KrajWysylkiPid, src.KrajPrzeznaczenia, src.KrajPrzeznaczeniaPid, src.CzyKontenery, src.KodDost, src.KodDostPid, src.MiejsceDost, src.MiejsceKodDost, src.MiejsceKodDostPid, src.Waluta, src.WalutaPid, src.WartoscFaktury, src.KursWaluty, src.RodzTransakcji, src.RodzTransakcjiPid, src.MasaBrutto, src.PlatnoscOdroczona, src.IdOdbiorcaKarty3, src.KodWynikuKontroli, src.TerminDostarczenia, src.IloscZamkniec, src.Miejsce, src.Data, src.IdGlownyZobowiazany, src.IdUpowaznionyOdbiorca);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Towar' BEGIN
		MERGE INTO zc.SAD_Towar AS tgt
		USING [WA_StageHurtownia].zc.SAD_Towar AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.P1c=src.P1c, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajWysylkiPid=src.KrajWysylkiPid, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.KrajPrzeznaczeniaPid=src.KrajPrzeznaczeniaPid, tgt.MasaBrutto=src.MasaBrutto, tgt.IdOdbiorca=src.IdOdbiorca, tgt.IdNadawca=src.IdNadawca, tgt.KodTowarowy=src.KodTowarowy, tgt.KodTowarowyPid=src.KodTowarowyPid, tgt.KodTaric=src.KodTaric, tgt.KrajPochodzenia=src.KrajPochodzenia, tgt.KrajPochodzeniaPid=src.KrajPochodzeniaPid, tgt.Preferencje=src.Preferencje, tgt.PreferencjePid=src.PreferencjePid, tgt.ProceduraBiezaca=src.ProceduraBiezaca, tgt.ProceduraBiezacaPid=src.ProceduraBiezacaPid, tgt.ProceduraPoprzednia=src.ProceduraPoprzednia, tgt.ProceduraPoprzedniaPid=src.ProceduraPoprzedniaPid, tgt.ProceduraSzczegoly=src.ProceduraSzczegoly, tgt.ProceduraSzczegolyPid=src.ProceduraSzczegolyPid, tgt.MasaNetto=src.MasaNetto, tgt.IloscTowaruUjm=src.IloscTowaruUjm, tgt.WartoscPozycji=src.WartoscPozycji, tgt.MetodaWartosciowania=src.MetodaWartosciowania, tgt.MetodaWartosciowaniaPid=src.MetodaWartosciowaniaPid, tgt.WartoscStatystyczna=src.WartoscStatystyczna, tgt.OpisTowaru=src.OpisTowaru, tgt.SamochodMarka=src.SamochodMarka, tgt.SamochodMarkaPid=src.SamochodMarkaPid, tgt.SamochodNrNadwozia=src.SamochodNrNadwozia, tgt.SamochodNrSilnika=src.SamochodNrSilnika, tgt.SamochodPojemnosc=src.SamochodPojemnosc, tgt.SamochodRodzajPaliwa=src.SamochodRodzajPaliwa, tgt.SamochodRodzajPaliwaPid=src.SamochodRodzajPaliwaPid, tgt.SamochodRokProdukcji=src.SamochodRokProdukcji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, P1c, KrajWysylki, KrajWysylkiPid, KrajPrzeznaczenia, KrajPrzeznaczeniaPid, MasaBrutto, IdOdbiorca, IdNadawca, KodTowarowy, KodTowarowyPid, KodTaric, KrajPochodzenia, KrajPochodzeniaPid, Preferencje, PreferencjePid, ProceduraBiezaca, ProceduraBiezacaPid, ProceduraPoprzednia, ProceduraPoprzedniaPid, ProceduraSzczegoly, ProceduraSzczegolyPid, MasaNetto, IloscTowaruUjm, WartoscPozycji, MetodaWartosciowania, MetodaWartosciowaniaPid, WartoscStatystyczna, OpisTowaru, SamochodMarka, SamochodMarkaPid, SamochodNrNadwozia, SamochodNrSilnika, SamochodPojemnosc, SamochodRodzajPaliwa, SamochodRodzajPaliwaPid, SamochodRokProdukcji)
		VALUES (src.IdDok, src.IdPozycji, src.P1c, src.KrajWysylki, src.KrajWysylkiPid, src.KrajPrzeznaczenia, src.KrajPrzeznaczeniaPid, src.MasaBrutto, src.IdOdbiorca, src.IdNadawca, src.KodTowarowy, src.KodTowarowyPid, src.KodTaric, src.KrajPochodzenia, src.KrajPochodzeniaPid, src.Preferencje, src.PreferencjePid, src.ProceduraBiezaca, src.ProceduraBiezacaPid, src.ProceduraPoprzednia, src.ProceduraPoprzedniaPid, src.ProceduraSzczegoly, src.ProceduraSzczegolyPid, src.MasaNetto, src.IloscTowaruUjm, src.WartoscPozycji, src.MetodaWartosciowania, src.MetodaWartosciowaniaPid, src.WartoscStatystyczna, src.OpisTowaru, src.SamochodMarka, src.SamochodMarkaPid, src.SamochodNrNadwozia, src.SamochodNrSilnika, src.SamochodPojemnosc, src.SamochodRodzajPaliwa, src.SamochodRodzajPaliwaPid, src.SamochodRokProdukcji);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_DokumentPoprzedni' BEGIN
		MERGE INTO zc.SAD_DokumentPoprzedni AS tgt
		USING [WA_StageHurtownia].zc.SAD_DokumentPoprzedni AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiDokPoprz=src.IdPozycjiDokPoprz)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Kategoria=src.Kategoria, tgt.KategoriaPid=src.KategoriaPid, tgt.KodDokPoprz=src.KodDokPoprz, tgt.KodDokPoprzPid=src.KodDokPoprzPid, tgt.TypSAD=src.TypSAD, tgt.TypSADPid=src.TypSADPid, tgt.NrDokPoprz=src.NrDokPoprz, tgt.NrCelina=src.NrCelina
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiDokPoprz, Kategoria, KategoriaPid, KodDokPoprz, KodDokPoprzPid, TypSAD, TypSADPid, NrDokPoprz, NrCelina)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiDokPoprz, src.Kategoria, src.KategoriaPid, src.KodDokPoprz, src.KodDokPoprzPid, src.TypSAD, src.TypSADPid, src.NrDokPoprz, src.NrCelina);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_DokumentWymagany' BEGIN
		MERGE INTO zc.SAD_DokumentWymagany AS tgt
		USING [WA_StageHurtownia].zc.SAD_DokumentWymagany AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiDokWymagany=src.IdPozycjiDokWymagany)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodDokWym=src.KodDokWym, tgt.KodDokWymPid=src.KodDokWymPid, tgt.NrDokWym=src.NrDokWym
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiDokWymagany, KodDokWym, KodDokWymPid, NrDokWym)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiDokWymagany, src.KodDokWym, src.KodDokWymPid, src.NrDokWym);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Dyrektywa' BEGIN
		MERGE INTO zc.SAD_Dyrektywa AS tgt
		USING [WA_StageHurtownia].zc.SAD_Dyrektywa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdProfilu=src.IdProfilu, tgt.Autor=src.Autor, tgt.RodzajDyrektywy=src.RodzajDyrektywy, tgt.RodzajDyrektywyPid=src.RodzajDyrektywyPid, tgt.Parametr=src.Parametr, tgt.Tresc=src.Tresc, tgt.Adresat=src.Adresat, tgt.Status=src.Status, tgt.Komentarz=src.Komentarz, tgt.KomentarzDyspozytora=src.KomentarzDyspozytora
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdProfilu, Autor, RodzajDyrektywy, RodzajDyrektywyPid, Parametr, Tresc, Adresat, Status, Komentarz, KomentarzDyspozytora)
		VALUES (src.IdDok, src.IdPozycji, src.IdProfilu, src.Autor, src.RodzajDyrektywy, src.RodzajDyrektywyPid, src.Parametr, src.Tresc, src.Adresat, src.Status, src.Komentarz, src.KomentarzDyspozytora);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Historia' BEGIN
		MERGE INTO zc.SAD_Historia AS tgt
		USING [WA_StageHurtownia].zc.SAD_Historia AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DataOperacji=src.DataOperacji, tgt.UC=src.UC, tgt.UCPid=src.UCPid, tgt.Operator=src.Operator, tgt.Operacja=src.Operacja, tgt.Adnotacja=src.Adnotacja, tgt.RodzAdnotacji=src.RodzAdnotacji, tgt.DataRejestracji=src.DataRejestracji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, DataOperacji, UC, UCPid, Operator, Operacja, Adnotacja, RodzAdnotacji, DataRejestracji)
		VALUES (src.IdDok, src.IdPozycji, src.DataOperacji, src.UC, src.UCPid, src.Operator, src.Operacja, src.Adnotacja, src.RodzAdnotacji, src.DataRejestracji);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_IloscTowaru' BEGIN
		MERGE INTO zc.SAD_IloscTowaru AS tgt
		USING [WA_StageHurtownia].zc.SAD_IloscTowaru AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiIloscTowaru=src.IdPozycjiIloscTowaru)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Jm=src.Jm, tgt.JmPid=src.JmPid, tgt.Ilosc=src.Ilosc, tgt.KwalifikatorJm=src.KwalifikatorJm, tgt.KwalifikatorJmPid=src.KwalifikatorJmPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiIloscTowaru, Jm, JmPid, Ilosc, KwalifikatorJm, KwalifikatorJmPid)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiIloscTowaru, src.Jm, src.JmPid, src.Ilosc, src.KwalifikatorJm, src.KwalifikatorJmPid);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_InformacjaDodatkowa' BEGIN
		MERGE INTO zc.SAD_InformacjaDodatkowa AS tgt
		USING [WA_StageHurtownia].zc.SAD_InformacjaDodatkowa AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiInfDod=src.IdPozycjiInfDod)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodInfDod=src.KodInfDod, tgt.KodInfDodPid=src.KodInfDodPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiInfDod, KodInfDod, KodInfDodPid)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiInfDod, src.KodInfDod, src.KodInfDodPid);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_KodDodatkowyPL' BEGIN
		MERGE INTO zc.SAD_KodDodatkowyPL AS tgt
		USING [WA_StageHurtownia].zc.SAD_KodDodatkowyPL AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiKodDodPL=src.IdPozycjiKodDodPL)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodPL=src.KodPL, tgt.KodPLPid=src.KodPLPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiKodDodPL, KodPL, KodPLPid)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiKodDodPL, src.KodPL, src.KodPLPid);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_KodDodatkowyUE' BEGIN
		MERGE INTO zc.SAD_KodDodatkowyUE AS tgt
		USING [WA_StageHurtownia].zc.SAD_KodDodatkowyUE AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiKodDodUE=src.IdPozycjiKodDodUE)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodUE=src.KodUE, tgt.KodUEPid=src.KodUEPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiKodDodUE, KodUE, KodUEPid)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiKodDodUE, src.KodUE, src.KodUEPid);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Kontener' BEGIN
		MERGE INTO zc.SAD_Kontener AS tgt
		USING [WA_StageHurtownia].zc.SAD_Kontener AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiKontener=src.IdPozycjiKontener)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiKontener, NrKontenera)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiKontener, src.NrKontenera);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Kontyngent' BEGIN
		MERGE INTO zc.SAD_Kontyngent AS tgt
		USING [WA_StageHurtownia].zc.SAD_Kontyngent AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiKontyngent=src.IdPozycjiKontyngent)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrPorzadkowy=src.NrPorzadkowy, tgt.WnioskowanaIlosc=src.WnioskowanaIlosc, tgt.Jm=src.Jm, tgt.JmPid=src.JmPid, tgt.TQSNr=src.TQSNr, tgt.TQSJm=src.TQSJm, tgt.TQSWnioskowanaIlosc=src.TQSWnioskowanaIlosc, tgt.TQSStatus=src.TQSStatus, tgt.CzyKorekta=src.CzyKorekta, tgt.PrzyznanaIlosc=src.PrzyznanaIlosc, tgt.WykorzystanaIlosc=src.WykorzystanaIlosc, tgt.NrWniosku=src.NrWniosku, tgt.NrDecyzji=src.NrDecyzji
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiKontyngent, NrPorzadkowy, WnioskowanaIlosc, Jm, JmPid, TQSNr, TQSJm, TQSWnioskowanaIlosc, TQSStatus, CzyKorekta, PrzyznanaIlosc, WykorzystanaIlosc, NrWniosku, NrDecyzji)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiKontyngent, src.NrPorzadkowy, src.WnioskowanaIlosc, src.Jm, src.JmPid, src.TQSNr, src.TQSJm, src.TQSWnioskowanaIlosc, src.TQSStatus, src.CzyKorekta, src.PrzyznanaIlosc, src.WykorzystanaIlosc, src.NrWniosku, src.NrDecyzji);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Korekta' BEGIN
		MERGE INTO zc.SAD_Korekta AS tgt
		USING [WA_StageHurtownia].zc.SAD_Korekta AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiKorekta=src.IdPozycjiKorekta)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodKorekty=src.KodKorekty, tgt.KodKorektyPid=src.KodKorektyPid, tgt.Wartosc=src.Wartosc
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiKorekta, KodKorekty, KodKorektyPid, Wartosc)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiKorekta, src.KodKorekty, src.KodKorektyPid, src.Wartosc);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Nadawca' BEGIN
		MERGE INTO zc.SAD_Nadawca AS tgt
		USING [WA_StageHurtownia].zc.SAD_Nadawca AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdKontrahenta=src.IdKontrahenta)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.EORI=src.EORI
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdKontrahenta, EORI)
		VALUES (src.IdDok, src.IdPozycji, src.IdKontrahenta, src.EORI);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Odbiorca' BEGIN
		MERGE INTO zc.SAD_Odbiorca AS tgt
		USING [WA_StageHurtownia].zc.SAD_Odbiorca AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdKontrahenta=src.IdKontrahenta)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.EORI=src.EORI
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdKontrahenta, EORI)
		VALUES (src.IdDok, src.IdPozycji, src.IdKontrahenta, src.EORI);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Opakowanie' BEGIN
		MERGE INTO zc.SAD_Opakowanie AS tgt
		USING [WA_StageHurtownia].zc.SAD_Opakowanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiOpakowanie=src.IdPozycjiOpakowanie)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajOpakKod=src.RodzajOpakKod, tgt.RodzajOpakKodPid=src.RodzajOpakKodPid, tgt.ZnakiOpak=src.ZnakiOpak, tgt.LiczbaOpak=src.LiczbaOpak, tgt.IloscSztuk=src.IloscSztuk
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiOpakowanie, RodzajOpakKod, RodzajOpakKodPid, ZnakiOpak, LiczbaOpak, IloscSztuk)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiOpakowanie, src.RodzajOpakKod, src.RodzajOpakKodPid, src.ZnakiOpak, src.LiczbaOpak, src.IloscSztuk);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Oplata' BEGIN
		MERGE INTO zc.SAD_Oplata AS tgt
		USING [WA_StageHurtownia].zc.SAD_Oplata AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiOplata=src.IdPozycjiOplata)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Typ=src.Typ, tgt.TypPid=src.TypPid, tgt.Podstawa=src.Podstawa, tgt.Stawka=src.Stawka, tgt.Kwota=src.Kwota, tgt.MetodaPlatnosci=src.MetodaPlatnosci, tgt.MetodaPlatnosciPid=src.MetodaPlatnosciPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiOplata, Typ, TypPid, Podstawa, Stawka, Kwota, MetodaPlatnosci, MetodaPlatnosciPid)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiOplata, src.Typ, src.TypPid, src.Podstawa, src.Stawka, src.Kwota, src.MetodaPlatnosci, src.MetodaPlatnosciPid);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Podklasyfikacja' BEGIN
		MERGE INTO zc.SAD_Podklasyfikacja AS tgt
		USING [WA_StageHurtownia].zc.SAD_Podklasyfikacja AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiPodklasyfikacja=src.IdPozycjiPodklasyfikacja)
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiPodklasyfikacja)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiPodklasyfikacja);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Powiazanie' BEGIN
		MERGE INTO zc.SAD_Powiazanie AS tgt
		USING [WA_StageHurtownia].zc.SAD_Powiazanie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.Typ=src.Typ AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.RodzajDok=src.RodzajDok, tgt.NrEwidencyjny=src.NrEwidencyjny, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto
		WHEN NOT MATCHED
		THEN INSERT (IdDok, Typ, IdPozycji, RodzajDok, NrEwidencyjny, LiczbaOpakowan, MasaBrutto)
		VALUES (src.IdDok, src.Typ, src.IdPozycji, src.RodzajDok, src.NrEwidencyjny, src.LiczbaOpakowan, src.MasaBrutto);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_SrodekPrzewozowy' BEGIN
		MERGE INTO zc.SAD_SrodekPrzewozowy AS tgt
		USING [WA_StageHurtownia].zc.SAD_SrodekPrzewozowy AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiSrodekPrzewoz=src.IdPozycjiSrodekPrzewoz)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.Identyfikator=src.Identyfikator, tgt.Seria=src.Seria, tgt.Typ=src.Typ, tgt.SrodkiGEO=src.SrodkiGEO, tgt.SrodkiGEOPid=src.SrodkiGEOPid, tgt.NrPorzadkowy=src.NrPorzadkowy, tgt.Ujm=src.Ujm, tgt.UjmPid=src.UjmPid, tgt.KwalifikatorUjm=src.KwalifikatorUjm, tgt.KwalifikatorUjmPid=src.KwalifikatorUjmPid, tgt.ZdefiniowanaJm=src.ZdefiniowanaJm, tgt.RaportowanaIlosc=src.RaportowanaIlosc
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiSrodekPrzewoz, Identyfikator, Seria, Typ, SrodkiGEO, SrodkiGEOPid, NrPorzadkowy, Ujm, UjmPid, KwalifikatorUjm, KwalifikatorUjmPid, ZdefiniowanaJm, RaportowanaIlosc)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiSrodekPrzewoz, src.Identyfikator, src.Seria, src.Typ, src.SrodkiGEO, src.SrodkiGEOPid, src.NrPorzadkowy, src.Ujm, src.UjmPid, src.KwalifikatorUjm, src.KwalifikatorUjmPid, src.ZdefiniowanaJm, src.RaportowanaIlosc);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_SzczegolyWartosci' BEGIN
		MERGE INTO zc.SAD_SzczegolyWartosci AS tgt
		USING [WA_StageHurtownia].zc.SAD_SzczegolyWartosci AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji AND tgt.IdPozycjiSzczegWart=src.IdPozycjiSzczegWart)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodWartosci=src.KodWartosci, tgt.KodWartosciPid=src.KodWartosciPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, IdPozycjiSzczegWart, KodWartosci, KodWartosciPid)
		VALUES (src.IdDok, src.IdPozycji, src.IdPozycjiSzczegWart, src.KodWartosci, src.KodWartosciPid);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Transport' BEGIN
		MERGE INTO zc.SAD_Transport AS tgt
		USING [WA_StageHurtownia].zc.SAD_Transport AS src
		ON (tgt.IdDok=src.IdDok AND tgt.GranicznyWewnetrzny=src.GranicznyWewnetrzny)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.ZnakiP18=src.ZnakiP18, tgt.ZnakiP21=src.ZnakiP21, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid, tgt.RodzajTranspNaGran=src.RodzajTranspNaGran, tgt.RodzajTranspNaGranPid=src.RodzajTranspNaGranPid, tgt.RodzajTranspWewn=src.RodzajTranspWewn, tgt.RodzajTranspWewnPid=src.RodzajTranspWewnPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, GranicznyWewnetrzny, ZnakiP18, ZnakiP21, Kraj, KrajPid, RodzajTranspNaGran, RodzajTranspNaGranPid, RodzajTranspWewn, RodzajTranspWewnPid)
		VALUES (src.IdDok, src.GranicznyWewnetrzny, src.ZnakiP18, src.ZnakiP21, src.Kraj, src.KrajPid, src.RodzajTranspNaGran, src.RodzajTranspNaGranPid, src.RodzajTranspWewn, src.RodzajTranspWewnPid);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_UrzadKontrolny' BEGIN
		MERGE INTO zc.SAD_UrzadKontrolny AS tgt
		USING [WA_StageHurtownia].zc.SAD_UrzadKontrolny AS src
		ON (tgt.IdDok=src.IdDok)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.UCZgloszenia=src.UCZgloszenia, tgt.UCZgloszeniaPid=src.UCZgloszeniaPid, tgt.KodUrzedu=src.KodUrzedu, tgt.KodUrzeduPid=src.KodUrzeduPid, tgt.Nazwa=src.Nazwa, tgt.Kraj=src.Kraj, tgt.KrajPid=src.KrajPid, tgt.UlicaNumer=src.UlicaNumer, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.UCGraniczny=src.UCGraniczny, tgt.UCGranicznyPid=src.UCGranicznyPid, tgt.LokalizacjaMiejsce=src.LokalizacjaMiejsce, tgt.LokalizacjaUC=src.LokalizacjaUC, tgt.LokalizacjaOpis=src.LokalizacjaOpis, tgt.SkladTyp=src.SkladTyp, tgt.SkladTypPid=src.SkladTypPid, tgt.SkladMiejsce=src.SkladMiejsce, tgt.SkladKraj=src.SkladKraj, tgt.SkladKrajPid=src.SkladKrajPid, tgt.UCPrzeznaczenia=src.UCPrzeznaczenia, tgt.UCPrzeznaczeniaPid=src.UCPrzeznaczeniaPid
		WHEN NOT MATCHED
		THEN INSERT (IdDok, UCZgloszenia, UCZgloszeniaPid, KodUrzedu, KodUrzeduPid, Nazwa, Kraj, KrajPid, UlicaNumer, KodPocztowy, Miejscowosc, UCGraniczny, UCGranicznyPid, LokalizacjaMiejsce, LokalizacjaUC, LokalizacjaOpis, SkladTyp, SkladTypPid, SkladMiejsce, SkladKraj, SkladKrajPid, UCPrzeznaczenia, UCPrzeznaczeniaPid)
		VALUES (src.IdDok, src.UCZgloszenia, src.UCZgloszeniaPid, src.KodUrzedu, src.KodUrzeduPid, src.Nazwa, src.Kraj, src.KrajPid, src.UlicaNumer, src.KodPocztowy, src.Miejscowosc, src.UCGraniczny, src.UCGranicznyPid, src.LokalizacjaMiejsce, src.LokalizacjaUC, src.LokalizacjaOpis, src.SkladTyp, src.SkladTypPid, src.SkladMiejsce, src.SkladKraj, src.SkladKrajPid, src.UCPrzeznaczenia, src.UCPrzeznaczeniaPid);
		SET @Merged = 1;
	END

	IF @TableName = 'SAD_Zamkniecie' BEGIN
		MERGE INTO zc.SAD_Zamkniecie AS tgt
		USING [WA_StageHurtownia].zc.SAD_Zamkniecie AS src
		ON (tgt.IdDok=src.IdDok AND tgt.IdPozycji=src.IdPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrZamkniecia=src.NrZamkniecia
		WHEN NOT MATCHED
		THEN INSERT (IdDok, IdPozycji, NrZamkniecia)
		VALUES (src.IdDok, src.IdPozycji, src.NrZamkniecia);
		SET @Merged = 1;
	END


	
	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END