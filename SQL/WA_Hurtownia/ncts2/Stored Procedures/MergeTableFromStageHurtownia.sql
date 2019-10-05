




-- ==============================================
-- Author:		Michał Błędowski
-- Create date: 2015-10-27
-- Description:	Procedura Merge'ująca w schemacie NCTS2.
-- ===============================================

CREATE PROCEDURE [ncts2].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
		END

		IF @TableName = 'AnalizaRyzykaDokument' BEGIN
			MERGE INTO ncts2.AnalizaRyzykaDokument AS tgt
			USING [WA_StageHurtownia].ncts2.AnalizaRyzykaDokument AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.NumerDokumentuZISAR=src.NumerDokumentuZISAR, tgt.NumerDokumentuSO=src.NumerDokumentuSO, tgt.SystemOperacyjny=src.SystemOperacyjny, tgt.RodzajDokumentu=src.RodzajDokumentu, tgt.NrTypuKomunikatu=src.NrTypuKomunikatu, tgt.WynikAnalizyRyzyka=src.WynikAnalizyRyzyka, tgt.UCZglaszajacyDoAAR=src.UCZglaszajacyDoAAR, tgt.UCKontroliTowarow=src.UCKontroliTowarow, tgt.MiejsceAnalizy=src.MiejsceAnalizy, tgt.CzasAnalizy=src.CzasAnalizy, tgt.Wersja=src.Wersja, tgt.RolaUrzedu=src.RolaUrzedu, tgt.IdKomunikatu=src.IdKomunikatu, tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej
			WHEN NOT MATCHED
			THEN INSERT (Id, NumerDokumentuZISAR, NumerDokumentuSO, SystemOperacyjny, RodzajDokumentu, NrTypuKomunikatu, WynikAnalizyRyzyka, UCZglaszajacyDoAAR, UCKontroliTowarow, MiejsceAnalizy, CzasAnalizy, Wersja, RolaUrzedu, IdKomunikatu, IdOperacjiTranzytowej)
			VALUES (src.Id, src.NumerDokumentuZISAR, src.NumerDokumentuSO, src.SystemOperacyjny, src.RodzajDokumentu, src.NrTypuKomunikatu, src.WynikAnalizyRyzyka, src.UCZglaszajacyDoAAR, src.UCKontroliTowarow, src.MiejsceAnalizy, src.CzasAnalizy, src.Wersja, src.RolaUrzedu, src.IdKomunikatu, src.IdOperacjiTranzytowej);
			SET @Merged = 1;
		END

		IF @TableName = 'AnalizaRyzykaMetodyKontroli' BEGIN
			MERGE INTO ncts2.AnalizaRyzykaMetodyKontroli AS tgt
			USING [WA_StageHurtownia].ncts2.AnalizaRyzykaMetodyKontroli AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdObslugiWskazanKontroli=src.IdObslugiWskazanKontroli, tgt.PoziomZdefiniowania=src.PoziomZdefiniowania, tgt.MetodaKontroli=src.MetodaKontroli
			WHEN NOT MATCHED
			THEN INSERT (Id, IdObslugiWskazanKontroli, PoziomZdefiniowania, MetodaKontroli)
			VALUES (src.Id, src.IdObslugiWskazanKontroli, src.PoziomZdefiniowania, src.MetodaKontroli);
			SET @Merged = 1;
		END

		IF @TableName = 'AnalizaRyzykaObslugaWskazanKontroli' BEGIN
			MERGE INTO ncts2.AnalizaRyzykaObslugaWskazanKontroli AS tgt
			USING [WA_StageHurtownia].ncts2.AnalizaRyzykaObslugaWskazanKontroli AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdDokumentuAR=src.IdDokumentuAR, tgt.Zrodlo=src.Zrodlo, tgt.NumerAlgorytmu=src.NumerAlgorytmu, tgt.Autor=src.Autor, tgt.War1=src.War1, tgt.War1SO=src.War1SO, tgt.War24=src.War24, tgt.War24SO=src.War24SO, tgt.War5=src.War5, tgt.War5SO=src.War5SO, tgt.ZmianaWarUzasadnienieSO=src.ZmianaWarUzasadnienieSO, tgt.ObszarRyzyka=src.ObszarRyzyka, tgt.ZmianaMetodKontroliUzasadnienieSO=src.ZmianaMetodKontroliUzasadnienieSO, tgt.TrescDyrektywy=src.TrescDyrektywy, tgt.InformacjaDlaDyspozytora=src.InformacjaDlaDyspozytora, tgt.DecyzjaDyspozytoraSO=src.DecyzjaDyspozytoraSO, tgt.OdstapienieOdKontroliUzasadnienieSO=src.OdstapienieOdKontroliUzasadnienieSO, tgt.AdresaciDyrektywySO=src.AdresaciDyrektywySO, tgt.ZalecenieDyspozytoraSO=src.ZalecenieDyspozytoraSO, tgt.DyrektywaDlaKolejnegoUCWprowadzeniaSO=src.DyrektywaDlaKolejnegoUCWprowadzeniaSO, tgt.ZakresPrzebiegKontroliSO=src.ZakresPrzebiegKontroliSO, tgt.WynikKontroliSO=src.WynikKontroliSO, tgt.MetodaAnalizy=src.MetodaAnalizy, tgt.CzyWidocznaWInnychUC=src.CzyWidocznaWInnychUC, tgt.NumerProfiluAlgorytmu=src.NumerProfiluAlgorytmu, tgt.NumerZastrzezenia=src.NumerZastrzezenia, tgt.RolaWystepowaniaPodmiotu=src.RolaWystepowaniaPodmiotu, tgt.PoziomRyzyka=src.PoziomRyzyka, tgt.Status=src.Status, tgt.IdUzytkownikaObslugujacego=src.IdUzytkownikaObslugujacego, tgt.IdUzytkownikaRejestrujacegoWynikKontroli=src.IdUzytkownikaRejestrujacegoWynikKontroli, tgt.KontrolerObszarRyzyka=src.KontrolerObszarRyzyka, tgt.KontrolerPowodZmianyMetody=src.KontrolerPowodZmianyMetody, tgt.DyspozytorPowodZmianyMetody=src.DyspozytorPowodZmianyMetody, tgt.KontrolerWynikKontroli=src.KontrolerWynikKontroli, tgt.KontrolerPrzebiegKontroli=src.KontrolerPrzebiegKontroli, tgt.Segment=src.Segment, tgt.CzasZarejestrowaniaWyniku=src.CzasZarejestrowaniaWyniku, tgt.CzasObslugi=src.CzasObslugi, tgt.Dyspozycja=src.Dyspozycja
			WHEN NOT MATCHED
			THEN INSERT (Id, IdDokumentuAR, Zrodlo, NumerAlgorytmu, Autor, War1, War1SO, War24, War24SO, War5, War5SO, ZmianaWarUzasadnienieSO, ObszarRyzyka, ZmianaMetodKontroliUzasadnienieSO, TrescDyrektywy, InformacjaDlaDyspozytora, DecyzjaDyspozytoraSO, OdstapienieOdKontroliUzasadnienieSO, AdresaciDyrektywySO, ZalecenieDyspozytoraSO, DyrektywaDlaKolejnegoUCWprowadzeniaSO, ZakresPrzebiegKontroliSO, WynikKontroliSO, MetodaAnalizy, CzyWidocznaWInnychUC, NumerProfiluAlgorytmu, NumerZastrzezenia, RolaWystepowaniaPodmiotu, PoziomRyzyka, Status, IdUzytkownikaObslugujacego, IdUzytkownikaRejestrujacegoWynikKontroli, KontrolerObszarRyzyka, KontrolerPowodZmianyMetody, DyspozytorPowodZmianyMetody, KontrolerWynikKontroli, KontrolerPrzebiegKontroli, Segment, CzasZarejestrowaniaWyniku, CzasObslugi, Dyspozycja)
			VALUES (src.Id, src.IdDokumentuAR, src.Zrodlo, src.NumerAlgorytmu, src.Autor, src.War1, src.War1SO, src.War24, src.War24SO, src.War5, src.War5SO, src.ZmianaWarUzasadnienieSO, src.ObszarRyzyka, src.ZmianaMetodKontroliUzasadnienieSO, src.TrescDyrektywy, src.InformacjaDlaDyspozytora, src.DecyzjaDyspozytoraSO, src.OdstapienieOdKontroliUzasadnienieSO, src.AdresaciDyrektywySO, src.ZalecenieDyspozytoraSO, src.DyrektywaDlaKolejnegoUCWprowadzeniaSO, src.ZakresPrzebiegKontroliSO, src.WynikKontroliSO, src.MetodaAnalizy, src.CzyWidocznaWInnychUC, src.NumerProfiluAlgorytmu, src.NumerZastrzezenia, src.RolaWystepowaniaPodmiotu, src.PoziomRyzyka, src.Status, src.IdUzytkownikaObslugujacego, src.IdUzytkownikaRejestrujacegoWynikKontroli, src.KontrolerObszarRyzyka, src.KontrolerPowodZmianyMetody, src.DyspozytorPowodZmianyMetody, src.KontrolerWynikKontroli, src.KontrolerPrzebiegKontroli, src.Segment, src.CzasZarejestrowaniaWyniku, src.CzasObslugi, src.Dyspozycja);
			SET @Merged = 1;
		END

		IF @TableName = 'AnalizaRyzykaObslugaWskazanKontroliPozycje' BEGIN
			MERGE INTO ncts2.AnalizaRyzykaObslugaWskazanKontroliPozycje AS tgt
			USING [WA_StageHurtownia].ncts2.AnalizaRyzykaObslugaWskazanKontroliPozycje AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdObslugiWskazanKontroli=src.IdObslugiWskazanKontroli, tgt.NumerPozycji=src.NumerPozycji
			WHEN NOT MATCHED
			THEN INSERT (Id, IdObslugiWskazanKontroli, NumerPozycji)
			VALUES (src.Id, src.IdObslugiWskazanKontroli, src.NumerPozycji);
			SET @Merged = 1;
		END

		IF @TableName = 'AnalizaRyzykaZespolKontroli' BEGIN
			MERGE INTO ncts2.AnalizaRyzykaZespolKontroli AS tgt
			USING [WA_StageHurtownia].ncts2.AnalizaRyzykaZespolKontroli AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdObslugiWskazanKontroli=src.IdObslugiWskazanKontroli, tgt.Login=src.Login, tgt.RejestratorWynikowZISAR=src.RejestratorWynikowZISAR
			WHEN NOT MATCHED
			THEN INSERT (Id, IdObslugiWskazanKontroli, Login, RejestratorWynikowZISAR)
			VALUES (src.Id, src.IdObslugiWskazanKontroli, src.Login, src.RejestratorWynikowZISAR);
			SET @Merged = 1;
		END

		IF @TableName = 'UzytkownicyUprawnieniaOC' BEGIN
			MERGE INTO ncts2.UzytkownicyUprawnieniaOC AS tgt
			USING [WA_StageHurtownia].ncts2.UzytkownicyUprawnieniaOC AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdUzytkownika=src.IdUzytkownika, tgt.TypUprawnienia=src.TypUprawnienia, tgt.KodUrzedu=src.KodUrzedu
			WHEN NOT MATCHED
			THEN INSERT (Id, IdUzytkownika, TypUprawnienia, KodUrzedu)
			VALUES (src.Id, src.IdUzytkownika, src.TypUprawnienia, src.KodUrzedu);
			SET @Merged = 1;
		END

		IF @TableName = 'OperacjeTranzytowe' BEGIN
			MERGE INTO ncts2.OperacjeTranzytowe AS tgt
			USING [WA_StageHurtownia].ncts2.OperacjeTranzytowe AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.DataUtworzenia=src.DataUtworzenia, tgt.DataModyfikacji=src.DataModyfikacji, tgt.DataZwolnienia=src.DataZwolnienia, tgt.UCWyjscia=src.UCWyjscia, 

tgt.UCPrzeznaczenia=src.UCPrzeznaczenia, tgt.NadawcaNazwa=src.NadawcaNazwa, tgt.NadawcaUlicaNumer=src.NadawcaUlicaNumer, tgt.NadawcaKodPocztowy=src.NadawcaKodPocztowy, 

tgt.NadawcaMiejscowosc=src.NadawcaMiejscowosc, tgt.NadawcaKraj=src.NadawcaKraj, tgt.NadawcaTIN=src.NadawcaTIN, tgt.OdbiorcaNazwa=src.OdbiorcaNazwa, tgt.OdbiorcaUlicaNumer=src.OdbiorcaUlicaNumer, 

tgt.OdbiorcaKodPocztowy=src.OdbiorcaKodPocztowy, tgt.OdbiorcaMiejscowosc=src.OdbiorcaMiejscowosc, tgt.OdbiorcaKraj=src.OdbiorcaKraj, tgt.OdbiorcaTIN=src.OdbiorcaTIN, 

tgt.GlownyZobowiazanyNazwa=src.GlownyZobowiazanyNazwa, tgt.GlownyZobowiazanyUlicaNumer=src.GlownyZobowiazanyUlicaNumer, tgt.GlownyZobowiazanyKodPocztowy=src.GlownyZobowiazanyKodPocztowy, 

tgt.GlownyZobowiazanyMiejscowosc=src.GlownyZobowiazanyMiejscowosc, tgt.GlownyZobowiazanyKraj=src.GlownyZobowiazanyKraj, tgt.GlownyZobowiazanyTIN=src.GlownyZobowiazanyTIN, 

tgt.GlownyZobowiazanyPrzedstawicielTIN=src.GlownyZobowiazanyPrzedstawicielTIN, tgt.UpowaznionyOdbiorcaTIN=src.UpowaznionyOdbiorcaTIN, tgt.TransportRodzaj=src.TransportRodzaj, 

tgt.TransportZnaki=src.TransportZnaki, tgt.TransportKraj=src.TransportKraj, tgt.TransportNaGranicyRodzaj=src.TransportNaGranicyRodzaj, tgt.TransportNaGranicyZnaki=src.TransportNaGranicyZnaki, 

tgt.TransportNaGranicyKraj=src.TransportNaGranicyKraj, tgt.WynikKontroliKod=src.WynikKontroliKod, tgt.WynikKontroliTerminDostarczenia=src.WynikKontroliTerminDostarczenia, 

tgt.ZamknieciaCelneIlosc=src.ZamknieciaCelneIlosc, tgt.ZamknieciaCelneNakladajacy=src.ZamknieciaCelneNakladajacy, tgt.BezpieczenstwoSpecWarunki=src.BezpieczenstwoSpecWarunki, 

tgt.BezpieczenstwoFormaPlatnosci=src.BezpieczenstwoFormaPlatnosci, tgt.BezpieczenstwoNrReferencyjnyPrzesylki=src.BezpieczenstwoNrReferencyjnyPrzesylki, 

tgt.BezpieczenstwoNrReferencyjnyPrzewozu=src.BezpieczenstwoNrReferencyjnyPrzewozu, tgt.BezpieczenstwoMiejsceRozladunku=src.BezpieczenstwoMiejsceRozladunku, 

tgt.BezpieczenstwoNadawcaNazwa=src.BezpieczenstwoNadawcaNazwa, tgt.BezpieczenstwoNadawcaUlicaNumer=src.BezpieczenstwoNadawcaUlicaNumer, 

tgt.BezpieczenstwoNadawcaKodPocztowy=src.BezpieczenstwoNadawcaKodPocztowy, tgt.BezpieczenstwoNadawcaMiejscowosc=src.BezpieczenstwoNadawcaMiejscowosc, 

tgt.BezpieczenstwoNadawcaKraj=src.BezpieczenstwoNadawcaKraj, tgt.BezpieczenstwoNadawcaTIN=src.BezpieczenstwoNadawcaTIN, tgt.BezpieczenstwoOdbiorcaNazwa=src.BezpieczenstwoOdbiorcaNazwa, 

tgt.BezpieczenstwoOdbiorcaUlicaNumer=src.BezpieczenstwoOdbiorcaUlicaNumer, tgt.BezpieczenstwoOdbiorcaKodPocztowy=src.BezpieczenstwoOdbiorcaKodPocztowy, 

tgt.BezpieczenstwoOdbiorcaMiejscowosc=src.BezpieczenstwoOdbiorcaMiejscowosc, tgt.BezpieczenstwoOdbiorcaKraj=src.BezpieczenstwoOdbiorcaKraj, 

tgt.BezpieczenstwoOdbiorcaTIN=src.BezpieczenstwoOdbiorcaTIN, tgt.BezpieczenstwoPrzewoznikNazwa=src.BezpieczenstwoPrzewoznikNazwa, 

tgt.BezpieczenstwoPrzewoznikUlicaNumer=src.BezpieczenstwoPrzewoznikUlicaNumer, tgt.BezpieczenstwoPrzewoznikKodPocztowy=src.BezpieczenstwoPrzewoznikKodPocztowy, 

tgt.BezpieczenstwoPrzewoznikMiejscowosc=src.BezpieczenstwoPrzewoznikMiejscowosc, tgt.BezpieczenstwoPrzewoznikKraj=src.BezpieczenstwoPrzewoznikKraj, 

tgt.BezpieczenstwoPrzewoznikTIN=src.BezpieczenstwoPrzewoznikTIN, tgt.IE015ZgloszenieData=src.IE015ZgloszenieData, tgt.TypDeklaracji=src.TypDeklaracji, tgt.LiczbaPozycji=src.LiczbaPozycji, 

tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.KrajWysylki=src.KrajWysylki, tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.MasaBrutto=src.MasaBrutto, tgt.MiejsceZaladunku=src.MiejsceZaladunku, 

tgt.ProceduraUproszczonaUCWyjscia=src.ProceduraUproszczonaUCWyjscia, tgt.GlownyZobowiazanyTirholder=src.GlownyZobowiazanyTirholder, tgt.Kontenery=src.Kontenery, tgt.LRN=src.LRN, tgt.MRN=src.MRN, 

tgt.StatusUCPrzeznaczeniaData=src.StatusUCPrzeznaczeniaData, tgt.StatusAnalizyRyzykaUCWyjscia=src.StatusAnalizyRyzykaUCWyjscia, tgt.FlagaStopUCWyjscia=src.FlagaStopUCWyjscia, 

tgt.StatusUCWyjscia=src.StatusUCWyjscia, tgt.DataZmianyStatusuUCWyjscia=src.DataZmianyStatusuUCWyjscia,tgt.IE015ZgloszenieMiejsce=src.IE015ZgloszenieMiejsce, 

tgt.IE015ZgloszenieNazwiskoImie=src.IE015ZgloszenieNazwiskoImie, tgt.IE015ZgloszenieStanowisko=src.IE015ZgloszenieStanowisko, tgt.MiejsceUznane=src.MiejsceUznane, 

tgt.RyzykoUCWyjscia=src.RyzykoUCWyjscia, tgt.RyzykoUCPrzeznaczenia=src.RyzykoUCPrzeznaczenia, tgt.DataDokonania=src.DataDokonania, tgt.WiazacaTrasaPrzewozu=src.WiazacaTrasaPrzewozu, 

tgt.OdpNaZapytanieOPrzesylke=src.OdpNaZapytanieOPrzesylke, tgt.PrzedstawiajacyNazwa=src.PrzedstawiajacyNazwa, tgt.PrzedstawiajacyUlicaNumer=src.PrzedstawiajacyUlicaNumer, 

tgt.PrzedstawiajacyKodPocztowy=src.PrzedstawiajacyKodPocztowy, tgt.PrzedstawiajacyMiejscowosc=src.PrzedstawiajacyMiejscowosc, tgt.PrzedstawiajacyKraj=src.PrzedstawiajacyKraj, 

tgt.PrzedstawiajacyTIN=src.PrzedstawiajacyTIN, tgt.StatusAnalizyRyzykaUCPrzeznaczenia=src.StatusAnalizyRyzykaUCPrzeznaczenia, tgt.TowaryWrazliwe=src.TowaryWrazliwe, 

tgt.KomunikacjaPodmiotWyjscia=src.KomunikacjaPodmiotWyjscia, tgt.KomunikacjaKrajWyjscia=src.KomunikacjaKrajWyjscia, tgt.KomunikacjaPodmiotPrzeznaczenia=src.KomunikacjaPodmiotPrzeznaczenia, 

tgt.KomunikacjaKrajPrzeznaczenia = src.KomunikacjaKrajPrzeznaczenia, tgt.ProceduraUproszczonaUCPrzeznaczenia = src.ProceduraUproszczonaUCPrzeznaczenia, tgt.DataPrzyjecia=src.DataPrzyjecia, 

tgt.StatusUCPrzeznaczenia=src.StatusUCPrzeznaczenia, tgt.NrKarnetuTIR=src.NrKarnetuTIR, tgt.PrzedstawiajacyPrzedstawicielTIN=src.PrzedstawiajacyPrzedstawicielTIN, 

tgt.UCPrzeznaczeniaDeklarowany=src.UCPrzeznaczeniaDeklarowany, tgt.DataPrzybycia=src.DataPrzybycia, tgt.FlagaUniewaznienieUCWyjscia=src.FlagaUniewaznienieUCWyjscia, tgt.JezykTDT=src.JezykTDT, 

tgt.DataKontroli=src.DataKontroli, tgt.Bezpieczenstwo=src.Bezpieczenstwo, tgt.FlagaAEO=src.FlagaAEO, tgt.FlagaRejGwarUCWyjscia=src.FlagaRejGwarUCWyjscia, tgt.MiejscePrzybycia=src.MiejscePrzybycia, 

tgt.FlagaGlowZobPozwNaProcUpro=src.FlagaGlowZobPozwNaProcUpro, tgt.GlownyZobowiazanyPrzedstawicielNazwa=src.GlownyZobowiazanyPrzedstawicielNazwa, 

tgt.GlownyZobowiazanyPrzedstawicieUlicaNumer=src.GlownyZobowiazanyPrzedstawicieUlicaNumer, tgt.GlownyZobowiazanyPrzedstawicielKodPocztowy=src.GlownyZobowiazanyPrzedstawicielKodPocztowy, 

tgt.GlownyZobowiazanyPrzedstawicielMiejscowosc= src.GlownyZobowiazanyPrzedstawicielMiejscowosc, tgt.GlownyZobowiazanyPrzedstawicielKraj=src.GlownyZobowiazanyPrzedstawicielKraj, 

tgt.TransportZnakiJezyk=src.TransportZnakiJezyk, tgt.FlagaUniewaznienieAES=src.FlagaUniewaznienieAES, tgt.FlagaOstrzezenia=src.FlagaOstrzezenia, 

tgt.PrzedstawiajacyNrPozwolenia=src.PrzedstawiajacyNrPozwolenia
			WHEN NOT MATCHED
			THEN INSERT (Id, DataUtworzenia, DataModyfikacji, DataZwolnienia, UCWyjscia, UCPrzeznaczenia, NadawcaNazwa, NadawcaUlicaNumer, NadawcaKodPocztowy, NadawcaMiejscowosc, 

NadawcaKraj, NadawcaTIN, OdbiorcaNazwa, OdbiorcaUlicaNumer, OdbiorcaKodPocztowy, OdbiorcaMiejscowosc, OdbiorcaKraj, OdbiorcaTIN, GlownyZobowiazanyNazwa, GlownyZobowiazanyUlicaNumer, 

GlownyZobowiazanyKodPocztowy, GlownyZobowiazanyMiejscowosc, GlownyZobowiazanyKraj, GlownyZobowiazanyTIN, GlownyZobowiazanyPrzedstawicielTIN, UpowaznionyOdbiorcaTIN, TransportRodzaj, 

TransportZnaki, TransportKraj, TransportNaGranicyRodzaj, TransportNaGranicyZnaki, TransportNaGranicyKraj, WynikKontroliKod, WynikKontroliTerminDostarczenia, ZamknieciaCelneIlosc, 

ZamknieciaCelneNakladajacy, BezpieczenstwoSpecWarunki, BezpieczenstwoFormaPlatnosci, BezpieczenstwoNrReferencyjnyPrzesylki, BezpieczenstwoNrReferencyjnyPrzewozu, BezpieczenstwoMiejsceRozladunku, 

BezpieczenstwoNadawcaNazwa, BezpieczenstwoNadawcaUlicaNumer, BezpieczenstwoNadawcaKodPocztowy, BezpieczenstwoNadawcaMiejscowosc, BezpieczenstwoNadawcaKraj, BezpieczenstwoNadawcaTIN, 

BezpieczenstwoOdbiorcaNazwa, BezpieczenstwoOdbiorcaUlicaNumer, BezpieczenstwoOdbiorcaKodPocztowy, BezpieczenstwoOdbiorcaMiejscowosc, BezpieczenstwoOdbiorcaKraj, BezpieczenstwoOdbiorcaTIN, 

BezpieczenstwoPrzewoznikNazwa, BezpieczenstwoPrzewoznikUlicaNumer, BezpieczenstwoPrzewoznikKodPocztowy, BezpieczenstwoPrzewoznikMiejscowosc, BezpieczenstwoPrzewoznikKraj, 

BezpieczenstwoPrzewoznikTIN, IE015ZgloszenieData, TypDeklaracji, LiczbaPozycji, LiczbaOpakowan, KrajWysylki, KrajPrzeznaczenia, MasaBrutto, MiejsceZaladunku, ProceduraUproszczonaUCWyjscia, 

GlownyZobowiazanyTirholder, Kontenery, LRN, MRN, StatusUCPrzeznaczeniaData, StatusAnalizyRyzykaUCWyjscia, FlagaStopUCWyjscia, StatusUCWyjscia, DataZmianyStatusuUCWyjscia, IE015ZgloszenieMiejsce, 

IE015ZgloszenieNazwiskoImie, IE015ZgloszenieStanowisko, MiejsceUznane, RyzykoUCWyjscia, RyzykoUCPrzeznaczenia, DataDokonania, WiazacaTrasaPrzewozu, OdpNaZapytanieOPrzesylke, PrzedstawiajacyNazwa, 

PrzedstawiajacyUlicaNumer, PrzedstawiajacyKodPocztowy, PrzedstawiajacyMiejscowosc, PrzedstawiajacyKraj, PrzedstawiajacyTIN, StatusAnalizyRyzykaUCPrzeznaczenia, TowaryWrazliwe, 

KomunikacjaPodmiotWyjscia, KomunikacjaKrajWyjscia, KomunikacjaPodmiotPrzeznaczenia, KomunikacjaKrajPrzeznaczenia, ProceduraUproszczonaUCPrzeznaczenia, DataPrzyjecia, StatusUCPrzeznaczenia, 

NrKarnetuTIR, PrzedstawiajacyPrzedstawicielTIN, UCPrzeznaczeniaDeklarowany, DataPrzybycia, FlagaUniewaznienieUCWyjscia, JezykTDT, DataKontroli, Bezpieczenstwo, FlagaAEO, FlagaRejGwarUCWyjscia, 

MiejscePrzybycia, FlagaGlowZobPozwNaProcUpro, GlownyZobowiazanyPrzedstawicielNazwa, GlownyZobowiazanyPrzedstawicieUlicaNumer, GlownyZobowiazanyPrzedstawicielKodPocztowy, 

GlownyZobowiazanyPrzedstawicielMiejscowosc, GlownyZobowiazanyPrzedstawicielKraj, TransportZnakiJezyk, FlagaUniewaznienieAES, FlagaOstrzezenia, PrzedstawiajacyNrPozwolenia)
			VALUES (src.Id, src.DataUtworzenia, src.DataModyfikacji, src.DataZwolnienia, src.UCWyjscia, src.UCPrzeznaczenia, src.NadawcaNazwa, src.NadawcaUlicaNumer, 

src.NadawcaKodPocztowy, src.NadawcaMiejscowosc, src.NadawcaKraj, src.NadawcaTIN, src.OdbiorcaNazwa, src.OdbiorcaUlicaNumer, src.OdbiorcaKodPocztowy, src.OdbiorcaMiejscowosc, src.OdbiorcaKraj, 

src.OdbiorcaTIN, src.GlownyZobowiazanyNazwa, src.GlownyZobowiazanyUlicaNumer, src.GlownyZobowiazanyKodPocztowy, src.GlownyZobowiazanyMiejscowosc, src.GlownyZobowiazanyKraj, 

src.GlownyZobowiazanyTIN, src.GlownyZobowiazanyPrzedstawicielTIN, src.UpowaznionyOdbiorcaTIN, src.TransportRodzaj, src.TransportZnaki, src.TransportKraj, src.TransportNaGranicyRodzaj, 

src.TransportNaGranicyZnaki, src.TransportNaGranicyKraj, src.WynikKontroliKod, src.WynikKontroliTerminDostarczenia, src.ZamknieciaCelneIlosc, src.ZamknieciaCelneNakladajacy, 

src.BezpieczenstwoSpecWarunki, src.BezpieczenstwoFormaPlatnosci, src.BezpieczenstwoNrReferencyjnyPrzesylki, src.BezpieczenstwoNrReferencyjnyPrzewozu, src.BezpieczenstwoMiejsceRozladunku, 

src.BezpieczenstwoNadawcaNazwa, src.BezpieczenstwoNadawcaUlicaNumer, src.BezpieczenstwoNadawcaKodPocztowy, src.BezpieczenstwoNadawcaMiejscowosc, src.BezpieczenstwoNadawcaKraj, 

src.BezpieczenstwoNadawcaTIN, src.BezpieczenstwoOdbiorcaNazwa, src.BezpieczenstwoOdbiorcaUlicaNumer, src.BezpieczenstwoOdbiorcaKodPocztowy, src.BezpieczenstwoOdbiorcaMiejscowosc, 

src.BezpieczenstwoOdbiorcaKraj, src.BezpieczenstwoOdbiorcaTIN, src.BezpieczenstwoPrzewoznikNazwa, src.BezpieczenstwoPrzewoznikUlicaNumer, src.BezpieczenstwoPrzewoznikKodPocztowy, 

src.BezpieczenstwoPrzewoznikMiejscowosc, src.BezpieczenstwoPrzewoznikKraj, src.BezpieczenstwoPrzewoznikTIN, src.IE015ZgloszenieData, src.TypDeklaracji, src.LiczbaPozycji, src.LiczbaOpakowan, 

src.KrajWysylki, src.KrajPrzeznaczenia, src.MasaBrutto, src.MiejsceZaladunku, src.ProceduraUproszczonaUCWyjscia, src.GlownyZobowiazanyTirholder, src.Kontenery, src.LRN, src.MRN, 

src.StatusUCPrzeznaczeniaData, src.StatusAnalizyRyzykaUCWyjscia, src.FlagaStopUCWyjscia, src.StatusUCWyjscia, src.DataZmianyStatusuUCWyjscia, src.IE015ZgloszenieMiejsce, 

src.IE015ZgloszenieNazwiskoImie, src.IE015ZgloszenieStanowisko, src.MiejsceUznane, src.RyzykoUCWyjscia, src.RyzykoUCPrzeznaczenia, src.DataDokonania, src.WiazacaTrasaPrzewozu, 

src.OdpNaZapytanieOPrzesylke, src.PrzedstawiajacyNazwa, src.PrzedstawiajacyUlicaNumer, src.PrzedstawiajacyKodPocztowy, src.PrzedstawiajacyMiejscowosc, src.PrzedstawiajacyKraj, 

src.PrzedstawiajacyTIN, src.StatusAnalizyRyzykaUCPrzeznaczenia, src.TowaryWrazliwe, src.KomunikacjaPodmiotWyjscia, src.KomunikacjaKrajWyjscia, src.KomunikacjaPodmiotPrzeznaczenia, 

src.KomunikacjaKrajPrzeznaczenia, src.ProceduraUproszczonaUCPrzeznaczenia, src.DataPrzyjecia, src.StatusUCPrzeznaczenia, src.NrKarnetuTIR, src.PrzedstawiajacyPrzedstawicielTIN, 

src.UCPrzeznaczeniaDeklarowany, src.DataPrzybycia, src.FlagaUniewaznienieUCWyjscia, src.JezykTDT, src.DataKontroli, src.Bezpieczenstwo, src.FlagaAEO, src.FlagaRejGwarUCWyjscia, 

src.MiejscePrzybycia, src.FlagaGlowZobPozwNaProcUpro, src.GlownyZobowiazanyPrzedstawicielNazwa, src.GlownyZobowiazanyPrzedstawicieUlicaNumer, src.GlownyZobowiazanyPrzedstawicielKodPocztowy, 

src.GlownyZobowiazanyPrzedstawicielMiejscowosc, src.GlownyZobowiazanyPrzedstawicielKraj, src.TransportZnakiJezyk, src.FlagaUniewaznienieAES, src.FlagaOstrzezenia, src.PrzedstawiajacyNrPozwolenia);
			SET @Merged = 1;
		END

		IF @TableName = 'RefPodmioty' BEGIN
			MERGE INTO ncts2.RefPodmioty AS tgt
			USING [WA_StageHurtownia].ncts2.RefPodmioty AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdSISC=src.IdSISC, tgt.NumerEORI=src.NumerEORI, tgt.Imie=src.Imie, tgt.Nazwisko=src.Nazwisko, tgt.NazwaPelna=src.NazwaPelna, tgt.NazwaSkrocona=src.NazwaSkrocona, 

tgt.AdresUlica=src.AdresUlica, tgt.AdresKodPocztowy=src.AdresKodPocztowy, tgt.AdresMiejscowosc=src.AdresMiejscowosc, tgt.AdresKodKraju=src.AdresKodKraju, tgt.AdresKodJezyka=src.AdresKodJezyka, 

tgt.AdresTelefon=src.AdresTelefon, tgt.AdresFax=src.AdresFax, tgt.AdresEmail=src.AdresEmail, tgt.DataOd=src.DataOd, tgt.DataDo=src.DataDo
			WHEN NOT MATCHED
			THEN INSERT (Id, IdSISC, NumerEORI, Imie, Nazwisko, NazwaPelna, NazwaSkrocona, AdresUlica, AdresKodPocztowy, AdresMiejscowosc, AdresKodKraju, AdresKodJezyka, AdresTelefon, 

AdresFax, AdresEmail, DataOd, DataDo)
			VALUES (src.Id, src.IdSISC, src.NumerEORI, src.Imie, src.Nazwisko, src.NazwaPelna, src.NazwaSkrocona, src.AdresUlica, src.AdresKodPocztowy, src.AdresMiejscowosc, 

src.AdresKodKraju, src.AdresKodJezyka, src.AdresTelefon, src.AdresFax, src.AdresEmail, src.DataOd, src.DataDo);
			SET @Merged = 1;
		END

		IF @TableName = 'RefPodmiotyAEO' BEGIN
			MERGE INTO ncts2.RefPodmiotyAEO AS tgt
			USING [WA_StageHurtownia].ncts2.RefPodmiotyAEO AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdSISC=src.IdSISC, tgt.Numer=src.Numer, tgt.DataObowiazywania=src.DataObowiazywania, tgt.WazneOd=src.WazneOd, tgt.WazneDo=src.WazneDo
			WHEN NOT MATCHED
			THEN INSERT (Id, IdSISC, Numer, DataObowiazywania, WazneOd, WazneDo)
			VALUES (src.Id, src.IdSISC, src.Numer, src.DataObowiazywania, src.WazneOd, src.WazneDo);
			SET @Merged = 1;
		END

		IF @TableName = 'RefPozwolNaProcUproszcz' BEGIN
			MERGE INTO ncts2.RefPozwolNaProcUproszcz AS tgt
			USING [WA_StageHurtownia].ncts2.RefPozwolNaProcUproszcz AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdSISC=src.IdSISC, tgt.NumerPozwolenia=src.NumerPozwolenia, tgt.FormaProceduryUproszczonej=src.FormaProceduryUproszczonej, tgt.WazneOd=src.WazneOd, tgt.Status=src.Status, tgt.DataZawieszenia=src.DataZawieszenia, tgt.DataWaznosciOdRekordu=src.DataWaznosciOdRekordu, tgt.DataWaznosciDoRekordu=src.DataWaznosciDoRekordu, tgt.NumerKlucz=src.NumerKlucz
			WHEN NOT MATCHED
			THEN INSERT (Id, IdSISC, NumerPozwolenia, FormaProceduryUproszczonej, WazneOd, Status, DataZawieszenia, DataWaznosciOdRekordu, DataWaznosciDoRekordu, NumerKlucz)
			VALUES (src.Id, src.IdSISC, src.NumerPozwolenia, src.FormaProceduryUproszczonej, src.WazneOd, src.Status, src.DataZawieszenia, src.DataWaznosciOdRekordu, src.DataWaznosciDoRekordu, src.NumerKlucz);
		SET @Merged = 1;
		END

		IF @TableName = 'RefReprezentanci' BEGIN
			MERGE INTO ncts2.RefReprezentanci AS tgt
			USING [WA_StageHurtownia].ncts2.RefReprezentanci AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.Imie=src.Imie, tgt.Nazwisko=src.Nazwisko, tgt.DataOd=src.DataOd, tgt.DataDo=src.DataDo, tgt.IDSISCRof=src.IDSISCRof, tgt.Status=src.Status, tgt.PESEL=src.PESEL
			WHEN NOT MATCHED
			THEN INSERT (Id, Imie, Nazwisko, DataOd, DataDo, IDSISCRof, Status, PESEL)
			VALUES (src.Id, src.Imie, src.Nazwisko, src.DataOd, src.DataDo, src.IDSISCRof, src.Status, src.PESEL);
			SET @Merged = 1;
		END

		IF @TableName = 'RefUrzCel' BEGIN
			MERGE INTO ncts2.RefUrzCel AS tgt
			USING [WA_StageHurtownia].ncts2.RefUrzCel AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.KodUC=src.KodUC, tgt.KodUCGlowneBiuro=src.KodUCGlowneBiuro, tgt.KodUCWyzszyOrgan=src.KodUCWyzszyOrgan, tgt.KodUCPrzejecia=src.KodUCPrzejecia, 

tgt.KodUCPoszukiwania=src.KodUCPoszukiwania, tgt.KodUCPoboru=src.KodUCPoboru, tgt.KodKraju=src.KodKraju, tgt.KodMiasta=src.KodMiasta, tgt.KodRegionu=src.KodRegionu, 

tgt.DataWejsciaNCTS=src.DataWejsciaNCTS, tgt.NajblizszyUrzad=src.NajblizszyUrzad, tgt.KodPocztowy=src.KodPocztowy, tgt.Fax=src.Fax, tgt.Telefon=src.Telefon, tgt.Telex=src.Telex, 

tgt.AdresEmail=src.AdresEmail, tgt.KodPolozeniaGeograficznego=src.KodPolozeniaGeograficznego, tgt.PodmiotPrzeznaczenia=src.PodmiotPrzeznaczenia, tgt.WaznyOd=src.WaznyOd, tgt.WaznyDo=src.WaznyDo
			WHEN NOT MATCHED
			THEN INSERT (Id, KodUC, KodUCGlowneBiuro, KodUCWyzszyOrgan, KodUCPrzejecia, KodUCPoszukiwania, KodUCPoboru, KodKraju, KodMiasta, KodRegionu, DataWejsciaNCTS, 

NajblizszyUrzad, KodPocztowy, Fax, Telefon, Telex, AdresEmail, KodPolozeniaGeograficznego, PodmiotPrzeznaczenia, WaznyOd, WaznyDo)
			VALUES (src.Id, src.KodUC, src.KodUCGlowneBiuro, src.KodUCWyzszyOrgan, src.KodUCPrzejecia, src.KodUCPoszukiwania, src.KodUCPoboru, src.KodKraju, src.KodMiasta, 

src.KodRegionu, src.DataWejsciaNCTS, src.NajblizszyUrzad, src.KodPocztowy, src.Fax, src.Telefon, src.Telex, src.AdresEmail, src.KodPolozeniaGeograficznego, src.PodmiotPrzeznaczenia, src.WaznyOd, 

src.WaznyDo);
			SET @Merged = 1;
		END

		IF @TableName = 'SafeTIRRejAwaryjne' BEGIN
			MERGE INTO ncts2.SafeTIRRejAwaryjne AS tgt
			USING [WA_StageHurtownia].ncts2.SafeTIRRejAwaryjne AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.NumerKarnetuTIR=src.NumerKarnetuTIR, tgt.MRN=src.MRN, tgt.KodUC=src.KodUC, tgt.Status=src.Status, tgt.DataKontroli=src.DataKontroli, 

tgt.NumerStronyKarnetuTIR=src.NumerStronyKarnetuTIR, tgt.TypRozladunku=src.TypRozladunku, tgt.NumerRozladunku=src.NumerRozladunku, tgt.ZwolnienieZastrzezenia=src.ZwolnienieZastrzezenia, 

tgt.IdKomunkatuUtworzenia=src.IdKomunkatuUtworzenia, tgt.IdKomunikatuUsuniecia=src.IdKomunikatuUsuniecia, tgt.AwaryjnyNumerReferencyjny=src.AwaryjnyNumerReferencyjny, 

tgt.StatusData=src.StatusData, tgt.KodBledu=src.KodBledu, tgt.IdUzytkownika=src.IdUzytkownika
			WHEN NOT MATCHED
			THEN INSERT (Id, NumerKarnetuTIR, MRN, KodUC, Status, DataKontroli, NumerStronyKarnetuTIR, TypRozladunku, NumerRozladunku, ZwolnienieZastrzezenia, IdKomunkatuUtworzenia, 

IdKomunikatuUsuniecia, AwaryjnyNumerReferencyjny, StatusData, KodBledu, IdUzytkownika)
			VALUES (src.Id, src.NumerKarnetuTIR, src.MRN, src.KodUC, src.Status, src.DataKontroli, src.NumerStronyKarnetuTIR, src.TypRozladunku, src.NumerRozladunku, 

src.ZwolnienieZastrzezenia, src.IdKomunkatuUtworzenia, src.IdKomunikatuUsuniecia, src.AwaryjnyNumerReferencyjny, src.StatusData, src.KodBledu, src.IdUzytkownika);
			SET @Merged = 1;
		END

		IF @TableName = 'SlownikiTypy' BEGIN
			MERGE INTO ncts2.SlownikiTypy AS tgt
			USING [WA_StageHurtownia].ncts2.SlownikiTypy AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.Nazwa=src.Nazwa, tgt.IdDDNTA=src.IdDDNTA, tgt.IdPDR=src.IdPDR
			WHEN NOT MATCHED
			THEN INSERT (Id, Nazwa, IdDDNTA, IdPDR)
			VALUES (src.Id, src.Nazwa, src.IdDDNTA, src.IdPDR);
			SET @Merged = 1;
		END

		IF @TableName = 'TrasyPrzewozu' BEGIN
			MERGE INTO ncts2.TrasyPrzewozu AS tgt
			USING [WA_StageHurtownia].ncts2.TrasyPrzewozu AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.Trasa=src.Trasa
			WHEN NOT MATCHED
			THEN INSERT (IdOperacjiTranzytowej, Trasa, Id)
			VALUES (src.IdOperacjiTranzytowej, src.Trasa, src.Id);
			SET @Merged = 1;
		END

		IF @TableName = 'UpowOdbiorca' BEGIN
			MERGE INTO ncts2.UpowOdbiorca AS tgt
			USING [WA_StageHurtownia].ncts2.UpowOdbiorca AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.DataZapytania=src.DataZapytania, tgt.DataOdpowiedzi=src.DataOdpowiedzi, tgt.Status=src.Status, tgt.TIN=src.TIN, tgt.UrzadPytany=src.UrzadPytany, 

tgt.IdKomunikatZapytania=src.IdKomunikatZapytania, tgt.IdKomunikatOdpowiedzi=src.IdKomunikatOdpowiedzi, tgt.KodOdpowiedzi=src.KodOdpowiedzi, tgt.UrzadPytajacy=src.UrzadPytajacy
			WHEN NOT MATCHED
			THEN INSERT (Id, DataZapytania, DataOdpowiedzi, Status, TIN, UrzadPytany, IdKomunikatZapytania, IdKomunikatOdpowiedzi, KodOdpowiedzi, UrzadPytajacy)
			VALUES (src.Id, src.DataZapytania, src.DataOdpowiedzi, src.Status, src.TIN, src.UrzadPytany, src.IdKomunikatZapytania, src.IdKomunikatOdpowiedzi, src.KodOdpowiedzi, 

src.UrzadPytajacy);
			SET @Merged = 1;
		END

		IF @TableName = 'ZapytaniaOGwarancje' BEGIN
			MERGE INTO ncts2.ZapytaniaOGwarancje AS tgt
			USING [WA_StageHurtownia].ncts2.ZapytaniaOGwarancje AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.DataUtworzenia=src.DataUtworzenia, tgt.IdKomunikatZapytania=src.IdKomunikatZapytania, tgt.IdKomunikatOdpowiedzi=src.IdKomunikatOdpowiedzi, 

tgt.IdKomunikatZapytaniaOSOZ=src.IdKomunikatZapytaniaOSOZ, tgt.IdKomunikatOdpowiedziOSOZ=src.IdKomunikatOdpowiedziOSOZ, tgt.KomunikacjaOdbiorcaNTA=src.KomunikacjaOdbiorcaNTA, 

tgt.KodUCPytajacego=src.KodUCPytajacego
			WHEN NOT MATCHED
			THEN INSERT (Id, DataUtworzenia, IdKomunikatZapytania, IdKomunikatOdpowiedzi, IdKomunikatZapytaniaOSOZ, IdKomunikatOdpowiedziOSOZ, KomunikacjaOdbiorcaNTA, KodUCPytajacego)
			VALUES (src.Id, src.DataUtworzenia, src.IdKomunikatZapytania, src.IdKomunikatOdpowiedzi, src.IdKomunikatZapytaniaOSOZ, src.IdKomunikatOdpowiedziOSOZ, 

src.KomunikacjaOdbiorcaNTA, src.KodUCPytajacego);
			SET @Merged = 1;
		END

		IF @TableName = 'ZapytaniaOPrzesylki' BEGIN
			MERGE INTO ncts2.ZapytaniaOPrzesylki AS tgt
			USING [WA_StageHurtownia].ncts2.ZapytaniaOPrzesylki AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.MRN=src.MRN, tgt.DataUtworzenia=src.DataUtworzenia, tgt.DataOdpowiedzi=src.DataOdpowiedzi, tgt.StatusOdpowiedzi=src.StatusOdpowiedzi, 

tgt.IdUzytkownika=src.IdUzytkownika, tgt.UCPrzedstawieniaZapytania=src.UCPrzedstawieniaZapytania, tgt.[UCWyslaniaZapytania ] =src.[UCWyslaniaZapytania ], 

tgt.IdKomunikatuZapytaniaIE027=src.IdKomunikatuZapytaniaIE027, tgt.IdKomunikatuOdpowiedziIE038=src.IdKomunikatuOdpowiedziIE038, 

tgt.ZapytanieDodatkInformOPrzesylce=src.ZapytanieDodatkInformOPrzesylce, tgt.OdpowiedzDodatkInformOPrzesylce=src.OdpowiedzDodatkInformOPrzesylce, 

tgt.PoinformowanoOPrzeladunku=src.PoinformowanoOPrzeladunku, tgt.PoinformowanoOZdarzeniu=src.PoinformowanoOZdarzeniu
			WHEN NOT MATCHED
			THEN INSERT (Id, MRN, DataUtworzenia, DataOdpowiedzi, StatusOdpowiedzi, IdUzytkownika, UCPrzedstawieniaZapytania, [UCWyslaniaZapytania ] , IdKomunikatuZapytaniaIE027, 

IdKomunikatuOdpowiedziIE038, ZapytanieDodatkInformOPrzesylce, OdpowiedzDodatkInformOPrzesylce, PoinformowanoOPrzeladunku, PoinformowanoOZdarzeniu)
			VALUES (src.Id, src.MRN, src.DataUtworzenia, src.DataOdpowiedzi, src.StatusOdpowiedzi, src.IdUzytkownika, src.UCPrzedstawieniaZapytania, src.[UCWyslaniaZapytania ], 

src.IdKomunikatuZapytaniaIE027, src.IdKomunikatuOdpowiedziIE038, src.ZapytanieDodatkInformOPrzesylce, src.OdpowiedzDodatkInformOPrzesylce, src.PoinformowanoOPrzeladunku, 

src.PoinformowanoOZdarzeniu);
			SET @Merged = 1;
		END

		IF @TableName = 'HistoriaZmianTowarow' BEGIN
			MERGE INTO ncts2.HistoriaZmianTowarow AS tgt
			USING [WA_StageHurtownia].ncts2.HistoriaZmianTowarow AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.Wersja=src.Wersja, tgt.CalkowitaLiczbaSztuk=src.CalkowitaLiczbaSztuk, tgt.CalkowitaLiczbaOpakowan=src.CalkowitaLiczbaOpakowan, 

tgt.CalkowitaMasaBrutto=src.CalkowitaMasaBrutto, tgt.IdPozycji=src.IdPozycji, tgt.KodTowarowy=src.KodTowarowy, tgt.OpisTowaru=src.OpisTowaru, tgt.LiczbaOpakowan=src.LiczbaOpakowan, 

tgt.LiczbaSztuk=src.LiczbaSztuk, tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.IdKomunikatu=src.IdKomunikatu, tgt.MasaBrutto=src.MasaBrutto
			WHEN NOT MATCHED
			THEN INSERT (Id, Wersja, CalkowitaLiczbaSztuk, CalkowitaLiczbaOpakowan, CalkowitaMasaBrutto, IdPozycji, KodTowarowy, OpisTowaru, LiczbaOpakowan, LiczbaSztuk, 

IdOperacjiTranzytowej, IdKomunikatu, MasaBrutto)
			VALUES (src.Id, src.Wersja, src.CalkowitaLiczbaSztuk, src.CalkowitaLiczbaOpakowan, src.CalkowitaMasaBrutto, src.IdPozycji, src.KodTowarowy, src.OpisTowaru, 

src.LiczbaOpakowan, src.LiczbaSztuk, src.IdOperacjiTranzytowej, src.IdKomunikatu, src.MasaBrutto);
			SET @Merged = 1;
		END

		IF @TableName = 'KrajeWyslaneInfoOTranzycie' BEGIN
			MERGE INTO ncts2.KrajeWyslaneInfoOTranzycie AS tgt
			USING [WA_StageHurtownia].ncts2.KrajeWyslaneInfoOTranzycie AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.KodKraju=src.KodKraju, tgt.UrzadTranzytowy=src.UrzadTranzytowy
			WHEN NOT MATCHED
			THEN INSERT (Id, IdOperacjiTranzytowej, KodKraju, UrzadTranzytowy)
			VALUES (src.Id, src.IdOperacjiTranzytowej, src.KodKraju, src.UrzadTranzytowy);
			SET @Merged = 1;
		END

		IF @TableName = 'OperacjaTranzytoweGwarancje' BEGIN
			MERGE INTO ncts2.OperacjaTranzytoweGwarancje AS tgt
			USING [WA_StageHurtownia].ncts2.OperacjaTranzytoweGwarancje AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.Rodzaj=src.Rodzaj, tgt.IdPozycji=src.IdPozycji
			WHEN NOT MATCHED
			THEN INSERT (Id, IdOperacjiTranzytowej, Rodzaj, IdPozycji)
			VALUES (src.Id, src.IdOperacjiTranzytowej, src.Rodzaj, src.IdPozycji);
			SET @Merged = 1;
		END

		IF @TableName = 'OperacjeTranzytoweInneInformacje' BEGIN
			MERGE INTO ncts2.OperacjeTranzytoweInneInformacje AS tgt
			USING [WA_StageHurtownia].ncts2.OperacjeTranzytoweInneInformacje AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.Uwagi=src.Uwagi, tgt.UwagiJezyk=src.UwagiJezyk, tgt.TrybUtworzeniaPozycji=src.TrybUtworzeniaPozycji, 

tgt.IteracjaUwagRozladunkowych=src.IteracjaUwagRozladunkowych
			WHEN NOT MATCHED
			THEN INSERT (Id, IdOperacjiTranzytowej, Uwagi, UwagiJezyk, TrybUtworzeniaPozycji, IteracjaUwagRozladunkowych)
			VALUES (src.Id, src.IdOperacjiTranzytowej, src.Uwagi, src.UwagiJezyk, src.TrybUtworzeniaPozycji, src.IteracjaUwagRozladunkowych);
			SET @Merged = 1;
		END

		IF @TableName = 'OpercjeTranzytoweSzczegoly' BEGIN
			MERGE INTO ncts2.OpercjeTranzytoweSzczegoly AS tgt
			USING [WA_StageHurtownia].ncts2.OpercjeTranzytoweSzczegoly AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.WynikKontroliSkontrolowalUCWyjscia=src.WynikKontroliSkontrolowalUCWyjscia, 

tgt.WynikKontroliUwagiUCWyjscia=src.WynikKontroliUwagiUCWyjscia, tgt.LokalizacjaKodMiejscaUznanego=src.LokalizacjaKodMiejscaUznanego, tgt.LokalizacjaMiejsceUznane=src.LokalizacjaMiejsceUznane, 

tgt.LokalizacjaMiejsceOdprawCelnych=src.LokalizacjaMiejsceOdprawCelnych, tgt.LokalizacjaKodMiejscaWskazanegoWPozwoleniu=src.LokalizacjaKodMiejscaWskazanegoWPozwoleniu, 

tgt.PrzybycieLokalizacjaKodMiejscaUznanego=src.PrzybycieLokalizacjaKodMiejscaUznanego, tgt.PrzybycieLokalizacjaMiejsceUznane=src.PrzybycieLokalizacjaMiejsceUznane, 

tgt.PrzybycieLokalizacjaMiejsceOdprawCelnych=src.PrzybycieLokalizacjaMiejsceOdprawCelnych, 

tgt.PrzybycieLokalizacjaKodMiejscaWskazanegoWPozwoleniu=src.PrzybycieLokalizacjaKodMiejscaWskazanegoWPozwoleniu, tgt.StatusKomunikacjiAES=src.StatusKomunikacjiAES, 

tgt.NadawcaCertyfikatAEO=src.NadawcaCertyfikatAEO, tgt.OdbiorcaCertyfikatAEO=src.OdbiorcaCertyfikatAEO, tgt.PrzedstawiajacyCertyfikatAEO=src.PrzedstawiajacyCertyfikatAEO, 

tgt.GlownyZobowiazanyCertyfikatAEO=src.GlownyZobowiazanyCertyfikatAEO, tgt.GlownyZobowiazanyPrzedstawicielCertyfikatAEO=src.GlownyZobowiazanyPrzedstawicielCertyfikatAEO, 

tgt.UpowaznionyOdbiorcaCertyfikatAEO=src.UpowaznionyOdbiorcaCertyfikatAEO, tgt.BezpieczenstwoNadawcaCertyfikatAEO=src.BezpieczenstwoNadawcaCertyfikatAEO, 

tgt.BezpieczenstwoOdbiorcaCertyfikatAEO=src.BezpieczenstwoOdbiorcaCertyfikatAEO, tgt.BezpieczenstwoPrzewoznikCertyfikatAEO=src.BezpieczenstwoPrzewoznikCertyfikatAEO, 

tgt.PrzybycieNrPozwolenia=src.PrzybycieNrPozwolenia
			WHEN NOT MATCHED
			THEN INSERT (Id, IdOperacjiTranzytowej, WynikKontroliSkontrolowalUCWyjscia, WynikKontroliUwagiUCWyjscia, LokalizacjaKodMiejscaUznanego, LokalizacjaMiejsceUznane, 

LokalizacjaMiejsceOdprawCelnych, LokalizacjaKodMiejscaWskazanegoWPozwoleniu, PrzybycieLokalizacjaKodMiejscaUznanego, PrzybycieLokalizacjaMiejsceUznane, PrzybycieLokalizacjaMiejsceOdprawCelnych, 

PrzybycieLokalizacjaKodMiejscaWskazanegoWPozwoleniu, StatusKomunikacjiAES, NadawcaCertyfikatAEO, OdbiorcaCertyfikatAEO, PrzedstawiajacyCertyfikatAEO, GlownyZobowiazanyCertyfikatAEO, 

GlownyZobowiazanyPrzedstawicielCertyfikatAEO, UpowaznionyOdbiorcaCertyfikatAEO, BezpieczenstwoNadawcaCertyfikatAEO, BezpieczenstwoOdbiorcaCertyfikatAEO, BezpieczenstwoPrzewoznikCertyfikatAEO, 

PrzybycieNrPozwolenia)
			VALUES (src.Id, src.IdOperacjiTranzytowej, src.WynikKontroliSkontrolowalUCWyjscia, src.WynikKontroliUwagiUCWyjscia, src.LokalizacjaKodMiejscaUznanego, 

src.LokalizacjaMiejsceUznane, src.LokalizacjaMiejsceOdprawCelnych, src.LokalizacjaKodMiejscaWskazanegoWPozwoleniu, src.PrzybycieLokalizacjaKodMiejscaUznanego, 

src.PrzybycieLokalizacjaMiejsceUznane, src.PrzybycieLokalizacjaMiejsceOdprawCelnych, src.PrzybycieLokalizacjaKodMiejscaWskazanegoWPozwoleniu, src.StatusKomunikacjiAES, src.NadawcaCertyfikatAEO, 

src.OdbiorcaCertyfikatAEO, src.PrzedstawiajacyCertyfikatAEO, src.GlownyZobowiazanyCertyfikatAEO, src.GlownyZobowiazanyPrzedstawicielCertyfikatAEO, src.UpowaznionyOdbiorcaCertyfikatAEO, 

src.BezpieczenstwoNadawcaCertyfikatAEO, src.BezpieczenstwoOdbiorcaCertyfikatAEO, src.BezpieczenstwoPrzewoznikCertyfikatAEO, src.PrzybycieNrPozwolenia);
			SET @Merged = 1;
		END

		IF @TableName = 'PoszukiwaniaPobory' BEGIN
			MERGE INTO ncts2.PoszukiwaniaPobory AS tgt
			USING [WA_StageHurtownia].ncts2.PoszukiwaniaPobory AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.Typ=src.Typ, tgt.Status=src.Status, tgt.MRN=src.MRN, tgt.UrzadWyjscia=src.UrzadWyjscia, tgt.UrzadPytajacy=src.UrzadPytajacy, tgt.Odbiorca=src.Odbiorca, tgt.DataWyslaniaZapytania=src.DataWyslaniaZapytania, tgt.CzyPrzekroczonyCzasOdp=src.CzyPrzekroczonyCzasOdp, tgt.DataObsluzenia=src.DataObsluzenia, tgt.KodOdpowiedzi=src.KodOdpowiedzi, tgt.TrescOdpowiedzi=src.TrescOdpowiedzi, tgt.TrescInformacji=src.TrescInformacji, tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.IdKomunikatZapytania=src.IdKomunikatZapytania, tgt.IdKomunikatOdpowiedzi=src.IdKomunikatOdpowiedzi, tgt.CzyInfDodatkoweIE144=src.CzyInfDodatkoweIE144, tgt.CzyInfDodatkoweIE145=src.CzyInfDodatkoweIE145, tgt.TerminNaOdpowiedz=src.TerminNaOdpowiedz, tgt.RolaUrzeduOdbiorcy=src.RolaUrzeduOdbiorcy, tgt.DataUtworzenia=src.DataUtworzenia, tgt.DataModyfikacji=src.DataModyfikacji
			WHEN NOT MATCHED
			THEN INSERT (Id, Typ, Status, MRN, UrzadWyjscia, UrzadPytajacy, Odbiorca, DataWyslaniaZapytania, CzyPrzekroczonyCzasOdp, DataObsluzenia, KodOdpowiedzi, TrescOdpowiedzi, TrescInformacji, IdOperacjiTranzytowej, IdKomunikatZapytania, IdKomunikatOdpowiedzi, CzyInfDodatkoweIE144, CzyInfDodatkoweIE145, TerminNaOdpowiedz, RolaUrzeduOdbiorcy, DataUtworzenia, DataModyfikacji)
			VALUES (src.Id, src.Typ, src.Status, src.MRN, src.UrzadWyjscia, src.UrzadPytajacy, src.Odbiorca, src.DataWyslaniaZapytania, src.CzyPrzekroczonyCzasOdp, src.DataObsluzenia, src.KodOdpowiedzi, src.TrescOdpowiedzi, src.TrescInformacji, src.IdOperacjiTranzytowej, src.IdKomunikatZapytania, src.IdKomunikatOdpowiedzi, src.CzyInfDodatkoweIE144, src.CzyInfDodatkoweIE145, src.TerminNaOdpowiedz, src.RolaUrzeduOdbiorcy, src.DataUtworzenia, src.DataModyfikacji);
			SET @Merged = 1;		
		END

		IF @TableName = 'RefProcUproszczMiejscaLokalTow' BEGIN
			MERGE INTO ncts2.RefProcUproszczMiejscaLokalTow AS tgt
			USING [WA_StageHurtownia].ncts2.RefProcUproszczMiejscaLokalTow AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdPozwoleniaNaProcedureUproszczona=src.IdPozwoleniaNaProcedureUproszczona, tgt.NumerMiejsca=src.NumerMiejsca, tgt.CzasDecyzjeTranzyt=src.CzasDecyzjeTranzyt, 

tgt.ZgodaPoGodzinachPracyUrzeduUCPrzeznaczenia=src.ZgodaPoGodzinachPracyUrzeduUCPrzeznaczenia, tgt.ZgodaPoGodzinachPracyUrzeduUCWyjscia=src.ZgodaPoGodzinachPracyUrzeduUCWyjscia, 

tgt.KodUrzedu=src.KodUrzedu
			WHEN NOT MATCHED
			THEN INSERT (Id, IdPozwoleniaNaProcedureUproszczona, NumerMiejsca, CzasDecyzjeTranzyt, ZgodaPoGodzinachPracyUrzeduUCPrzeznaczenia, ZgodaPoGodzinachPracyUrzeduUCWyjscia, 

KodUrzedu)
			VALUES (src.Id, src.IdPozwoleniaNaProcedureUproszczona, src.NumerMiejsca, src.CzasDecyzjeTranzyt, src.ZgodaPoGodzinachPracyUrzeduUCPrzeznaczenia, 

src.ZgodaPoGodzinachPracyUrzeduUCWyjscia, src.KodUrzedu);
			SET @Merged = 1;
		END

		IF @TableName = 'RefUrzCelPodmioty' BEGIN
			MERGE INTO ncts2.RefUrzCelPodmioty AS tgt
			USING [WA_StageHurtownia].ncts2.RefUrzCelPodmioty AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdUrzeduCelnego=src.IdUrzeduCelnego, tgt.Nazwa=src.Nazwa, tgt.KodJezyka=src.KodJezyka, tgt.TIN=src.TIN
			WHEN NOT MATCHED
			THEN INSERT (Id, IdUrzeduCelnego, Nazwa, KodJezyka, TIN)
			VALUES (src.Id, src.IdUrzeduCelnego, src.Nazwa, src.KodJezyka, src.TIN);
			SET @Merged = 1;
		END

		IF @TableName = 'SlownikiWartosci' BEGIN
			MERGE INTO ncts2.SlownikiWartosci AS tgt
			USING [WA_StageHurtownia].ncts2.SlownikiWartosci AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdTypuSlownika=src.IdTypuSlownika, tgt.Kod=src.Kod, tgt.WaznyOd=src.WaznyOd, tgt.WaznyDo=src.WaznyDo, tgt.OpisKodu=src.OpisKodu, tgt.OpisKoduENG=src.OpisKoduENG
			WHEN NOT MATCHED
			THEN INSERT (Id, IdTypuSlownika, Kod, WaznyOd, WaznyDo, OpisKodu, OpisKoduENG)
			VALUES (src.Id, src.IdTypuSlownika, src.Kod, src.WaznyOd, src.WaznyDo, src.OpisKodu, src.OpisKoduENG);
			SET @Merged = 1;
		END

		IF @TableName = 'Towary' BEGIN
			MERGE INTO ncts2.Towary AS tgt
			USING [WA_StageHurtownia].ncts2.Towary AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.IdPozycji=src.IdPozycji, tgt.TypDeklaracji=src.TypDeklaracji, tgt.KrajWysylki=src.KrajWysylki, 

tgt.KrajPrzeznaczenia=src.KrajPrzeznaczenia, tgt.Opis=src.Opis, tgt.KodTowarowy=src.KodTowarowy, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaNetto=src.MasaNetto, tgt.NadawcaNazwa=src.NadawcaNazwa, 

tgt.NadawcaUlicaNumer=src.NadawcaUlicaNumer, tgt.NadawcaKodPocztowy=src.NadawcaKodPocztowy, tgt.NadawcaMiejscowosc=src.NadawcaMiejscowosc, tgt.NadawcaKraj=src.NadawcaKraj, 

tgt.NadawcaTIN=src.NadawcaTIN, tgt.OdbiorcaNazwa=src.OdbiorcaNazwa, tgt.OdbiorcaUlicaNumer=src.OdbiorcaUlicaNumer, tgt.OdbiorcaKodPocztowy=src.OdbiorcaKodPocztowy, 

tgt.OdbiorcaMiejscowosc=src.OdbiorcaMiejscowosc, tgt.OdbiorcaKraj=src.OdbiorcaKraj, tgt.OdbiorcaTIN=src.OdbiorcaTIN, tgt.BezpieczenstwoFormaPlatnosci=src.BezpieczenstwoFormaPlatnosci, 

tgt.BezpieczenstwoNrReferencyjnyPrzesylki=src.BezpieczenstwoNrReferencyjnyPrzesylki, tgt.BezpieczenstwoKodUNTowarowNiebezpiecznych=src.BezpieczenstwoKodUNTowarowNiebezpiecznych, 

tgt.BezpieczenstwoNadawcaNazwa=src.BezpieczenstwoNadawcaNazwa, tgt.BezpieczenstwoNadawcaUlicaNumer=src.BezpieczenstwoNadawcaUlicaNumer, 

tgt.BezpieczenstwoNadawcaKodPocztowy=src.BezpieczenstwoNadawcaKodPocztowy, tgt.BezpieczenstwoNadawcaMiejscowosc=src.BezpieczenstwoNadawcaMiejscowosc, 

tgt.BezpieczenstwoNadawcaKraj=src.BezpieczenstwoNadawcaKraj, tgt.BezpieczenstwoNadawcaTIN=src.BezpieczenstwoNadawcaTIN, tgt.BezpieczenstwoOdbiorcaNazwa=src.BezpieczenstwoOdbiorcaNazwa, 

tgt.BezpieczenstwoOdbiorcaUlicaNumer=src.BezpieczenstwoOdbiorcaUlicaNumer, tgt.BezpieczenstwoOdbiorcaKodPocztowy=src.BezpieczenstwoOdbiorcaKodPocztowy, 

tgt.BezpieczenstwoOdbiorcaMiejscowosc=src.BezpieczenstwoOdbiorcaMiejscowosc, tgt.BezpieczenstwoOdbiorcaKraj=src.BezpieczenstwoOdbiorcaKraj, 

tgt.BezpieczenstwoOdbiorcaTIN=src.BezpieczenstwoOdbiorcaTIN, tgt.TrybUtworzeniaPozycji=src.TrybUtworzeniaPozycji, tgt.IteracjaUwagRozladunkowych=src.IteracjaUwagRozladunkowych, 

tgt.NadawcaCertyfikatAEO=src.NadawcaCertyfikatAEO, tgt.OdbiorcaCertyfikatAEO=src.OdbiorcaCertyfikatAEO, tgt.BezpieczenstwoNadawcaCertyfikatAEO=src.BezpieczenstwoNadawcaCertyfikatAEO, 

tgt.BezpieczenstwoOdbiorcaCertyfikatAEO=src.BezpieczenstwoOdbiorcaCertyfikatAEO, tgt.OpisJezyk=src.OpisJezyk
			WHEN NOT MATCHED
			THEN INSERT (Id, IdOperacjiTranzytowej, IdPozycji, TypDeklaracji, KrajWysylki, KrajPrzeznaczenia, Opis, KodTowarowy, MasaBrutto, MasaNetto, NadawcaNazwa, NadawcaUlicaNumer, 

NadawcaKodPocztowy, NadawcaMiejscowosc, NadawcaKraj, NadawcaTIN, OdbiorcaNazwa, OdbiorcaUlicaNumer, OdbiorcaKodPocztowy, OdbiorcaMiejscowosc, OdbiorcaKraj, OdbiorcaTIN, 

BezpieczenstwoFormaPlatnosci, BezpieczenstwoNrReferencyjnyPrzesylki, BezpieczenstwoKodUNTowarowNiebezpiecznych, BezpieczenstwoNadawcaNazwa, BezpieczenstwoNadawcaUlicaNumer, 

BezpieczenstwoNadawcaKodPocztowy, BezpieczenstwoNadawcaMiejscowosc, BezpieczenstwoNadawcaKraj, BezpieczenstwoNadawcaTIN, BezpieczenstwoOdbiorcaNazwa, BezpieczenstwoOdbiorcaUlicaNumer, 

BezpieczenstwoOdbiorcaKodPocztowy, BezpieczenstwoOdbiorcaMiejscowosc, BezpieczenstwoOdbiorcaKraj, BezpieczenstwoOdbiorcaTIN, TrybUtworzeniaPozycji, IteracjaUwagRozladunkowych, 

NadawcaCertyfikatAEO, OdbiorcaCertyfikatAEO, BezpieczenstwoNadawcaCertyfikatAEO, BezpieczenstwoOdbiorcaCertyfikatAEO, OpisJezyk)
			VALUES (src.Id, src.IdOperacjiTranzytowej, src.IdPozycji, src.TypDeklaracji, src.KrajWysylki, src.KrajPrzeznaczenia, src.Opis, src.KodTowarowy, src.MasaBrutto, 

src.MasaNetto, src.NadawcaNazwa, src.NadawcaUlicaNumer, src.NadawcaKodPocztowy, src.NadawcaMiejscowosc, src.NadawcaKraj, src.NadawcaTIN, src.OdbiorcaNazwa, src.OdbiorcaUlicaNumer, 

src.OdbiorcaKodPocztowy, src.OdbiorcaMiejscowosc, src.OdbiorcaKraj, src.OdbiorcaTIN, src.BezpieczenstwoFormaPlatnosci, src.BezpieczenstwoNrReferencyjnyPrzesylki, 

src.BezpieczenstwoKodUNTowarowNiebezpiecznych, src.BezpieczenstwoNadawcaNazwa, src.BezpieczenstwoNadawcaUlicaNumer, src.BezpieczenstwoNadawcaKodPocztowy, src.BezpieczenstwoNadawcaMiejscowosc, 

src.BezpieczenstwoNadawcaKraj, src.BezpieczenstwoNadawcaTIN, src.BezpieczenstwoOdbiorcaNazwa, src.BezpieczenstwoOdbiorcaUlicaNumer, src.BezpieczenstwoOdbiorcaKodPocztowy, 

src.BezpieczenstwoOdbiorcaMiejscowosc, src.BezpieczenstwoOdbiorcaKraj, src.BezpieczenstwoOdbiorcaTIN, src.TrybUtworzeniaPozycji, src.IteracjaUwagRozladunkowych, src.NadawcaCertyfikatAEO, 

src.OdbiorcaCertyfikatAEO, src.BezpieczenstwoNadawcaCertyfikatAEO, src.BezpieczenstwoOdbiorcaCertyfikatAEO, src.OpisJezyk);
			SET @Merged = 1;
		END

		IF @TableName = 'UCTranzytowe' BEGIN
			MERGE INTO ncts2.UCTranzytowe AS tgt
			USING [WA_StageHurtownia].ncts2.UCTranzytowe AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.UCTranzytowy=src.UCTranzytowy, tgt.CzasPrzybycia=src.CzasPrzybycia, tgt.IdPozycji=src.IdPozycji, 

tgt.StatusUCTranzytowy=src.StatusUCTranzytowy, tgt.DataZmianyStatusuUCTranzytowym=src.DataZmianyStatusuUCTranzytowym, tgt.RyzykoUCTranzytowy=src.RyzykoUCTranzytowy, 

tgt.StatusAnalizyRyzykaUCTranzytowy=src.StatusAnalizyRyzykaUCTranzytowy
			WHEN NOT MATCHED
			THEN INSERT (IdOperacjiTranzytowej, UCTranzytowy, CzasPrzybycia, Id, IdPozycji, StatusUCTranzytowy, DataZmianyStatusuUCTranzytowym, RyzykoUCTranzytowy, 

StatusAnalizyRyzykaUCTranzytowy)
			VALUES (src.IdOperacjiTranzytowej, src.UCTranzytowy, src.CzasPrzybycia, src.Id, src.IdPozycji, src.StatusUCTranzytowy, src.DataZmianyStatusuUCTranzytowym, 

src.RyzykoUCTranzytowy, src.StatusAnalizyRyzykaUCTranzytowy);
			SET @Merged = 1;
		END

		IF @TableName = 'UwagiRozladunkowe' BEGIN
			MERGE INTO ncts2.UwagiRozladunkowe AS tgt
			USING [WA_StageHurtownia].ncts2.UwagiRozladunkowe AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.Iteracja=src.Iteracja, tgt.DataRozladunku=src.DataRozladunku, 

tgt.WynikRozladunkuZakonczenie=src.WynikRozladunkuZakonczenie, tgt.WynikRozladunkuZgodny=src.WynikRozladunkuZgodny, tgt.WynikRozladunkuZamknieciaPrawidlowe=src.WynikRozladunkuZamknieciaPrawidlowe, 

tgt.PodmiotWMiejscuPrzeznaczeniaNazwa=src.PodmiotWMiejscuPrzeznaczeniaNazwa, tgt.PodmiotWMiejscuPrzeznaczeniaUlicaNumer=src.PodmiotWMiejscuPrzeznaczeniaUlicaNumer, 

tgt.PodmiotWMiejscuPrzeznaczeniaKodPocztowy=src.PodmiotWMiejscuPrzeznaczeniaKodPocztowy, tgt.PodmiotWMiejscuPrzeznaczeniaMiejscowosc=src.PodmiotWMiejscuPrzeznaczeniaMiejscowosc, 

tgt.PodmiotWMiejscuPrzeznaczeniaKraj=src.PodmiotWMiejscuPrzeznaczeniaKraj, tgt.PodmiotWMiejscuPrzeznaczeniaTIN=src.PodmiotWMiejscuPrzeznaczeniaTIN, tgt.UwagiRozladunkowe=src.UwagiRozladunkowe, 

tgt.KarnetTIRNieDotyczy=src.KarnetTIRNieDotyczy, tgt.NumerStronyKarnetuTIR=src.NumerStronyKarnetuTIR, tgt.KarnetTIRTypRozladunku=src.KarnetTIRTypRozladunku, 

tgt.KarnetTIRNumerRozladunku=src.KarnetTIRNumerRozladunku, tgt.Zwolnienie=src.Zwolnienie, tgt.ZamknieciaCelneIlosc=src.ZamknieciaCelneIlosc, tgt.LiczbaPozycji=src.LiczbaPozycji, 

tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.MasaBrutto=src.MasaBrutto, tgt.TransportZnaki=src.TransportZnaki, tgt.TransportKraj=src.TransportKraj, tgt.LiczbaPozycjiUwagi=src.LiczbaPozycjiUwagi, 

tgt.MasaBruttoUwagi=src.MasaBruttoUwagi, tgt.LiczbaOpakowanUwagi=src.LiczbaOpakowanUwagi, tgt.TransportZnakiUwagi=src.TransportZnakiUwagi, tgt.TransportKrajUwagi=src.TransportKrajUwagi, 

tgt.DataUtworzenia=src.DataUtworzenia
			WHEN NOT MATCHED
			THEN INSERT (Id, IdOperacjiTranzytowej, Iteracja, DataRozladunku, WynikRozladunkuZakonczenie, WynikRozladunkuZgodny, WynikRozladunkuZamknieciaPrawidlowe, 

PodmiotWMiejscuPrzeznaczeniaNazwa, PodmiotWMiejscuPrzeznaczeniaUlicaNumer, PodmiotWMiejscuPrzeznaczeniaKodPocztowy, PodmiotWMiejscuPrzeznaczeniaMiejscowosc, PodmiotWMiejscuPrzeznaczeniaKraj, 

PodmiotWMiejscuPrzeznaczeniaTIN, UwagiRozladunkowe, KarnetTIRNieDotyczy, NumerStronyKarnetuTIR, KarnetTIRTypRozladunku, KarnetTIRNumerRozladunku, Zwolnienie, ZamknieciaCelneIlosc, LiczbaPozycji, 

LiczbaOpakowan, MasaBrutto, TransportZnaki, TransportKraj, LiczbaPozycjiUwagi, MasaBruttoUwagi, LiczbaOpakowanUwagi, TransportZnakiUwagi, TransportKrajUwagi, DataUtworzenia)
			VALUES (src.Id, src.IdOperacjiTranzytowej, src.Iteracja, src.DataRozladunku, src.WynikRozladunkuZakonczenie, src.WynikRozladunkuZgodny, 

src.WynikRozladunkuZamknieciaPrawidlowe, src.PodmiotWMiejscuPrzeznaczeniaNazwa, src.PodmiotWMiejscuPrzeznaczeniaUlicaNumer, src.PodmiotWMiejscuPrzeznaczeniaKodPocztowy, 

src.PodmiotWMiejscuPrzeznaczeniaMiejscowosc, src.PodmiotWMiejscuPrzeznaczeniaKraj, src.PodmiotWMiejscuPrzeznaczeniaTIN, src.UwagiRozladunkowe, src.KarnetTIRNieDotyczy, src.NumerStronyKarnetuTIR, 

src.KarnetTIRTypRozladunku, src.KarnetTIRNumerRozladunku, src.Zwolnienie, src.ZamknieciaCelneIlosc, src.LiczbaPozycji, src.LiczbaOpakowan, src.MasaBrutto, src.TransportZnaki, src.TransportKraj, 

src.LiczbaPozycjiUwagi, src.MasaBruttoUwagi, src.LiczbaOpakowanUwagi, src.TransportZnakiUwagi, src.TransportKrajUwagi, src.DataUtworzenia);
			SET @Merged = 1;
		END

		IF @TableName = 'WynikiKontroli' BEGIN
			MERGE INTO ncts2.WynikiKontroli AS tgt
			USING [WA_StageHurtownia].ncts2.WynikiKontroli AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.DataKontroli=src.DataKontroli, tgt.KodWyniku=src.KodWyniku, 

tgt.WyjasnianieNiezgodnosci=src.WyjasnianieNiezgodnosci, tgt.ZamknieciaPrawidlowe=src.ZamknieciaPrawidlowe, tgt.LosoweTypowanie=src.LosoweTypowanie, 

tgt.ZwolnienieBezZastrzezen=src.ZwolnienieBezZastrzezen, tgt.KarnetTIRNieDotyczy=src.KarnetTIRNieDotyczy, tgt.NumerStronyKarnetuTIR=src.NumerStronyKarnetuTIR, 

tgt.KarnetTIRTypRozladunku=src.KarnetTIRTypRozladunku, tgt.KarnetTIRNumerRozladunku=src.KarnetTIRNumerRozladunku, tgt.Skontrolowal=src.Skontrolowal, tgt.Uwagi=src.Uwagi, 

tgt.UwagiJezyk=src.UwagiJezyk, tgt.LiczbaPozycji=src.LiczbaPozycji, tgt.LiczbaPozycjiUwagi=src.LiczbaPozycjiUwagi, tgt.MasaBrutto=src.MasaBrutto, tgt.MasaBruttoUwagi=src.MasaBruttoUwagi, 

tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.LiczbaOpakowanUwagi=src.LiczbaOpakowanUwagi, tgt.TransportZnaki=src.TransportZnaki, tgt.TransportZnakiUwagi=src.TransportZnakiUwagi, 

tgt.TransportKraj=src.TransportKraj, tgt.TransportKrajUwagi=src.TransportKrajUwagi, tgt.DataUtworzenia=src.DataUtworzenia
			WHEN NOT MATCHED
			THEN INSERT (Id, IdOperacjiTranzytowej, DataKontroli, KodWyniku, WyjasnianieNiezgodnosci, ZamknieciaPrawidlowe, LosoweTypowanie, ZwolnienieBezZastrzezen, 

KarnetTIRNieDotyczy, NumerStronyKarnetuTIR, KarnetTIRTypRozladunku, KarnetTIRNumerRozladunku, Skontrolowal, Uwagi, UwagiJezyk, LiczbaPozycji, LiczbaPozycjiUwagi, MasaBrutto, MasaBruttoUwagi, 

LiczbaOpakowan, LiczbaOpakowanUwagi, TransportZnaki, TransportZnakiUwagi, TransportKraj, TransportKrajUwagi, DataUtworzenia)
			VALUES (src.Id, src.IdOperacjiTranzytowej, src.DataKontroli, src.KodWyniku, src.WyjasnianieNiezgodnosci, src.ZamknieciaPrawidlowe, src.LosoweTypowanie, 

src.ZwolnienieBezZastrzezen, src.KarnetTIRNieDotyczy, src.NumerStronyKarnetuTIR, src.KarnetTIRTypRozladunku, src.KarnetTIRNumerRozladunku, src.Skontrolowal, src.Uwagi, src.UwagiJezyk, 

src.LiczbaPozycji, src.LiczbaPozycjiUwagi, src.MasaBrutto, src.MasaBruttoUwagi, src.LiczbaOpakowan, src.LiczbaOpakowanUwagi, src.TransportZnaki, src.TransportZnakiUwagi, src.TransportKraj, 

src.TransportKrajUwagi, src.DataUtworzenia);
			SET @Merged = 1;
		END

		IF @TableName = 'ZamknieciaCelne' BEGIN
			MERGE INTO ncts2.ZamknieciaCelne AS tgt
			USING [WA_StageHurtownia].ncts2.ZamknieciaCelne AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.Numer=src.Numer, tgt.IdPozycji=src.IdPozycji
			WHEN NOT MATCHED
			THEN INSERT (IdOperacjiTranzytowej, Numer, Id, IdPozycji)
			VALUES (src.IdOperacjiTranzytowej, src.Numer, src.Id, src.IdPozycji);
			SET @Merged = 1;
		END

		IF @TableName = 'Zdarzenia' BEGIN
			MERGE INTO ncts2.Zdarzenia AS tgt
			USING [WA_StageHurtownia].ncts2.Zdarzenia AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.Typ=src.Typ, tgt.IdPozycji=src.IdPozycji, tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.Miejsce=src.Miejsce, tgt.Kraj=src.Kraj, 

tgt.CzyInneZdarzenie=src.CzyInneZdarzenie, tgt.CzyWSystemie=src.CzyWSystemie, tgt.ZdarzenieOpis=src.ZdarzenieOpis, tgt.ZdarzenieDataAdnotacji=src.ZdarzenieDataAdnotacji, 

tgt.ZdarzenieKrajAdnotacji=src.ZdarzenieKrajAdnotacji, tgt.ZdarzenieWladzeAdnotacji=src.ZdarzenieWladzeAdnotacji, tgt.ZdarzenieMiejsceAdnotacji=src.ZdarzenieMiejsceAdnotacji, 

tgt.PrzeladunekZnaki=src.PrzeladunekZnaki, tgt.PrzeladunekKrajSrodkaTransportu=src.PrzeladunekKrajSrodkaTransportu, tgt.PrzeladunekDataAdnotacji=src.PrzeladunekDataAdnotacji, 

tgt.PrzeladunekKrajAdnotacji=src.PrzeladunekKrajAdnotacji, tgt.PrzeladunekWladzeAdnotacji=src.PrzeladunekWladzeAdnotacji, tgt.PrzeladunekMiejsceAdnotacji=src.PrzeladunekMiejsceAdnotacji, 

tgt.IloscZamkniec=src.IloscZamkniec, tgt.KodUC=src.KodUC
			WHEN NOT MATCHED
			THEN INSERT (Id, Typ, IdPozycji, IdOperacjiTranzytowej, Miejsce, Kraj, CzyInneZdarzenie, CzyWSystemie, ZdarzenieOpis, ZdarzenieDataAdnotacji, ZdarzenieKrajAdnotacji, 

ZdarzenieWladzeAdnotacji, ZdarzenieMiejsceAdnotacji, PrzeladunekZnaki, PrzeladunekKrajSrodkaTransportu, PrzeladunekDataAdnotacji, PrzeladunekKrajAdnotacji, PrzeladunekWladzeAdnotacji, 

PrzeladunekMiejsceAdnotacji, IloscZamkniec, KodUC)
			VALUES (src.Id, src.Typ, src.IdPozycji, src.IdOperacjiTranzytowej, src.Miejsce, src.Kraj, src.CzyInneZdarzenie, src.CzyWSystemie, src.ZdarzenieOpis, 

src.ZdarzenieDataAdnotacji, src.ZdarzenieKrajAdnotacji, src.ZdarzenieWladzeAdnotacji, src.ZdarzenieMiejsceAdnotacji, src.PrzeladunekZnaki, src.PrzeladunekKrajSrodkaTransportu, 

src.PrzeladunekDataAdnotacji, src.PrzeladunekKrajAdnotacji, src.PrzeladunekWladzeAdnotacji, src.PrzeladunekMiejsceAdnotacji, src.IloscZamkniec, src.KodUC);
			SET @Merged = 1;
		END

		IF @TableName = 'DokPoprzednieWPT' BEGIN
			MERGE INTO ncts2.DokPoprzednieWPT AS tgt
			USING [WA_StageHurtownia].ncts2.DokPoprzednieWPT AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdTowaru=src.IdTowaru, tgt.KodDokPoprz=src.KodDokPoprz, tgt.NrDokPoprz=src.NrDokPoprz, tgt.Uwagi=src.Uwagi, tgt.IdPozycji=src.IdPozycji
			WHEN NOT MATCHED
			THEN INSERT (IdTowaru, KodDokPoprz, NrDokPoprz, Uwagi, Id, IdPozycji)
			VALUES (src.IdTowaru, src.KodDokPoprz, src.NrDokPoprz, src.Uwagi, src.Id, src.IdPozycji);
			SET @Merged = 1;
		END

		IF @TableName = 'DokWymaganeWPT' BEGIN
			MERGE INTO ncts2.DokWymaganeWPT AS tgt
			USING [WA_StageHurtownia].ncts2.DokWymaganeWPT AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdTowaru=src.IdTowaru, tgt.KodDokWym=src.KodDokWym, tgt.NrDokWym=src.NrDokWym, tgt.Uwagi=src.Uwagi, tgt.IdPozycji=src.IdPozycji, tgt.TrybUtworzeniaPozycji=src.TrybUtworzeniaPozycji, tgt.IteracjaUwagRozladunkowych=src.IteracjaUwagRozladunkowych, tgt.NrJezyka=src.NrJezyka, tgt.UwagiJezyk=src.UwagiJezyk
			WHEN NOT MATCHED
			THEN INSERT (IdTowaru, KodDokWym, NrDokWym, Uwagi, Id, IdPozycji, TrybUtworzeniaPozycji, IteracjaUwagRozladunkowych, NrJezyka, UwagiJezyk)
			VALUES (src.IdTowaru, src.KodDokWym, src.NrDokWym, src.Uwagi, src.Id, src.IdPozycji, src.TrybUtworzeniaPozycji, src.IteracjaUwagRozladunkowych, src.NrJezyka, src.UwagiJezyk);
			SET @Merged = 1;
		END

		IF @TableName = 'Gwarancje' BEGIN
			MERGE INTO ncts2.Gwarancje AS tgt
			USING [WA_StageHurtownia].ncts2.Gwarancje AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdOperacjiTranzytowejDlaGwarancji=src.IdOperacjiTranzytowejDlaGwarancji, tgt.GRN=src.GRN, tgt.KodDostepu=src.KodDostepu, tgt.NiewaznaNaUE=src.NiewaznaNaUE, 

tgt.IdPozycji=src.IdPozycji, tgt.Numer=src.Numer, tgt.Kwota=src.Kwota, tgt.Waluta=src.Waluta, tgt.Status=src.Status, tgt.NumerOperacjiZajeciaZabezpieczenia=src.NumerOperacjiZajeciaZabezpieczenia, 

tgt.NumerOperacjiZwolnieniaZabezpieczenia=src.NumerOperacjiZwolnieniaZabezpieczenia, tgt.NumerOperacjiWycofaniaZabezpieczenia=src.NumerOperacjiWycofaniaZabezpieczenia, 

tgt.NiewaznaNaStronyKonwencji=src.NiewaznaNaStronyKonwencji, tgt.KwotaEuro=src.KwotaEuro, tgt.UCGwarancji=src.UCGwarancji, tgt.KwotaPln=src.KwotaPln, 

tgt.KodPrzyczynyOdrzucenia=src.KodPrzyczynyOdrzucenia, tgt.OpisPrzyczynyOdrzucenia=src.OpisPrzyczynyOdrzucenia, tgt.StatusIntegralnosci=src.StatusIntegralnosci, 

tgt.DataSprawdzeniaIntegralnosci=src.DataSprawdzeniaIntegralnosci, tgt.DataZapytaniaOIntegralnosc=src.DataZapytaniaOIntegralnosc
			WHEN NOT MATCHED
			THEN INSERT (Id, IdOperacjiTranzytowejDlaGwarancji, GRN, KodDostepu, NiewaznaNaUE, IdPozycji, Numer, Kwota, Waluta, Status, NumerOperacjiZajeciaZabezpieczenia, 

NumerOperacjiZwolnieniaZabezpieczenia, NumerOperacjiWycofaniaZabezpieczenia, NiewaznaNaStronyKonwencji, KwotaEuro, UCGwarancji, KwotaPln, KodPrzyczynyOdrzucenia, OpisPrzyczynyOdrzucenia, 

StatusIntegralnosci, DataSprawdzeniaIntegralnosci, DataZapytaniaOIntegralnosc)
			VALUES (src.Id, src.IdOperacjiTranzytowejDlaGwarancji, src.GRN, src.KodDostepu, src.NiewaznaNaUE, src.IdPozycji, src.Numer, src.Kwota, src.Waluta, src.Status, 

src.NumerOperacjiZajeciaZabezpieczenia, src.NumerOperacjiZwolnieniaZabezpieczenia, src.NumerOperacjiWycofaniaZabezpieczenia, src.NiewaznaNaStronyKonwencji, src.KwotaEuro, src.UCGwarancji, 

src.KwotaPln, src.KodPrzyczynyOdrzucenia, src.OpisPrzyczynyOdrzucenia, src.StatusIntegralnosci, src.DataSprawdzeniaIntegralnosci, src.DataZapytaniaOIntegralnosc);
			SET @Merged = 1;
		END

		IF @TableName = 'InformacjeDodatkoweWPT' BEGIN
			MERGE INTO ncts2.InformacjeDodatkoweWPT AS tgt
			USING [WA_StageHurtownia].ncts2.InformacjeDodatkoweWPT AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdTowaru=src.IdTowaru, tgt.KodInfDod=src.KodInfDod, tgt.KrajWywozu=src.KrajWywozu, tgt.Tekst=src.Tekst, tgt.WywozUE=src.WywozUE, tgt.IdPozycji=src.IdPozycji
			WHEN NOT MATCHED
			THEN INSERT (IdTowaru, KodInfDod, KrajWywozu, Tekst, Id, WywozUE, IdPozycji)
			VALUES (src.IdTowaru, src.KodInfDod, src.KrajWywozu, src.Tekst, src.Id, src.WywozUE, src.IdPozycji);
			SET @Merged = 1;
		END

		IF @TableName = 'Kontenery' BEGIN
			MERGE INTO ncts2.Kontenery AS tgt
			USING [WA_StageHurtownia].ncts2.Kontenery AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdTowaru=src.IdTowaru, tgt.NrKonteneru=src.NrKonteneru, tgt.IdPozycji=src.IdPozycji, tgt.TrybUtworzeniaPozycji=src.TrybUtworzeniaPozycji, 

tgt.IteracjaUwagRozladunkowych=src.IteracjaUwagRozladunkowych
			WHEN NOT MATCHED
			THEN INSERT (Id, IdTowaru, NrKonteneru, IdPozycji, TrybUtworzeniaPozycji, IteracjaUwagRozladunkowych)
			VALUES (src.Id, src.IdTowaru, src.NrKonteneru, src.IdPozycji, src.TrybUtworzeniaPozycji, src.IteracjaUwagRozladunkowych);
			SET @Merged = 1;
		END

		IF @TableName = 'Opakowania' BEGIN
			MERGE INTO ncts2.Opakowania AS tgt
			USING [WA_StageHurtownia].ncts2.Opakowania AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdTowaru=src.IdTowaru, tgt.Rodzaj=src.Rodzaj, tgt.Znaki=src.Znaki, tgt.LiczbaOpakowan=src.LiczbaOpakowan, tgt.IloscSztuk=src.IloscSztuk, tgt.IdPozycji=src.IdPozycji, 

tgt.TrybUtworzeniaPozycji=src.TrybUtworzeniaPozycji, tgt.IteracjaUwagRozladunkowych=src.IteracjaUwagRozladunkowych, tgt.ZnakiJezyk=src.ZnakiJezyk
			WHEN NOT MATCHED
			THEN INSERT (IdTowaru, Rodzaj, Znaki, LiczbaOpakowan, IloscSztuk, Id, IdPozycji, TrybUtworzeniaPozycji, IteracjaUwagRozladunkowych, ZnakiJezyk)
			VALUES (src.IdTowaru, src.Rodzaj, src.Znaki, src.LiczbaOpakowan, src.IloscSztuk, src.Id, src.IdPozycji, src.TrybUtworzeniaPozycji, src.IteracjaUwagRozladunkowych, 

src.ZnakiJezyk);
			SET @Merged = 1;
		END

			IF @TableName = 'PoboryNaleznosci' BEGIN
			MERGE INTO ncts2.PoboryNaleznosci AS tgt
			USING [WA_StageHurtownia].ncts2.PoboryNaleznosci AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.UC=src.UC, tgt.IdOperacjiTranzytowej=src.IdOperacjiTranzytowej, tgt.MRN=src.MRN, tgt.RolaUrzedu=src.RolaUrzedu, tgt.Status=src.Status, tgt.StatusData=src.StatusData, 

tgt.UCPoboru=src.UCPoboru, tgt.UCPrzeprowadzajacyPobor=src.UCPrzeprowadzajacyPobor, tgt.IdOperacjiPoszukiwaniaPoboru=src.IdOperacjiPoszukiwaniaPoboru, tgt.DataUtworzenia=src.DataUtworzenia, 

tgt.DataModyfikacji=src.DataModyfikacji, tgt.TypDeklaracji=src.TypDeklaracji, tgt.UCWyjscia=src.UCWyjscia, tgt.ProceduraUproszczonaUCPrzeznaczenia=src.ProceduraUproszczonaUCPrzeznaczenia, 

tgt.PrzedstawiajacyTIN=src.PrzedstawiajacyTIN, tgt.PrzedstawiajacyNazwa=src.PrzedstawiajacyNazwa
			WHEN NOT MATCHED
			THEN INSERT (Id, UC, IdOperacjiTranzytowej, MRN, RolaUrzedu, Status, StatusData, UCPoboru, UCPrzeprowadzajacyPobor, IdOperacjiPoszukiwaniaPoboru, DataUtworzenia, 

DataModyfikacji, TypDeklaracji, UCWyjscia, ProceduraUproszczonaUCPrzeznaczenia, PrzedstawiajacyTIN, PrzedstawiajacyNazwa)
			VALUES (src.Id, src.UC, src.IdOperacjiTranzytowej, src.MRN, src.RolaUrzedu, src.Status, src.StatusData, src.UCPoboru, src.UCPrzeprowadzajacyPobor, 

src.IdOperacjiPoszukiwaniaPoboru, src.DataUtworzenia, src.DataModyfikacji, src.TypDeklaracji, src.UCWyjscia, src.ProceduraUproszczonaUCPrzeznaczenia, src.PrzedstawiajacyTIN, 

src.PrzedstawiajacyNazwa);
			SET @Merged = 1;
		END

		IF @TableName = 'PoszukiwaniaPoboryInfDodatk' BEGIN
			MERGE INTO ncts2.PoszukiwaniaPoboryInfDodatk AS tgt
			USING [WA_StageHurtownia].ncts2.PoszukiwaniaPoboryInfDodatk AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.Typ=src.Typ, tgt.MRN=src.MRN, tgt.DataWyslania=src.DataWyslania, tgt.IdKomunikatu=src.IdKomunikatu, tgt.IdZapytaniaPoszukiwawczego=src.IdZapytaniaPoszukiwawczego, 

tgt.DataUtworzenia=src.DataUtworzenia
			WHEN NOT MATCHED
			THEN INSERT (Id, Typ, MRN, DataWyslania, IdKomunikatu, IdZapytaniaPoszukiwawczego, DataUtworzenia)
			VALUES (src.Id, src.Typ, src.MRN, src.DataWyslania, src.IdKomunikatu, src.IdZapytaniaPoszukiwawczego, src.DataUtworzenia);
			SET @Merged = 1;
		END

		IF @TableName = 'RefProcUproszczTowWykluczone' BEGIN
			MERGE INTO ncts2.RefProcUproszczTowWykluczone AS tgt
			USING [WA_StageHurtownia].ncts2.RefProcUproszczTowWykluczone AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdMiejscaLokalizacjiTowaru=src.IdMiejscaLokalizacjiTowaru, tgt.Kod=src.Kod
			WHEN NOT MATCHED
			THEN INSERT (Id, IdMiejscaLokalizacjiTowaru, Kod)
			VALUES (src.Id, src.IdMiejscaLokalizacjiTowaru, src.Kod);
			SET @Merged = 1;
		END

		IF @TableName = 'TowaryUwagi' BEGIN
			MERGE INTO ncts2.TowaryUwagi AS tgt
			USING [WA_StageHurtownia].ncts2.TowaryUwagi AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdTowaru=src.IdTowaru, tgt.Uwagi=src.Uwagi, tgt.UwagiJezyk=src.UwagiJezyk, tgt.TrybUtworzeniaPozycji=src.TrybUtworzeniaPozycji, 

tgt.IteracjaUwagRozladunkowych=src.IteracjaUwagRozladunkowych
			WHEN NOT MATCHED
			THEN INSERT (Id, IdTowaru, Uwagi, UwagiJezyk, TrybUtworzeniaPozycji, IteracjaUwagRozladunkowych)
			VALUES (src.Id, src.IdTowaru, src.Uwagi, src.UwagiJezyk, src.TrybUtworzeniaPozycji, src.IteracjaUwagRozladunkowych);
			SET @Merged = 1;
		END

		IF @TableName = 'TowaryWrazliwe' BEGIN
			MERGE INTO ncts2.TowaryWrazliwe AS tgt
			USING [WA_StageHurtownia].ncts2.TowaryWrazliwe AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdTowaru=src.IdTowaru, tgt.Kod=src.Kod, tgt.Ilosc=src.Ilosc, tgt.IdPozycji=src.IdPozycji, tgt.TrybUtworzeniaPozycji=src.TrybUtworzeniaPozycji, 

tgt.IteracjaUwagRozladunkowych=src.IteracjaUwagRozladunkowych
			WHEN NOT MATCHED
			THEN INSERT (IdTowaru, Kod, Ilosc, IdPozycji, Id, TrybUtworzeniaPozycji, IteracjaUwagRozladunkowych)
			VALUES (src.IdTowaru, src.Kod, src.Ilosc, src.IdPozycji, src.Id, src.TrybUtworzeniaPozycji, src.IteracjaUwagRozladunkowych);
			SET @Merged = 1;
		END

		IF @TableName = 'UwagiRozladunkoweZamknieciaCelne' BEGIN
			MERGE INTO ncts2.UwagiRozladunkoweZamknieciaCelne AS tgt
			USING [WA_StageHurtownia].ncts2.UwagiRozladunkoweZamknieciaCelne AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdUwagiRozladunkowe=src.IdUwagiRozladunkowe, tgt.IdPozycji=src.IdPozycji, tgt.Numer=src.Numer
			WHEN NOT MATCHED
			THEN INSERT (Id, IdUwagiRozladunkowe, IdPozycji, Numer)
			VALUES (src.Id, src.IdUwagiRozladunkowe, src.IdPozycji, src.Numer);
			SET @Merged = 1;
		END

		IF @TableName = 'ZdarzeniaKontenery' BEGIN
			MERGE INTO ncts2.ZdarzeniaKontenery AS tgt
			USING [WA_StageHurtownia].ncts2.ZdarzeniaKontenery AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdZdarzenia=src.IdZdarzenia, tgt.IdPozycji=src.IdPozycji, tgt.Numer=src.Numer
			WHEN NOT MATCHED
			THEN INSERT (Id, IdZdarzenia, IdPozycji, Numer)
			VALUES (src.Id, src.IdZdarzenia, src.IdPozycji, src.Numer);
			SET @Merged = 1;
		END

		IF @TableName = 'ZdarzeniaZamknieciaCelne' BEGIN
			MERGE INTO ncts2.ZdarzeniaZamknieciaCelne AS tgt
			USING [WA_StageHurtownia].ncts2.ZdarzeniaZamknieciaCelne AS src
			ON (tgt.Id=src.Id)
			WHEN MATCHED
			THEN UPDATE SET
			tgt.IdZdarzenia=src.IdZdarzenia, tgt.IdPozycji=src.IdPozycji, tgt.Numer=src.Numer
			WHEN NOT MATCHED
			THEN INSERT (Id, IdZdarzenia, IdPozycji, Numer)
			VALUES (src.Id, src.IdZdarzenia, src.IdPozycji, src.Numer);
			SET @Merged = 1;
		END
		
		IF (@Merged = 0)
		BEGIN
				DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
				THROW 51002, @Info, 0;
					END
				END
			;