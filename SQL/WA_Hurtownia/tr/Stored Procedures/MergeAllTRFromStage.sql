-- =============================================
-- Author:		Tomasz Pióro
-- Create date: 2014-07-28
-- Description:	Merge z WA_StageHurtownia do WA_Hurtownia.
-- =============================================

CREATE PROCEDURE [tr].[MergeAllTRFromStage]
AS
BEGIN
	SET NOCOUNT ON;

		EXEC [tr].[MergeTableFromStageHurtownia] 'Podmioty'
		EXEC [tr].[MergeTableFromStageHurtownia] 'JednostkiMiary'
		EXEC [tr].[MergeTableFromStageHurtownia] 'KodyInformacjiDodatkowych'
		EXEC [tr].[MergeTableFromStageHurtownia] 'KrajoweWynikiAnalizyRyzykaWAR1'
		EXEC [tr].[MergeTableFromStageHurtownia] 'KrajoweWynikiAnalizyRyzykaWAR234'
		EXEC [tr].[MergeTableFromStageHurtownia] 'KrajoweWynikiRyzykaOperacjiTranzytowej'
		EXEC [tr].[MergeTableFromStageHurtownia] 'NazwyKodowInterwencjiCelnej'
		EXEC [tr].[MergeTableFromStageHurtownia] 'NryPozwNaProcedureUproszczona'
		EXEC [tr].[MergeTableFromStageHurtownia] 'PodmiotyPDR'
		EXEC [tr].[MergeTableFromStageHurtownia] 'PrzeladunekKontenerow'
		EXEC [tr].[MergeTableFromStageHurtownia] 'RodzajeKontroli'
		EXEC [tr].[MergeTableFromStageHurtownia] 'RodzajeTransportu'
		EXEC [tr].[MergeTableFromStageHurtownia] 'RodzajeWynikowKontroli'
		EXEC [tr].[MergeTableFromStageHurtownia] 'SymbolWaluty'
		EXEC [tr].[MergeTableFromStageHurtownia] 'SzczegolySkontrolowanejPozycji'
		EXEC [tr].[MergeTableFromStageHurtownia] 'TypyDeklaracji'
		EXEC [tr].[MergeTableFromStageHurtownia] 'TypyDokumentow'
		EXEC [tr].[MergeTableFromStageHurtownia] 'TypyGwarancji'
		EXEC [tr].[MergeTableFromStageHurtownia] 'TypyOpakowan'
		EXEC [tr].[MergeTableFromStageHurtownia] 'TypyStatusowOperacjiTranzytowej'
		EXEC [tr].[MergeTableFromStageHurtownia] 'TypyTransportuPrzekrGranice'
		EXEC [tr].[MergeTableFromStageHurtownia] 'Urzedy'
		EXEC [tr].[MergeTableFromStageHurtownia] 'WskaznikiWarunkowSzczegolnych'
		EXEC [tr].[MergeTableFromStageHurtownia] 'WynikiAnalizyRyzyka'
		EXEC [tr].[MergeTableFromStageHurtownia] 'ZdarzeniaWTrakcieTransportu'
		EXEC [tr].[MergeTableFromStageHurtownia] 'DokumentySkontrolowanejPozycji'
		EXEC [tr].[MergeTableFromStageHurtownia] 'KontenerySkontrolowanejPozycji'
		EXEC [tr].[MergeTableFromStageHurtownia] 'KontrolaOpakowan'
		EXEC [tr].[MergeTableFromStageHurtownia] 'OperacjeTranzytowe'
		EXEC [tr].[MergeTableFromStageHurtownia] 'PlacowkiObjetePozwoleniamiPU'
		EXEC [tr].[MergeTableFromStageHurtownia] 'PozwoleniaNaProceduryUproszczone'
		EXEC [tr].[MergeTableFromStageHurtownia] 'SkontrolowanePozycjeInformacjeDodatkowe'
		EXEC [tr].[MergeTableFromStageHurtownia] 'SlownikTowarowWrazliwych'
		EXEC [tr].[MergeTableFromStageHurtownia] 'SzczegolyZdarzenWTrakcieTransportu'
		EXEC [tr].[MergeTableFromStageHurtownia] 'WynikiSkontrolowanejPozycji'
		EXEC [tr].[MergeTableFromStageHurtownia] 'HistoriaStatusowOperacjiTranzytowej'
		EXEC [tr].[MergeTableFromStageHurtownia] 'InformacjeoTowarachWrazliwych'
		EXEC [tr].[MergeTableFromStageHurtownia] 'SkontrolowanePozycjeTowaryWrazliwe'
		EXEC [tr].[MergeTableFromStageHurtownia] 'SzczegolyKontroli'
		EXEC [tr].[MergeTableFromStageHurtownia] 'TrasyPrzewozu'
		EXEC [tr].[MergeTableFromStageHurtownia] 'WersjaOperacjiTranzytowej'
		EXEC [tr].[MergeTableFromStageHurtownia] 'GwarancjaDlaOperacjiTranzytowej'
		EXEC [tr].[MergeTableFromStageHurtownia] 'InformacjeOPlombach'
		EXEC [tr].[MergeTableFromStageHurtownia] 'OperacjeTranzytoweUCTranzytowym'
		EXEC [tr].[MergeTableFromStageHurtownia] 'PozycjaTowarowaOperacjiTranzytowej'
		EXEC [tr].[MergeTableFromStageHurtownia] 'SzczegolyOperacjiTranzytowej'
		EXEC [tr].[MergeTableFromStageHurtownia] 'InformacjeDodatkoweOTowarach'
		EXEC [tr].[MergeTableFromStageHurtownia] 'InformacjeoDokumentachTowarow'
		EXEC [tr].[MergeTableFromStageHurtownia] 'InformacjeoKontenerachTowarow'
		EXEC [tr].[MergeTableFromStageHurtownia] 'InformacjeoOpakowaniachTowarow'
		EXEC [tr].[MergeTableFromStageHurtownia] 'UzycieGwarancjiDlaOperacjiTranzytowej'

END