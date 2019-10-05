-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-29
-- Description:	Procedura czyści wszystkie tabele znajdujące się w WA_StageHurtownia przygotowując je do zasilenia (przyrostowego) z systemu TR
-- =============================================
CREATE PROCEDURE [tr].[TruncateAllStageTR]
AS
BEGIN
	SET NOCOUNT ON;
		TRUNCATE TABLE [tr].[PrzeladunekKontenerow];
		TRUNCATE TABLE [tr].[DokumentySkontrolowanejPozycji];
		TRUNCATE TABLE [tr].[GwarancjaDlaOperacjiTranzytowej];
		TRUNCATE TABLE [tr].[HistoriaStatusowOperacjiTranzytowej];
		TRUNCATE TABLE [tr].[InformacjeDodatkoweOTowarach];
		TRUNCATE TABLE [tr].[InformacjeoDokumentachTowarow];
		TRUNCATE TABLE [tr].[InformacjeoKontenerachTowarow];
		TRUNCATE TABLE [tr].[InformacjeoOpakowaniachTowarow];
		TRUNCATE TABLE [tr].[InformacjeOPlombach];
		TRUNCATE TABLE [tr].[InformacjeoTowarachWrazliwych];
		TRUNCATE TABLE [tr].[JednostkiMiary];
		TRUNCATE TABLE [tr].[KodyInformacjiDodatkowych];
		TRUNCATE TABLE [tr].[KontenerySkontrolowanejPozycji];
		TRUNCATE TABLE [tr].[KontrolaOpakowan];
		TRUNCATE TABLE [tr].[KrajoweWynikiAnalizyRyzykaWAR1];
		TRUNCATE TABLE [tr].[KrajoweWynikiAnalizyRyzykaWAR234];
		TRUNCATE TABLE [tr].[KrajoweWynikiRyzykaOperacjiTranzytowej];
		TRUNCATE TABLE [tr].[NazwyKodowInterwencjiCelnej];
		TRUNCATE TABLE [tr].[NryPozwNaProcedureUproszczona];
		TRUNCATE TABLE [tr].[OperacjeTranzytowe];
		TRUNCATE TABLE [tr].[OperacjeTranzytoweUCTranzytowym];
		TRUNCATE TABLE [tr].[PlacowkiObjetePozwoleniamiPU];
		TRUNCATE TABLE [tr].[PodmiotyPDR];
		TRUNCATE TABLE [tr].[PozwoleniaNaProceduryUproszczone];
		TRUNCATE TABLE [tr].[PozycjaTowarowaOperacjiTranzytowej];
		TRUNCATE TABLE [tr].[RodzajeKontroli];
		TRUNCATE TABLE [tr].[RodzajeTransportu];
		TRUNCATE TABLE [tr].[RodzajeWynikowKontroli];
		TRUNCATE TABLE [tr].[SkontrolowanePozycjeInformacjeDodatkowe];
		TRUNCATE TABLE [tr].[SkontrolowanePozycjeTowaryWrazliwe];
		TRUNCATE TABLE [tr].[SlownikTowarowWrazliwych];
		TRUNCATE TABLE [tr].[SymbolWaluty];
		TRUNCATE TABLE [tr].[SzczegolyKontroli];
		TRUNCATE TABLE [tr].[SzczegolyOperacjiTranzytowej];
		TRUNCATE TABLE [tr].[SzczegolySkontrolowanejPozycji];
		TRUNCATE TABLE [tr].[SzczegolyZdarzenWTrakcieTransportu];
		TRUNCATE TABLE [tr].[TrasyPrzewozu];
		TRUNCATE TABLE [tr].[TypyDeklaracji];
		TRUNCATE TABLE [tr].[TypyDokumentow];
		TRUNCATE TABLE [tr].[TypyGwarancji];
		TRUNCATE TABLE [tr].[TypyOpakowan];
		TRUNCATE TABLE [tr].[TypyStatusowOperacjiTranzytowej];
		TRUNCATE TABLE [tr].[TypyTransportuPrzekrGranice];
		TRUNCATE TABLE [tr].[Urzedy];
		TRUNCATE TABLE [tr].[UzycieGwarancjiDlaOperacjiTranzytowej];
		TRUNCATE TABLE [tr].[WersjaOperacjiTranzytowej];
		TRUNCATE TABLE [tr].[WskaznikiWarunkowSzczegolnych];
		TRUNCATE TABLE [tr].[WynikiAnalizyRyzyka];
		TRUNCATE TABLE [tr].[WynikiSkontrolowanejPozycji];
		TRUNCATE TABLE [tr].[ZdarzeniaWTrakcieTransportu];
		TRUNCATE TABLE [tr].[Podmioty];
	END