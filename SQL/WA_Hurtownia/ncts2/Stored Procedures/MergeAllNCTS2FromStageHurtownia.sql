






-- =============================================
-- Author:		Michał Błędowski
-- Create date: 2015-10-27
-- Description:	Procedura merge'ująca w schemacie NCTS2.
-- =============================================

CREATE PROCEDURE [ncts2].[MergeAllNCTS2FromStageHurtownia]
AS
BEGIN
	SET NOCOUNT ON;

EXEC [ncts2].[MergeTableFromStageHurtownia] 'AnalizaRyzykaDokument';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'OperacjeTranzytowe';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'RefPodmioty';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'RefPodmiotyAEO';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'RefPozwolNaProcUproszcz';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'RefReprezentanci';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'RefUrzCel';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'SafeTIRRejAwaryjne';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'SlownikiTypy';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'TrasyPrzewozu';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'UpowOdbiorca';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'UzytkownicyUprawnieniaOC';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'ZapytaniaOGwarancje';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'ZapytaniaOPrzesylki';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'AnalizaRyzykaObslugaWskazanKontroli';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'HistoriaZmianTowarow';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'KrajeWyslaneInfoOTranzycie';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'OperacjaTranzytoweGwarancje';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'OperacjeTranzytoweInneInformacje';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'OpercjeTranzytoweSzczegoly';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'PoszukiwaniaPobory';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'RefProcUproszczMiejscaLokalTow';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'RefUrzCelPodmioty';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'SlownikiWartosci';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'Towary';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'UCTranzytowe';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'UwagiRozladunkowe';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'WynikiKontroli';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'ZamknieciaCelne';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'Zdarzenia';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'AnalizaRyzykaMetodyKontroli';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'AnalizaRyzykaObslugaWskazanKontroliPozycje';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'AnalizaRyzykaZespolKontroli';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'DokPoprzednieWPT';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'DokWymaganeWPT';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'Gwarancje';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'InformacjeDodatkoweWPT';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'Kontenery';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'Opakowania';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'PoboryNaleznosci';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'PoszukiwaniaPoboryInfDodatk';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'RefProcUproszczTowWykluczone';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'TowaryUwagi';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'TowaryWrazliwe';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'UwagiRozladunkoweZamknieciaCelne';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'ZdarzeniaKontenery';
EXEC [ncts2].[MergeTableFromStageHurtownia] 'ZdarzeniaZamknieciaCelne';

END