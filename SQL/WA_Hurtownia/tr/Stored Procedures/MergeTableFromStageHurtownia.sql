-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-28
-- Description:	Merge z WA_StageHurtownia do WA_Hurtownia.
-- =============================================

CREATE PROCEDURE [tr].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END

	IF @TableName = 'Podmioty' BEGIN
		MERGE INTO tr.Podmioty AS tgt
		USING WA_StageHurtownia.tr.Podmioty AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDKraju=src.IDKraju, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Nazwa=src.Nazwa, tgt.PosiadaczKarnetuTIR=src.PosiadaczKarnetuTIR, tgt.RodzajIdentyfikatoraPodmiotu=src.RodzajIdentyfikatoraPodmiotu, tgt.TIN=src.TIN, tgt.UlicaINrDomu=src.UlicaINrDomu
		WHEN NOT MATCHED
		THEN INSERT (SID, IDKraju, KodPocztowy, Miejscowosc, Nazwa, PosiadaczKarnetuTIR, RodzajIdentyfikatoraPodmiotu, TIN, UlicaINrDomu)
		VALUES (src.SID, src.IDKraju, src.KodPocztowy, src.Miejscowosc, src.Nazwa, src.PosiadaczKarnetuTIR, src.RodzajIdentyfikatoraPodmiotu, src.TIN, src.UlicaINrDomu);
		SET @Merged = 1;
	END

	IF @TableName = 'JednostkiMiary' BEGIN
		MERGE INTO tr.JednostkiMiary AS tgt
		USING [WA_StageHurtownia].tr.JednostkiMiary AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

IF @TableName = 'KodyInformacjiDodatkowych' BEGIN
		MERGE INTO tr.KodyInformacjiDodatkowych AS tgt
		USING [WA_StageHurtownia].tr.KodyInformacjiDodatkowych AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN, tgt.CzyWysylanyDoDomenyWspolnej=src.CzyWysylanyDoDomenyWspolnej, tgt.OpisKoduInformacjiDodatkowej=src.OpisKoduInformacjiDodatkowej
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN, CzyWysylanyDoDomenyWspolnej, OpisKoduInformacjiDodatkowej)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN, src.CzyWysylanyDoDomenyWspolnej, src.OpisKoduInformacjiDodatkowej);
		SET @Merged = 1;
	END

IF @TableName = 'KrajoweWynikiAnalizyRyzykaWAR1' BEGIN
		MERGE INTO tr.KrajoweWynikiAnalizyRyzykaWAR1 AS tgt
		USING [WA_StageHurtownia].tr.KrajoweWynikiAnalizyRyzykaWAR1 AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

IF @TableName = 'KrajoweWynikiAnalizyRyzykaWAR234' BEGIN
		MERGE INTO tr.KrajoweWynikiAnalizyRyzykaWAR234 AS tgt
		USING [WA_StageHurtownia].tr.KrajoweWynikiAnalizyRyzykaWAR234 AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

IF @TableName = 'KrajoweWynikiRyzykaOperacjiTranzytowej' BEGIN
		MERGE INTO tr.KrajoweWynikiRyzykaOperacjiTranzytowej AS tgt
		USING [WA_StageHurtownia].tr.KrajoweWynikiRyzykaOperacjiTranzytowej AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SIDOperacjiTranzytowej=src.SIDOperacjiTranzytowej, tgt.NumerWersji=src.NumerWersji, tgt.Lokalizacja=src.Lokalizacja, tgt.WynikAnalizyRyzyka=src.WynikAnalizyRyzyka, tgt.DataWynikuRyzyka=src.DataWynikuRyzyka, tgt.CzasWynikuRyzyka=src.CzasWynikuRyzyka, tgt.KodBledu=src.KodBledu, tgt.TrescBledu=src.TrescBledu, tgt.IDProfiluKontrolujacego=src.IDProfiluKontrolujacego, tgt.RodzdzajKontroli=src.RodzdzajKontroli, tgt.KodInterwencji=src.KodInterwencji
		WHEN NOT MATCHED
		THEN INSERT (SID, SIDOperacjiTranzytowej, NumerWersji, Lokalizacja, WynikAnalizyRyzyka, DataWynikuRyzyka, CzasWynikuRyzyka, KodBledu, TrescBledu, IDProfiluKontrolujacego, RodzdzajKontroli, KodInterwencji)
		VALUES (src.SID, src.SIDOperacjiTranzytowej, src.NumerWersji, src.Lokalizacja, src.WynikAnalizyRyzyka, src.DataWynikuRyzyka, src.CzasWynikuRyzyka, src.KodBledu, src.TrescBledu, src.IDProfiluKontrolujacego, src.RodzdzajKontroli, src.KodInterwencji);
		SET @Merged = 1;
	END

IF @TableName = 'NazwyKodowInterwencjiCelnej' BEGIN
		MERGE INTO tr.NazwyKodowInterwencjiCelnej AS tgt
		USING [WA_StageHurtownia].tr.NazwyKodowInterwencjiCelnej AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

IF @TableName = 'NryPozwNaProcedureUproszczona' BEGIN
		MERGE INTO tr.NryPozwNaProcedureUproszczona AS tgt
		USING [WA_StageHurtownia].tr.NryPozwNaProcedureUproszczona AS src
		ON (tgt.NrPozwolenia=src.NrPozwolenia)
		WHEN NOT MATCHED
		THEN INSERT (NrPozwolenia)
		VALUES (src.NrPozwolenia);
		SET @Merged = 1;
	END

IF @TableName = 'PodmiotyPDR' BEGIN
		MERGE INTO tr.PodmiotyPDR AS tgt
		USING [WA_StageHurtownia].tr.PodmiotyPDR AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDKraju=src.IDKraju, tgt.KodPocztowy=src.KodPocztowy, tgt.Miejscowosc=src.Miejscowosc, tgt.Nazwa=src.Nazwa, tgt.OsobaKontaktowa=src.OsobaKontaktowa, tgt.PodmiotEDI=src.PodmiotEDI, tgt.TIN=src.TIN, tgt.UlicaINrDomu=src.UlicaINrDomu, tgt.PosiadaczKarnetuTIR=src.PosiadaczKarnetuTIR
		WHEN NOT MATCHED
		THEN INSERT (SID, IDKraju, KodPocztowy, Miejscowosc, Nazwa, OsobaKontaktowa, PodmiotEDI, TIN, UlicaINrDomu, PosiadaczKarnetuTIR)
		VALUES (src.SID, src.IDKraju, src.KodPocztowy, src.Miejscowosc, src.Nazwa, src.OsobaKontaktowa, src.PodmiotEDI, src.TIN, src.UlicaINrDomu, src.PosiadaczKarnetuTIR);
				SET @Merged = 1;
	END

IF @TableName = 'PrzeladunekKontenerow' BEGIN
		DELETE tr.PrzeladunekKontenerow
		MERGE INTO tr.PrzeladunekKontenerow AS tgt
		USING [WA_StageHurtownia].tr.PrzeladunekKontenerow AS src
		ON (1=2)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CzyIncydent=src.CzyIncydent, tgt.NrSekwencji=src.NrSekwencji, tgt.CzyZdarzeniePrzeladunek=src.CzyZdarzeniePrzeladunek, tgt.NumerNowegoKontenera=src.NumerNowegoKontenera
		WHEN NOT MATCHED
		THEN INSERT (MRN, CzyIncydent, NrSekwencji, CzyZdarzeniePrzeladunek, NumerNowegoKontenera)
		VALUES (src.MRN, src.CzyIncydent, src.NrSekwencji, src.CzyZdarzeniePrzeladunek, src.NumerNowegoKontenera);
		SET @Merged = 1;
	END

	IF @TableName = 'RodzajeKontroli' BEGIN
		MERGE INTO tr.RodzajeKontroli AS tgt
		USING [WA_StageHurtownia].tr.RodzajeKontroli AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

	IF @TableName = 'RodzajeTransportu' BEGIN
		MERGE INTO tr.RodzajeTransportu AS tgt
		USING [WA_StageHurtownia].tr.RodzajeTransportu AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

	IF @TableName = 'RodzajeWynikowKontroli' BEGIN
		MERGE INTO tr.RodzajeWynikowKontroli AS tgt
		USING [WA_StageHurtownia].tr.RodzajeWynikowKontroli AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

	IF @TableName = 'SymbolWaluty' BEGIN
		MERGE INTO tr.SymbolWaluty AS tgt
		USING [WA_StageHurtownia].tr.SymbolWaluty AS src
		ON (tgt.IDWaluty=src.IDWaluty)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.KodJezykaWaluty=src.KodJezykaWaluty, tgt.KursWymiany=src.KursWymiany, tgt.NazwaWaluty=src.NazwaWaluty
		WHEN NOT MATCHED
		THEN INSERT (IDWaluty, KodJezykaWaluty, KursWymiany, NazwaWaluty)
		VALUES (src.IDWaluty, src.KodJezykaWaluty, src.KursWymiany, src.NazwaWaluty);
		SET @Merged = 1;
	END

	IF @TableName = 'SzczegolySkontrolowanejPozycji' BEGIN
		MERGE INTO tr.SzczegolySkontrolowanejPozycji AS tgt
		USING [WA_StageHurtownia].tr.SzczegolySkontrolowanejPozycji AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.MRN=src.MRN, tgt.NumerPozycjiTowarowej=src.NumerPozycjiTowarowej, tgt.KodCN=src.KodCN, tgt.KodHS=src.KodHS, tgt.LokalizacjaKontroli=src.LokalizacjaKontroli, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaNetto=src.MasaNetto, tgt.NumerWersjiUwagRozladunkowych=src.NumerWersjiUwagRozladunkowych, tgt.WskaznikKontroli=src.WskaznikKontroli
		WHEN NOT MATCHED
		THEN INSERT (SID, MRN, NumerPozycjiTowarowej, KodCN, KodHS, LokalizacjaKontroli, MasaBrutto, MasaNetto, NumerWersjiUwagRozladunkowych, WskaznikKontroli)
		VALUES (src.SID, src.MRN, src.NumerPozycjiTowarowej, src.KodCN, src.KodHS, src.LokalizacjaKontroli, src.MasaBrutto, src.MasaNetto, src.NumerWersjiUwagRozladunkowych, src.WskaznikKontroli);
		SET @Merged = 1;
	END

	IF @TableName = 'TypyDeklaracji' BEGIN
		MERGE INTO tr.TypyDeklaracji AS tgt
		USING [WA_StageHurtownia].tr.TypyDeklaracji AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

	IF @TableName = 'TypyDokumentow' BEGIN
		MERGE INTO tr.TypyDokumentow AS tgt
		USING [WA_StageHurtownia].tr.TypyDokumentow AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CzyTranzytowy=src.CzyTranzytowy, tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN, tgt.CzyWysylanyDoDomenyWspolnej=src.CzyWysylanyDoDomenyWspolnej, tgt.ZalaczonyCzyPoprzedni=src.ZalaczonyCzyPoprzedni
		WHEN NOT MATCHED
		THEN INSERT (Id, CzyTranzytowy, NazwaPL, NazwaEN, CzyWysylanyDoDomenyWspolnej, ZalaczonyCzyPoprzedni)
		VALUES (src.Id, src.CzyTranzytowy, src.NazwaPL, src.NazwaEN, src.CzyWysylanyDoDomenyWspolnej, src.ZalaczonyCzyPoprzedni);
		SET @Merged = 1;
	END

	IF @TableName = 'TypyGwarancji' BEGIN
		MERGE INTO tr.TypyGwarancji AS tgt
		USING [WA_StageHurtownia].tr.TypyGwarancji AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

	IF @TableName = 'TypyOpakowan' BEGIN
		MERGE INTO tr.TypyOpakowan AS tgt
		USING [WA_StageHurtownia].tr.TypyOpakowan AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

	IF @TableName = 'TypyStatusowOperacjiTranzytowej' BEGIN
		MERGE INTO tr.TypyStatusowOperacjiTranzytowej AS tgt
		USING [WA_StageHurtownia].tr.TypyStatusowOperacjiTranzytowej AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

	IF @TableName = 'TypyTransportuPrzekrGranice' BEGIN
		MERGE INTO tr.TypyTransportuPrzekrGranice AS tgt
		USING [WA_StageHurtownia].tr.TypyTransportuPrzekrGranice AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

	IF @TableName = 'Urzedy' BEGIN
		MERGE INTO tr.Urzedy AS tgt
		USING [WA_StageHurtownia].tr.Urzedy AS src
		ON (tgt.IDUrzedu=src.IDUrzedu)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CzyDedykowanyDlaPrzedsiebiorcow=src.CzyDedykowanyDlaPrzedsiebiorcow, tgt.IDKraju=src.IDKraju, tgt.KodGeograficzny=src.KodGeograficzny, tgt.KodPocztowy=src.KodPocztowy, tgt.KodRegionu=src.KodRegionu
		WHEN NOT MATCHED
		THEN INSERT (IDUrzedu, CzyDedykowanyDlaPrzedsiebiorcow, IDKraju, KodGeograficzny, KodPocztowy, KodRegionu)
		VALUES (src.IDUrzedu, src.CzyDedykowanyDlaPrzedsiebiorcow, src.IDKraju, src.KodGeograficzny, src.KodPocztowy, src.KodRegionu);
		SET @Merged = 1;
	END

	IF @TableName = 'WskaznikiWarunkowSzczegolnych' BEGIN
		MERGE INTO tr.WskaznikiWarunkowSzczegolnych AS tgt
		USING [WA_StageHurtownia].tr.WskaznikiWarunkowSzczegolnych AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

	IF @TableName = 'WynikiAnalizyRyzyka' BEGIN
		MERGE INTO tr.WynikiAnalizyRyzyka AS tgt
		USING [WA_StageHurtownia].tr.WynikiAnalizyRyzyka AS src
		ON (tgt.Id=src.Id)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NazwaPL=src.NazwaPL, tgt.NazwaEN=src.NazwaEN
		WHEN NOT MATCHED
		THEN INSERT (Id, NazwaPL, NazwaEN)
		VALUES (src.Id, src.NazwaPL, src.NazwaEN);
		SET @Merged = 1;
	END

	IF @TableName = 'ZdarzeniaWTrakcieTransportu' BEGIN
		MERGE INTO tr.ZdarzeniaWTrakcieTransportu AS tgt
		USING [WA_StageHurtownia].tr.ZdarzeniaWTrakcieTransportu AS src
		ON (tgt.MRN=src.MRN and tgt.Sekwencja=src.Sekwencja)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDKrajuZdarzenia=src.IDKrajuZdarzenia, tgt.CzyJuzWNCTS=src.CzyJuzWNCTS, tgt.CzyWDrodze=src.CzyWDrodze, tgt.KodJezykaMiejsca=src.KodJezykaMiejsca, tgt.LiczbaPlomb=src.LiczbaPlomb, tgt.Miejsce=src.Miejsce
		WHEN NOT MATCHED
		THEN INSERT (MRN, Sekwencja, IDKrajuZdarzenia, CzyJuzWNCTS, CzyWDrodze, KodJezykaMiejsca, LiczbaPlomb, Miejsce)
		VALUES (src.MRN, src.Sekwencja, src.IDKrajuZdarzenia, src.CzyJuzWNCTS, src.CzyWDrodze, src.KodJezykaMiejsca, src.LiczbaPlomb, src.Miejsce);
		SET @Merged = 1;
	END

	IF @TableName = 'DokumentySkontrolowanejPozycji' BEGIN
		MERGE INTO tr.DokumentySkontrolowanejPozycji AS tgt
		USING [WA_StageHurtownia].tr.DokumentySkontrolowanejPozycji AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SIDSkontrolowanejPozycjiTowarowej=src.SIDSkontrolowanejPozycjiTowarowej, tgt.IDTypuDokumentu=src.IDTypuDokumentu
		WHEN NOT MATCHED
		THEN INSERT (SID, SIDSkontrolowanejPozycjiTowarowej, IDTypuDokumentu)
		VALUES (src.SID, src.SIDSkontrolowanejPozycjiTowarowej, src.IDTypuDokumentu);
		SET @Merged = 1;
	END

	IF @TableName = 'KontenerySkontrolowanejPozycji' BEGIN
		MERGE INTO tr.KontenerySkontrolowanejPozycji AS tgt
		USING [WA_StageHurtownia].tr.KontenerySkontrolowanejPozycji AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.NrKontenera=src.NrKontenera, tgt.KodPoziomuKontroli=src.KodPoziomuKontroli, tgt.SIDSkontrolowanejPozycji=src.SIDSkontrolowanejPozycji
		WHEN NOT MATCHED
		THEN INSERT (SID, NrKontenera, KodPoziomuKontroli, SIDSkontrolowanejPozycji)
		VALUES (src.SID, src.NrKontenera, src.KodPoziomuKontroli, src.SIDSkontrolowanejPozycji);
		SET @Merged = 1;
	END

	IF @TableName = 'KontrolaOpakowan' BEGIN
		MERGE INTO tr.KontrolaOpakowan AS tgt
		USING [WA_StageHurtownia].tr.KontrolaOpakowan AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SIDPozycjiTowarowejOperacjiTranzytowej=src.SIDPozycjiTowarowejOperacjiTranzytowej, tgt.IDTypuOpakowania=src.IDTypuOpakowania, tgt.KodPoziomuKontroli=src.KodPoziomuKontroli, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.LiczbaSztuk=src.LiczbaSztuk
		WHEN NOT MATCHED
		THEN INSERT (SID, SIDPozycjiTowarowejOperacjiTranzytowej, IDTypuOpakowania, KodPoziomuKontroli, LiczbaOpakowan, LiczbaSztuk)
		VALUES (src.SID, src.SIDPozycjiTowarowejOperacjiTranzytowej, src.IDTypuOpakowania, src.KodPoziomuKontroli, src.LiczbaOpakowan, src.LiczbaSztuk);
		SET @Merged = 1;
	END

	IF @TableName = 'OperacjeTranzytowe' BEGIN
		MERGE INTO tr.OperacjeTranzytowe AS tgt
		USING [WA_StageHurtownia].tr.OperacjeTranzytowe AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDKrajuPrzeznaczenia=src.IDKrajuPrzeznaczenia, tgt.IDKrajuWysylki=src.IDKrajuWysylki, tgt.IDUrzeduPrzybycia=src.IDUrzeduPrzybycia, tgt.IDWynikowKontroliUrzadPrzeznaczenia=src.IDWynikowKontroliUrzadPrzeznaczenia, tgt.IDWynikowKontroliUrzadWyjscia=src.IDWynikowKontroliUrzadWyjscia, tgt.AnalizaRyzykawUrzedziePrzeznaczenia=src.AnalizaRyzykawUrzedziePrzeznaczenia, tgt.AnalizaRyzykaWUrzedzieTranzytowym=src.AnalizaRyzykaWUrzedzieTranzytowym, tgt.AnalizaRyzykawUrzedzieWyjscia=src.AnalizaRyzykawUrzedzieWyjscia, tgt.CzyTowaryWrazliwe=src.CzyTowaryWrazliwe, tgt.DataPrzyjeciaZgloszenia=src.DataPrzyjeciaZgloszenia, tgt.DataKontroliUrzadPrzeznaczenia=src.DataKontroliUrzadPrzeznaczenia, tgt.DataKontroliUrzadWyjscia=src.DataKontroliUrzadWyjscia, tgt.DataOdbioruKomunikatuIE18=src.DataOdbioruKomunikatuIE18, tgt.DataZamknieciaOperacjiTranzytowej=src.DataZamknieciaOperacjiTranzytowej, tgt.DataPrzekierowaniaDoOTS=src.DataPrzekierowaniaDoOTS, tgt.DataWyjasnieniaNiezgodnosci=src.DataWyjasnieniaNiezgodnosci, tgt.TerminNaPrzybycie=src.TerminNaPrzybycie, tgt.DataWaznosciPozwoleniaNaTranzyt=src.DataWaznosciPozwoleniaNaTranzyt, tgt.DataZapytaniaOZwolnienie=src.DataZapytaniaOZwolnienie, tgt.DataZgloszeniaNiezgodnosci=src.DataZgloszeniaNiezgodnosci, tgt.DataZgloszonegoPrzybycia=src.DataZgloszonegoPrzybycia, tgt.DataZmianyStatusu=src.DataZmianyStatusu, tgt.DataZwolnieniaTowaru=src.DataZwolnieniaTowaru, tgt.DataZwolnieniaZOdpowiedzialnosci=src.DataZwolnieniaZOdpowiedzialnosci, tgt.DataZwrotuDokumentu=src.DataZwrotuDokumentu, tgt.DataPrzybycia=src.DataPrzybycia, tgt.IDDeklarowanegoUCPrzeznaczenia=src.IDDeklarowanegoUCPrzeznaczenia, tgt.LiczbaPlomb=src.LiczbaPlomb, tgt.LRN=src.LRN, tgt.MRN=src.MRN, tgt.NrStronyKarnetuTIR=src.NrStronyKarnetuTIR, tgt.ProcUprWUCWyjscia=src.ProcUprWUCWyjscia, tgt.RodzajZwolnieniaTIR=src.RodzajZwolnieniaTIR, tgt.TranzytWysokiegoRyzyka=src.TranzytWysokiegoRyzyka, tgt.SIDAdresuUrzeduPrzybycia=src.SIDAdresuUrzeduPrzybycia, tgt.SIDGlownegoZobowiazanegoPDR=src.SIDGlownegoZobowiazanegoPDR, tgt.SIDGlownegoZobowiazanego=src.SIDGlownegoZobowiazanego, tgt.SIDPrzedstawiajacegoPDR=src.SIDPrzedstawiajacegoPDR, tgt.SIDPrzedstawiajacego=src.SIDPrzedstawiajacego, tgt.StatusOperacjiTranzytowejWUCPrzeznaczenia=src.StatusOperacjiTranzytowejWUCPrzeznaczenia, tgt.StatusOperacjiTranzytowejWUCWyjscia=src.StatusOperacjiTranzytowejWUCWyjscia, tgt.TypRozladunuTIR=src.TypRozladunuTIR, tgt.ProcUprWUCPrzeznaczenia=src.ProcUprWUCPrzeznaczenia, tgt.TypDeklaracji=src.TypDeklaracji, tgt.IDUrzeduCelnegoPrzeznaczenia=src.IDUrzeduCelnegoPrzeznaczenia, tgt.IDUrzeduCelnegoWysylki=src.IDUrzeduCelnegoWysylki, tgt.WiazacaTrasaPrzewozu=src.WiazacaTrasaPrzewozu
		WHEN NOT MATCHED
		THEN INSERT (SID, IDKrajuPrzeznaczenia, IDKrajuWysylki, IDUrzeduPrzybycia, IDWynikowKontroliUrzadPrzeznaczenia, IDWynikowKontroliUrzadWyjscia, AnalizaRyzykawUrzedziePrzeznaczenia, AnalizaRyzykaWUrzedzieTranzytowym, AnalizaRyzykawUrzedzieWyjscia, CzyTowaryWrazliwe, DataPrzyjeciaZgloszenia, DataKontroliUrzadPrzeznaczenia, DataKontroliUrzadWyjscia, DataOdbioruKomunikatuIE18, DataZamknieciaOperacjiTranzytowej, DataPrzekierowaniaDoOTS, DataWyjasnieniaNiezgodnosci, TerminNaPrzybycie, DataWaznosciPozwoleniaNaTranzyt, DataZapytaniaOZwolnienie, DataZgloszeniaNiezgodnosci, DataZgloszonegoPrzybycia, DataZmianyStatusu, DataZwolnieniaTowaru, DataZwolnieniaZOdpowiedzialnosci, DataZwrotuDokumentu, DataPrzybycia, IDDeklarowanegoUCPrzeznaczenia, LiczbaPlomb, LRN, MRN, NrStronyKarnetuTIR, ProcUprWUCWyjscia, RodzajZwolnieniaTIR, TranzytWysokiegoRyzyka, SIDAdresuUrzeduPrzybycia, SIDGlownegoZobowiazanegoPDR, SIDGlownegoZobowiazanego, SIDPrzedstawiajacegoPDR, SIDPrzedstawiajacego, StatusOperacjiTranzytowejWUCPrzeznaczenia, StatusOperacjiTranzytowejWUCWyjscia, TypRozladunuTIR, ProcUprWUCPrzeznaczenia, TypDeklaracji, IDUrzeduCelnegoPrzeznaczenia, IDUrzeduCelnegoWysylki, WiazacaTrasaPrzewozu)
		VALUES (src.SID, src.IDKrajuPrzeznaczenia, src.IDKrajuWysylki, src.IDUrzeduPrzybycia, src.IDWynikowKontroliUrzadPrzeznaczenia, src.IDWynikowKontroliUrzadWyjscia, src.AnalizaRyzykawUrzedziePrzeznaczenia, src.AnalizaRyzykaWUrzedzieTranzytowym, src.AnalizaRyzykawUrzedzieWyjscia, src.CzyTowaryWrazliwe, src.DataPrzyjeciaZgloszenia, src.DataKontroliUrzadPrzeznaczenia, src.DataKontroliUrzadWyjscia, src.DataOdbioruKomunikatuIE18, src.DataZamknieciaOperacjiTranzytowej, src.DataPrzekierowaniaDoOTS, src.DataWyjasnieniaNiezgodnosci, src.TerminNaPrzybycie, src.DataWaznosciPozwoleniaNaTranzyt, src.DataZapytaniaOZwolnienie, src.DataZgloszeniaNiezgodnosci, src.DataZgloszonegoPrzybycia, src.DataZmianyStatusu, src.DataZwolnieniaTowaru, src.DataZwolnieniaZOdpowiedzialnosci, src.DataZwrotuDokumentu, src.DataPrzybycia, src.IDDeklarowanegoUCPrzeznaczenia, src.LiczbaPlomb, src.LRN, src.MRN, src.NrStronyKarnetuTIR, src.ProcUprWUCWyjscia, src.RodzajZwolnieniaTIR, src.TranzytWysokiegoRyzyka, src.SIDAdresuUrzeduPrzybycia, src.SIDGlownegoZobowiazanegoPDR, src.SIDGlownegoZobowiazanego, src.SIDPrzedstawiajacegoPDR, src.SIDPrzedstawiajacego, src.StatusOperacjiTranzytowejWUCPrzeznaczenia, src.StatusOperacjiTranzytowejWUCWyjscia, src.TypRozladunuTIR, src.ProcUprWUCPrzeznaczenia, src.TypDeklaracji, src.IDUrzeduCelnegoPrzeznaczenia, src.IDUrzeduCelnegoWysylki, src.WiazacaTrasaPrzewozu);
		SET @Merged = 1;
	END

	IF @TableName = 'PlacowkiObjetePozwoleniamiPU' BEGIN
		MERGE INTO tr.PlacowkiObjetePozwoleniamiPU AS tgt
		USING [WA_StageHurtownia].tr.PlacowkiObjetePozwoleniamiPU AS src
		ON (tgt.IdPlacowki=src.IdPlacowki and tgt.NrPozwolenia=src.NrPozwolenia)
		WHEN NOT MATCHED
		THEN INSERT (IdPlacowki, NrPozwolenia)
		VALUES (src.IdPlacowki, src.NrPozwolenia);
		SET @Merged = 1;
	END

	IF @TableName = 'PozwoleniaNaProceduryUproszczone' BEGIN
		MERGE INTO tr.PozwoleniaNaProceduryUproszczone AS tgt
		USING [WA_StageHurtownia].tr.PozwoleniaNaProceduryUproszczone AS src
		ON (tgt.NrPozwolenia=src.NrPozwolenia and tgt.Lokalizacja=src.Lokalizacja and tgt.TypDeklaracji=src.TypDeklaracji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.DataWniosku=src.DataWniosku, tgt.DataWystawieniaPozwolenia=src.DataWystawieniaPozwolenia, tgt.DataWaznosci=src.DataWaznosci, tgt.MaksymalnyCzasPodrozy=src.MaksymalnyCzasPodrozy, tgt.SIDPodmiotuPDR=src.SIDPodmiotuPDR, tgt.IDUrzeduWydajacegoPozwolenie=src.IDUrzeduWydajacegoPozwolenie
		WHEN NOT MATCHED
		THEN INSERT (NrPozwolenia, Lokalizacja, DataWniosku, DataWystawieniaPozwolenia, DataWaznosci, MaksymalnyCzasPodrozy, SIDPodmiotuPDR, IDUrzeduWydajacegoPozwolenie, TypDeklaracji)
		VALUES (src.NrPozwolenia, src.Lokalizacja, src.DataWniosku, src.DataWystawieniaPozwolenia, src.DataWaznosci, src.MaksymalnyCzasPodrozy, src.SIDPodmiotuPDR, src.IDUrzeduWydajacegoPozwolenie, src.TypDeklaracji);
		SET @Merged = 1;
	END

	IF @TableName = 'SkontrolowanePozycjeInformacjeDodatkowe' BEGIN
		MERGE INTO tr.SkontrolowanePozycjeInformacjeDodatkowe AS tgt
		USING [WA_StageHurtownia].tr.SkontrolowanePozycjeInformacjeDodatkowe AS src
		ON (tgt.SIDSkontrolowanejPozycji=src.SIDSkontrolowanejPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SID=src.SID, tgt.IDKoduInformacjiDodatkowej=src.IDKoduInformacjiDodatkowej, tgt.EksportZEC=src.EksportZEC, tgt.IDKrajuEksportujacego=src.IDKrajuEksportujacego, tgt.KodPoziomuKontroli=src.KodPoziomuKontroli
		WHEN NOT MATCHED
		THEN INSERT (SID, SIDSkontrolowanejPozycji, IDKoduInformacjiDodatkowej, EksportZEC, IDKrajuEksportujacego, KodPoziomuKontroli)
		VALUES (src.SID, src.SIDSkontrolowanejPozycji, src.IDKoduInformacjiDodatkowej, src.EksportZEC, src.IDKrajuEksportujacego, src.KodPoziomuKontroli);
		SET @Merged = 1;
	END

	IF @TableName = 'SlownikTowarowWrazliwych' BEGIN
		MERGE INTO tr.SlownikTowarowWrazliwych AS tgt
		USING [WA_StageHurtownia].tr.SlownikTowarowWrazliwych AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDJednostkiMiary=src.IDJednostkiMiary, tgt.GranicaTerytoriumEWG=src.GranicaTerytoriumEWG, tgt.IloscReferencyjna=src.IloscReferencyjna, tgt.KlasaHS=src.KlasaHS, tgt.KodTowarowWrazliwych=src.KodTowarowWrazliwych
		WHEN NOT MATCHED
		THEN INSERT (SID, IDJednostkiMiary, GranicaTerytoriumEWG, IloscReferencyjna, KlasaHS, KodTowarowWrazliwych)
		VALUES (src.SID, src.IDJednostkiMiary, src.GranicaTerytoriumEWG, src.IloscReferencyjna, src.KlasaHS, src.KodTowarowWrazliwych);
		SET @Merged = 1;
	END

	IF @TableName = 'SzczegolyZdarzenWTrakcieTransportu' BEGIN
		MERGE INTO tr.SzczegolyZdarzenWTrakcieTransportu AS tgt
		USING [WA_StageHurtownia].tr.SzczegolyZdarzenWTrakcieTransportu AS src
		ON (tgt.MRN=src.MRN and tgt.NrSekwencji=src.NrSekwencji and tgt.CzyIncydent=src.CzyIncydent)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.CzyZdarzeniePrzeladunek=src.CzyZdarzeniePrzeladunek, tgt.NrNowegoSrTransportu=src.NrNowegoSrTransportu
		WHEN NOT MATCHED
		THEN INSERT (MRN, NrSekwencji, CzyIncydent, CzyZdarzeniePrzeladunek, NrNowegoSrTransportu)
		VALUES (src.MRN, src.NrSekwencji, src.CzyIncydent, src.CzyZdarzeniePrzeladunek, src.NrNowegoSrTransportu);
		SET @Merged = 1;
	END

	IF @TableName = 'WynikiSkontrolowanejPozycji' BEGIN
		MERGE INTO tr.WynikiSkontrolowanejPozycji AS tgt
		USING [WA_StageHurtownia].tr.WynikiSkontrolowanejPozycji AS src
		ON (tgt.SIDWynikuSkontrolowanejPozycji=src.SIDWynikuSkontrolowanejPozycji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SIDSkontrolowanejPozycji=src.SIDSkontrolowanejPozycji, tgt.WskaznikKontroli=src.WskaznikKontroli, tgt.WskaznikDoAtrybutu=src.WskaznikDoAtrybutu
		WHEN NOT MATCHED
		THEN INSERT (SIDWynikuSkontrolowanejPozycji, SIDSkontrolowanejPozycji, WskaznikKontroli, WskaznikDoAtrybutu)
		VALUES (src.SIDWynikuSkontrolowanejPozycji, src.SIDSkontrolowanejPozycji, src.WskaznikKontroli, src.WskaznikDoAtrybutu);
		SET @Merged = 1;
	END

	IF @TableName = 'HistoriaStatusowOperacjiTranzytowej' BEGIN
		MERGE INTO tr.HistoriaStatusowOperacjiTranzytowej AS tgt
		USING [WA_StageHurtownia].tr.HistoriaStatusowOperacjiTranzytowej AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SIDOperacjiTranzytowej=src.SIDOperacjiTranzytowej, tgt.IDStatusu=src.IDStatusu, tgt.SIDOperacjiwUCTranzytowym=src.SIDOperacjiwUCTranzytowym, tgt.IDStatusuUCPrzeznaczenia=src.IDStatusuUCPrzeznaczenia, tgt.IDUzytkownika=src.IDUzytkownika, tgt.IDGrupy=src.IDGrupy, tgt.PowodZmianyStatusu=src.PowodZmianyStatusu, tgt.DataZmianyStatusu=src.DataZmianyStatusu, tgt.IDStatusuUCTranzytowy=src.IDStatusuUCTranzytowy
		WHEN NOT MATCHED
		THEN INSERT (SID, SIDOperacjiTranzytowej, IDStatusu, SIDOperacjiwUCTranzytowym, IDStatusuUCPrzeznaczenia, IDUzytkownika, IDGrupy, PowodZmianyStatusu, DataZmianyStatusu, IDStatusuUCTranzytowy)
		VALUES (src.SID, src.SIDOperacjiTranzytowej, src.IDStatusu, src.SIDOperacjiwUCTranzytowym, src.IDStatusuUCPrzeznaczenia, src.IDUzytkownika, src.IDGrupy, src.PowodZmianyStatusu, src.DataZmianyStatusu, src.IDStatusuUCTranzytowy);
		SET @Merged = 1;
	END

	IF @TableName = 'InformacjeoTowarachWrazliwych' BEGIN
		MERGE INTO tr.InformacjeoTowarachWrazliwych AS tgt
		USING [WA_StageHurtownia].tr.InformacjeoTowarachWrazliwych AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDSlownikaTowarowWrazliwych=src.IDSlownikaTowarowWrazliwych, tgt.JednostkaMiaryPole31=src.JednostkaMiaryPole31, tgt.SIDPozycjiTowarowejOperacjiTranzytowej=src.SIDPozycjiTowarowejOperacjiTranzytowej
		WHEN NOT MATCHED
		THEN INSERT (SID, IDSlownikaTowarowWrazliwych, JednostkaMiaryPole31, SIDPozycjiTowarowejOperacjiTranzytowej)
		VALUES (src.SID, src.IDSlownikaTowarowWrazliwych, src.JednostkaMiaryPole31, src.SIDPozycjiTowarowejOperacjiTranzytowej);
		SET @Merged = 1;
	END

	IF @TableName = 'SkontrolowanePozycjeTowaryWrazliwe' BEGIN
		MERGE INTO tr.SkontrolowanePozycjeTowaryWrazliwe AS tgt
		USING [WA_StageHurtownia].tr.SkontrolowanePozycjeTowaryWrazliwe AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SIDSkontrolowanejPozycji=src.SIDSkontrolowanejPozycji, tgt.IDSlownikaTowarowWrazliwych=src.IDSlownikaTowarowWrazliwych, tgt.JednostkaMiaryPole31=src.JednostkaMiaryPole31, tgt.KodPoziomuKontroli=src.KodPoziomuKontroli
		WHEN NOT MATCHED
		THEN INSERT (SID, SIDSkontrolowanejPozycji, IDSlownikaTowarowWrazliwych, JednostkaMiaryPole31, KodPoziomuKontroli)
		VALUES (src.SID, src.SIDSkontrolowanejPozycji, src.IDSlownikaTowarowWrazliwych, src.JednostkaMiaryPole31, src.KodPoziomuKontroli);
		SET @Merged = 1;
	END

	IF @TableName = 'SzczegolyKontroli' BEGIN
		MERGE INTO tr.SzczegolyKontroli AS tgt
		USING [WA_StageHurtownia].tr.SzczegolyKontroli AS src
		ON (tgt.MRN=src.MRN and tgt.KodLokalizacjiKontroli=src.KodLokalizacjiKontroli)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDKrajuWyjscia=src.IDKrajuWyjscia, tgt.LiczbaPaczek=src.LiczbaPaczek, tgt.LiczbaPozycjiTowarowych=src.LiczbaPozycjiTowarowych, tgt.MasaBrutto=src.MasaBrutto, tgt.NrSrTranspWMiejscuWyjscia=src.NrSrTranspWMiejscuWyjscia
		WHEN NOT MATCHED
		THEN INSERT (MRN, KodLokalizacjiKontroli, IDKrajuWyjscia, LiczbaPaczek, LiczbaPozycjiTowarowych, MasaBrutto, NrSrTranspWMiejscuWyjscia)
		VALUES (src.MRN, src.KodLokalizacjiKontroli, src.IDKrajuWyjscia, src.LiczbaPaczek, src.LiczbaPozycjiTowarowych, src.MasaBrutto, src.NrSrTranspWMiejscuWyjscia);
		SET @Merged = 1;
	END

	IF @TableName = 'TrasyPrzewozu' BEGIN
		MERGE INTO tr.TrasyPrzewozu AS tgt
		USING [WA_StageHurtownia].tr.TrasyPrzewozu AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SIDOperacjiTranzytowej=src.SIDOperacjiTranzytowej, tgt.NumerWersji=src.NumerWersji, tgt.IDKraju=src.IDKraju
		WHEN NOT MATCHED
		THEN INSERT (SID, SIDOperacjiTranzytowej, NumerWersji, IDKraju)
		VALUES (src.SID, src.SIDOperacjiTranzytowej, src.NumerWersji, src.IDKraju);
		SET @Merged = 1;
	END

	IF @TableName = 'WersjaOperacjiTranzytowej' BEGIN
		MERGE INTO tr.WersjaOperacjiTranzytowej AS tgt
		USING [WA_StageHurtownia].tr.WersjaOperacjiTranzytowej AS src
		ON (tgt.SIDOperacjiTranzytowej=src.SIDOperacjiTranzytowej and tgt.NumerWersji=src.NumerWersji)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.StatusWersji=src.StatusWersji, tgt.TypWersji=src.TypWersji
		WHEN NOT MATCHED
		THEN INSERT (SIDOperacjiTranzytowej, NumerWersji, StatusWersji, TypWersji)
		VALUES (src.SIDOperacjiTranzytowej, src.NumerWersji, src.StatusWersji, src.TypWersji);
		SET @Merged = 1;
	END

	IF @TableName = 'GwarancjaDlaOperacjiTranzytowej' BEGIN
		MERGE INTO tr.GwarancjaDlaOperacjiTranzytowej AS tgt
		USING [WA_StageHurtownia].tr.GwarancjaDlaOperacjiTranzytowej AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDTypuGwarancji=src.IDTypuGwarancji, tgt.NumerWersji=src.NumerWersji, tgt.SIDOperacjiTranzytowej=src.SIDOperacjiTranzytowej
		WHEN NOT MATCHED
		THEN INSERT (SID, IDTypuGwarancji, NumerWersji, SIDOperacjiTranzytowej)
		VALUES (src.SID, src.IDTypuGwarancji, src.NumerWersji, src.SIDOperacjiTranzytowej);
		SET @Merged = 1;
	END

	IF @TableName = 'InformacjeOPlombach' BEGIN
		MERGE INTO tr.InformacjeOPlombach AS tgt
		USING [WA_StageHurtownia].tr.InformacjeOPlombach AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.MRNZdarzeniaWTrakcieTransportu=src.MRNZdarzeniaWTrakcieTransportu, tgt.NrSekwencji=src.NrSekwencji, tgt.NumerWersji=src.NumerWersji, tgt.SIDOperacjiTranzytowej=src.SIDOperacjiTranzytowej, tgt.KodJezykaIdentyfikacjiPlomb=src.KodJezykaIdentyfikacjiPlomb, tgt.NumerIdentyfikacyjnyPlomb=src.NumerIdentyfikacyjnyPlomb
		WHEN NOT MATCHED
		THEN INSERT (SID, MRNZdarzeniaWTrakcieTransportu, NrSekwencji, NumerWersji, SIDOperacjiTranzytowej, KodJezykaIdentyfikacjiPlomb, NumerIdentyfikacyjnyPlomb)
		VALUES (src.SID, src.MRNZdarzeniaWTrakcieTransportu, src.NrSekwencji, src.NumerWersji, src.SIDOperacjiTranzytowej, src.KodJezykaIdentyfikacjiPlomb, src.NumerIdentyfikacyjnyPlomb);
		SET @Merged = 1;
	END

	IF @TableName = 'OperacjeTranzytoweUCTranzytowym' BEGIN
		MERGE INTO tr.OperacjeTranzytoweUCTranzytowym AS tgt
		USING [WA_StageHurtownia].tr.OperacjeTranzytoweUCTranzytowym AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.StatusOperacjiTranzytowejWUCTranzytowym=src.StatusOperacjiTranzytowejWUCTranzytowym, tgt.IDUrzeduTranzytowego=src.IDUrzeduTranzytowego, tgt.NumerWersji=src.NumerWersji, tgt.CzyPrzybycie=src.CzyPrzybycie, tgt.DataPrzybyciaDoUrzedu=src.DataPrzybyciaDoUrzedu, tgt.DataZmianyStatusu=src.DataZmianyStatusu, tgt.GwarancjaNiewazna=src.GwarancjaNiewazna, tgt.MRN=src.MRN, tgt.SIDOperacjiTranzytowej=src.SIDOperacjiTranzytowej
		WHEN NOT MATCHED
		THEN INSERT (SID, StatusOperacjiTranzytowejWUCTranzytowym, IDUrzeduTranzytowego, NumerWersji, CzyPrzybycie, DataPrzybyciaDoUrzedu, DataZmianyStatusu, GwarancjaNiewazna, MRN, SIDOperacjiTranzytowej)
		VALUES (src.SID, src.StatusOperacjiTranzytowejWUCTranzytowym, src.IDUrzeduTranzytowego, src.NumerWersji, src.CzyPrzybycie, src.DataPrzybyciaDoUrzedu, src.DataZmianyStatusu, src.GwarancjaNiewazna, src.MRN, src.SIDOperacjiTranzytowej);
		SET @Merged = 1;
	END

	IF @TableName = 'PozycjaTowarowaOperacjiTranzytowej' BEGIN
		MERGE INTO tr.PozycjaTowarowaOperacjiTranzytowej AS tgt
		USING [WA_StageHurtownia].tr.PozycjaTowarowaOperacjiTranzytowej AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.TypDeklaracji=src.TypDeklaracji, tgt.NumerWersji=src.NumerWersji, tgt.SIDOdbiorcy=src.SIDOdbiorcy, tgt.SIDOdbiorcyPDR=src.SIDOdbiorcyPDR, tgt.SIDNadawcy=src.SIDNadawcy, tgt.SIDNadawcyPDR=src.SIDNadawcyPDR, tgt.CzyTowarWstrzymany=src.CzyTowarWstrzymany, tgt.IDKrajuPrzeznaczenia=src.IDKrajuPrzeznaczenia, tgt.IDKrajuWysylki=src.IDKrajuWysylki, tgt.NumerPozycjiTowarowej=src.NumerPozycjiTowarowej, tgt.KodCN=src.KodCN, tgt.KodHS=src.KodHS, tgt.KodDlaTowarowNiebezpiecznych=src.KodDlaTowarowNiebezpiecznych, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaNetto=src.MasaNetto, tgt.MRN=src.MRN, tgt.CRN=src.CRN, tgt.SIDOperacjiTranzytowej=src.SIDOperacjiTranzytowej, tgt.OplataTranspMetodaPlatnosci=src.OplataTranspMetodaPlatnosci
		WHEN NOT MATCHED
		THEN INSERT (SID, TypDeklaracji, NumerWersji, SIDOdbiorcy, SIDOdbiorcyPDR, SIDNadawcy, SIDNadawcyPDR, CzyTowarWstrzymany, IDKrajuPrzeznaczenia, IDKrajuWysylki, NumerPozycjiTowarowej, KodCN, KodHS, KodDlaTowarowNiebezpiecznych, MasaBrutto, MasaNetto, MRN, CRN, SIDOperacjiTranzytowej, OplataTranspMetodaPlatnosci)
		VALUES (src.SID, src.TypDeklaracji, src.NumerWersji, src.SIDOdbiorcy, src.SIDOdbiorcyPDR, src.SIDNadawcy, src.SIDNadawcyPDR, src.CzyTowarWstrzymany, src.IDKrajuPrzeznaczenia, src.IDKrajuWysylki, src.NumerPozycjiTowarowej, src.KodCN, src.KodHS, src.KodDlaTowarowNiebezpiecznych, src.MasaBrutto, src.MasaNetto, src.MRN, src.CRN, src.SIDOperacjiTranzytowej, src.OplataTranspMetodaPlatnosci);
		SET @Merged = 1;
	END

	IF @TableName = 'SzczegolyOperacjiTranzytowej' BEGIN
		MERGE INTO tr.SzczegolyOperacjiTranzytowej AS tgt
		USING [WA_StageHurtownia].tr.SzczegolyOperacjiTranzytowej AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDKrajuSrTranspPrzekrGranice=src.IDKrajuSrTranspPrzekrGranice, tgt.IDKrajuPrzeznaczenia=src.IDKrajuPrzeznaczenia, tgt.IDKrajuNaWyjezdzie=src.IDKrajuNaWyjezdzie, tgt.IDKrajuWysylki=src.IDKrajuWysylki, tgt.CalkowitaLiczbaOpakowan=src.CalkowitaLiczbaOpakowan, tgt.CalkowitaLiczbaPozycji=src.CalkowitaLiczbaPozycji, tgt.CRN=src.CRN, tgt.CzyKontener=src.CzyKontener, tgt.CzyTowaryWrazliwe=src.CzyTowaryWrazliwe, tgt.DaneBezpieczenstwa=src.DaneBezpieczenstwa, tgt.KodMiejscaUznanego=src.KodMiejscaUznanego, tgt.LiczbaPlomb=src.LiczbaPlomb, tgt.MRN=src.MRN, tgt.NazwaPrzedstawiciela=src.NazwaPrzedstawiciela, tgt.NumerReferencyjnyPrzewozu=src.NumerReferencyjnyPrzewozu, tgt.NumerWersji=src.NumerWersji, tgt.UmocowaniePrzedstawiciela=src.UmocowaniePrzedstawiciela, tgt.ProcUprWUCWyjscia=src.ProcUprWUCWyjscia, tgt.RodzajTransportuNaGranicy=src.RodzajTransportuNaGranicy, tgt.TypTransportuPrzekrGranice=src.TypTransportuPrzekrGranice, tgt.RodzajTransportu=src.RodzajTransportu, tgt.SIDOperacjiTranzytowej=src.SIDOperacjiTranzytowej, tgt.SIDUpowaznionegoOdbiorcyPDR=src.SIDUpowaznionegoOdbiorcyPDR, tgt.SIDUpowaznionegoOdbiorcy=src.SIDUpowaznionegoOdbiorcy, tgt.SIDNadawcyPDR=src.SIDNadawcyPDR, tgt.SIDNadawcy=src.SIDNadawcy, tgt.SIDOdbiorcyPDR=src.SIDOdbiorcyPDR, tgt.SIDOdbiorcy=src.SIDOdbiorcy, tgt.SIDPrzedstawicielaPDR=src.SIDPrzedstawicielaPDR, tgt.TypDeklaracji=src.TypDeklaracji, tgt.MiejsceUznane=src.MiejsceUznane, tgt.WskaznikWarunkowSzczegolnych=src.WskaznikWarunkowSzczegolnych, tgt.OplataTranspMetodaPlatnosci=src.OplataTranspMetodaPlatnosci, tgt.NrSrTranspWMiejscuWyjscia=src.NrSrTranspWMiejscuWyjscia, tgt.NrSrTranspPrzekrGranice=src.NrSrTranspPrzekrGranice
		WHEN NOT MATCHED
		THEN INSERT (SID, IDKrajuSrTranspPrzekrGranice, IDKrajuPrzeznaczenia, IDKrajuNaWyjezdzie, IDKrajuWysylki, CalkowitaLiczbaOpakowan, CalkowitaLiczbaPozycji, CRN, CzyKontener, CzyTowaryWrazliwe, DaneBezpieczenstwa, KodMiejscaUznanego, LiczbaPlomb, MRN, NazwaPrzedstawiciela, NumerReferencyjnyPrzewozu, NumerWersji, UmocowaniePrzedstawiciela, ProcUprWUCWyjscia, RodzajTransportuNaGranicy, TypTransportuPrzekrGranice, RodzajTransportu, SIDOperacjiTranzytowej, SIDUpowaznionegoOdbiorcyPDR, SIDUpowaznionegoOdbiorcy, SIDNadawcyPDR, SIDNadawcy, SIDOdbiorcyPDR, SIDOdbiorcy, SIDPrzedstawicielaPDR, TypDeklaracji, MiejsceUznane, WskaznikWarunkowSzczegolnych, OplataTranspMetodaPlatnosci, NrSrTranspWMiejscuWyjscia, NrSrTranspPrzekrGranice)
		VALUES (src.SID, src.IDKrajuSrTranspPrzekrGranice, src.IDKrajuPrzeznaczenia, src.IDKrajuNaWyjezdzie, src.IDKrajuWysylki, src.CalkowitaLiczbaOpakowan, src.CalkowitaLiczbaPozycji, src.CRN, src.CzyKontener, src.CzyTowaryWrazliwe, src.DaneBezpieczenstwa, src.KodMiejscaUznanego, src.LiczbaPlomb, src.MRN, src.NazwaPrzedstawiciela, src.NumerReferencyjnyPrzewozu, src.NumerWersji, src.UmocowaniePrzedstawiciela, src.ProcUprWUCWyjscia, src.RodzajTransportuNaGranicy, src.TypTransportuPrzekrGranice, src.RodzajTransportu, src.SIDOperacjiTranzytowej, src.SIDUpowaznionegoOdbiorcyPDR, src.SIDUpowaznionegoOdbiorcy, src.SIDNadawcyPDR, src.SIDNadawcy, src.SIDOdbiorcyPDR, src.SIDOdbiorcy, src.SIDPrzedstawicielaPDR, src.TypDeklaracji, src.MiejsceUznane, src.WskaznikWarunkowSzczegolnych, src.OplataTranspMetodaPlatnosci, src.NrSrTranspWMiejscuWyjscia, src.NrSrTranspPrzekrGranice);
		SET @Merged = 1;
	END

	IF @TableName = 'InformacjeDodatkoweOTowarach' BEGIN
		MERGE INTO tr.InformacjeDodatkoweOTowarach AS tgt
		USING [WA_StageHurtownia].tr.InformacjeDodatkoweOTowarach AS src
		ON (tgt.SIDInformacjiDodatkowychOTowarach=src.SIDInformacjiDodatkowychOTowarach)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SIDPozycjiTowarowejOperacjiTranzytowej=src.SIDPozycjiTowarowejOperacjiTranzytowej, tgt.KodInformacjiDodatkowej=src.KodInformacjiDodatkowej
		WHEN NOT MATCHED
		THEN INSERT (SIDInformacjiDodatkowychOTowarach, SIDPozycjiTowarowejOperacjiTranzytowej, KodInformacjiDodatkowej)
		VALUES (src.SIDInformacjiDodatkowychOTowarach, src.SIDPozycjiTowarowejOperacjiTranzytowej, src.KodInformacjiDodatkowej);
		SET @Merged = 1;
	END

	IF @TableName = 'InformacjeoDokumentachTowarow' BEGIN
		MERGE INTO tr.InformacjeoDokumentachTowarow AS tgt
		USING [WA_StageHurtownia].tr.InformacjeoDokumentachTowarow AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IdTypuDokumentu=src.IdTypuDokumentu, tgt.SIDPozycjiTowarowejOperacjiTranzytowej=src.SIDPozycjiTowarowejOperacjiTranzytowej, tgt.DokumentReferencyjny=src.DokumentReferencyjny, tgt.DokumentPoprzedniZalaczony=src.DokumentPoprzedniZalaczony
		WHEN NOT MATCHED
		THEN INSERT (SID, IdTypuDokumentu, SIDPozycjiTowarowejOperacjiTranzytowej, DokumentReferencyjny, DokumentPoprzedniZalaczony)
		VALUES (src.SID, src.IdTypuDokumentu, src.SIDPozycjiTowarowejOperacjiTranzytowej, src.DokumentReferencyjny, src.DokumentPoprzedniZalaczony);
		SET @Merged = 1;
	END

	IF @TableName = 'InformacjeoKontenerachTowarow' BEGIN
		MERGE INTO tr.InformacjeoKontenerachTowarow AS tgt
		USING [WA_StageHurtownia].tr.InformacjeoKontenerachTowarow AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SIDPozycjiTowarowejOperacjiTranzytowej=src.SIDPozycjiTowarowejOperacjiTranzytowej, tgt.NrKontenera=src.NrKontenera
		WHEN NOT MATCHED
		THEN INSERT (SID, SIDPozycjiTowarowejOperacjiTranzytowej, NrKontenera)
		VALUES (src.SID, src.SIDPozycjiTowarowejOperacjiTranzytowej, src.NrKontenera);
		SET @Merged = 1;
	END

	IF @TableName = 'InformacjeoOpakowaniachTowarow' BEGIN
		MERGE INTO tr.InformacjeoOpakowaniachTowarow AS tgt
		USING [WA_StageHurtownia].tr.InformacjeoOpakowaniachTowarow AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.IDTypuOpakowania=src.IDTypuOpakowania, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.LiczbaSztuk=src.LiczbaSztuk, tgt.SIDPozycjiTowarowejOperacjiTranzytowej=src.SIDPozycjiTowarowejOperacjiTranzytowej
		WHEN NOT MATCHED
		THEN INSERT (SID, IDTypuOpakowania, LiczbaOpakowan, LiczbaSztuk, SIDPozycjiTowarowejOperacjiTranzytowej)
		VALUES (src.SID, src.IDTypuOpakowania, src.LiczbaOpakowan, src.LiczbaSztuk, src.SIDPozycjiTowarowejOperacjiTranzytowej);
		SET @Merged = 1;
	END

	IF @TableName = 'UzycieGwarancjiDlaOperacjiTranzytowej' BEGIN
		MERGE INTO tr.UzycieGwarancjiDlaOperacjiTranzytowej AS tgt
		USING [WA_StageHurtownia].tr.UzycieGwarancjiDlaOperacjiTranzytowej AS src
		ON (tgt.SID=src.SID)
		WHEN MATCHED
		THEN UPDATE SET
		tgt.SIDGwarancji=src.SIDGwarancji, tgt.GRN=src.GRN, tgt.NrReferencyjnyZabezpeczenia=src.NrReferencyjnyZabezpeczenia, tgt.GwarancjaNiewaznaWUE=src.GwarancjaNiewaznaWUE, tgt.KwotaGwarancji=src.KwotaGwarancji, tgt.Waluta=src.Waluta, tgt.IDUrzeduGwarancji=src.IDUrzeduGwarancji, tgt.IDKrajuWystawieniaGwarancji=src.IDKrajuWystawieniaGwarancji
		WHEN NOT MATCHED
		THEN INSERT (SID, SIDGwarancji, GRN, NrReferencyjnyZabezpeczenia, GwarancjaNiewaznaWUE, KwotaGwarancji, Waluta, IDUrzeduGwarancji, IDKrajuWystawieniaGwarancji)
		VALUES (src.SID, src.SIDGwarancji, src.GRN, src.NrReferencyjnyZabezpeczenia, src.GwarancjaNiewaznaWUE, src.KwotaGwarancji, src.Waluta, src.IDUrzeduGwarancji, src.IDKrajuWystawieniaGwarancji);
		SET @Merged = 1;
	END
	
	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END
END