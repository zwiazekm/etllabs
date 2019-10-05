

-- =============================================
-- Author:	
-- Create date: 2016-10-20
-- Description:	
-- =============================================

CREATE PROCEDURE [emcs2].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END


IF @TableName = '[emcs2].[AD_SzczegolyTransportu]'
BEGIN
MERGE INTO [emcs2].[AD_SzczegolyTransportu] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_SzczegolyTransportu]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[InformacjaPieczecKodJezyka]=src.[InformacjaPieczecKodJezyka],
tgt.[InfPieczec]=src.[InfPieczec],
tgt.[KodJednTransp]=src.[KodJednTransp],
tgt.[DodInf]=src.[DodInf],
tgt.[OznaczeniePieczecHandl]=src.[OznaczeniePieczecHandl],
tgt.[DodatkoweInformacjeKodJezyka]=src.[DodatkoweInformacjeKodJezyka],
tgt.[OznJednTransp]=src.[OznJednTransp],
tgt.[IdDokAD]=src.[IdDokAD]

WHEN NOT MATCHED
THEN INSERT (
[InformacjaPieczecKodJezyka], [InfPieczec], [KodJednTransp], [DodInf], [Id], [OznaczeniePieczecHandl], [DodatkoweInformacjeKodJezyka], [OznJednTransp], [IdDokAD] )
VALUES ([InformacjaPieczecKodJezyka], [InfPieczec], [KodJednTransp], [DodInf], [Id], [OznaczeniePieczecHandl], [DodatkoweInformacjeKodJezyka], [OznJednTransp], [IdDokAD] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_Dokument]'
BEGIN
MERGE INTO [emcs2].[AD_Dokument] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[OrganizatorTranspNrDomu]=src.[OrganizatorTranspNrDomu],
tgt.[Gwarant2Nazwa]=src.[Gwarant2Nazwa],
tgt.[OdbierajacyNrDomu]=src.[OdbierajacyNrDomu],
tgt.[Gwarant1KodPocztowy]=src.[Gwarant1KodPocztowy],
tgt.[TypZgloszenia]=src.[TypZgloszenia],
tgt.[CzyOdbierajacyZmieniony]=src.[CzyOdbierajacyZmieniony],
tgt.[Gwarant2NrVAT]=src.[Gwarant2NrVAT],
tgt.[MiejsceDostawyUlica]=src.[MiejsceDostawyUlica],
tgt.[Gwarant2KodPocztowy]=src.[Gwarant2KodPocztowy],
tgt.[DataCzasWysylki]=src.[DataCzasWysylki],
tgt.[Gwarant2Ulica]=src.[Gwarant2Ulica],
tgt.[DataFaktury]=src.[DataFaktury],
tgt.[WysylajacyMiejscowosc]=src.[WysylajacyMiejscowosc],
tgt.[GwarantKodRodz]=src.[GwarantKodRodz],
tgt.[FlagaOdroczeniaPotwierdzenia]=src.[FlagaOdroczeniaPotwierdzenia],
tgt.[TransportKodRodz]=src.[TransportKodRodz],
tgt.[CzySkontrolowanoMiejsceDostawy]=src.[CzySkontrolowanoMiejsceDostawy],
tgt.[MRN]=src.[MRN],
tgt.[PierwszyPrzewoznikNrVAT]=src.[PierwszyPrzewoznikNrVAT],
tgt.[DataOdrzuceniaLubOstrzezenia]=src.[DataOdrzuceniaLubOstrzezenia],
tgt.[TransportDodatkoweInfoKodJezyka]=src.[TransportDodatkoweInfoKodJezyka],
tgt.[TINWysylajacegoDlaZabezpMagazyn]=src.[TINWysylajacegoDlaZabezpMagazyn],
tgt.[OdbierajacyKodJezyka]=src.[OdbierajacyKodJezyka],
tgt.[CzyJestUstawionyCzasWysylki]=src.[CzyJestUstawionyCzasWysylki],
tgt.[OdbiorcaPrzekierowanieEmail]=src.[OdbiorcaPrzekierowanieEmail],
tgt.[NrFaktury]=src.[NrFaktury],
tgt.[Gwarant1NrDomu]=src.[Gwarant1NrDomu],
tgt.[KwotaGwarancjiDlaZabezpMagazyn]=src.[KwotaGwarancjiDlaZabezpMagazyn],
tgt.[CzyPrzemieszczeniePrzeterminowane]=src.[CzyPrzemieszczeniePrzeterminowane],
tgt.[PierwszyPrzewoznikKodPocztowy]=src.[PierwszyPrzewoznikKodPocztowy],
tgt.[OdbierajacyEORI]=src.[OdbierajacyEORI],
tgt.[DataRaportuODostarczeniu]=src.[DataRaportuODostarczeniu],
tgt.[WysylajacyNrDomu]=src.[WysylajacyNrDomu],
tgt.[MiejsceWysylkiNazwaPodm]=src.[MiejsceWysylkiNazwaPodm],
tgt.[OrganizatorTranspKodPocztowy]=src.[OrganizatorTranspKodPocztowy],
tgt.[PierwszyPrzewoznikKodJezyka]=src.[PierwszyPrzewoznikKodJezyka],
tgt.[CzyOpozniony]=src.[CzyOpozniony],
tgt.[DataUniewaznienia]=src.[DataUniewaznienia],
tgt.[UzupOdbierajacyKodKraju]=src.[UzupOdbierajacyKodKraju],
tgt.[CzyWyjasnieniaZgloszonePrzezWysylajacego]=src.[CzyWyjasnieniaZgloszonePrzezWysylajacego],
tgt.[KodRodzMiejscaPrzezn]=src.[KodRodzMiejscaPrzezn],
tgt.[MiejsceDostawyIdentyfikacja]=src.[MiejsceDostawyIdentyfikacja],
tgt.[AERZnalezioneRozbiez]=src.[AERZnalezioneRozbiez],
tgt.[ARC]=src.[ARC],
tgt.[KodRodzMiejscaPochRozpPrzem]=src.[KodRodzMiejscaPochRozpPrzem],
tgt.[KodWyrobuAkcyzowego]=src.[KodWyrobuAkcyzowego],
tgt.[OrganizatorTranspKodJezyka]=src.[OrganizatorTranspKodJezyka],
tgt.[UrzadKontroliWMiejscuWysylki]=src.[UrzadKontroliWMiejscuWysylki],
tgt.[OdbierajacyIdentyfikacja]=src.[OdbierajacyIdentyfikacja],
tgt.[NadrzednyARC]=src.[NadrzednyARC],
tgt.[Gwarant1NrVAT]=src.[Gwarant1NrVAT],
tgt.[OrganizatorTranspMiejscowosc]=src.[OrganizatorTranspMiejscowosc],
tgt.[CzyPrzemieszczenieKrajowe]=src.[CzyPrzemieszczenieKrajowe],
tgt.[CzasPrzewozu]=src.[CzasPrzewozu],
tgt.[Gwarant2Miejscowosc]=src.[Gwarant2Miejscowosc],
tgt.[WysylajacyNrAkcyzowy]=src.[WysylajacyNrAkcyzowy],
tgt.[TransportDodatkoweInfo]=src.[TransportDodatkoweInfo],
tgt.[Gwarant1Miejscowosc]=src.[Gwarant1Miejscowosc],
tgt.[DataCzasZatwierdzeniaAD]=src.[DataCzasZatwierdzeniaAD],
tgt.[MiejsceDostawyKodJezyka]=src.[MiejsceDostawyKodJezyka],
tgt.[UrzadNadzoruWMiejscuOdbioru]=src.[UrzadNadzoruWMiejscuOdbioru],
tgt.[GRNDlaZabezpMagazyn]=src.[GRNDlaZabezpMagazyn],
tgt.[CzyPrzewoznikZmieniony]=src.[CzyPrzewoznikZmieniony],
tgt.[OrganizacjaPrzewozu]=src.[OrganizacjaPrzewozu],
tgt.[OddzialDoKontroliWMiejscuZgloszenia]=src.[OddzialDoKontroliWMiejscuZgloszenia],
tgt.[UrzadKontroliWMiejscuOdbioru]=src.[UrzadKontroliWMiejscuOdbioru],
tgt.[LRN]=src.[LRN],
tgt.[PierwszyPrzewoznikMiejscowosc]=src.[PierwszyPrzewoznikMiejscowosc],
tgt.[Gwarant1KodJezyka]=src.[Gwarant1KodJezyka],
tgt.[Gwarant2NrAkcyzowy]=src.[Gwarant2NrAkcyzowy],
tgt.[Gwarant1Nazwa]=src.[Gwarant1Nazwa],
tgt.[DataEksportu]=src.[DataEksportu],
tgt.[DataCzasZatwierdzeniaUzup]=src.[DataCzasZatwierdzeniaUzup],
tgt.[OdbiorcaNRA]=src.[OdbiorcaNRA],
tgt.[MiejsceDostawyMiejscowosc]=src.[MiejsceDostawyMiejscowosc],
tgt.[Gwarant1Ulica]=src.[Gwarant1Ulica],
tgt.[MiejsceWysylkiNrDomu]=src.[MiejsceWysylkiNrDomu],
tgt.[Gwarant2KodJezyka]=src.[Gwarant2KodJezyka],
tgt.[CzyPowiadomionoODostarczeniu]=src.[CzyPowiadomionoODostarczeniu],
tgt.[MiejsceWysylkiUlica]=src.[MiejsceWysylkiUlica],
tgt.[GwarantTIN]=src.[GwarantTIN],
tgt.[WysylajacyNazwa]=src.[WysylajacyNazwa],
tgt.[WysylajacyUlica]=src.[WysylajacyUlica],
tgt.[MiejsceDostawyKodPocztowy]=src.[MiejsceDostawyKodPocztowy],
tgt.[OrganizatorTranspNazwa]=src.[OrganizatorTranspNazwa],
tgt.[Gwarant1NrAkcyzowy]=src.[Gwarant1NrAkcyzowy],
tgt.[OrganizatorTranspUlica]=src.[OrganizatorTranspUlica],
tgt.[WysylajacyKodPocztowy]=src.[WysylajacyKodPocztowy],
tgt.[CzyMiejsceWysylkiKrajowe]=src.[CzyMiejsceWysylkiKrajowe],
tgt.[CzyWyjasnieniaZgloszonePrzezOdbierajacego]=src.[CzyWyjasnieniaZgloszonePrzezOdbierajacego],
tgt.[PozostalaGwaracjaDlaZabezpMagazyn]=src.[PozostalaGwaracjaDlaZabezpMagazyn],
tgt.[DataPowiadomieniaKontroli]=src.[DataPowiadomieniaKontroli],
tgt.[OdbierajacyTIN]=src.[OdbierajacyTIN],
tgt.[UrzadNadzoruWMiejscuWysylki]=src.[UrzadNadzoruWMiejscuWysylki],
tgt.[KwotaGwarancji]=src.[KwotaGwarancji],
tgt.[ManualneZwolnienieKwotyGwarancji]=src.[ManualneZwolnienieKwotyGwarancji],
tgt.[PozostalaKwotaGwarancji]=src.[PozostalaKwotaGwarancji],
tgt.[BrakujacaKwotaGwarancji]=src.[BrakujacaKwotaGwarancji],
tgt.[KodPrzemieszczenia]=src.[KodPrzemieszczenia],
tgt.[DataPodzialuPrzesylki]=src.[DataPodzialuPrzesylki],
tgt.[MiejsceWysylkiNrSkladuPod]=src.[MiejsceWysylkiNrSkladuPod],
tgt.[OdbierajacyMiejscowosc]=src.[OdbierajacyMiejscowosc],
tgt.[WysylajacyKodJezyka]=src.[WysylajacyKodJezyka],
tgt.[PierwszyPrzewoznikNrDomu]=src.[PierwszyPrzewoznikNrDomu],
tgt.[MiejsceWysylkiKodPocztowy]=src.[MiejsceWysylkiKodPocztowy],
tgt.[NrPorzadkowy]=src.[NrPorzadkowy],
tgt.[OdbierajacyNazwa]=src.[OdbierajacyNazwa],
tgt.[NadawcaEmail]=src.[NadawcaEmail],
tgt.[PierwszyPrzewoznikNazwa]=src.[PierwszyPrzewoznikNazwa],
tgt.[MiejsceDostawyNrDomu]=src.[MiejsceDostawyNrDomu],
tgt.[UzupOdbierajacyNrSwiadectwaZwol]=src.[UzupOdbierajacyNrSwiadectwaZwol],
tgt.[PierwszyPrzewoznikUlica]=src.[PierwszyPrzewoznikUlica],
tgt.[NadawcaNRA]=src.[NadawcaNRA],
tgt.[MiejsceWysylkiKodJezyka]=src.[MiejsceWysylkiKodJezyka],
tgt.[OdbierajacyUlica]=src.[OdbierajacyUlica],
tgt.[CzySkontrolowanoMiejsceWysylki]=src.[CzySkontrolowanoMiejsceWysylki],
tgt.[GRN]=src.[GRN],
tgt.[MiejsceWysylkiMiejscowosc]=src.[MiejsceWysylkiMiejscowosc],
tgt.[OrganizatorTranspNrVAT]=src.[OrganizatorTranspNrVAT],
tgt.[OdbierajacyKodPocztowy]=src.[OdbierajacyKodPocztowy],
tgt.[Gwarant2NrDomu]=src.[Gwarant2NrDomu],
tgt.[Status]=src.[Status],
tgt.[MiejsceDostawyNazwaPodm]=src.[MiejsceDostawyNazwaPodm]

WHEN NOT MATCHED
THEN INSERT (
[OrganizatorTranspNrDomu], [Gwarant2Nazwa], [OdbierajacyNrDomu], [Gwarant1KodPocztowy], [TypZgloszenia], [CzyOdbierajacyZmieniony], [Gwarant2NrVAT], [MiejsceDostawyUlica], [Gwarant2KodPocztowy], [DataCzasWysylki], [Gwarant2Ulica], [DataFaktury], [WysylajacyMiejscowosc], [GwarantKodRodz], [FlagaOdroczeniaPotwierdzenia], [TransportKodRodz], [CzySkontrolowanoMiejsceDostawy], [MRN], [PierwszyPrzewoznikNrVAT], [DataOdrzuceniaLubOstrzezenia], [TransportDodatkoweInfoKodJezyka], [TINWysylajacegoDlaZabezpMagazyn], [OdbierajacyKodJezyka], [CzyJestUstawionyCzasWysylki], [OdbiorcaPrzekierowanieEmail], [NrFaktury], [Gwarant1NrDomu], [KwotaGwarancjiDlaZabezpMagazyn], [CzyPrzemieszczeniePrzeterminowane], [PierwszyPrzewoznikKodPocztowy], [OdbierajacyEORI], [DataRaportuODostarczeniu], [WysylajacyNrDomu], [MiejsceWysylkiNazwaPodm], [OrganizatorTranspKodPocztowy], [PierwszyPrzewoznikKodJezyka], [CzyOpozniony], [DataUniewaznienia], [UzupOdbierajacyKodKraju], [CzyWyjasnieniaZgloszonePrzezWysylajacego], [KodRodzMiejscaPrzezn], [MiejsceDostawyIdentyfikacja], [AERZnalezioneRozbiez], [ARC], [KodRodzMiejscaPochRozpPrzem], [KodWyrobuAkcyzowego], [OrganizatorTranspKodJezyka], [Id], [UrzadKontroliWMiejscuWysylki], [OdbierajacyIdentyfikacja], [NadrzednyARC], [Gwarant1NrVAT], [OrganizatorTranspMiejscowosc], [CzyPrzemieszczenieKrajowe], [CzasPrzewozu], [Gwarant2Miejscowosc], [WysylajacyNrAkcyzowy], [TransportDodatkoweInfo], [Gwarant1Miejscowosc], [DataCzasZatwierdzeniaAD], [MiejsceDostawyKodJezyka], [UrzadNadzoruWMiejscuOdbioru], [GRNDlaZabezpMagazyn], [CzyPrzewoznikZmieniony], [OrganizacjaPrzewozu], [OddzialDoKontroliWMiejscuZgloszenia], [UrzadKontroliWMiejscuOdbioru], [LRN], [PierwszyPrzewoznikMiejscowosc], [Gwarant1KodJezyka], [Gwarant2NrAkcyzowy], [Gwarant1Nazwa], [DataEksportu], [DataCzasZatwierdzeniaUzup], [OdbiorcaNRA], [MiejsceDostawyMiejscowosc], [Gwarant1Ulica], [MiejsceWysylkiNrDomu], [Gwarant2KodJezyka], [CzyPowiadomionoODostarczeniu], [MiejsceWysylkiUlica], [GwarantTIN], [WysylajacyNazwa], [WysylajacyUlica], [MiejsceDostawyKodPocztowy], [OrganizatorTranspNazwa], [Gwarant1NrAkcyzowy], [OrganizatorTranspUlica], [WysylajacyKodPocztowy], [CzyMiejsceWysylkiKrajowe], [CzyWyjasnieniaZgloszonePrzezOdbierajacego], [PozostalaGwaracjaDlaZabezpMagazyn], [DataPowiadomieniaKontroli], [OdbierajacyTIN], [UrzadNadzoruWMiejscuWysylki], [KwotaGwarancji], [ManualneZwolnienieKwotyGwarancji], [PozostalaKwotaGwarancji], [BrakujacaKwotaGwarancji], [KodPrzemieszczenia], [DataPodzialuPrzesylki], [MiejsceWysylkiNrSkladuPod], [OdbierajacyMiejscowosc], [WysylajacyKodJezyka], [PierwszyPrzewoznikNrDomu], [MiejsceWysylkiKodPocztowy], [NrPorzadkowy], [OdbierajacyNazwa], [NadawcaEmail], [PierwszyPrzewoznikNazwa], [MiejsceDostawyNrDomu], [UzupOdbierajacyNrSwiadectwaZwol], [PierwszyPrzewoznikUlica], [NadawcaNRA], [MiejsceWysylkiKodJezyka], [OdbierajacyUlica], [CzySkontrolowanoMiejsceWysylki], [GRN], [MiejsceWysylkiMiejscowosc], [OrganizatorTranspNrVAT], [OdbierajacyKodPocztowy], [Gwarant2NrDomu], [Status], [MiejsceDostawyNazwaPodm] )
VALUES ([OrganizatorTranspNrDomu], [Gwarant2Nazwa], [OdbierajacyNrDomu], [Gwarant1KodPocztowy], [TypZgloszenia], [CzyOdbierajacyZmieniony], [Gwarant2NrVAT], [MiejsceDostawyUlica], [Gwarant2KodPocztowy], [DataCzasWysylki], [Gwarant2Ulica], [DataFaktury], [WysylajacyMiejscowosc], [GwarantKodRodz], [FlagaOdroczeniaPotwierdzenia], [TransportKodRodz], [CzySkontrolowanoMiejsceDostawy], [MRN], [PierwszyPrzewoznikNrVAT], [DataOdrzuceniaLubOstrzezenia], [TransportDodatkoweInfoKodJezyka], [TINWysylajacegoDlaZabezpMagazyn], [OdbierajacyKodJezyka], [CzyJestUstawionyCzasWysylki], [OdbiorcaPrzekierowanieEmail], [NrFaktury], [Gwarant1NrDomu], [KwotaGwarancjiDlaZabezpMagazyn], [CzyPrzemieszczeniePrzeterminowane], [PierwszyPrzewoznikKodPocztowy], [OdbierajacyEORI], [DataRaportuODostarczeniu], [WysylajacyNrDomu], [MiejsceWysylkiNazwaPodm], [OrganizatorTranspKodPocztowy], [PierwszyPrzewoznikKodJezyka], [CzyOpozniony], [DataUniewaznienia], [UzupOdbierajacyKodKraju], [CzyWyjasnieniaZgloszonePrzezWysylajacego], [KodRodzMiejscaPrzezn], [MiejsceDostawyIdentyfikacja], [AERZnalezioneRozbiez], [ARC], [KodRodzMiejscaPochRozpPrzem], [KodWyrobuAkcyzowego], [OrganizatorTranspKodJezyka], [Id], [UrzadKontroliWMiejscuWysylki], [OdbierajacyIdentyfikacja], [NadrzednyARC], [Gwarant1NrVAT], [OrganizatorTranspMiejscowosc], [CzyPrzemieszczenieKrajowe], [CzasPrzewozu], [Gwarant2Miejscowosc], [WysylajacyNrAkcyzowy], [TransportDodatkoweInfo], [Gwarant1Miejscowosc], [DataCzasZatwierdzeniaAD], [MiejsceDostawyKodJezyka], [UrzadNadzoruWMiejscuOdbioru], [GRNDlaZabezpMagazyn], [CzyPrzewoznikZmieniony], [OrganizacjaPrzewozu], [OddzialDoKontroliWMiejscuZgloszenia], [UrzadKontroliWMiejscuOdbioru], [LRN], [PierwszyPrzewoznikMiejscowosc], [Gwarant1KodJezyka], [Gwarant2NrAkcyzowy], [Gwarant1Nazwa], [DataEksportu], [DataCzasZatwierdzeniaUzup], [OdbiorcaNRA], [MiejsceDostawyMiejscowosc], [Gwarant1Ulica], [MiejsceWysylkiNrDomu], [Gwarant2KodJezyka], [CzyPowiadomionoODostarczeniu], [MiejsceWysylkiUlica], [GwarantTIN], [WysylajacyNazwa], [WysylajacyUlica], [MiejsceDostawyKodPocztowy], [OrganizatorTranspNazwa], [Gwarant1NrAkcyzowy], [OrganizatorTranspUlica], [WysylajacyKodPocztowy], [CzyMiejsceWysylkiKrajowe], [CzyWyjasnieniaZgloszonePrzezOdbierajacego], [PozostalaGwaracjaDlaZabezpMagazyn], [DataPowiadomieniaKontroli], [OdbierajacyTIN], [UrzadNadzoruWMiejscuWysylki], [KwotaGwarancji], [ManualneZwolnienieKwotyGwarancji], [PozostalaKwotaGwarancji], [BrakujacaKwotaGwarancji], [KodPrzemieszczenia], [DataPodzialuPrzesylki], [MiejsceWysylkiNrSkladuPod], [OdbierajacyMiejscowosc], [WysylajacyKodJezyka], [PierwszyPrzewoznikNrDomu], [MiejsceWysylkiKodPocztowy], [NrPorzadkowy], [OdbierajacyNazwa], [NadawcaEmail], [PierwszyPrzewoznikNazwa], [MiejsceDostawyNrDomu], [UzupOdbierajacyNrSwiadectwaZwol], [PierwszyPrzewoznikUlica], [NadawcaNRA], [MiejsceWysylkiKodJezyka], [OdbierajacyUlica], [CzySkontrolowanoMiejsceWysylki], [GRN], [MiejsceWysylkiMiejscowosc], [OrganizatorTranspNrVAT], [OdbierajacyKodPocztowy], [Gwarant2NrDomu], [Status], [MiejsceDostawyNazwaPodm] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_Wlasciciel]'
BEGIN
MERGE INTO [emcs2].[AD_Wlasciciel] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_Wlasciciel]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Typ]=src.[Typ],
tgt.[WlascicielTyp]=src.[WlascicielTyp],
tgt.[NRA]=src.[NRA],
tgt.[WlascicielNRA]=src.[WlascicielNRA]

WHEN NOT MATCHED
THEN INSERT (
[WlascicielTyp], [NRA], [Id], [WlascicielNRA], [Typ] )
VALUES ([WlascicielTyp], [NRA], [Id], [WlascicielNRA], [Typ] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_Zadanie]'
BEGIN
MERGE INTO [emcs2].[AD_Zadanie] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_Zadanie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Opis]=src.[Opis],
tgt.[DataUtworzenia]=src.[DataUtworzenia],
tgt.[PodmiotNazwa]=src.[PodmiotNazwa],
tgt.[DecyzjaKontroliDomyslna]=src.[DecyzjaKontroliDomyslna],
tgt.[NazwaMiejscaKontroli]=src.[NazwaMiejscaKontroli],
tgt.[ZmianaOpis]=src.[ZmianaOpis],
tgt.[Ilosc]=src.[Ilosc],
tgt.[CzyPrawidlowaOperacjaOSOZ]=src.[CzyPrawidlowaOperacjaOSOZ],
tgt.[WersjaAudytu]=src.[WersjaAudytu],
tgt.[LRN]=src.[LRN],
tgt.[ZmienionePrzez]=src.[ZmienionePrzez],
tgt.[CzyZadanieKontroli]=src.[CzyZadanieKontroli],
tgt.[PodmiotIdentyfikacja]=src.[PodmiotIdentyfikacja],
tgt.[IdDokAD]=src.[IdDokAD],
tgt.[UzytkownikOpis]=src.[UzytkownikOpis],
tgt.[NrRefDokumentu]=src.[NrRefDokumentu],
tgt.[OdpowiedzialnyUzytkownik]=src.[OdpowiedzialnyUzytkownik],
tgt.[DecyzjaKontroli]=src.[DecyzjaKontroli],
tgt.[TypZadania]=src.[TypZadania],
tgt.[ARC]=src.[ARC],
tgt.[PodmiotMiejscowosc]=src.[PodmiotMiejscowosc],
tgt.[PodmiotKodPocztowy]=src.[PodmiotKodPocztowy],
tgt.[PodmiotNrDomu]=src.[PodmiotNrDomu],
tgt.[idKomunikatuRaportu]=src.[idKomunikatuRaportu],
tgt.[idKomuniktuBledu]=src.[idKomuniktuBledu],
tgt.[UrzadCelnyNrRef]=src.[UrzadCelnyNrRef],
tgt.[IdKomunikat]=src.[IdKomunikat],
tgt.[DataPrzeladunku]=src.[DataPrzeladunku],
tgt.[OdpowiedzialnaRola]=src.[OdpowiedzialnaRola],
tgt.[PodmiotUlica]=src.[PodmiotUlica],
tgt.[KodPowoduOdrzuceniaCla]=src.[KodPowoduOdrzuceniaCla],
tgt.[DataZmian]=src.[DataZmian],
tgt.[TerminPlatnosci]=src.[TerminPlatnosci],
tgt.[Status]=src.[Status],
tgt.[Tytul]=src.[Tytul]

WHEN NOT MATCHED
THEN INSERT (
[Opis], [DataUtworzenia], [PodmiotNazwa], [DecyzjaKontroliDomyslna], [NazwaMiejscaKontroli], [ZmianaOpis], [Ilosc], [CzyPrawidlowaOperacjaOSOZ], [WersjaAudytu], [LRN], [ZmienionePrzez], [CzyZadanieKontroli], [PodmiotIdentyfikacja], [IdDokAD], [UzytkownikOpis], [NrRefDokumentu], [OdpowiedzialnyUzytkownik], [DecyzjaKontroli], [TypZadania], [ARC], [PodmiotMiejscowosc], [PodmiotKodPocztowy], [PodmiotNrDomu], [Id], [idKomunikatuRaportu], [idKomuniktuBledu], [UrzadCelnyNrRef], [IdKomunikat], [DataPrzeladunku], [OdpowiedzialnaRola], [PodmiotUlica], [KodPowoduOdrzuceniaCla], [DataZmian], [TerminPlatnosci], [Status], [Tytul] )
VALUES ([Opis], [DataUtworzenia], [PodmiotNazwa], [DecyzjaKontroliDomyslna], [NazwaMiejscaKontroli], [ZmianaOpis], [Ilosc], [CzyPrawidlowaOperacjaOSOZ], [WersjaAudytu], [LRN], [ZmienionePrzez], [CzyZadanieKontroli], [PodmiotIdentyfikacja], [IdDokAD], [UzytkownikOpis], [NrRefDokumentu], [OdpowiedzialnyUzytkownik], [DecyzjaKontroli], [TypZadania], [ARC], [PodmiotMiejscowosc], [PodmiotKodPocztowy], [PodmiotNrDomu], [Id], [idKomunikatuRaportu], [idKomuniktuBledu], [UrzadCelnyNrRef], [IdKomunikat], [DataPrzeladunku], [OdpowiedzialnaRola], [PodmiotUlica], [KodPowoduOdrzuceniaCla], [DataZmian], [TerminPlatnosci], [Status], [Tytul] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_TypZadania]'
BEGIN
MERGE INTO [emcs2].[AD_TypZadania] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_TypZadania]as src
ON (tgt.[TypZadania]=src.[TypZadania])
WHEN MATCHED
THEN UPDATE SET
tgt.[Opis]=src.[Opis]

WHEN NOT MATCHED
THEN INSERT (
[Opis], [TypZadania] )
VALUES ([Opis], [TypZadania] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_AnalizaRyzykaMetodyKontroli]'
BEGIN
MERGE INTO [emcs2].[AD_AnalizaRyzykaMetodyKontroli] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_AnalizaRyzykaMetodyKontroli]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[PoziomZdefiniowania]=src.[PoziomZdefiniowania],
tgt.[IdObslugiWskazanKontroli]=src.[IdObslugiWskazanKontroli],
tgt.[MetodaKontroli]=src.[MetodaKontroli]

WHEN NOT MATCHED
THEN INSERT (
[PoziomZdefiniowania], [Id], [IdObslugiWskazanKontroli], [MetodaKontroli] )
VALUES ([PoziomZdefiniowania], [Id], [IdObslugiWskazanKontroli], [MetodaKontroli] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_AnalizaRyzykaKontrPozycje]'
BEGIN
MERGE INTO [emcs2].[AD_AnalizaRyzykaKontrPozycje] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_AnalizaRyzykaKontrPozycje]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdObslugiWskazanKontroli]=src.[IdObslugiWskazanKontroli],
tgt.[NrPozycji]=src.[NrPozycji]

WHEN NOT MATCHED
THEN INSERT (
[Id], [IdObslugiWskazanKontroli], [NrPozycji] )
VALUES ([Id], [IdObslugiWskazanKontroli], [NrPozycji] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_Zaswiadczenie]'
BEGIN
MERGE INTO [emcs2].[AD_Zaswiadczenie] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_Zaswiadczenie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[NrDok]=src.[NrDok],
tgt.[OpisdokumnetuKodJezyka]=src.[OpisdokumnetuKodJezyka],
tgt.[NumerDokumnetuKodJezyka]=src.[NumerDokumnetuKodJezyka],
tgt.[KrotkiOpis]=src.[KrotkiOpis],
tgt.[IdDokAD]=src.[IdDokAD]

WHEN NOT MATCHED
THEN INSERT (
[NrDok], [OpisdokumnetuKodJezyka], [NumerDokumnetuKodJezyka], [KrotkiOpis], [Id], [IdDokAD] )
VALUES ([NrDok], [OpisdokumnetuKodJezyka], [NumerDokumnetuKodJezyka], [KrotkiOpis], [Id], [IdDokAD] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_SADPrzywozu]'
BEGIN
MERGE INTO [emcs2].[AD_SADPrzywozu] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_SADPrzywozu]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[NrSAD]=src.[NrSAD],
tgt.[IdDokAD]=src.[IdDokAD]

WHEN NOT MATCHED
THEN INSERT (
[NrSAD], [Id], [IdDokAD] )
VALUES ([NrSAD], [Id], [IdDokAD] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_Wyrob]'
BEGIN
MERGE INTO [emcs2].[AD_Wyrob] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_Wyrob]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[WielkoscProducenta]=src.[WielkoscProducenta],
tgt.[OlejeNiebarwioneINieoznaczane]=src.[OlejeNiebarwioneINieoznaczane],
tgt.[ZnakiAkcyzyKodJezyka]=src.[ZnakiAkcyzyKodJezyka],
tgt.[MiejscePochodzenia]=src.[MiejscePochodzenia],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[Gestosc]=src.[Gestosc],
tgt.[KodCN]=src.[KodCN],
tgt.[KrajTrzeciPochodzeniaWino]=src.[KrajTrzeciPochodzeniaWino],
tgt.[PotwProduktDostarczony]=src.[PotwProduktDostarczony],
tgt.[Ilosc]=src.[Ilosc],
tgt.[MarkaWyrobow]=src.[MarkaWyrobow],
tgt.[ZnakAkcyzy]=src.[ZnakAkcyzy],
tgt.[MiejscePochodzeniaKodJezyka]=src.[MiejscePochodzeniaKodJezyka],
tgt.[IdDokAD]=src.[IdDokAD],
tgt.[IloscDodJednMiary]=src.[IloscDodJednMiary],
tgt.[MaksymalnaCenaDetaliczna]=src.[MaksymalnaCenaDetaliczna],
tgt.[ZawartoscAlkoholu]=src.[ZawartoscAlkoholu],
tgt.[OpisHandlowy]=src.[OpisHandlowy],
tgt.[BiokomponentyCzySpelWymJakosc]=src.[BiokomponentyCzySpelWymJakosc],
tgt.[OplataPaliwowaUbytekKwota]=src.[OplataPaliwowaUbytekKwota],
tgt.[KategoriaWyrobuAkcyzowego]=src.[KategoriaWyrobuAkcyzowego],
tgt.[OplataPaliwowaPozostalaKwota]=src.[OplataPaliwowaPozostalaKwota],
tgt.[ZnakiAkcyzy]=src.[ZnakiAkcyzy],
tgt.[KategoriaWyrobuWiniarskiego]=src.[KategoriaWyrobuWiniarskiego],
tgt.[KwotaGwarancji]=src.[KwotaGwarancji],
tgt.[StopienPlato]=src.[StopienPlato],
tgt.[PozostalaKwotaGwarancji]=src.[PozostalaKwotaGwarancji],
tgt.[BrakujacaKwotaGwarancji]=src.[BrakujacaKwotaGwarancji],
tgt.[TypPaliwa]=src.[TypPaliwa],
tgt.[OpisHandlowyKodJezyka]=src.[OpisHandlowyKodJezyka],
tgt.[PozostalaWagaBrutto]=src.[PozostalaWagaBrutto],
tgt.[PozostalaWagaNetto]=src.[PozostalaWagaNetto],
tgt.[MasaNetto]=src.[MasaNetto],
tgt.[IdPozycjiTowarowejTekst]=src.[IdPozycjiTowarowejTekst],
tgt.[IloscNiedoboruLubNadwyzki]=src.[IloscNiedoboruLubNadwyzki],
tgt.[KodStrefyUprawyWinorosli]=src.[KodStrefyUprawyWinorosli],
tgt.[MarkaWyrobowKodJezyka]=src.[MarkaWyrobowKodJezyka],
tgt.[NiedoborLubNadwyzka]=src.[NiedoborLubNadwyzka],
tgt.[OplataPaliwowaKwota]=src.[OplataPaliwowaKwota],
tgt.[AERPozycjaNumer]=src.[AERPozycjaNumer],
tgt.[DodInfWino]=src.[DodInfWino],
tgt.[IloscDodanychBiokomponentow]=src.[IloscDodanychBiokomponentow],
tgt.[KodWyrobuAkcyzowego]=src.[KodWyrobuAkcyzowego],
tgt.[OstatnioDostIlosc]=src.[OstatnioDostIlosc],
tgt.[InneInformacjeKodJezyka]=src.[InneInformacjeKodJezyka],
tgt.[CzyStawkaZerowaDlaWyrobu]=src.[CzyStawkaZerowaDlaWyrobu],
tgt.[AERNiedoborLubNadwyzka]=src.[AERNiedoborLubNadwyzka],
tgt.[IdPozycjiTowarowej]=src.[IdPozycjiTowarowej],
tgt.[PozostalaIlosc]=src.[PozostalaIlosc],
tgt.[IloscDodJednMiaryPoOdbiorze]=src.[IloscDodJednMiaryPoOdbiorze]

WHEN NOT MATCHED
THEN INSERT (
[WielkoscProducenta], [OlejeNiebarwioneINieoznaczane], [ZnakiAkcyzyKodJezyka], [MiejscePochodzenia], [MasaBrutto], [Gestosc], [KodCN], [KrajTrzeciPochodzeniaWino], [PotwProduktDostarczony], [Ilosc], [MarkaWyrobow], [ZnakAkcyzy], [MiejscePochodzeniaKodJezyka], [IdDokAD], [IloscDodJednMiary], [MaksymalnaCenaDetaliczna], [ZawartoscAlkoholu], [OpisHandlowy], [BiokomponentyCzySpelWymJakosc], [OplataPaliwowaUbytekKwota], [KategoriaWyrobuAkcyzowego], [OplataPaliwowaPozostalaKwota], [ZnakiAkcyzy], [KategoriaWyrobuWiniarskiego], [KwotaGwarancji], [StopienPlato], [PozostalaKwotaGwarancji], [BrakujacaKwotaGwarancji], [TypPaliwa], [OpisHandlowyKodJezyka], [PozostalaWagaBrutto], [PozostalaWagaNetto], [MasaNetto], [IdPozycjiTowarowejTekst], [IloscNiedoboruLubNadwyzki], [KodStrefyUprawyWinorosli], [MarkaWyrobowKodJezyka], [NiedoborLubNadwyzka], [OplataPaliwowaKwota], [AERPozycjaNumer], [DodInfWino], [IloscDodanychBiokomponentow], [KodWyrobuAkcyzowego], [OstatnioDostIlosc], [Id], [InneInformacjeKodJezyka], [CzyStawkaZerowaDlaWyrobu], [AERNiedoborLubNadwyzka], [IdPozycjiTowarowej], [PozostalaIlosc], [IloscDodJednMiaryPoOdbiorze] )
VALUES ([WielkoscProducenta], [OlejeNiebarwioneINieoznaczane], [ZnakiAkcyzyKodJezyka], [MiejscePochodzenia], [MasaBrutto], [Gestosc], [KodCN], [KrajTrzeciPochodzeniaWino], [PotwProduktDostarczony], [Ilosc], [MarkaWyrobow], [ZnakAkcyzy], [MiejscePochodzeniaKodJezyka], [IdDokAD], [IloscDodJednMiary], [MaksymalnaCenaDetaliczna], [ZawartoscAlkoholu], [OpisHandlowy], [BiokomponentyCzySpelWymJakosc], [OplataPaliwowaUbytekKwota], [KategoriaWyrobuAkcyzowego], [OplataPaliwowaPozostalaKwota], [ZnakiAkcyzy], [KategoriaWyrobuWiniarskiego], [KwotaGwarancji], [StopienPlato], [PozostalaKwotaGwarancji], [BrakujacaKwotaGwarancji], [TypPaliwa], [OpisHandlowyKodJezyka], [PozostalaWagaBrutto], [PozostalaWagaNetto], [MasaNetto], [IdPozycjiTowarowejTekst], [IloscNiedoboruLubNadwyzki], [KodStrefyUprawyWinorosli], [MarkaWyrobowKodJezyka], [NiedoborLubNadwyzka], [OplataPaliwowaKwota], [AERPozycjaNumer], [DodInfWino], [IloscDodanychBiokomponentow], [KodWyrobuAkcyzowego], [OstatnioDostIlosc], [Id], [InneInformacjeKodJezyka], [CzyStawkaZerowaDlaWyrobu], [AERNiedoborLubNadwyzka], [IdPozycjiTowarowej], [PozostalaIlosc], [IloscDodJednMiaryPoOdbiorze] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_AnalizaRyzykaKontrPodsum]'
BEGIN
MERGE INTO [emcs2].[AD_AnalizaRyzykaKontrPodsum] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_AnalizaRyzykaKontrPodsum]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[WynikKontroliSO]=src.[WynikKontroliSO],
tgt.[IdObslugiWskazanKontroli]=src.[IdObslugiWskazanKontroli],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[ZakresPrzebiegKontroliSO]=src.[ZakresPrzebiegKontroliSO]

WHEN NOT MATCHED
THEN INSERT (
[ZakresPrzebiegKontroliSO], [WynikKontroliSO], [Id], [IdObslugiWskazanKontroli], [NrPozycji] )
VALUES ([ZakresPrzebiegKontroliSO], [WynikKontroliSO], [Id], [IdObslugiWskazanKontroli], [NrPozycji] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_Opakowanie]'
BEGIN
MERGE INTO [emcs2].[AD_Opakowanie] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_Opakowanie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodRodzOpakowan]=src.[KodRodzOpakowan],
tgt.[InformacjaPieczecHandlowaKodJezyka]=src.[InformacjaPieczecHandlowaKodJezyka],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[OznPieczecHandl]=src.[OznPieczecHandl],
tgt.[InfPieczecHandl]=src.[InfPieczecHandl],
tgt.[IdWyrobAD]=src.[IdWyrobAD]

WHEN NOT MATCHED
THEN INSERT (
[KodRodzOpakowan], [InformacjaPieczecHandlowaKodJezyka], [Id], [LiczbaOpakowan], [OznPieczecHandl], [InfPieczecHandl], [IdWyrobAD] )
VALUES ([KodRodzOpakowan], [InformacjaPieczecHandlowaKodJezyka], [Id], [LiczbaOpakowan], [OznPieczecHandl], [InfPieczecHandl], [IdWyrobAD] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_KodCzynnosciWino]'
BEGIN
MERGE INTO [emcs2].[AD_KodCzynnosciWino] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_KodCzynnosciWino]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodCzynnosciWino]=src.[KodCzynnosciWino],
tgt.[IdWyrobAD]=src.[IdWyrobAD]

WHEN NOT MATCHED
THEN INSERT (
[KodCzynnosciWino], [Id], [IdWyrobAD] )
VALUES ([KodCzynnosciWino], [Id], [IdWyrobAD] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_MiejsceOdbioru]'
BEGIN
MERGE INTO [emcs2].[AD_MiejsceOdbioru] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_MiejsceOdbioru]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[NrDomu]=src.[NrDomu],
tgt.[Nazwa]=src.[Nazwa],
tgt.[UCKontroli]=src.[UCKontroli],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[PodmiotTyp]=src.[PodmiotTyp],
tgt.[NrLokalu]=src.[NrLokalu],
tgt.[Poczta]=src.[Poczta],
tgt.[Ulica]=src.[Ulica],
tgt.[NrAkcyzowy]=src.[NrAkcyzowy],
tgt.[KodKraju]=src.[KodKraju],
tgt.[PodmiotNRA]=src.[PodmiotNRA]

WHEN NOT MATCHED
THEN INSERT (
[NrDomu], [Nazwa], [UCKontroli], [Miejscowosc], [KodPocztowy], [PodmiotTyp], [NrLokalu], [Poczta], [Id], [Ulica], [NrAkcyzowy], [KodKraju], [PodmiotNRA] )
VALUES ([NrDomu], [Nazwa], [UCKontroli], [Miejscowosc], [KodPocztowy], [PodmiotTyp], [NrLokalu], [Poczta], [Id], [Ulica], [NrAkcyzowy], [KodKraju], [PodmiotNRA] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_Podmiot]'
BEGIN
MERGE INTO [emcs2].[AD_Podmiot] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_Podmiot]as src
ON (tgt.[NRA]=src.[NRA] AND tgt.[Typ]=src.[Typ])
WHEN MATCHED
THEN UPDATE SET
tgt.[Wlasciciel]=src.[Wlasciciel],
tgt.[UCNadzoru]=src.[UCNadzoru],
tgt.[NIP]=src.[NIP],
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[CzyDostawaBezposrednia]=src.[CzyDostawaBezposrednia],
tgt.[Ulica]=src.[Ulica],
tgt.[IntDomyslny]=src.[IntDomyslny],
tgt.[WSLogin]=src.[WSLogin],
tgt.[ObowiazujeDo]=src.[ObowiazujeDo],
tgt.[WSAdres]=src.[WSAdres],
tgt.[WSEmcsHaslo]=src.[WSEmcsHaslo],
tgt.[ObowiazujeOd]=src.[ObowiazujeOd],
tgt.[WSHaslo]=src.[WSHaslo],
tgt.[NrDomu]=src.[NrDomu],
tgt.[UCWydania]=src.[UCWydania],
tgt.[WSOdciskPalca]=src.[WSOdciskPalca],
tgt.[PodstawowyEmail]=src.[PodstawowyEmail],
tgt.[NrLokalu]=src.[NrLokalu],
tgt.[Poczta]=src.[Poczta],
tgt.[IDSISC]=src.[IDSISC],
tgt.[Wysylajacy]=src.[Wysylajacy],
tgt.[KodKraju]=src.[KodKraju],
tgt.[REGON]=src.[REGON],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Wlasciciel], [UCNadzoru], [NIP], [Nazwa], [Typ], [Miejscowosc], [KodPocztowy], [CzyDostawaBezposrednia], [Ulica], [IntDomyslny], [WSLogin], [ObowiazujeDo], [WSAdres], [WSEmcsHaslo], [ObowiazujeOd], [WSHaslo], [NrDomu], [UCWydania], [WSOdciskPalca], [PodstawowyEmail], [NrLokalu], [Poczta], [IDSISC], [Wysylajacy], [KodKraju], [REGON], [NRA], [Email] )
VALUES ([Wlasciciel], [UCNadzoru], [NIP], [Nazwa], [Typ], [Miejscowosc], [KodPocztowy], [CzyDostawaBezposrednia], [Ulica], [IntDomyslny], [WSLogin], [ObowiazujeDo], [WSAdres], [WSEmcsHaslo], [ObowiazujeOd], [WSHaslo], [NrDomu], [UCWydania], [WSOdciskPalca], [PodstawowyEmail], [NrLokalu], [Poczta], [IDSISC], [Wysylajacy], [KodKraju], [REGON], [NRA], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_AnalizaRyzykaZespolKontroli]'
BEGIN
MERGE INTO [emcs2].[AD_AnalizaRyzykaZespolKontroli] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_AnalizaRyzykaZespolKontroli]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[RejestratorWynikowZISAR]=src.[RejestratorWynikowZISAR],
tgt.[IdObslugiWskazanKontroli]=src.[IdObslugiWskazanKontroli],
tgt.[Login]=src.[Login]

WHEN NOT MATCHED
THEN INSERT (
[RejestratorWynikowZISAR], [Login], [Id], [IdObslugiWskazanKontroli] )
VALUES ([RejestratorWynikowZISAR], [Login], [Id], [IdObslugiWskazanKontroli] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_AnalizaRyzykaDokument]'
BEGIN
MERGE INTO [emcs2].[AD_AnalizaRyzykaDokument] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_AnalizaRyzykaDokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[WynikAnalizyRyzyka]=src.[WynikAnalizyRyzyka],
tgt.[SystemOperacyjny]=src.[SystemOperacyjny],
tgt.[UCKontroliTowarow]=src.[UCKontroliTowarow],
tgt.[RodzajDokumentu]=src.[RodzajDokumentu],
tgt.[UCZglaszajacyDoAAR]=src.[UCZglaszajacyDoAAR],
tgt.[PROCESS_COMM_ID]=src.[PROCESS_COMM_ID],
tgt.[NrDokZISAR]=src.[NrDokZISAR],
tgt.[NrDokSO]=src.[NrDokSO],
tgt.[NrTypuKomunikatu]=src.[NrTypuKomunikatu]

WHEN NOT MATCHED
THEN INSERT (
[WynikAnalizyRyzyka], [SystemOperacyjny], [UCKontroliTowarow], [RodzajDokumentu], [UCZglaszajacyDoAAR], [PROCESS_COMM_ID], [NrDokZISAR], [Id], [NrDokSO], [NrTypuKomunikatu] )
VALUES ([WynikAnalizyRyzyka], [SystemOperacyjny], [UCKontroliTowarow], [RodzajDokumentu], [UCZglaszajacyDoAAR], [PROCESS_COMM_ID], [NrDokZISAR], [Id], [NrDokSO], [NrTypuKomunikatu] );

SET @Merged = 1;
 END
IF @TableName = '[emcs2].[AD_AnalizaRyzykaKontrola]'
BEGIN
MERGE INTO [emcs2].[AD_AnalizaRyzykaKontrola] as tgt
USING [WA_StageHurtownia].[emcs2].[AD_AnalizaRyzykaKontrola]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[DyrDlaKolejnegoUCWprSO]=src.[DyrDlaKolejnegoUCWprSO],
tgt.[DecyzjaDyspozytoraSO]=src.[DecyzjaDyspozytoraSO],
tgt.[AdresaciDyrektywySO]=src.[AdresaciDyrektywySO],
tgt.[WynikKontroliSO]=src.[WynikKontroliSO],
tgt.[OdstOdKontroliUzasadnSO]=src.[OdstOdKontroliUzasadnSO],
tgt.[WAR24SO]=src.[WAR24SO],
tgt.[WAR1]=src.[WAR1],
tgt.[WAR24]=src.[WAR24],
tgt.[ZmianaWarUzasadnSO]=src.[ZmianaWarUzasadnSO],
tgt.[WAR5SO]=src.[WAR5SO],
tgt.[ZakresPrzebiegKontroliSO]=src.[ZakresPrzebiegKontroliSO],
tgt.[IdDokAR]=src.[IdDokAR],
tgt.[ZalecenieDyspozytoraSO]=src.[ZalecenieDyspozytoraSO],
tgt.[WAR1SO]=src.[WAR1SO],
tgt.[ZmianaMKUzasadnSO]=src.[ZmianaMKUzasadnSO],
tgt.[ObszarRyzyka]=src.[ObszarRyzyka],
tgt.[TrescDyrektywy]=src.[TrescDyrektywy],
tgt.[Autor]=src.[Autor],
tgt.[Zrodlo]=src.[Zrodlo],
tgt.[NrAlgorytmu]=src.[NrAlgorytmu],
tgt.[NumerDokumentuZISAR]=src.[NumerDokumentuZISAR],
tgt.[InformacjaDlaDyspozytora]=src.[InformacjaDlaDyspozytora]

WHEN NOT MATCHED
THEN INSERT (
[DyrDlaKolejnegoUCWprSO], [DecyzjaDyspozytoraSO], [AdresaciDyrektywySO], [WynikKontroliSO], [OdstOdKontroliUzasadnSO], [WAR24SO], [WAR1], [WAR24], [ZmianaWarUzasadnSO], [WAR5SO], [ZakresPrzebiegKontroliSO], [Id], [IdDokAR], [ZalecenieDyspozytoraSO], [WAR1SO], [ZmianaMKUzasadnSO], [ObszarRyzyka], [TrescDyrektywy], [Autor], [Zrodlo], [NrAlgorytmu], [NumerDokumentuZISAR], [InformacjaDlaDyspozytora] )
VALUES ([DyrDlaKolejnegoUCWprSO], [DecyzjaDyspozytoraSO], [AdresaciDyrektywySO], [WynikKontroliSO], [OdstOdKontroliUzasadnSO], [WAR24SO], [WAR1], [WAR24], [ZmianaWarUzasadnSO], [WAR5SO], [ZakresPrzebiegKontroliSO], [Id], [IdDokAR], [ZalecenieDyspozytoraSO], [WAR1SO], [ZmianaMKUzasadnSO], [ObszarRyzyka], [TrescDyrektywy], [Autor], [Zrodlo], [NrAlgorytmu], [NumerDokumentuZISAR], [InformacjaDlaDyspozytora] );

SET @Merged = 1;
 END









	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END