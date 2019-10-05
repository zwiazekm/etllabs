



CREATE PROCEDURE [ncts2].[TruncateAllNCTS2]
AS
BEGIN
	SET NOCOUNT ON;

		TRUNCATE TABLE [ncts2].[AnalizaRyzykaDokument];
		TRUNCATE TABLE [ncts2].[AnalizaRyzykaMetodyKontroli];
		TRUNCATE TABLE [ncts2].[AnalizaRyzykaObslugaWskazanKontroli];
		TRUNCATE TABLE [ncts2].[AnalizaRyzykaObslugaWskazanKontroliPozycje];
		TRUNCATE TABLE [ncts2].[AnalizaRyzykaZespolKontroli];
		TRUNCATE TABLE [ncts2].[UzytkownicyUprawnieniaOC];
		TRUNCATE TABLE [ncts2].[DokPoprzednieWPT];
		TRUNCATE TABLE [ncts2].[DokWymaganeWPT];
		TRUNCATE TABLE [ncts2].[Gwarancje];
		TRUNCATE TABLE [ncts2].[HistoriaZmianTowarow];
		TRUNCATE TABLE [ncts2].[InformacjeDodatkoweWPT];
		TRUNCATE TABLE [ncts2].[Kontenery];
		TRUNCATE TABLE [ncts2].[KrajeWyslaneInfoOTranzycie];
		TRUNCATE TABLE [ncts2].[Opakowania];
		TRUNCATE TABLE [ncts2].[OperacjeTranzytowe];
		TRUNCATE TABLE [ncts2].[OperacjaTranzytoweGwarancje];
		TRUNCATE TABLE [ncts2].[OperacjeTranzytoweInneInformacje];
		TRUNCATE TABLE [ncts2].[OpercjeTranzytoweSzczegoly];
		TRUNCATE TABLE [ncts2].[PoboryNaleznosci];
		TRUNCATE TABLE [ncts2].[PoszukiwaniaPobory];
		TRUNCATE TABLE [ncts2].[PoszukiwaniaPoboryInfDodatk];
		TRUNCATE TABLE [ncts2].[RefPodmioty];
		TRUNCATE TABLE [ncts2].[RefPodmiotyAEO];
		TRUNCATE TABLE [ncts2].[RefPozwolNaProcUproszcz];
		TRUNCATE TABLE [ncts2].[RefProcUproszczTowWykluczone];
		TRUNCATE TABLE [ncts2].[RefProcUproszczMiejscaLokalTow];
		TRUNCATE TABLE [ncts2].[RefReprezentanci];
		TRUNCATE TABLE [ncts2].[RefUrzCel];
		TRUNCATE TABLE [ncts2].[RefUrzCelPodmioty];
		TRUNCATE TABLE [ncts2].[SafeTIRRejAwaryjne];
		TRUNCATE TABLE [ncts2].[SlownikiTypy];
		TRUNCATE TABLE [ncts2].[SlownikiWartosci];
		TRUNCATE TABLE [ncts2].[Towary];
		TRUNCATE TABLE [ncts2].[TowaryUwagi];
		TRUNCATE TABLE [ncts2].[TowaryWrazliwe];
		TRUNCATE TABLE [ncts2].[TrasyPrzewozu];
		TRUNCATE TABLE [ncts2].[UCTranzytowe];
		TRUNCATE TABLE [ncts2].[UpowOdbiorca];
		TRUNCATE TABLE [ncts2].[UwagiRozladunkowe];
		TRUNCATE TABLE [ncts2].[UwagiRozladunkoweZamknieciaCelne];
		TRUNCATE TABLE [ncts2].[WynikiKontroli];
		TRUNCATE TABLE [ncts2].[ZamknieciaCelne];
		TRUNCATE TABLE [ncts2].[ZapytaniaOGwarancje];
		TRUNCATE TABLE [ncts2].[ZapytaniaOPrzesylki];
		TRUNCATE TABLE [ncts2].[Zdarzenia];
		TRUNCATE TABLE [ncts2].[ZdarzeniaKontenery];
		TRUNCATE TABLE [ncts2].[ZdarzeniaZamknieciaCelne];

	END