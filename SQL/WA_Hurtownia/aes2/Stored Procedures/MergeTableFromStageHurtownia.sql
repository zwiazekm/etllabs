


-- =============================================
-- Author:	
-- Create date: 2016-10-20
-- Description:	
-- =============================================

CREATE PROCEDURE [aes2].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END


IF @TableName = '[aes2].[ZUZ_Pozwolenie]'
BEGIN
MERGE INTO [aes2].[ZUZ_Pozwolenie] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_Pozwolenie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[NumerPozwolenia]=src.[NumerPozwolenia],
tgt.[IdDokZUZ]=src.[IdDokZUZ],
tgt.[NumerPozwoleniaWUzupeln]=src.[NumerPozwoleniaWUzupeln]

WHEN NOT MATCHED
THEN INSERT (
[NumerPozwolenia], [IdDokZUZ], [Id], [NumerPozwoleniaWUzupeln] )
VALUES ([NumerPozwolenia], [IdDokZUZ], [Id], [NumerPozwoleniaWUzupeln] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_Podmiot]'
BEGIN
MERGE INTO [aes2].[ZWP_Podmiot] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_Podmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokZWP]=src.[IdDokZWP],
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[KrajPid]=src.[KrajPid],
tgt.[TIN]=src.[TIN],
tgt.[EORI]=src.[EORI],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[IdDokZWP], [Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [TIN], [EORI], [RodzPodmiotu], [Email] )
VALUES ([IdDokZWP], [Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [TIN], [EORI], [RodzPodmiotu], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_ZamkniecieCelne]'
BEGIN
MERGE INTO [aes2].[ZUZ_ZamkniecieCelne] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_ZamkniecieCelne]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[ZnakiZamkniec]=src.[ZnakiZamkniec],
tgt.[IdDokZUZ]=src.[IdDokZUZ],
tgt.[ZnakiZamkniecWUzupeln]=src.[ZnakiZamkniecWUzupeln]

WHEN NOT MATCHED
THEN INSERT (
[IdDokZUZ], [ZnakiZamkniecWUzupeln], [Id], [ZnakiZamkniec] )
VALUES ([IdDokZUZ], [ZnakiZamkniecWUzupeln], [Id], [ZnakiZamkniec] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Oplata]'
BEGIN
MERGE INTO [aes2].[ZWU_Oplata] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Oplata]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Podstawa]=src.[Podstawa],
tgt.[TypPid]=src.[TypPid],
tgt.[MP]=src.[MP],
tgt.[Stawka]=src.[Stawka],
tgt.[Typ]=src.[Typ],
tgt.[MPPid]=src.[MPPid],
tgt.[Kwota]=src.[Kwota],
tgt.[IdTowarZWU]=src.[IdTowarZWU]

WHEN NOT MATCHED
THEN INSERT (
[Podstawa], [TypPid], [MP], [Stawka], [Typ], [MPPid], [Kwota], [IdTowarZWU], [Id] )
VALUES ([Podstawa], [TypPid], [MP], [Stawka], [Typ], [MPPid], [Kwota], [IdTowarZWU], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWU_ZamkniecieCelne]'
BEGIN
MERGE INTO [aes2].[DWU_ZamkniecieCelne] as tgt
USING [WA_StageHurtownia].[aes2].[DWU_ZamkniecieCelne]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[NrZamkniecia]=src.[NrZamkniecia],
tgt.[IdDokDWU]=src.[IdDokDWU]

WHEN NOT MATCHED
THEN INSERT (
[NrZamkniecia], [Id], [IdDokDWU] )
VALUES ([NrZamkniecia], [Id], [IdDokDWU] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[TRS_Rezerwacje]'
BEGIN
MERGE INTO [aes2].[TRS_Rezerwacje] as tgt
USING [WA_StageHurtownia].[aes2].[TRS_Rezerwacje]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodTowarowy]=src.[KodTowarowy],
tgt.[IdPozycjiTranzytowej]=src.[IdPozycjiTranzytowej],
tgt.[KodTowarowyPid]=src.[KodTowarowyPid],
tgt.[Wersja]=src.[Wersja],
tgt.[IdDeklaracjiTranzytowej]=src.[IdDeklaracjiTranzytowej],
tgt.[MasaZarezerwowana]=src.[MasaZarezerwowana],
tgt.[KomentarzNCTS]=src.[KomentarzNCTS],
tgt.[MRN]=src.[MRN],
tgt.[IdPozycjiTRS]=src.[IdPozycjiTRS],
tgt.[NrPozycjiWywozowej]=src.[NrPozycjiWywozowej],
tgt.[IdDeklaracjiWywozowej]=src.[IdDeklaracjiWywozowej]

WHEN NOT MATCHED
THEN INSERT (
[KodTowarowy], [IdPozycjiTranzytowej], [KodTowarowyPid], [Wersja], [MasaZarezerwowana], [MRN], [NrPozycjiWywozowej], [Id], [IdDeklaracjiWywozowej], [IdDeklaracjiTranzytowej], [KomentarzNCTS], [IdPozycjiTRS] )
VALUES ([KodTowarowy], [IdPozycjiTranzytowej], [KodTowarowyPid], [Wersja], [MasaZarezerwowana], [MRN], [NrPozycjiWywozowej], [Id], [IdDeklaracjiWywozowej], [IdDeklaracjiTranzytowej], [KomentarzNCTS], [IdPozycjiTRS] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_Oplata]'
BEGIN
MERGE INTO [aes2].[ZUZ_Oplata] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_Oplata]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Podstawa]=src.[Podstawa],
tgt.[KwotaWUzupln]=src.[KwotaWUzupln],
tgt.[TypPid]=src.[TypPid],
tgt.[Stawka]=src.[Stawka],
tgt.[Typ]=src.[Typ],
tgt.[MPWUzupln]=src.[MPWUzupln],
tgt.[MPWUzuplnPid]=src.[MPWUzuplnPid],
tgt.[MP]=src.[MP],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[TypWUzupln]=src.[TypWUzupln],
tgt.[PodstawaWUzupln]=src.[PodstawaWUzupln],
tgt.[MPPid]=src.[MPPid],
tgt.[Kwota]=src.[Kwota],
tgt.[StawkaWUzupln]=src.[StawkaWUzupln],
tgt.[TypWUzuplnPid]=src.[TypWUzuplnPid]

WHEN NOT MATCHED
THEN INSERT (
[Podstawa], [KwotaWUzupln], [TypPid], [Stawka], [Typ], [Id], [MPWUzupln], [MPWUzuplnPid], [MP], [IdTowarZUZ], [TypWUzupln], [PodstawaWUzupln], [MPPid], [Kwota], [StawkaWUzupln], [TypWUzuplnPid] )
VALUES ([Podstawa], [KwotaWUzupln], [TypPid], [Stawka], [Typ], [Id], [MPWUzupln], [MPWUzuplnPid], [MP], [IdTowarZUZ], [TypWUzupln], [PodstawaWUzupln], [MPPid], [Kwota], [StawkaWUzupln], [TypWUzuplnPid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWU_Dokument]'
BEGIN
MERGE INTO [aes2].[DWU_Dokument] as tgt
USING [WA_StageHurtownia].[aes2].[DWU_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Miejsce]=src.[Miejsce],
tgt.[UCZlozeniaPid]=src.[UCZlozeniaPid],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[PrzedstTowPozaUCKodPid]=src.[PrzedstTowPozaUCKodPid],
tgt.[Telefon]=src.[Telefon],
tgt.[PrzedstTowUC]=src.[PrzedstTowUC],
tgt.[LiczbaPozycji]=src.[LiczbaPozycji],
tgt.[PrzedstTowPozaUCKod]=src.[PrzedstTowPozaUCKod],
tgt.[KodTypOplatTransp]=src.[KodTypOplatTransp],
tgt.[DataCzasZgodyNaPrzekroczenieGranic]=src.[DataCzasZgodyNaPrzekroczenieGranic],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[NrWlasny]=src.[NrWlasny],
tgt.[DataPrzyjecia]=src.[DataPrzyjecia],
tgt.[UrzadWyprowadzenia]=src.[UrzadWyprowadzenia],
tgt.[PodpisElektroniczny]=src.[PodpisElektroniczny],
tgt.[SpecyficzneOkolicznosciPid]=src.[SpecyficzneOkolicznosciPid],
tgt.[PrzedstTowUCPid]=src.[PrzedstTowUCPid],
tgt.[MRN]=src.[MRN],
tgt.[Data]=src.[Data],
tgt.[SpecyficzneOkolicznosci]=src.[SpecyficzneOkolicznosci],
tgt.[PrzedstTowPozaUCBezKodu]=src.[PrzedstTowPozaUCBezKodu],
tgt.[KodTypOplatTranspPid]=src.[KodTypOplatTranspPid],
tgt.[UCZlozenia]=src.[UCZlozenia],
tgt.[CRN]=src.[CRN],
tgt.[DataZgody]=src.[DataZgody],
tgt.[UrzadWyprowadzeniaPid]=src.[UrzadWyprowadzeniaPid],
tgt.[Status]=src.[Status]

WHEN NOT MATCHED
THEN INSERT (
[Miejsce], [UCZlozeniaPid], [MasaBrutto], [PrzedstTowPozaUCKodPid], [Telefon], [PrzedstTowUC], [LiczbaPozycji], [PrzedstTowPozaUCKod], [KodTypOplatTransp], [DataCzasZgodyNaPrzekroczenieGranic], [LiczbaOpakowan], [NrWlasny], [DataPrzyjecia], [UrzadWyprowadzenia], [PodpisElektroniczny], [SpecyficzneOkolicznosciPid], [PrzedstTowUCPid], [MRN], [Data], [Id], [SpecyficzneOkolicznosci], [PrzedstTowPozaUCBezKodu], [KodTypOplatTranspPid], [UCZlozenia], [CRN], [DataZgody], [UrzadWyprowadzeniaPid], [Status] )
VALUES ([Miejsce], [UCZlozeniaPid], [MasaBrutto], [PrzedstTowPozaUCKodPid], [Telefon], [PrzedstTowUC], [LiczbaPozycji], [PrzedstTowPozaUCKod], [KodTypOplatTransp], [DataCzasZgodyNaPrzekroczenieGranic], [LiczbaOpakowan], [NrWlasny], [DataPrzyjecia], [UrzadWyprowadzenia], [PodpisElektroniczny], [SpecyficzneOkolicznosciPid], [PrzedstTowUCPid], [MRN], [Data], [Id], [SpecyficzneOkolicznosci], [PrzedstTowPozaUCBezKodu], [KodTypOplatTranspPid], [UCZlozenia], [CRN], [DataZgody], [UrzadWyprowadzeniaPid], [Status] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_Kontener]'
BEGIN
MERGE INTO [aes2].[QUERY_Kontener] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_Kontener]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarQUERY]=src.[IdTowarQUERY],
tgt.[NrKontenera]=src.[NrKontenera]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarQUERY], [Id], [NrKontenera] )
VALUES ([IdTowarQUERY], [Id], [NrKontenera] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_Opakowanie]'
BEGIN
MERGE INTO [aes2].[ZUZ_Opakowanie] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_Opakowanie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[RodzajOpakowanPid]=src.[RodzajOpakowanPid],
tgt.[RodzajOpakowanWUzuplnPid]=src.[RodzajOpakowanWUzuplnPid],
tgt.[LiczbaSztukWUzupln]=src.[LiczbaSztukWUzupln],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[RodzajOpakowanWUzupln]=src.[RodzajOpakowanWUzupln],
tgt.[LiczbaSztuk]=src.[LiczbaSztuk],
tgt.[RodzajOpakowan]=src.[RodzajOpakowan],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[LiczbaOpakowanWUzupln]=src.[LiczbaOpakowanWUzupln],
tgt.[ZnakiOpakowan]=src.[ZnakiOpakowan]

WHEN NOT MATCHED
THEN INSERT (
[RodzajOpakowanPid], [RodzajOpakowanWUzuplnPid], [LiczbaSztukWUzupln], [IdTowarZUZ], [RodzajOpakowanWUzupln], [LiczbaSztuk], [RodzajOpakowan], [Id], [LiczbaOpakowan], [LiczbaOpakowanWUzupln], [ZnakiOpakowan] )
VALUES ([RodzajOpakowanPid], [RodzajOpakowanWUzuplnPid], [LiczbaSztukWUzupln], [IdTowarZUZ], [RodzajOpakowanWUzupln], [LiczbaSztuk], [RodzajOpakowan], [Id], [LiczbaOpakowan], [LiczbaOpakowanWUzupln], [ZnakiOpakowan] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_KodDodatkowyUE]'
BEGIN
MERGE INTO [aes2].[ZWU_KodDodatkowyUE] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_KodDodatkowyUE]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodUEPid]=src.[KodUEPid],
tgt.[KodUE]=src.[KodUE],
tgt.[IdTowarZWU]=src.[IdTowarZWU]

WHEN NOT MATCHED
THEN INSERT (
[KodUEPid], [IdTowarZWU], [KodUE], [Id] )
VALUES ([KodUEPid], [IdTowarZWU], [KodUE], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_DokumentWymagany]'
BEGIN
MERGE INTO [aes2].[ZWU_DokumentWymagany] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_DokumentWymagany]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodDokWymPid]=src.[KodDokWymPid],
tgt.[WynikKontroliAGREX]=src.[WynikKontroliAGREX],
tgt.[IloscTowaru]=src.[IloscTowaru],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[NrDokWym]=src.[NrDokWym],
tgt.[Uwagi]=src.[Uwagi],
tgt.[StanNaGranicyKom]=src.[StanNaGranicyKom],
tgt.[StanNaGranicy]=src.[StanNaGranicy],
tgt.[InformacjaRozbieznosciAGREX]=src.[InformacjaRozbieznosciAGREX],
tgt.[IdTowarZWU]=src.[IdTowarZWU],
tgt.[KodDokWym]=src.[KodDokWym],
tgt.[JednostkaMiary]=src.[JednostkaMiary]

WHEN NOT MATCHED
THEN INSERT (
[KodDokWymPid], [WynikKontroliAGREX], [IloscTowaru], [NrPozycji], [NrDokWym], [Uwagi], [Id], [StanNaGranicyKom], [StanNaGranicy], [InformacjaRozbieznosciAGREX], [IdTowarZWU], [KodDokWym], [JednostkaMiary] )
VALUES ([KodDokWymPid], [WynikKontroliAGREX], [IloscTowaru], [NrPozycji], [NrDokWym], [Uwagi], [Id], [StanNaGranicyKom], [StanNaGranicy], [InformacjaRozbieznosciAGREX], [IdTowarZWU], [KodDokWym], [JednostkaMiary] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWA_ZamkniecieCelne]'
BEGIN
MERGE INTO [aes2].[DWA_ZamkniecieCelne] as tgt
USING [WA_StageHurtownia].[aes2].[DWA_ZamkniecieCelne]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokDWA]=src.[IdDokDWA],
tgt.[NrZamkniecia]=src.[NrZamkniecia]

WHEN NOT MATCHED
THEN INSERT (
[NrZamkniecia], [IdDokDWA], [Id] )
VALUES ([NrZamkniecia], [IdDokDWA], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_TowarPodmiot]'
BEGIN
MERGE INTO [aes2].[QUERY_TowarPodmiot] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_TowarPodmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarQUERY]=src.[IdTowarQUERY],
tgt.[Nazwa]=src.[Nazwa],
tgt.[TIN]=src.[TIN],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarQUERY], [Nazwa], [TIN], [Miejscowosc], [KodPocztowy], [RodzPodmiotu], [Id], [Kraj], [KrajPid], [UlicaNumer], [Email] )
VALUES ([IdTowarQUERY], [Nazwa], [TIN], [Miejscowosc], [KodPocztowy], [RodzPodmiotu], [Id], [Kraj], [KrajPid], [UlicaNumer], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_KodDodatkowyPL]'
BEGIN
MERGE INTO [aes2].[ZUZ_KodDodatkowyPL] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_KodDodatkowyPL]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodPL]=src.[KodPL],
tgt.[KodPLPid]=src.[KodPLPid],
tgt.[KodPLWUzupln]=src.[KodPLWUzupln],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[KodPLWUzuplnPid]=src.[KodPLWUzuplnPid]

WHEN NOT MATCHED
THEN INSERT (
[KodPL], [KodPLPid], [KodPLWUzupln], [IdTowarZUZ], [KodPLWUzuplnPid], [Id] )
VALUES ([KodPL], [KodPLPid], [KodPLWUzupln], [IdTowarZUZ], [KodPLWUzuplnPid], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_InformacjaDodatkowa]'
BEGIN
MERGE INTO [aes2].[ZUZ_InformacjaDodatkowa] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_InformacjaDodatkowa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodInfDodPid]=src.[KodInfDodPid],
tgt.[Tekst]=src.[Tekst],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[KodInfDod]=src.[KodInfDod]

WHEN NOT MATCHED
THEN INSERT (
[KodInfDodPid], [Tekst], [KodInfDod], [IdTowarZUZ], [Id] )
VALUES ([KodInfDodPid], [Tekst], [KodInfDod], [IdTowarZUZ], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_ZamkniecieCelneWUzupeln]'
BEGIN
MERGE INTO [aes2].[ZUZ_ZamkniecieCelneWUzupeln] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_ZamkniecieCelneWUzupeln]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[ZnakiZamkniec]=src.[ZnakiZamkniec],
tgt.[IdDokZUZ]=src.[IdDokZUZ]

WHEN NOT MATCHED
THEN INSERT (
[IdDokZUZ], [Id], [ZnakiZamkniec] )
VALUES ([IdDokZUZ], [Id], [ZnakiZamkniec] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_TowarPodmiot]'
BEGIN
MERGE INTO [aes2].[ZUZ_TowarPodmiot] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_TowarPodmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[TIN]=src.[TIN],
tgt.[REGON]=src.[REGON],
tgt.[EORI]=src.[EORI],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [KrajPid], [UlicaNumer], [IdTowarZUZ], [TIN], [REGON], [EORI], [RodzPodmiotu], [Email] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [KrajPid], [UlicaNumer], [IdTowarZUZ], [TIN], [REGON], [EORI], [RodzPodmiotu], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_Towar]'
BEGIN
MERGE INTO [aes2].[ZUZ_Towar] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_Towar]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KrajPrzeznaczeniaWUzupln]=src.[KrajPrzeznaczeniaWUzupln],
tgt.[KodTowarowyNaGranicy]=src.[KodTowarowyNaGranicy],
tgt.[KrajWysylkiWUzuplnPid]=src.[KrajWysylkiWUzuplnPid],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[KodTARIC]=src.[KodTARIC],
tgt.[MasaNettoWUzupln]=src.[MasaNettoWUzupln],
tgt.[KrajPochodzeniaPid]=src.[KrajPochodzeniaPid],
tgt.[KrajWysylkiWUzupln]=src.[KrajWysylkiWUzupln],
tgt.[KrajWysylki]=src.[KrajWysylki],
tgt.[IloscUjmWUzupln]=src.[IloscUjmWUzupln],
tgt.[KodTowarowyNaGranicyPid]=src.[KodTowarowyNaGranicyPid],
tgt.[OpisTowaruNaGranicy2]=src.[OpisTowaruNaGranicy2],
tgt.[ProceduraWUzupln]=src.[ProceduraWUzupln],
tgt.[ProceduraSzczegoly]=src.[ProceduraSzczegoly],
tgt.[SumaOplatWUzupln]=src.[SumaOplatWUzupln],
tgt.[OplatyTransportoweNaZWU]=src.[OplatyTransportoweNaZWU],
tgt.[IloscUjm]=src.[IloscUjm],
tgt.[ProceduraPid]=src.[ProceduraPid],
tgt.[ProceduraWUzuplnPid]=src.[ProceduraWUzuplnPid],
tgt.[KrajPochodzeniaWUzuplnPid]=src.[KrajPochodzeniaWUzuplnPid],
tgt.[OpisTowaruNaGranicy]=src.[OpisTowaruNaGranicy],
tgt.[ProceduraSzczegolyWUzupln]=src.[ProceduraSzczegolyWUzupln],
tgt.[WartoscStatystyczna]=src.[WartoscStatystyczna],
tgt.[ProceduraPoprz]=src.[ProceduraPoprz],
tgt.[ProceduraPoprzPid]=src.[ProceduraPoprzPid],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[ProceduraPoprzWUzuplnPid]=src.[ProceduraPoprzWUzuplnPid],
tgt.[ProceduraPoprzWUzupln]=src.[ProceduraPoprzWUzupln],
tgt.[TowarNiebezpieczny]=src.[TowarNiebezpieczny],
tgt.[KrajPrzeznaczeniaWUzuplnPid]=src.[KrajPrzeznaczeniaWUzuplnPid],
tgt.[MasaNetto]=src.[MasaNetto],
tgt.[OplatyTransportowe]=src.[OplatyTransportowe],
tgt.[KrajWysylkiPid]=src.[KrajWysylkiPid],
tgt.[OpisTowaruWUzupln]=src.[OpisTowaruWUzupln],
tgt.[Procedura]=src.[Procedura],
tgt.[TowarNiebezpiecznyNaZWU]=src.[TowarNiebezpiecznyNaZWU],
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[KrajPochodzeniaWUzupln]=src.[KrajPochodzeniaWUzupln],
tgt.[KrajPochodzenia]=src.[KrajPochodzenia],
tgt.[CRNWUzupln]=src.[CRNWUzupln],
tgt.[OpisTowaru]=src.[OpisTowaru],
tgt.[WartoscStatystycznaNaZWU]=src.[WartoscStatystycznaNaZWU],
tgt.[KodTARICWUzupln]=src.[KodTARICWUzupln],
tgt.[SumaOplat]=src.[SumaOplat],
tgt.[Waluta]=src.[Waluta],
tgt.[CRN]=src.[CRN],
tgt.[IdDokZUZ]=src.[IdDokZUZ],
tgt.[OpisTowaru2]=src.[OpisTowaru2]

WHEN NOT MATCHED
THEN INSERT (
[KrajPrzeznaczeniaWUzupln], [KodTowarowyNaGranicy], [KrajWysylkiWUzuplnPid], [NrPozycji], [KodTARIC], [MasaNettoWUzupln], [KrajPochodzeniaPid], [KrajWysylkiWUzupln], [KrajWysylki], [IloscUjmWUzupln], [KodTowarowyNaGranicyPid], [OpisTowaruNaGranicy2], [ProceduraWUzupln], [ProceduraSzczegoly], [SumaOplatWUzupln], [OplatyTransportoweNaZWU], [IloscUjm], [ProceduraPid], [ProceduraWUzuplnPid], [KrajPochodzeniaWUzuplnPid], [OpisTowaruNaGranicy], [ProceduraSzczegolyWUzupln], [WartoscStatystyczna], [ProceduraPoprz], [ProceduraPoprzPid], [KrajPrzeznaczeniaPid], [ProceduraPoprzWUzuplnPid], [ProceduraPoprzWUzupln], [TowarNiebezpieczny], [KrajPrzeznaczeniaWUzuplnPid], [MasaNetto], [OplatyTransportowe], [KrajWysylkiPid], [OpisTowaruWUzupln], [Procedura], [TowarNiebezpiecznyNaZWU], [KrajPrzeznaczenia], [KrajPochodzeniaWUzupln], [KrajPochodzenia], [CRNWUzupln], [OpisTowaru], [Id], [WartoscStatystycznaNaZWU], [KodTARICWUzupln], [SumaOplat], [Waluta], [CRN], [IdDokZUZ], [OpisTowaru2] )
VALUES ([KrajPrzeznaczeniaWUzupln], [KodTowarowyNaGranicy], [KrajWysylkiWUzuplnPid], [NrPozycji], [KodTARIC], [MasaNettoWUzupln], [KrajPochodzeniaPid], [KrajWysylkiWUzupln], [KrajWysylki], [IloscUjmWUzupln], [KodTowarowyNaGranicyPid], [OpisTowaruNaGranicy2], [ProceduraWUzupln], [ProceduraSzczegoly], [SumaOplatWUzupln], [OplatyTransportoweNaZWU], [IloscUjm], [ProceduraPid], [ProceduraWUzuplnPid], [KrajPochodzeniaWUzuplnPid], [OpisTowaruNaGranicy], [ProceduraSzczegolyWUzupln], [WartoscStatystyczna], [ProceduraPoprz], [ProceduraPoprzPid], [KrajPrzeznaczeniaPid], [ProceduraPoprzWUzuplnPid], [ProceduraPoprzWUzupln], [TowarNiebezpieczny], [KrajPrzeznaczeniaWUzuplnPid], [MasaNetto], [OplatyTransportowe], [KrajWysylkiPid], [OpisTowaruWUzupln], [Procedura], [TowarNiebezpiecznyNaZWU], [KrajPrzeznaczenia], [KrajPochodzeniaWUzupln], [KrajPochodzenia], [CRNWUzupln], [OpisTowaru], [Id], [WartoscStatystycznaNaZWU], [KodTARICWUzupln], [SumaOplat], [Waluta], [CRN], [IdDokZUZ], [OpisTowaru2] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_DokumentWymagany]'
BEGIN
MERGE INTO [aes2].[QUERY_DokumentWymagany] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_DokumentWymagany]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodDokWymPid]=src.[KodDokWymPid],
tgt.[KodJezykaDokWym]=src.[KodJezykaDokWym],
tgt.[IdTowarQUERY]=src.[IdTowarQUERY],
tgt.[NrDokWym]=src.[NrDokWym],
tgt.[KodDokWym]=src.[KodDokWym]

WHEN NOT MATCHED
THEN INSERT (
[KodDokWymPid], [KodJezykaDokWym], [IdTowarQUERY], [NrDokWym], [Id], [KodDokWym] )
VALUES ([KodDokWymPid], [KodJezykaDokWym], [IdTowarQUERY], [NrDokWym], [Id], [KodDokWym] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_KodDodatkowyPL]'
BEGIN
MERGE INTO [aes2].[ZWU_KodDodatkowyPL] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_KodDodatkowyPL]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodPL]=src.[KodPL],
tgt.[KodPLPid]=src.[KodPLPid],
tgt.[IdTowarZWU]=src.[IdTowarZWU]

WHEN NOT MATCHED
THEN INSERT (
[KodPL], [KodPLPid], [IdTowarZWU], [Id] )
VALUES ([KodPL], [KodPLPid], [IdTowarZWU], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_Trasa]'
BEGIN
MERGE INTO [aes2].[ZUZ_Trasa] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_Trasa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KrajZUzupeln]=src.[KrajZUzupeln],
tgt.[KrajZUzupelnPid]=src.[KrajZUzupelnPid],
tgt.[IdDokZUZ]=src.[IdDokZUZ],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid]

WHEN NOT MATCHED
THEN INSERT (
[KrajZUzupeln], [KrajZUzupelnPid], [IdDokZUZ], [Id], [Kraj], [KrajPid] )
VALUES ([KrajZUzupeln], [KrajZUzupelnPid], [IdDokZUZ], [Id], [Kraj], [KrajPid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_KodDodatkowyUE]'
BEGIN
MERGE INTO [aes2].[ZUZ_KodDodatkowyUE] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_KodDodatkowyUE]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodUEPid]=src.[KodUEPid],
tgt.[KodUE]=src.[KodUE],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[KodUEUWzuplnPid]=src.[KodUEUWzuplnPid],
tgt.[KodUEWUzupln]=src.[KodUEWUzupln]

WHEN NOT MATCHED
THEN INSERT (
[KodUEPid], [KodUE], [IdTowarZUZ], [KodUEUWzuplnPid], [Id], [KodUEWUzupln] )
VALUES ([KodUEPid], [KodUE], [IdTowarZUZ], [KodUEUWzuplnPid], [Id], [KodUEWUzupln] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWA_Trasa]'
BEGIN
MERGE INTO [aes2].[DWA_Trasa] as tgt
USING [WA_StageHurtownia].[aes2].[DWA_Trasa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokDWA]=src.[IdDokDWA],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid]

WHEN NOT MATCHED
THEN INSERT (
[IdDokDWA], [Id], [Kraj], [KrajPid] )
VALUES ([IdDokDWA], [Id], [Kraj], [KrajPid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_DokumentPoprzedni]'
BEGIN
MERGE INTO [aes2].[ZWU_DokumentPoprzedni] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_DokumentPoprzedni]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[NrDokPoprz]=src.[NrDokPoprz],
tgt.[KodDokPoprz]=src.[KodDokPoprz],
tgt.[KodDokPoprzPid]=src.[KodDokPoprzPid],
tgt.[IdTowarZWU]=src.[IdTowarZWU]

WHEN NOT MATCHED
THEN INSERT (
[KodDokPoprz], [NrDokPoprz], [KodDokPoprzPid], [IdTowarZWU], [Id] )
VALUES ([KodDokPoprz], [NrDokPoprz], [KodDokPoprzPid], [IdTowarZWU], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Towar]'
BEGIN
MERGE INTO [aes2].[ZWU_Towar] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Towar]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodTowarowy]=src.[KodTowarowy],
tgt.[KodTowarowyPid]=src.[KodTowarowyPid],
tgt.[ProceduraPoprz]=src.[ProceduraPoprz],
tgt.[ProceduraPoprzPid]=src.[ProceduraPoprzPid],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[KodTowarowyNaGranicy]=src.[KodTowarowyNaGranicy],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[KodTARIC]=src.[KodTARIC],
tgt.[KrajPochodzeniaPid]=src.[KrajPochodzeniaPid],
tgt.[TowarNiebezpieczny]=src.[TowarNiebezpieczny],
tgt.[OpisNiezgodnościAGREX]=src.[OpisNiezgodnościAGREX],
tgt.[KontynuacjaPrzetwarzaniaAGREX]=src.[KontynuacjaPrzetwarzaniaAGREX],
tgt.[MasaNetto]=src.[MasaNetto],
tgt.[OplatyTransportoweNaGranicy]=src.[OplatyTransportoweNaGranicy],
tgt.[KrajWysylkiPid]=src.[KrajWysylkiPid],
tgt.[MasaBruttoNaGranicy]=src.[MasaBruttoNaGranicy],
tgt.[KrajWysylki]=src.[KrajWysylki],
tgt.[DodKodTARIC1NaGranicy]=src.[DodKodTARIC1NaGranicy],
tgt.[TowarNiebezpiecznyPid]=src.[TowarNiebezpiecznyPid],
tgt.[StanNaGranicy]=src.[StanNaGranicy],
tgt.[KodTowarowyNaGranicyPid]=src.[KodTowarowyNaGranicyPid],
tgt.[IdDokZWU]=src.[IdDokZWU],
tgt.[KodTypOplatTransp]=src.[KodTypOplatTransp],
tgt.[WalutaNaGranicy]=src.[WalutaNaGranicy],
tgt.[Procedura]=src.[Procedura],
tgt.[WartoscStatystycznaNaGranicy]=src.[WartoscStatystycznaNaGranicy],
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[ProceduraSzczegoly]=src.[ProceduraSzczegoly],
tgt.[KrajPochodzenia]=src.[KrajPochodzenia],
tgt.[TowarNiebezpiecznyNaGranicy]=src.[TowarNiebezpiecznyNaGranicy],
tgt.[CRNNaGranicy]=src.[CRNNaGranicy],
tgt.[IloscUjm]=src.[IloscUjm],
tgt.[OpisTowaru]=src.[OpisTowaru],
tgt.[SaldoAGREX]=src.[SaldoAGREX],
tgt.[ProceduraPid]=src.[ProceduraPid],
tgt.[KodTypOplatTranspPid]=src.[KodTypOplatTranspPid],
tgt.[MasaNettoNaGranicy]=src.[MasaNettoNaGranicy],
tgt.[DodKodTARIC2NaGranicy]=src.[DodKodTARIC2NaGranicy],
tgt.[StatusAGREX]=src.[StatusAGREX],
tgt.[SumaOplat]=src.[SumaOplat],
tgt.[Waluta]=src.[Waluta],
tgt.[CRN]=src.[CRN],
tgt.[OpisTowaruNaGranicy]=src.[OpisTowaruNaGranicy],
tgt.[WartoscStatystyczna]=src.[WartoscStatystyczna],
tgt.[ProceduraSzczegolyPid]=src.[ProceduraSzczegolyPid]

WHEN NOT MATCHED
THEN INSERT (
[KodTowarowy], [KodTowarowyPid], [ProceduraPoprz], [ProceduraPoprzPid], [KrajPrzeznaczeniaPid], [KodTowarowyNaGranicy], [NrPozycji], [MasaBrutto], [KodTARIC], [KrajPochodzeniaPid], [TowarNiebezpieczny], [OpisNiezgodnościAGREX], [KontynuacjaPrzetwarzaniaAGREX], [MasaNetto], [OplatyTransportoweNaGranicy], [KrajWysylkiPid], [MasaBruttoNaGranicy], [KrajWysylki], [DodKodTARIC1NaGranicy], [TowarNiebezpiecznyPid], [StanNaGranicy], [KodTowarowyNaGranicyPid], [IdDokZWU], [KodTypOplatTransp], [WalutaNaGranicy], [Procedura], [WartoscStatystycznaNaGranicy], [KrajPrzeznaczenia], [ProceduraSzczegoly], [KrajPochodzenia], [TowarNiebezpiecznyNaGranicy], [CRNNaGranicy], [IloscUjm], [OpisTowaru], [Id], [SaldoAGREX], [ProceduraPid], [KodTypOplatTranspPid], [MasaNettoNaGranicy], [DodKodTARIC2NaGranicy], [StatusAGREX], [SumaOplat], [Waluta], [CRN], [OpisTowaruNaGranicy], [WartoscStatystyczna], [ProceduraSzczegolyPid] )
VALUES ([KodTowarowy], [KodTowarowyPid], [ProceduraPoprz], [ProceduraPoprzPid], [KrajPrzeznaczeniaPid], [KodTowarowyNaGranicy], [NrPozycji], [MasaBrutto], [KodTARIC], [KrajPochodzeniaPid], [TowarNiebezpieczny], [OpisNiezgodnościAGREX], [KontynuacjaPrzetwarzaniaAGREX], [MasaNetto], [OplatyTransportoweNaGranicy], [KrajWysylkiPid], [MasaBruttoNaGranicy], [KrajWysylki], [DodKodTARIC1NaGranicy], [TowarNiebezpiecznyPid], [StanNaGranicy], [KodTowarowyNaGranicyPid], [IdDokZWU], [KodTypOplatTransp], [WalutaNaGranicy], [Procedura], [WartoscStatystycznaNaGranicy], [KrajPrzeznaczenia], [ProceduraSzczegoly], [KrajPochodzenia], [TowarNiebezpiecznyNaGranicy], [CRNNaGranicy], [IloscUjm], [OpisTowaru], [Id], [SaldoAGREX], [ProceduraPid], [KodTypOplatTranspPid], [MasaNettoNaGranicy], [DodKodTARIC2NaGranicy], [StatusAGREX], [SumaOplat], [Waluta], [CRN], [OpisTowaruNaGranicy], [WartoscStatystyczna], [ProceduraSzczegolyPid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_InformacjaDodatkowa]'
BEGIN
MERGE INTO [aes2].[ZWU_InformacjaDodatkowa] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_InformacjaDodatkowa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodInfDodPid]=src.[KodInfDodPid],
tgt.[Tekst]=src.[Tekst],
tgt.[KodInfDod]=src.[KodInfDod],
tgt.[IdTowarZWU]=src.[IdTowarZWU]

WHEN NOT MATCHED
THEN INSERT (
[KodInfDodPid], [Tekst], [KodInfDod], [IdTowarZWU], [Id] )
VALUES ([KodInfDodPid], [Tekst], [KodInfDod], [IdTowarZWU], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWU_TowarPodmiot]'
BEGIN
MERGE INTO [aes2].[DWU_TowarPodmiot] as tgt
USING [WA_StageHurtownia].[aes2].[DWU_TowarPodmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarDWU]=src.[IdTowarDWU],
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[TIN]=src.[TIN],
tgt.[REGON]=src.[REGON],
tgt.[EORI]=src.[EORI],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarDWU], [Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [KrajPid], [UlicaNumer], [TIN], [REGON], [EORI], [RodzPodmiotu], [Email] )
VALUES ([IdTowarDWU], [Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [KrajPid], [UlicaNumer], [TIN], [REGON], [EORI], [RodzPodmiotu], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_InformacjaDodatkowa]'
BEGIN
MERGE INTO [aes2].[ZWP_InformacjaDodatkowa] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_InformacjaDodatkowa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodInfDodPid]=src.[KodInfDodPid],
tgt.[IdTowarZWP]=src.[IdTowarZWP],
tgt.[Tekst]=src.[Tekst],
tgt.[KodJezykaInfDod]=src.[KodJezykaInfDod],
tgt.[KodInfDod]=src.[KodInfDod]

WHEN NOT MATCHED
THEN INSERT (
[KodInfDodPid], [IdTowarZWP], [Tekst], [KodJezykaInfDod], [KodInfDod], [Id] )
VALUES ([KodInfDodPid], [IdTowarZWP], [Tekst], [KodJezykaInfDod], [KodInfDod], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Kontener]'
BEGIN
MERGE INTO [aes2].[ZWU_Kontener] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Kontener]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[StanKontenera]=src.[StanKontenera],
tgt.[IdTowarZWU]=src.[IdTowarZWU],
tgt.[NrKontenera]=src.[NrKontenera]

WHEN NOT MATCHED
THEN INSERT (
[StanKontenera], [IdTowarZWU], [Id], [NrKontenera] )
VALUES ([StanKontenera], [IdTowarZWU], [Id], [NrKontenera] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_ZamkniecieCelne]'
BEGIN
MERGE INTO [aes2].[ZWA_ZamkniecieCelne] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_ZamkniecieCelne]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[ZnakiZamkniec]=src.[ZnakiZamkniec],
tgt.[IdDokZWA]=src.[IdDokZWA]

WHEN NOT MATCHED
THEN INSERT (
[Id], [ZnakiZamkniec], [IdDokZWA] )
VALUES ([Id], [ZnakiZamkniec], [IdDokZWA] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Podmiot]'
BEGIN
MERGE INTO [aes2].[ZWU_Podmiot] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Podmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[KrajPid]=src.[KrajPid],
tgt.[TIN]=src.[TIN],
tgt.[REGON]=src.[REGON],
tgt.[IdDokZWU]=src.[IdDokZWU],
tgt.[EORI]=src.[EORI],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [TIN], [REGON], [IdDokZWU], [EORI], [RodzPodmiotu], [Email] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [TIN], [REGON], [IdDokZWU], [EORI], [RodzPodmiotu], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[MEX_Przewoznik]'
BEGIN
MERGE INTO [aes2].[MEX_Przewoznik] as tgt
USING [WA_StageHurtownia].[aes2].[MEX_Przewoznik]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[TIN]=src.[TIN],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[IdDokMEX]=src.[IdDokMEX],
tgt.[Kraj]=src.[Kraj],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[KrajPid]=src.[KrajPid],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [TIN], [Miejscowosc], [KodPocztowy], [IdDokMEX], [Id], [Kraj], [UlicaNumer], [KrajPid], [Email] )
VALUES ([Nazwa], [TIN], [Miejscowosc], [KodPocztowy], [IdDokMEX], [Id], [Kraj], [UlicaNumer], [KrajPid], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWU_Towar]'
BEGIN
MERGE INTO [aes2].[DWU_Towar] as tgt
USING [WA_StageHurtownia].[aes2].[DWU_Towar]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodTowarowy]=src.[KodTowarowy],
tgt.[OplatyTransportowe]=src.[OplatyTransportowe],
tgt.[KodTowarowyPid]=src.[KodTowarowyPid],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[TowNiebezpPid]=src.[TowNiebezpPid],
tgt.[CRN]=src.[CRN],
tgt.[TowNiebezp]=src.[TowNiebezp],
tgt.[OpisTowaru]=src.[OpisTowaru],
tgt.[OplatyTransportowePid]=src.[OplatyTransportowePid],
tgt.[IdDokDWU]=src.[IdDokDWU]

WHEN NOT MATCHED
THEN INSERT (
[KodTowarowy], [KodTowarowyPid], [NrPozycji], [MasaBrutto], [TowNiebezpPid], [TowNiebezp], [OpisTowaru], [Id], [IdDokDWU], [OplatyTransportowe], [CRN], [OplatyTransportowePid] )
VALUES ([KodTowarowy], [KodTowarowyPid], [NrPozycji], [MasaBrutto], [TowNiebezpPid], [TowNiebezp], [OpisTowaru], [Id], [IdDokDWU], [OplatyTransportowe], [CRN], [OplatyTransportowePid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_DokumentWymagany]'
BEGIN
MERGE INTO [aes2].[ZUZ_DokumentWymagany] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_DokumentWymagany]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodDokWymPid]=src.[KodDokWymPid],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[KodDokWymWUzupln]=src.[KodDokWymWUzupln],
tgt.[NrDokWym]=src.[NrDokWym],
tgt.[KodDokWym]=src.[KodDokWym],
tgt.[KodDokWymWUzuplnPid]=src.[KodDokWymWUzuplnPid],
tgt.[NrDokWymWUzupln]=src.[NrDokWymWUzupln]

WHEN NOT MATCHED
THEN INSERT (
[KodDokWymPid], [IdTowarZUZ], [KodDokWymWUzupln], [NrDokWym], [Id], [KodDokWym], [KodDokWymWUzuplnPid], [NrDokWymWUzupln] )
VALUES ([KodDokWymPid], [IdTowarZUZ], [KodDokWymWUzupln], [NrDokWym], [Id], [KodDokWym], [KodDokWymWUzuplnPid], [NrDokWymWUzupln] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_Towar]'
BEGIN
MERGE INTO [aes2].[ZWA_Towar] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_Towar]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodTowarowyPid]=src.[KodTowarowyPid],
tgt.[ProceduraWnioskowana]=src.[ProceduraWnioskowana],
tgt.[KodScalonyNaGranicy]=src.[KodScalonyNaGranicy],
tgt.[ProceduraWnioskowanaPid]=src.[ProceduraWnioskowanaPid],
tgt.[KodDod]=src.[KodDod],
tgt.[KodTARICNaGranicy]=src.[KodTARICNaGranicy],
tgt.[KodTowarowyNaGranicy]=src.[KodTowarowyNaGranicy],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[KodTARIC]=src.[KodTARIC],
tgt.[KodDodPid]=src.[KodDodPid],
tgt.[OplatyTransportoweNaGranicy]=src.[OplatyTransportoweNaGranicy],
tgt.[KodScalony]=src.[KodScalony],
tgt.[KrajWysylki]=src.[KrajWysylki],
tgt.[KodTowarowyNaGranicyPid]=src.[KodTowarowyNaGranicyPid],
tgt.[WalutaWartosciStat]=src.[WalutaWartosciStat],
tgt.[WartoscStatystycznaNaGranicy]=src.[WartoscStatystycznaNaGranicy],
tgt.[KodDodNaGranicy]=src.[KodDodNaGranicy],
tgt.[DodKodTARIC1]=src.[DodKodTARIC1],
tgt.[KodTypOplTransp]=src.[KodTypOplTransp],
tgt.[ProceduraKrajowa]=src.[ProceduraKrajowa],
tgt.[MasaNettoNaGranicy]=src.[MasaNettoNaGranicy],
tgt.[KodTypOplTranspPid]=src.[KodTypOplTranspPid],
tgt.[OpisTowaruNaGranicy]=src.[OpisTowaruNaGranicy],
tgt.[WartoscStatystyczna]=src.[WartoscStatystyczna],
tgt.[ProceduraWymaganaPid]=src.[ProceduraWymaganaPid],
tgt.[KodTowarowy]=src.[KodTowarowy],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[DodKodTARIC2]=src.[DodKodTARIC2],
tgt.[TowarNiebezpieczny]=src.[TowarNiebezpieczny],
tgt.[MasaNetto]=src.[MasaNetto],
tgt.[KrajWysylkiPid]=src.[KrajWysylkiPid],
tgt.[MasaBruttoNaGranicy]=src.[MasaBruttoNaGranicy],
tgt.[DodKodTARIC1Pid]=src.[DodKodTARIC1Pid],
tgt.[DodKodTARIC1NaGranicy]=src.[DodKodTARIC1NaGranicy],
tgt.[TowarNiebezpiecznyPid]=src.[TowarNiebezpiecznyPid],
tgt.[WalutaNaGranicy]=src.[WalutaNaGranicy],
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[ProceduraWymagana]=src.[ProceduraWymagana],
tgt.[SzczegolyProceduryNaGranicy]=src.[SzczegolyProceduryNaGranicy],
tgt.[DodKodTARIC2Pid]=src.[DodKodTARIC2Pid],
tgt.[StanTowaruNaGranicy]=src.[StanTowaruNaGranicy],
tgt.[TowarNiebezpiecznyNaGranicy]=src.[TowarNiebezpiecznyNaGranicy],
tgt.[ProceduraKrajowaPid]=src.[ProceduraKrajowaPid],
tgt.[WalutaWartosciStatPid]=src.[WalutaWartosciStatPid],
tgt.[OpisTowaru]=src.[OpisTowaru],
tgt.[CRNRozbieznosc]=src.[CRNRozbieznosc],
tgt.[DodKodTARIC2NaGranicy]=src.[DodKodTARIC2NaGranicy],
tgt.[IdDokZWA]=src.[IdDokZWA],
tgt.[CRN]=src.[CRN]

WHEN NOT MATCHED
THEN INSERT (
[KodTowarowyPid], [ProceduraWnioskowana], [KodScalonyNaGranicy], [ProceduraWnioskowanaPid], [KodDod], [KodTARICNaGranicy], [KodTowarowyNaGranicy], [NrPozycji], [MasaBrutto], [KodTARIC], [KodDodPid], [OplatyTransportoweNaGranicy], [KodScalony], [KrajWysylki], [KodTowarowyNaGranicyPid], [WalutaWartosciStat], [WartoscStatystycznaNaGranicy], [KodDodNaGranicy], [DodKodTARIC1], [KodTypOplTransp], [ProceduraKrajowa], [MasaNettoNaGranicy], [KodTypOplTranspPid], [OpisTowaruNaGranicy], [WartoscStatystyczna], [ProceduraWymaganaPid], [KodTowarowy], [KrajPrzeznaczeniaPid], [DodKodTARIC2], [TowarNiebezpieczny], [MasaNetto], [KrajWysylkiPid], [MasaBruttoNaGranicy], [DodKodTARIC1Pid], [DodKodTARIC1NaGranicy], [TowarNiebezpiecznyPid], [WalutaNaGranicy], [KrajPrzeznaczenia], [ProceduraWymagana], [SzczegolyProceduryNaGranicy], [DodKodTARIC2Pid], [StanTowaruNaGranicy], [TowarNiebezpiecznyNaGranicy], [ProceduraKrajowaPid], [WalutaWartosciStatPid], [OpisTowaru], [Id], [CRNRozbieznosc], [DodKodTARIC2NaGranicy], [IdDokZWA], [CRN] )
VALUES ([KodTowarowyPid], [ProceduraWnioskowana], [KodScalonyNaGranicy], [ProceduraWnioskowanaPid], [KodDod], [KodTARICNaGranicy], [KodTowarowyNaGranicy], [NrPozycji], [MasaBrutto], [KodTARIC], [KodDodPid], [OplatyTransportoweNaGranicy], [KodScalony], [KrajWysylki], [KodTowarowyNaGranicyPid], [WalutaWartosciStat], [WartoscStatystycznaNaGranicy], [KodDodNaGranicy], [DodKodTARIC1], [KodTypOplTransp], [ProceduraKrajowa], [MasaNettoNaGranicy], [KodTypOplTranspPid], [OpisTowaruNaGranicy], [WartoscStatystyczna], [ProceduraWymaganaPid], [KodTowarowy], [KrajPrzeznaczeniaPid], [DodKodTARIC2], [TowarNiebezpieczny], [MasaNetto], [KrajWysylkiPid], [MasaBruttoNaGranicy], [DodKodTARIC1Pid], [DodKodTARIC1NaGranicy], [TowarNiebezpiecznyPid], [WalutaNaGranicy], [KrajPrzeznaczenia], [ProceduraWymagana], [SzczegolyProceduryNaGranicy], [DodKodTARIC2Pid], [StanTowaruNaGranicy], [TowarNiebezpiecznyNaGranicy], [ProceduraKrajowaPid], [WalutaWartosciStatPid], [OpisTowaru], [Id], [CRNRozbieznosc], [DodKodTARIC2NaGranicy], [IdDokZWA], [CRN] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[MEX_DaneCelne]'
BEGIN
MERGE INTO [aes2].[MEX_DaneCelne] as tgt
USING [WA_StageHurtownia].[aes2].[MEX_DaneCelne]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[WywozCzesciowy]=src.[WywozCzesciowy],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[LiczbaSztuk]=src.[LiczbaSztuk],
tgt.[MRN]=src.[MRN],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[IdTowarMEX]=src.[IdTowarMEX]

WHEN NOT MATCHED
THEN INSERT (
[WywozCzesciowy], [NrPozycji], [MasaBrutto], [LiczbaSztuk], [MRN], [Id], [LiczbaOpakowan], [IdTowarMEX] )
VALUES ([WywozCzesciowy], [NrPozycji], [MasaBrutto], [LiczbaSztuk], [MRN], [Id], [LiczbaOpakowan], [IdTowarMEX] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_Dokument]'
BEGIN
MERGE INTO [aes2].[ZUZ_Dokument] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[MiejsceSkodyfikowanePozaUC]=src.[MiejsceSkodyfikowanePozaUC],
tgt.[UCZlozeniaPid]=src.[UCZlozeniaPid],
tgt.[Typ]=src.[Typ],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[UCWUzupeln]=src.[UCWUzupeln],
tgt.[MiejsceKodPozaUCPid]=src.[MiejsceKodPozaUCPid],
tgt.[ZamkCelneLiczba]=src.[ZamkCelneLiczba],
tgt.[LiczbaPozycji]=src.[LiczbaPozycji],
tgt.[UCWUzupelnPid]=src.[UCWUzupelnPid],
tgt.[MiejsceKodPozaUCWUzupeln]=src.[MiejsceKodPozaUCWUzupeln],
tgt.[TrWewnRodzaj]=src.[TrWewnRodzaj],
tgt.[KodTypOplatTranspWUzupelnPid]=src.[KodTypOplatTranspWUzupelnPid],
tgt.[TrDeklKraj]=src.[TrDeklKraj],
tgt.[SumaOplatPozycjiTowarWUzupeln]=src.[SumaOplatPozycjiTowarWUzupeln],
tgt.[MiejsceSkodyfikowanePozaUCnaZWU]=src.[MiejsceSkodyfikowanePozaUCnaZWU],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[NrWlasny]=src.[NrWlasny],
tgt.[KursWalutyWUzupeln]=src.[KursWalutyWUzupeln],
tgt.[KodRodzajuTransakcjiWUzupelnPid]=src.[KodRodzajuTransakcjiWUzupelnPid],
tgt.[PodpisElektroniczny]=src.[PodpisElektroniczny],
tgt.[TrDeklKrajWUzupeln]=src.[TrDeklKrajWUzupeln],
tgt.[TowNiebezpUzupeln]=src.[TowNiebezpUzupeln],
tgt.[MRN]=src.[MRN],
tgt.[SpecyficzneOkolicznosciWUzupelnPid]=src.[SpecyficzneOkolicznosciWUzupelnPid],
tgt.[SpecyficzneOkolicznosci]=src.[SpecyficzneOkolicznosci],
tgt.[KodRodzajuTransakcji]=src.[KodRodzajuTransakcji],
tgt.[SkladTowPozaUCKod]=src.[SkladTowPozaUCKod],
tgt.[ZnakiSrodkaPrzewozWUzupeln]=src.[ZnakiSrodkaPrzewozWUzupeln],
tgt.[KodWarunkowDostawyWUzupelnPid]=src.[KodWarunkowDostawyWUzupelnPid],
tgt.[ZamkCelneLiczbaWUzupeln]=src.[ZamkCelneLiczbaWUzupeln],
tgt.[UCPid]=src.[UCPid],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[UrzadWywozu]=src.[UrzadWywozu],
tgt.[UrzadWywozuWUzupeln]=src.[UrzadWywozuWUzupeln],
tgt.[Telefon]=src.[Telefon],
tgt.[1aPid]=src.[1aPid],
tgt.[LiczbaOpakowanWUzupeln]=src.[LiczbaOpakowanWUzupeln],
tgt.[UrzadWywozuPid]=src.[UrzadWywozuPid],
tgt.[MiejsceBezKoduPozaUC]=src.[MiejsceBezKoduPozaUC],
tgt.[TrWewnRodzajWUzupeln]=src.[TrWewnRodzajWUzupeln],
tgt.[SkladTowPozaUCKodWUzupeln]=src.[SkladTowPozaUCKodWUzupeln],
tgt.[SumaOplatPozycjiTowar]=src.[SumaOplatPozycjiTowar],
tgt.[TrWewnZnakiWUzupeln]=src.[TrWewnZnakiWUzupeln],
tgt.[KodMiejscaDostawyWUzupelnPid]=src.[KodMiejscaDostawyWUzupelnPid],
tgt.[KodTypOplatTransp]=src.[KodTypOplatTransp],
tgt.[SkladTowPozaUCBezKodu]=src.[SkladTowPozaUCBezKodu],
tgt.[KodWarunkowDostawyPid]=src.[KodWarunkowDostawyPid],
tgt.[MiejsceKodPozaUC]=src.[MiejsceKodPozaUC],
tgt.[Skladowanie]=src.[Skladowanie],
tgt.[KodRodzajuTransakcjiPid]=src.[KodRodzajuTransakcjiPid],
tgt.[Data]=src.[Data],
tgt.[MiejsceKodPozaUCWUzupelnPid]=src.[MiejsceKodPozaUCWUzupelnPid],
tgt.[KodMiejscaDostawyWUzupeln]=src.[KodMiejscaDostawyWUzupeln],
tgt.[Wartosc]=src.[Wartosc],
tgt.[UrzadWyprowadzeniaWUzupeln]=src.[UrzadWyprowadzeniaWUzupeln],
tgt.[UCZlozenia]=src.[UCZlozenia],
tgt.[UrzadWyprowadzeniaWUzupelnPid]=src.[UrzadWyprowadzeniaWUzupelnPid],
tgt.[KrajPrzeznaczeniaWUzupeln]=src.[KrajPrzeznaczeniaWUzupeln],
tgt.[TypNaZWU]=src.[TypNaZWU],
tgt.[CRN]=src.[CRN],
tgt.[CRNWUzupeln]=src.[CRNWUzupeln],
tgt.[UC]=src.[UC],
tgt.[TrWewnZnaki]=src.[TrWewnZnaki],
tgt.[TrDeklRodzajPid]=src.[TrDeklRodzajPid],
tgt.[KodWalutyWUzupeln]=src.[KodWalutyWUzupeln],
tgt.[MasaBruttoWUzupeln]=src.[MasaBruttoWUzupeln],
tgt.[KodKrajuNaZWUPid]=src.[KodKrajuNaZWUPid],
tgt.[TowNiebezpWUzupelnPid]=src.[TowNiebezpWUzupelnPid],
tgt.[SkladowanieWUzupeln]=src.[SkladowanieWUzupeln],
tgt.[KodWalutyWUzupelnPid]=src.[KodWalutyWUzupelnPid],
tgt.[KonteneryWUzupeln]=src.[KonteneryWUzupeln],
tgt.[KrajPrzeznaczeniaWUzupelnPid]=src.[KrajPrzeznaczeniaWUzupelnPid],
tgt.[UrzadWywozuWUzupelnPid]=src.[UrzadWywozuWUzupelnPid],
tgt.[KrajWysylki]=src.[KrajWysylki],
tgt.[KodKrajuNaZWU]=src.[KodKrajuNaZWU],
tgt.[TrWewnRodzajWUzupelnPid]=src.[TrWewnRodzajWUzupelnPid],
tgt.[Stanowisko]=src.[Stanowisko],
tgt.[LiczbaPozycjiWUzupeln]=src.[LiczbaPozycjiWUzupeln],
tgt.[KodWalutyPid]=src.[KodWalutyPid],
tgt.[UrzadWyprowadzenia]=src.[UrzadWyprowadzenia],
tgt.[TrDeklKrajPid]=src.[TrDeklKrajPid],
tgt.[SpecyficzneOkolicznosciPid]=src.[SpecyficzneOkolicznosciPid],
tgt.[TowNiebezpPid]=src.[TowNiebezpPid],
tgt.[TrDeklRodzajWUzupeln]=src.[TrDeklRodzajWUzupeln],
tgt.[NazwiskoImie]=src.[NazwiskoImie],
tgt.[TrDeklKrajWUzupelnPid]=src.[TrDeklKrajWUzupelnPid],
tgt.[UrzadZgloszeniaUzupeln]=src.[UrzadZgloszeniaUzupeln],
tgt.[KodKrajuPid]=src.[KodKrajuPid],
tgt.[UrzadZgloszeniaUzupelnPid]=src.[UrzadZgloszeniaUzupelnPid],
tgt.[KodWarunkowDostawyWUzupeln]=src.[KodWarunkowDostawyWUzupeln],
tgt.[KodTypOplatTranspPid]=src.[KodTypOplatTranspPid],
tgt.[TrDeklRodzajWUzupelnPid]=src.[TrDeklRodzajWUzupelnPid],
tgt.[KrajWysylkiWUzupeln]=src.[KrajWysylkiWUzupeln],
tgt.[KodWaluty]=src.[KodWaluty],
tgt.[1bPid]=src.[1bPid],
tgt.[KodMiejscaDostawyPid]=src.[KodMiejscaDostawyPid],
tgt.[TrDeklRodzaj]=src.[TrDeklRodzaj],
tgt.[Miejsce]=src.[Miejsce],
tgt.[SpecyficzneOkolicznosciWUzupeln]=src.[SpecyficzneOkolicznosciWUzupeln],
tgt.[KodTypOplatTranspWUzupeln]=src.[KodTypOplatTranspWUzupeln],
tgt.[TowNiebezp]=src.[TowNiebezp],
tgt.[KodWarunkowDostawy]=src.[KodWarunkowDostawy],
tgt.[UrzadZgloszeniaUzupelnWUzupelnPid]=src.[UrzadZgloszeniaUzupelnWUzupelnPid],
tgt.[KrajWysylkiPid]=src.[KrajWysylkiPid],
tgt.[TrWewnRodzajPid]=src.[TrWewnRodzajPid],
tgt.[WartoscWUzupeln]=src.[WartoscWUzupeln],
tgt.[Kontenery]=src.[Kontenery],
tgt.[1b]=src.[1b],
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[ZnakiSrodkaPrzewoz]=src.[ZnakiSrodkaPrzewoz],
tgt.[DataPowiazaniaZgloszen]=src.[DataPowiazaniaZgloszen],
tgt.[UrzadZgloszeniaUzupelnWUzupeln]=src.[UrzadZgloszeniaUzupelnWUzupeln],
tgt.[KodRodzajuTransakcjiWUzupeln]=src.[KodRodzajuTransakcjiWUzupeln],
tgt.[KodKraju]=src.[KodKraju],
tgt.[1a]=src.[1a],
tgt.[KodMiejscaDostawy]=src.[KodMiejscaDostawy],
tgt.[MiejsceDostawy]=src.[MiejsceDostawy],
tgt.[KursWaluty]=src.[KursWaluty],
tgt.[KrajWysylkiWUzupelnPid]=src.[KrajWysylkiWUzupelnPid],
tgt.[UrzadWyprowadzeniaPid]=src.[UrzadWyprowadzeniaPid],
tgt.[Status]=src.[Status]

WHEN NOT MATCHED
THEN INSERT (
[MiejsceSkodyfikowanePozaUC], [UCZlozeniaPid], [Typ], [MasaBrutto], [UCWUzupeln], [MiejsceKodPozaUCPid], [ZamkCelneLiczba], [LiczbaPozycji], [UCWUzupelnPid], [MiejsceKodPozaUCWUzupeln], [TrWewnRodzaj], [KodTypOplatTranspWUzupelnPid], [TrDeklKraj], [SumaOplatPozycjiTowarWUzupeln], [MiejsceSkodyfikowanePozaUCnaZWU], [LiczbaOpakowan], [NrWlasny], [KursWalutyWUzupeln], [KodRodzajuTransakcjiWUzupelnPid], [PodpisElektroniczny], [TrDeklKrajWUzupeln], [TowNiebezpUzupeln], [MRN], [SpecyficzneOkolicznosciWUzupelnPid], [SpecyficzneOkolicznosci], [KodRodzajuTransakcji], [SkladTowPozaUCKod], [ZnakiSrodkaPrzewozWUzupeln], [KodWarunkowDostawyWUzupelnPid], [ZamkCelneLiczbaWUzupeln], [UCPid], [KrajPrzeznaczeniaPid], [UrzadWywozu], [UrzadWywozuWUzupeln], [Telefon], [1aPid], [LiczbaOpakowanWUzupeln], [UrzadWywozuPid], [MiejsceBezKoduPozaUC], [TrWewnRodzajWUzupeln], [SkladTowPozaUCKodWUzupeln], [SumaOplatPozycjiTowar], [TrWewnZnakiWUzupeln], [KodMiejscaDostawyWUzupelnPid], [KodTypOplatTransp], [SkladTowPozaUCBezKodu], [KodWarunkowDostawyPid], [MiejsceKodPozaUC], [Skladowanie], [KodRodzajuTransakcjiPid], [Data], [Id], [MiejsceKodPozaUCWUzupelnPid], [KodMiejscaDostawyWUzupeln], [Wartosc], [UrzadWyprowadzeniaWUzupeln], [UCZlozenia], [UrzadWyprowadzeniaWUzupelnPid], [KrajPrzeznaczeniaWUzupeln], [TypNaZWU], [CRN], [CRNWUzupeln], [UC], [TrWewnZnaki], [TrDeklRodzajPid], [KodWalutyWUzupeln], [MasaBruttoWUzupeln], [KodKrajuNaZWUPid], [TowNiebezpWUzupelnPid], [SkladowanieWUzupeln], [KodWalutyWUzupelnPid], [KonteneryWUzupeln], [KrajPrzeznaczeniaWUzupelnPid], [UrzadWywozuWUzupelnPid], [KrajWysylki], [KodKrajuNaZWU], [TrWewnRodzajWUzupelnPid], [Stanowisko], [LiczbaPozycjiWUzupeln], [KodWalutyPid], [UrzadWyprowadzenia], [TrDeklKrajPid], [SpecyficzneOkolicznosciPid], [TowNiebezpPid], [TrDeklRodzajWUzupeln], [NazwiskoImie], [TrDeklKrajWUzupelnPid], [UrzadZgloszeniaUzupeln], [KodKrajuPid], [UrzadZgloszeniaUzupelnPid], [KodWarunkowDostawyWUzupeln], [KodTypOplatTranspPid], [TrDeklRodzajWUzupelnPid], [KrajWysylkiWUzupeln], [KodWaluty], [1bPid], [KodMiejscaDostawyPid], [TrDeklRodzaj], [Miejsce], [SpecyficzneOkolicznosciWUzupeln], [KodTypOplatTranspWUzupeln], [TowNiebezp], [KodWarunkowDostawy], [UrzadZgloszeniaUzupelnWUzupelnPid], [KrajWysylkiPid], [TrWewnRodzajPid], [WartoscWUzupeln], [Kontenery], [1b], [KrajPrzeznaczenia], [ZnakiSrodkaPrzewoz], [DataPowiazaniaZgloszen], [UrzadZgloszeniaUzupelnWUzupeln], [KodRodzajuTransakcjiWUzupeln], [KodKraju], [1a], [KodMiejscaDostawy], [MiejsceDostawy], [KursWaluty], [KrajWysylkiWUzupelnPid], [UrzadWyprowadzeniaPid], [Status] )
VALUES ([MiejsceSkodyfikowanePozaUC], [UCZlozeniaPid], [Typ], [MasaBrutto], [UCWUzupeln], [MiejsceKodPozaUCPid], [ZamkCelneLiczba], [LiczbaPozycji], [UCWUzupelnPid], [MiejsceKodPozaUCWUzupeln], [TrWewnRodzaj], [KodTypOplatTranspWUzupelnPid], [TrDeklKraj], [SumaOplatPozycjiTowarWUzupeln], [MiejsceSkodyfikowanePozaUCnaZWU], [LiczbaOpakowan], [NrWlasny], [KursWalutyWUzupeln], [KodRodzajuTransakcjiWUzupelnPid], [PodpisElektroniczny], [TrDeklKrajWUzupeln], [TowNiebezpUzupeln], [MRN], [SpecyficzneOkolicznosciWUzupelnPid], [SpecyficzneOkolicznosci], [KodRodzajuTransakcji], [SkladTowPozaUCKod], [ZnakiSrodkaPrzewozWUzupeln], [KodWarunkowDostawyWUzupelnPid], [ZamkCelneLiczbaWUzupeln], [UCPid], [KrajPrzeznaczeniaPid], [UrzadWywozu], [UrzadWywozuWUzupeln], [Telefon], [1aPid], [LiczbaOpakowanWUzupeln], [UrzadWywozuPid], [MiejsceBezKoduPozaUC], [TrWewnRodzajWUzupeln], [SkladTowPozaUCKodWUzupeln], [SumaOplatPozycjiTowar], [TrWewnZnakiWUzupeln], [KodMiejscaDostawyWUzupelnPid], [KodTypOplatTransp], [SkladTowPozaUCBezKodu], [KodWarunkowDostawyPid], [MiejsceKodPozaUC], [Skladowanie], [KodRodzajuTransakcjiPid], [Data], [Id], [MiejsceKodPozaUCWUzupelnPid], [KodMiejscaDostawyWUzupeln], [Wartosc], [UrzadWyprowadzeniaWUzupeln], [UCZlozenia], [UrzadWyprowadzeniaWUzupelnPid], [KrajPrzeznaczeniaWUzupeln], [TypNaZWU], [CRN], [CRNWUzupeln], [UC], [TrWewnZnaki], [TrDeklRodzajPid], [KodWalutyWUzupeln], [MasaBruttoWUzupeln], [KodKrajuNaZWUPid], [TowNiebezpWUzupelnPid], [SkladowanieWUzupeln], [KodWalutyWUzupelnPid], [KonteneryWUzupeln], [KrajPrzeznaczeniaWUzupelnPid], [UrzadWywozuWUzupelnPid], [KrajWysylki], [KodKrajuNaZWU], [TrWewnRodzajWUzupelnPid], [Stanowisko], [LiczbaPozycjiWUzupeln], [KodWalutyPid], [UrzadWyprowadzenia], [TrDeklKrajPid], [SpecyficzneOkolicznosciPid], [TowNiebezpPid], [TrDeklRodzajWUzupeln], [NazwiskoImie], [TrDeklKrajWUzupelnPid], [UrzadZgloszeniaUzupeln], [KodKrajuPid], [UrzadZgloszeniaUzupelnPid], [KodWarunkowDostawyWUzupeln], [KodTypOplatTranspPid], [TrDeklRodzajWUzupelnPid], [KrajWysylkiWUzupeln], [KodWaluty], [1bPid], [KodMiejscaDostawyPid], [TrDeklRodzaj], [Miejsce], [SpecyficzneOkolicznosciWUzupeln], [KodTypOplatTranspWUzupeln], [TowNiebezp], [KodWarunkowDostawy], [UrzadZgloszeniaUzupelnWUzupelnPid], [KrajWysylkiPid], [TrWewnRodzajPid], [WartoscWUzupeln], [Kontenery], [1b], [KrajPrzeznaczenia], [ZnakiSrodkaPrzewoz], [DataPowiazaniaZgloszen], [UrzadZgloszeniaUzupelnWUzupeln], [KodRodzajuTransakcjiWUzupeln], [KodKraju], [1a], [KodMiejscaDostawy], [MiejsceDostawy], [KursWaluty], [KrajWysylkiWUzupelnPid], [UrzadWyprowadzeniaPid], [Status] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_TowarKomentarz]'
BEGIN
MERGE INTO [aes2].[ZWU_TowarKomentarz] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_TowarKomentarz]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Komentarz]=src.[Komentarz],
tgt.[IdTowarZWU]=src.[IdTowarZWU]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZWU], [Id], [Komentarz] )
VALUES ([IdTowarZWU], [Id], [Komentarz] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_WynikAnalizyRyzyka]'
BEGIN
MERGE INTO [aes2].[QUERY_WynikAnalizyRyzyka] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_WynikAnalizyRyzyka]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokQUERY]=src.[IdDokQUERY],
tgt.[OpisKoduAnalizyRyzyka]=src.[OpisKoduAnalizyRyzyka],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[KodAnalizyRyzyka]=src.[KodAnalizyRyzyka],
tgt.[KodJezykaOpisuKoduAnalizyRyzyka]=src.[KodJezykaOpisuKoduAnalizyRyzyka]

WHEN NOT MATCHED
THEN INSERT (
[IdDokQUERY], [OpisKoduAnalizyRyzyka], [NrPozycji], [KodAnalizyRyzyka], [KodJezykaOpisuKoduAnalizyRyzyka], [Id] )
VALUES ([IdDokQUERY], [OpisKoduAnalizyRyzyka], [NrPozycji], [KodAnalizyRyzyka], [KodJezykaOpisuKoduAnalizyRyzyka], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWU_Trasa]'
BEGIN
MERGE INTO [aes2].[DWU_Trasa] as tgt
USING [WA_StageHurtownia].[aes2].[DWU_Trasa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid],
tgt.[IdDokDWU]=src.[IdDokDWU]

WHEN NOT MATCHED
THEN INSERT (
[Id], [Kraj], [KrajPid], [IdDokDWU] )
VALUES ([Id], [Kraj], [KrajPid], [IdDokDWU] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_TowarPodmiot]'
BEGIN
MERGE INTO [aes2].[ZWP_TowarPodmiot] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_TowarPodmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZWP]=src.[IdTowarZWP],
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[KrajPid]=src.[KrajPid],
tgt.[TIN]=src.[TIN],
tgt.[EORI]=src.[EORI],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZWP], [Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [TIN], [EORI], [RodzPodmiotu], [Email] )
VALUES ([IdTowarZWP], [Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [TIN], [EORI], [RodzPodmiotu], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_Komentarz]'
BEGIN
MERGE INTO [aes2].[ZWA_Komentarz] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_Komentarz]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Komentarz]=src.[Komentarz],
tgt.[IdDokZWA]=src.[IdDokZWA]

WHEN NOT MATCHED
THEN INSERT (
[Id], [Komentarz], [IdDokZWA] )
VALUES ([Id], [Komentarz], [IdDokZWA] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Dokument]'
BEGIN
MERGE INTO [aes2].[ZWU_Dokument] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[TrWewnZnakiNaGranicy]=src.[TrWewnZnakiNaGranicy],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[TrDeklZnaki]=src.[TrDeklZnaki],
tgt.[UCKontrolnyMiejscowość]=src.[UCKontrolnyMiejscowość],
tgt.[LiczbaOpakowanNaGranicy]=src.[LiczbaOpakowanNaGranicy],
tgt.[LiczbaPozycjiNaGranicyKom]=src.[LiczbaPozycjiNaGranicyKom],
tgt.[ZamkCelneLiczba]=src.[ZamkCelneLiczba],
tgt.[MiejsceKodPozaUCPid]=src.[MiejsceKodPozaUCPid],
tgt.[DataPowiazaniaZWUNaZgloszUzupeln]=src.[DataPowiazaniaZWUNaZgloszUzupeln],
tgt.[CzyDotyczyEMCS]=src.[CzyDotyczyEMCS],
tgt.[LiczbaPozycji]=src.[LiczbaPozycji],
tgt.[TrWewnRodzaj]=src.[TrWewnRodzaj],
tgt.[TrDeklKraj]=src.[TrDeklKraj],
tgt.[MasaBruttoNaGranicyKom]=src.[MasaBruttoNaGranicyKom],
tgt.[UCKontrolnyKraj]=src.[UCKontrolnyKraj],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[NrWlasny]=src.[NrWlasny],
tgt.[TerminZwolnieniePU]=src.[TerminZwolnieniePU],
tgt.[PodpisElektroniczny]=src.[PodpisElektroniczny],
tgt.[DataZatrzymania]=src.[DataZatrzymania],
tgt.[LiczbaOpakowanNaGranicyKom]=src.[LiczbaOpakowanNaGranicyKom],
tgt.[TypWydrukuEAD]=src.[TypWydrukuEAD],
tgt.[MRN]=src.[MRN],
tgt.[KontrWywozTermin]=src.[KontrWywozTermin],
tgt.[SpecyficzneOkolicznosci]=src.[SpecyficzneOkolicznosci],
tgt.[TerminUrzadWyprowadzenia]=src.[TerminUrzadWyprowadzenia],
tgt.[UCZgloszUzupeln]=src.[UCZgloszUzupeln],
tgt.[KodRodzajuTransakcji]=src.[KodRodzajuTransakcji],
tgt.[OdprawaScentralizowana]=src.[OdprawaScentralizowana],
tgt.[SkladTowPozaUCKod]=src.[SkladTowPozaUCKod],
tgt.[UCPid]=src.[UCPid],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[UrzadWywozu]=src.[UrzadWywozu],
tgt.[KontrWyprKod]=src.[KontrWyprKod],
tgt.[LiczbaPozycjiNaGranicy]=src.[LiczbaPozycjiNaGranicy],
tgt.[Telefon]=src.[Telefon],
tgt.[TerminDostarczeniaZgloszUzupeln]=src.[TerminDostarczeniaZgloszUzupeln],
tgt.[1aPid]=src.[1aPid],
tgt.[MiejsceBezKoduPozaUC]=src.[MiejsceBezKoduPozaUC],
tgt.[UrzadWywozuPid]=src.[UrzadWywozuPid],
tgt.[UCKontrolnyKodKraju]=src.[UCKontrolnyKodKraju],
tgt.[MasaBruttoNaGranicy]=src.[MasaBruttoNaGranicy],
tgt.[DataWyprowadzenia]=src.[DataWyprowadzenia],
tgt.[TowarNiebezpiecznyPid]=src.[TowarNiebezpiecznyPid],
tgt.[KodTypOplatTransp]=src.[KodTypOplatTransp],
tgt.[SkladTowPozaUCBezKodu]=src.[SkladTowPozaUCBezKodu],
tgt.[KodWarunkowDostawyPid]=src.[KodWarunkowDostawyPid],
tgt.[MiejsceKodPozaUC]=src.[MiejsceKodPozaUC],
tgt.[Skladowanie]=src.[Skladowanie],
tgt.[TerminWysylkiPotwierdzenia]=src.[TerminWysylkiPotwierdzenia],
tgt.[presentation_goods_co]=src.[presentation_goods_co],
tgt.[KodRodzajuTransakcjiPid]=src.[KodRodzajuTransakcjiPid],
tgt.[Data]=src.[Data],
tgt.[WynikKontroliZWPKod]=src.[WynikKontroliZWPKod],
tgt.[WynikKontroliZWPLiczbaZamkniecCelnych]=src.[WynikKontroliZWPLiczbaZamkniecCelnych],
tgt.[Wartosc]=src.[Wartosc],
tgt.[KontrWyprStan]=src.[KontrWyprStan],
tgt.[ImieNazwisko]=src.[ImieNazwisko],
tgt.[UrzadWyprowadzeniaZm]=src.[UrzadWyprowadzeniaZm],
tgt.[SumaOplat]=src.[SumaOplat],
tgt.[CRN]=src.[CRN],
tgt.[KontrWywozKod]=src.[KontrWywozKod],
tgt.[UC]=src.[UC],
tgt.[SkladCelnyKod]=src.[SkladCelnyKod],
tgt.[TrWewnZnaki]=src.[TrWewnZnaki],
tgt.[Tranzyt]=src.[Tranzyt],
tgt.[SkladCelnyKodKraju]=src.[SkladCelnyKodKraju],
tgt.[TrDeklRodzajPid]=src.[TrDeklRodzajPid],
tgt.[SkladCelnyKodTyp]=src.[SkladCelnyKodTyp],
tgt.[UCKontrolnyUlicaNumer]=src.[UCKontrolnyUlicaNumer],
tgt.[UCKontrolnyNazwa]=src.[UCKontrolnyNazwa],
tgt.[UCKontrolnyKodPocztowy]=src.[UCKontrolnyKodPocztowy],
tgt.[UCPrzedstawienia]=src.[UCPrzedstawienia],
tgt.[DataPrzyjeciaNaEwid]=src.[DataPrzyjeciaNaEwid],
tgt.[OplatyTransportoweNaGranicy]=src.[OplatyTransportoweNaGranicy],
tgt.[KontrWyprKodPid]=src.[KontrWyprKodPid],
tgt.[PrzekroczenieLimitowNCTS2]=src.[PrzekroczenieLimitowNCTS2],
tgt.[KrajWysylki]=src.[KrajWysylki],
tgt.[Stanowisko]=src.[Stanowisko],
tgt.[KodWalutyPid]=src.[KodWalutyPid],
tgt.[UrzadWyprowadzenia]=src.[UrzadWyprowadzenia],
tgt.[TrDeklKrajPid]=src.[TrDeklKrajPid],
tgt.[KontrWywozKodPid]=src.[KontrWywozKodPid],
tgt.[SpecyficzneOkolicznosciPid]=src.[SpecyficzneOkolicznosciPid],
tgt.[OplatyTransportoweNaGranicyKomentarz]=src.[OplatyTransportoweNaGranicyKomentarz],
tgt.[CRNNaGranicy]=src.[CRNNaGranicy],
tgt.[KodTypOplatTranspPid]=src.[KodTypOplatTranspPid],
tgt.[CRNNaGranicyKomentarz]=src.[CRNNaGranicyKomentarz],
tgt.[FlagaZgloszUzupeln]=src.[FlagaZgloszUzupeln],
tgt.[KodWaluty]=src.[KodWaluty],
tgt.[1bPid]=src.[1bPid],
tgt.[ProceduraUproszczona]=src.[ProceduraUproszczona],
tgt.[KodMiejscaDostawyPid]=src.[KodMiejscaDostawyPid],
tgt.[TrDeklRodzaj]=src.[TrDeklRodzaj],
tgt.[Miejsce]=src.[Miejsce],
tgt.[UrzadWyprowadzeniaZmPid]=src.[UrzadWyprowadzeniaZmPid],
tgt.[TrWewnZnakiNaGranicyKom]=src.[TrWewnZnakiNaGranicyKom],
tgt.[TowarNiebezpieczny]=src.[TowarNiebezpieczny],
tgt.[DataZwolnienia]=src.[DataZwolnienia],
tgt.[KodWarunkowDostawy]=src.[KodWarunkowDostawy],
tgt.[TerminAutomatycznegoPrzyjęcia]=src.[TerminAutomatycznegoPrzyjęcia],
tgt.[TrWewnRodzajPid]=src.[TrWewnRodzajPid],
tgt.[KrajWysylkiPid]=src.[KrajWysylkiPid],
tgt.[Kontenery]=src.[Kontenery],
tgt.[1b]=src.[1b],
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[1a]=src.[1a],
tgt.[KodMiejscaDostawy]=src.[KodMiejscaDostawy],
tgt.[MiejsceDostawy]=src.[MiejsceDostawy],
tgt.[KursWaluty]=src.[KursWaluty],
tgt.[UrzadWyprowadzeniaPid]=src.[UrzadWyprowadzeniaPid],
tgt.[Status]=src.[Status]

WHEN NOT MATCHED
THEN INSERT (
[TrWewnZnakiNaGranicy], [MasaBrutto], [TrDeklZnaki], [UCKontrolnyMiejscowość], [LiczbaOpakowanNaGranicy], [LiczbaPozycjiNaGranicyKom], [ZamkCelneLiczba], [MiejsceKodPozaUCPid], [DataPowiazaniaZWUNaZgloszUzupeln], [CzyDotyczyEMCS], [LiczbaPozycji], [TrWewnRodzaj], [TrDeklKraj], [MasaBruttoNaGranicyKom], [UCKontrolnyKraj], [LiczbaOpakowan], [NrWlasny], [TerminZwolnieniePU], [PodpisElektroniczny], [DataZatrzymania], [LiczbaOpakowanNaGranicyKom], [TypWydrukuEAD], [MRN], [KontrWywozTermin], [SpecyficzneOkolicznosci], [TerminUrzadWyprowadzenia], [UCZgloszUzupeln], [KodRodzajuTransakcji], [OdprawaScentralizowana], [SkladTowPozaUCKod], [UCPid], [KrajPrzeznaczeniaPid], [UrzadWywozu], [KontrWyprKod], [LiczbaPozycjiNaGranicy], [Telefon], [TerminDostarczeniaZgloszUzupeln], [1aPid], [MiejsceBezKoduPozaUC], [UrzadWywozuPid], [UCKontrolnyKodKraju], [MasaBruttoNaGranicy], [DataWyprowadzenia], [TowarNiebezpiecznyPid], [KodTypOplatTransp], [SkladTowPozaUCBezKodu], [KodWarunkowDostawyPid], [MiejsceKodPozaUC], [Skladowanie], [TerminWysylkiPotwierdzenia], [presentation_goods_co], [KodRodzajuTransakcjiPid], [Id], [Data], [WynikKontroliZWPKod], [WynikKontroliZWPLiczbaZamkniecCelnych], [Wartosc], [KontrWyprStan], [ImieNazwisko], [UrzadWyprowadzeniaZm], [SumaOplat], [CRN], [KontrWywozKod], [UC], [SkladCelnyKod], [TrWewnZnaki], [Tranzyt], [SkladCelnyKodKraju], [TrDeklRodzajPid], [SkladCelnyKodTyp], [UCKontrolnyUlicaNumer], [UCKontrolnyNazwa], [UCKontrolnyKodPocztowy], [UCPrzedstawienia], [DataPrzyjeciaNaEwid], [OplatyTransportoweNaGranicy], [KontrWyprKodPid], [PrzekroczenieLimitowNCTS2], [KrajWysylki], [Stanowisko], [KodWalutyPid], [UrzadWyprowadzenia], [TrDeklKrajPid], [KontrWywozKodPid], [SpecyficzneOkolicznosciPid], [OplatyTransportoweNaGranicyKomentarz], [CRNNaGranicy], [KodTypOplatTranspPid], [CRNNaGranicyKomentarz], [FlagaZgloszUzupeln], [KodWaluty], [1bPid], [ProceduraUproszczona], [KodMiejscaDostawyPid], [TrDeklRodzaj], [Miejsce], [UrzadWyprowadzeniaZmPid], [TrWewnZnakiNaGranicyKom], [TowarNiebezpieczny], [DataZwolnienia], [KodWarunkowDostawy], [TerminAutomatycznegoPrzyjęcia], [TrWewnRodzajPid], [KrajWysylkiPid], [Kontenery], [1b], [KrajPrzeznaczenia], [1a], [KodMiejscaDostawy], [MiejsceDostawy], [KursWaluty], [UrzadWyprowadzeniaPid], [Status] )
VALUES ([TrWewnZnakiNaGranicy], [MasaBrutto], [TrDeklZnaki], [UCKontrolnyMiejscowość], [LiczbaOpakowanNaGranicy], [LiczbaPozycjiNaGranicyKom], [ZamkCelneLiczba], [MiejsceKodPozaUCPid], [DataPowiazaniaZWUNaZgloszUzupeln], [CzyDotyczyEMCS], [LiczbaPozycji], [TrWewnRodzaj], [TrDeklKraj], [MasaBruttoNaGranicyKom], [UCKontrolnyKraj], [LiczbaOpakowan], [NrWlasny], [TerminZwolnieniePU], [PodpisElektroniczny], [DataZatrzymania], [LiczbaOpakowanNaGranicyKom], [TypWydrukuEAD], [MRN], [KontrWywozTermin], [SpecyficzneOkolicznosci], [TerminUrzadWyprowadzenia], [UCZgloszUzupeln], [KodRodzajuTransakcji], [OdprawaScentralizowana], [SkladTowPozaUCKod], [UCPid], [KrajPrzeznaczeniaPid], [UrzadWywozu], [KontrWyprKod], [LiczbaPozycjiNaGranicy], [Telefon], [TerminDostarczeniaZgloszUzupeln], [1aPid], [MiejsceBezKoduPozaUC], [UrzadWywozuPid], [UCKontrolnyKodKraju], [MasaBruttoNaGranicy], [DataWyprowadzenia], [TowarNiebezpiecznyPid], [KodTypOplatTransp], [SkladTowPozaUCBezKodu], [KodWarunkowDostawyPid], [MiejsceKodPozaUC], [Skladowanie], [TerminWysylkiPotwierdzenia], [presentation_goods_co], [KodRodzajuTransakcjiPid], [Id], [Data], [WynikKontroliZWPKod], [WynikKontroliZWPLiczbaZamkniecCelnych], [Wartosc], [KontrWyprStan], [ImieNazwisko], [UrzadWyprowadzeniaZm], [SumaOplat], [CRN], [KontrWywozKod], [UC], [SkladCelnyKod], [TrWewnZnaki], [Tranzyt], [SkladCelnyKodKraju], [TrDeklRodzajPid], [SkladCelnyKodTyp], [UCKontrolnyUlicaNumer], [UCKontrolnyNazwa], [UCKontrolnyKodPocztowy], [UCPrzedstawienia], [DataPrzyjeciaNaEwid], [OplatyTransportoweNaGranicy], [KontrWyprKodPid], [PrzekroczenieLimitowNCTS2], [KrajWysylki], [Stanowisko], [KodWalutyPid], [UrzadWyprowadzenia], [TrDeklKrajPid], [KontrWywozKodPid], [SpecyficzneOkolicznosciPid], [OplatyTransportoweNaGranicyKomentarz], [CRNNaGranicy], [KodTypOplatTranspPid], [CRNNaGranicyKomentarz], [FlagaZgloszUzupeln], [KodWaluty], [1bPid], [ProceduraUproszczona], [KodMiejscaDostawyPid], [TrDeklRodzaj], [Miejsce], [UrzadWyprowadzeniaZmPid], [TrWewnZnakiNaGranicyKom], [TowarNiebezpieczny], [DataZwolnienia], [KodWarunkowDostawy], [TerminAutomatycznegoPrzyjęcia], [TrWewnRodzajPid], [KrajWysylkiPid], [Kontenery], [1b], [KrajPrzeznaczenia], [1a], [KodMiejscaDostawy], [MiejsceDostawy], [KursWaluty], [UrzadWyprowadzeniaPid], [Status] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Trasa]'
BEGIN
MERGE INTO [aes2].[ZWU_Trasa] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Trasa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokZWU]=src.[IdDokZWU],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid]

WHEN NOT MATCHED
THEN INSERT (
[IdDokZWU], [Id], [Kraj], [KrajPid] )
VALUES ([IdDokZWU], [Id], [Kraj], [KrajPid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_Kontener]'
BEGIN
MERGE INTO [aes2].[ZUZ_Kontener] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_Kontener]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[NrKonteneraWUzupln]=src.[NrKonteneraWUzupln],
tgt.[NrKontenera]=src.[NrKontenera]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZUZ], [Id], [NrKontenera], [NrKonteneraWUzupln] )
VALUES ([IdTowarZUZ], [Id], [NrKontenera], [NrKonteneraWUzupln] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_DokumentPoprzedni]'
BEGIN
MERGE INTO [aes2].[ZUZ_DokumentPoprzedni] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_DokumentPoprzedni]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[NrDokPoprz]=src.[NrDokPoprz],
tgt.[KodDokPoprzWUzuplnPid]=src.[KodDokPoprzWUzuplnPid],
tgt.[KodDokPoprzWUzupln]=src.[KodDokPoprzWUzupln],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[KodDokPoprz]=src.[KodDokPoprz],
tgt.[KodDokPoprzPid]=src.[KodDokPoprzPid],
tgt.[NrDokPoprzWUzupln]=src.[NrDokPoprzWUzupln]

WHEN NOT MATCHED
THEN INSERT (
[NrDokPoprz], [KodDokPoprzWUzuplnPid], [KodDokPoprzWUzupln], [IdTowarZUZ], [KodDokPoprz], [KodDokPoprzPid], [Id], [NrDokPoprzWUzupln] )
VALUES ([NrDokPoprz], [KodDokPoprzWUzuplnPid], [KodDokPoprzWUzupln], [IdTowarZUZ], [KodDokPoprz], [KodDokPoprzPid], [Id], [NrDokPoprzWUzupln] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_SrodkiTaryfowe]'
BEGIN
MERGE INTO [aes2].[ZUZ_SrodkiTaryfowe] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_SrodkiTaryfowe]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[NumerPorzadkowySrodka]=src.[NumerPorzadkowySrodka],
tgt.[KodUzupJM]=src.[KodUzupJM],
tgt.[IdSrodkaTaryfowegoWUzupln]=src.[IdSrodkaTaryfowegoWUzupln],
tgt.[KodObszaruSrodka]=src.[KodObszaruSrodka],
tgt.[KodUzupJMWUzupln]=src.[KodUzupJMWUzupln],
tgt.[IdSrodkaTaryfowego]=src.[IdSrodkaTaryfowego],
tgt.[KodObszaruSrodkaWUzupln]=src.[KodObszaruSrodkaWUzupln],
tgt.[SeriaSrodkaTaryfowegoWUzupln]=src.[SeriaSrodkaTaryfowegoWUzupln],
tgt.[TypSrodkaWUzupln]=src.[TypSrodkaWUzupln],
tgt.[NumerPorzadkowySrodkaWUzupln]=src.[NumerPorzadkowySrodkaWUzupln],
tgt.[KwalifikatorUzupJMWUzupln]=src.[KwalifikatorUzupJMWUzupln],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[KwalifikatorUzupJM]=src.[KwalifikatorUzupJM],
tgt.[SeriaSrodkaTaryfowego]=src.[SeriaSrodkaTaryfowego],
tgt.[TypSrodka]=src.[TypSrodka]

WHEN NOT MATCHED
THEN INSERT (
[NumerPorzadkowySrodka], [KodUzupJM], [IdSrodkaTaryfowegoWUzupln], [KodObszaruSrodka], [KodUzupJMWUzupln], [IdSrodkaTaryfowego], [KodObszaruSrodkaWUzupln], [SeriaSrodkaTaryfowegoWUzupln], [Id], [TypSrodkaWUzupln], [NumerPorzadkowySrodkaWUzupln], [KwalifikatorUzupJMWUzupln], [IdTowarZUZ], [KwalifikatorUzupJM], [SeriaSrodkaTaryfowego], [TypSrodka] )
VALUES ([NumerPorzadkowySrodka], [KodUzupJM], [IdSrodkaTaryfowegoWUzupln], [KodObszaruSrodka], [KodUzupJMWUzupln], [IdSrodkaTaryfowego], [KodObszaruSrodkaWUzupln], [SeriaSrodkaTaryfowegoWUzupln], [Id], [TypSrodkaWUzupln], [NumerPorzadkowySrodkaWUzupln], [KwalifikatorUzupJMWUzupln], [IdTowarZUZ], [KwalifikatorUzupJM], [SeriaSrodkaTaryfowego], [TypSrodka] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_InformacjaDodatkowa]'
BEGIN
MERGE INTO [aes2].[ZWA_InformacjaDodatkowa] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_InformacjaDodatkowa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZWA]=src.[IdTowarZWA],
tgt.[KodJezykaInfDod]=src.[KodJezykaInfDod],
tgt.[KodInfDod]=src.[KodInfDod],
tgt.[TekstInfDod]=src.[TekstInfDod]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZWA], [KodJezykaInfDod], [KodInfDod], [Id], [TekstInfDod] )
VALUES ([IdTowarZWA], [KodJezykaInfDod], [KodInfDod], [Id], [TekstInfDod] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_Komentarz]'
BEGIN
MERGE INTO [aes2].[ZWP_Komentarz] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_Komentarz]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokZWP]=src.[IdDokZWP],
tgt.[Komentarz]=src.[Komentarz]

WHEN NOT MATCHED
THEN INSERT (
[IdDokZWP], [Id], [Komentarz] )
VALUES ([IdDokZWP], [Id], [Komentarz] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_Trasa]'
BEGIN
MERGE INTO [aes2].[ZWP_Trasa] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_Trasa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokZWP]=src.[IdDokZWP],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid]

WHEN NOT MATCHED
THEN INSERT (
[IdDokZWP], [Id], [Kraj], [KrajPid] )
VALUES ([IdDokZWP], [Id], [Kraj], [KrajPid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_Kontener]'
BEGIN
MERGE INTO [aes2].[ZWA_Kontener] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_Kontener]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZWA]=src.[IdTowarZWA],
tgt.[StanKontenera]=src.[StanKontenera],
tgt.[NrKontenera]=src.[NrKontenera]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZWA], [StanKontenera], [Id], [NrKontenera] )
VALUES ([IdTowarZWA], [StanKontenera], [Id], [NrKontenera] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_DokumentPoprzedni]'
BEGIN
MERGE INTO [aes2].[ZWP_DokumentPoprzedni] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_DokumentPoprzedni]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZWP]=src.[IdTowarZWP],
tgt.[NrDokPoprz]=src.[NrDokPoprz],
tgt.[KodDokPoprz]=src.[KodDokPoprz],
tgt.[KodDokPoprzPid]=src.[KodDokPoprzPid]

WHEN NOT MATCHED
THEN INSERT (
[KodDokPoprz], [IdTowarZWP], [NrDokPoprz], [KodDokPoprzPid], [Id] )
VALUES ([KodDokPoprz], [IdTowarZWP], [NrDokPoprz], [KodDokPoprzPid], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_Opakowanie]'
BEGIN
MERGE INTO [aes2].[ZWP_Opakowanie] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_Opakowanie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[RodzajOpakowanPid]=src.[RodzajOpakowanPid],
tgt.[IdTowarZWP]=src.[IdTowarZWP],
tgt.[LiczbaSztuk]=src.[LiczbaSztuk],
tgt.[RodzajOpakowan]=src.[RodzajOpakowan],
tgt.[StanOpakowanNaGranicy]=src.[StanOpakowanNaGranicy],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[ZnakiOpakowan]=src.[ZnakiOpakowan]

WHEN NOT MATCHED
THEN INSERT (
[RodzajOpakowanPid], [IdTowarZWP], [LiczbaSztuk], [RodzajOpakowan], [StanOpakowanNaGranicy], [Id], [LiczbaOpakowan], [ZnakiOpakowan] )
VALUES ([RodzajOpakowanPid], [IdTowarZWP], [LiczbaSztuk], [RodzajOpakowan], [StanOpakowanNaGranicy], [Id], [LiczbaOpakowan], [ZnakiOpakowan] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_Dokument]'
BEGIN
MERGE INTO [aes2].[ZWA_Dokument] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[UrzadWyprowadzeniaDekl]=src.[UrzadWyprowadzeniaDekl],
tgt.[Tranzyt]=src.[Tranzyt],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[PrzedstTowPozaUCKodPid]=src.[PrzedstTowPozaUCKodPid],
tgt.[KodWynikuKontroliPrzedTranzyt]=src.[KodWynikuKontroliPrzedTranzyt],
tgt.[LiczbaOpakowanNaGranicy]=src.[LiczbaOpakowanNaGranicy],
tgt.[PrzedstTowUC]=src.[PrzedstTowUC],
tgt.[LiczbaPozycjiNaGranicyKom]=src.[LiczbaPozycjiNaGranicyKom],
tgt.[ZamkCelneLiczba]=src.[ZamkCelneLiczba],
tgt.[LiczbaPozycji]=src.[LiczbaPozycji],
tgt.[CRNRozbieznoscKom]=src.[CRNRozbieznoscKom],
tgt.[PrzedstTowPozaUCKod]=src.[PrzedstTowPozaUCKod],
tgt.[PrzekroczenieLimitowNCTS2]=src.[PrzekroczenieLimitowNCTS2],
tgt.[KrajWysylki]=src.[KrajWysylki],
tgt.[DataPowiadomienia]=src.[DataPowiadomienia],
tgt.[MasaBruttoNaGranicyKom]=src.[MasaBruttoNaGranicyKom],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[NrWlasny]=src.[NrWlasny],
tgt.[UrzadWyprowadzeniaDeklPid]=src.[UrzadWyprowadzeniaDeklPid],
tgt.[UrzadWyprowadzenia]=src.[UrzadWyprowadzenia],
tgt.[DataPrzyjecia]=src.[DataPrzyjecia],
tgt.[EmailZwrotny]=src.[EmailZwrotny],
tgt.[DataWyslania]=src.[DataWyslania],
tgt.[DataZatrzymania]=src.[DataZatrzymania],
tgt.[ZnakiSrodkaPrzewozNaGranicy]=src.[ZnakiSrodkaPrzewozNaGranicy],
tgt.[SpecyficzneOkolicznosciPid]=src.[SpecyficzneOkolicznosciPid],
tgt.[LiczbaOpakowanNaGranicyKom]=src.[LiczbaOpakowanNaGranicyKom],
tgt.[MRN]=src.[MRN],
tgt.[SpecyficzneOkolicznosci]=src.[SpecyficzneOkolicznosci],
tgt.[KodTypOplatTranspPid]=src.[KodTypOplatTranspPid],
tgt.[SkladTowPozaUCKod]=src.[SkladTowPozaUCKod],
tgt.[TerminWysylkiKontr]=src.[TerminWysylkiKontr],
tgt.[DataPrzedstawienia]=src.[DataPrzedstawienia],
tgt.[FaktycznaDataPrzedstawienia]=src.[FaktycznaDataPrzedstawienia],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[ZnakiSrodkaPrzewozNaGranicyKom]=src.[ZnakiSrodkaPrzewozNaGranicyKom],
tgt.[Miejsce]=src.[Miejsce],
tgt.[UrzadWywozu]=src.[UrzadWywozu],
tgt.[UrzadWyprowadzeniaZmPid]=src.[UrzadWyprowadzeniaZmPid],
tgt.[LiczbaPozycjiNaGranicy]=src.[LiczbaPozycjiNaGranicy],
tgt.[CzyECS]=src.[CzyECS],
tgt.[1aPid]=src.[1aPid],
tgt.[UrzadWywozuPid]=src.[UrzadWywozuPid],
tgt.[DataZwolnienia]=src.[DataZwolnienia],
tgt.[KodWynikuKontroliPrzedTranzytPid]=src.[KodWynikuKontroliPrzedTranzytPid],
tgt.[KontrolaWywozKodPid]=src.[KontrolaWywozKodPid],
tgt.[KrajWysylkiPid]=src.[KrajWysylkiPid],
tgt.[KodEAD]=src.[KodEAD],
tgt.[MasaBruttoNaGranicy]=src.[MasaBruttoNaGranicy],
tgt.[Kontenery]=src.[Kontenery],
tgt.[KodTypOplatTransp]=src.[KodTypOplatTransp],
tgt.[SkladTowPozaUCBezKodu]=src.[SkladTowPozaUCBezKodu],
tgt.[KontrolaWyprKodPid]=src.[KontrolaWyprKodPid],
tgt.[Skladowanie]=src.[Skladowanie],
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[KodTypOplatTranspRozbieznoscKom]=src.[KodTypOplatTranspRozbieznoscKom],
tgt.[KontrolaWyprKod]=src.[KontrolaWyprKod],
tgt.[KontrolaWywozKod]=src.[KontrolaWywozKod],
tgt.[TerminUrzadWypr]=src.[TerminUrzadWypr],
tgt.[PrzedstTowUCPid]=src.[PrzedstTowUCPid],
tgt.[ZnakiSrodkaPrzewoz]=src.[ZnakiSrodkaPrzewoz],
tgt.[Data]=src.[Data],
tgt.[DataZwolnienia2]=src.[DataZwolnienia2],
tgt.[PrzedstTowPozaUCBezKodu]=src.[PrzedstTowPozaUCBezKodu],
tgt.[CRNRozbieznosc]=src.[CRNRozbieznosc],
tgt.[UrzadWyprowadzeniaZm]=src.[UrzadWyprowadzeniaZm],
tgt.[1a]=src.[1a],
tgt.[KontrolaWyprStan]=src.[KontrolaWyprStan],
tgt.[KodEADPid]=src.[KodEADPid],
tgt.[CRN]=src.[CRN],
tgt.[KodTypOplatTranspRozbieznosc]=src.[KodTypOplatTranspRozbieznosc],
tgt.[UrzadWyprowadzeniaPid]=src.[UrzadWyprowadzeniaPid],
tgt.[Status]=src.[Status]

WHEN NOT MATCHED
THEN INSERT (
[UrzadWyprowadzeniaDekl], [Tranzyt], [MasaBrutto], [PrzedstTowPozaUCKodPid], [KodWynikuKontroliPrzedTranzyt], [LiczbaOpakowanNaGranicy], [PrzedstTowUC], [LiczbaPozycjiNaGranicyKom], [ZamkCelneLiczba], [LiczbaPozycji], [CRNRozbieznoscKom], [PrzedstTowPozaUCKod], [PrzekroczenieLimitowNCTS2], [KrajWysylki], [DataPowiadomienia], [MasaBruttoNaGranicyKom], [LiczbaOpakowan], [NrWlasny], [UrzadWyprowadzeniaDeklPid], [UrzadWyprowadzenia], [DataPrzyjecia], [EmailZwrotny], [DataWyslania], [DataZatrzymania], [ZnakiSrodkaPrzewozNaGranicy], [SpecyficzneOkolicznosciPid], [LiczbaOpakowanNaGranicyKom], [MRN], [SpecyficzneOkolicznosci], [KodTypOplatTranspPid], [SkladTowPozaUCKod], [TerminWysylkiKontr], [DataPrzedstawienia], [FaktycznaDataPrzedstawienia], [KrajPrzeznaczeniaPid], [ZnakiSrodkaPrzewozNaGranicyKom], [Miejsce], [UrzadWywozu], [UrzadWyprowadzeniaZmPid], [LiczbaPozycjiNaGranicy], [CzyECS], [1aPid], [UrzadWywozuPid], [DataZwolnienia], [KodWynikuKontroliPrzedTranzytPid], [KontrolaWywozKodPid], [KrajWysylkiPid], [KodEAD], [MasaBruttoNaGranicy], [Kontenery], [KodTypOplatTransp], [SkladTowPozaUCBezKodu], [KontrolaWyprKodPid], [Skladowanie], [KrajPrzeznaczenia], [KodTypOplatTranspRozbieznoscKom], [KontrolaWyprKod], [KontrolaWywozKod], [TerminUrzadWypr], [PrzedstTowUCPid], [ZnakiSrodkaPrzewoz], [Id], [Data], [DataZwolnienia2], [PrzedstTowPozaUCBezKodu], [CRNRozbieznosc], [UrzadWyprowadzeniaZm], [1a], [KontrolaWyprStan], [KodEADPid], [CRN], [KodTypOplatTranspRozbieznosc], [UrzadWyprowadzeniaPid], [Status] )
VALUES ([UrzadWyprowadzeniaDekl], [Tranzyt], [MasaBrutto], [PrzedstTowPozaUCKodPid], [KodWynikuKontroliPrzedTranzyt], [LiczbaOpakowanNaGranicy], [PrzedstTowUC], [LiczbaPozycjiNaGranicyKom], [ZamkCelneLiczba], [LiczbaPozycji], [CRNRozbieznoscKom], [PrzedstTowPozaUCKod], [PrzekroczenieLimitowNCTS2], [KrajWysylki], [DataPowiadomienia], [MasaBruttoNaGranicyKom], [LiczbaOpakowan], [NrWlasny], [UrzadWyprowadzeniaDeklPid], [UrzadWyprowadzenia], [DataPrzyjecia], [EmailZwrotny], [DataWyslania], [DataZatrzymania], [ZnakiSrodkaPrzewozNaGranicy], [SpecyficzneOkolicznosciPid], [LiczbaOpakowanNaGranicyKom], [MRN], [SpecyficzneOkolicznosci], [KodTypOplatTranspPid], [SkladTowPozaUCKod], [TerminWysylkiKontr], [DataPrzedstawienia], [FaktycznaDataPrzedstawienia], [KrajPrzeznaczeniaPid], [ZnakiSrodkaPrzewozNaGranicyKom], [Miejsce], [UrzadWywozu], [UrzadWyprowadzeniaZmPid], [LiczbaPozycjiNaGranicy], [CzyECS], [1aPid], [UrzadWywozuPid], [DataZwolnienia], [KodWynikuKontroliPrzedTranzytPid], [KontrolaWywozKodPid], [KrajWysylkiPid], [KodEAD], [MasaBruttoNaGranicy], [Kontenery], [KodTypOplatTransp], [SkladTowPozaUCBezKodu], [KontrolaWyprKodPid], [Skladowanie], [KrajPrzeznaczenia], [KodTypOplatTranspRozbieznoscKom], [KontrolaWyprKod], [KontrolaWywozKod], [TerminUrzadWypr], [PrzedstTowUCPid], [ZnakiSrodkaPrzewoz], [Id], [Data], [DataZwolnienia2], [PrzedstTowPozaUCBezKodu], [CRNRozbieznosc], [UrzadWyprowadzeniaZm], [1a], [KontrolaWyprStan], [KodEADPid], [CRN], [KodTypOplatTranspRozbieznosc], [UrzadWyprowadzeniaPid], [Status] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_KodDodatkowyUEWUzupln]'
BEGIN
MERGE INTO [aes2].[ZUZ_KodDodatkowyUEWUzupln] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_KodDodatkowyUEWUzupln]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodUEPid]=src.[KodUEPid],
tgt.[KodUE]=src.[KodUE],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ]

WHEN NOT MATCHED
THEN INSERT (
[KodUEPid], [KodUE], [IdTowarZUZ], [Id] )
VALUES ([KodUEPid], [KodUE], [IdTowarZUZ], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_Podmiot]'
BEGIN
MERGE INTO [aes2].[ZWA_Podmiot] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_Podmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[KrajPid]=src.[KrajPid],
tgt.[TIN]=src.[TIN],
tgt.[IdDokZWA]=src.[IdDokZWA],
tgt.[EORI]=src.[EORI],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [TIN], [IdDokZWA], [EORI], [RodzPodmiotu], [Email] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [TIN], [IdDokZWA], [EORI], [RodzPodmiotu], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWA_Towar]'
BEGIN
MERGE INTO [aes2].[DWA_Towar] as tgt
USING [WA_StageHurtownia].[aes2].[DWA_Towar]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodTowarowy]=src.[KodTowarowy],
tgt.[KodTowarowyPid]=src.[KodTowarowyPid],
tgt.[KodTowarowyNaGranicy]=src.[KodTowarowyNaGranicy],
tgt.[TowNiebezpNaGranicy]=src.[TowNiebezpNaGranicy],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[OplTransp]=src.[OplTransp],
tgt.[StanTowaruNaGranicy]=src.[StanTowaruNaGranicy],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[OplTranspNaGranicy]=src.[OplTranspNaGranicy],
tgt.[CRNNaGranicy]=src.[CRNNaGranicy],
tgt.[TowNiebezpPid]=src.[TowNiebezpPid],
tgt.[TowNiebezp]=src.[TowNiebezp],
tgt.[OpisTowaru]=src.[OpisTowaru],
tgt.[OplTranspPid]=src.[OplTranspPid],
tgt.[IdDokDWA]=src.[IdDokDWA],
tgt.[MasaBruttoNaGranicy]=src.[MasaBruttoNaGranicy],
tgt.[TowNiebezpNaGranicyPid]=src.[TowNiebezpNaGranicyPid],
tgt.[OplTranspNaGranicyPid]=src.[OplTranspNaGranicyPid],
tgt.[CRN]=src.[CRN],
tgt.[OpisTowaruNaGranicy]=src.[OpisTowaruNaGranicy],
tgt.[KodTowarowyNaGranicyPid]=src.[KodTowarowyNaGranicyPid]

WHEN NOT MATCHED
THEN INSERT (
[KodTowarowy], [KodTowarowyPid], [KodTowarowyNaGranicy], [TowNiebezpNaGranicy], [NrPozycji], [OplTransp], [StanTowaruNaGranicy], [MasaBrutto], [OplTranspNaGranicy], [CRNNaGranicy], [TowNiebezpPid], [TowNiebezp], [OpisTowaru], [Id], [OplTranspPid], [IdDokDWA], [MasaBruttoNaGranicy], [TowNiebezpNaGranicyPid], [OplTranspNaGranicyPid], [CRN], [OpisTowaruNaGranicy], [KodTowarowyNaGranicyPid] )
VALUES ([KodTowarowy], [KodTowarowyPid], [KodTowarowyNaGranicy], [TowNiebezpNaGranicy], [NrPozycji], [OplTransp], [StanTowaruNaGranicy], [MasaBrutto], [OplTranspNaGranicy], [CRNNaGranicy], [TowNiebezpPid], [TowNiebezp], [OpisTowaru], [Id], [OplTranspPid], [IdDokDWA], [MasaBruttoNaGranicy], [TowNiebezpNaGranicyPid], [OplTranspNaGranicyPid], [CRN], [OpisTowaruNaGranicy], [KodTowarowyNaGranicyPid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_TowarKomentarz]'
BEGIN
MERGE INTO [aes2].[ZWA_TowarKomentarz] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_TowarKomentarz]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZWA]=src.[IdTowarZWA],
tgt.[Komentarz]=src.[Komentarz]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZWA], [Id], [Komentarz] )
VALUES ([IdTowarZWA], [Id], [Komentarz] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_DokumentPoprzedni]'
BEGIN
MERGE INTO [aes2].[ZWA_DokumentPoprzedni] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_DokumentPoprzedni]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZWA]=src.[IdTowarZWA],
tgt.[NrDokPoprz]=src.[NrDokPoprz],
tgt.[KodDokPoprz]=src.[KodDokPoprz],
tgt.[KodDokPoprzPid]=src.[KodDokPoprzPid]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZWA], [KodDokPoprz], [NrDokPoprz], [KodDokPoprzPid], [Id] )
VALUES ([IdTowarZWA], [KodDokPoprz], [NrDokPoprz], [KodDokPoprzPid], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Opakowanie]'
BEGIN
MERGE INTO [aes2].[ZWU_Opakowanie] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Opakowanie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[RodzajOpakowanPid]=src.[RodzajOpakowanPid],
tgt.[LiczbaSztuk]=src.[LiczbaSztuk],
tgt.[RodzajOpakowan]=src.[RodzajOpakowan],
tgt.[StanOpakowanNaGranicy]=src.[StanOpakowanNaGranicy],
tgt.[IdTowarZWU]=src.[IdTowarZWU],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[ZnakiOpakowan]=src.[ZnakiOpakowan]

WHEN NOT MATCHED
THEN INSERT (
[RodzajOpakowanPid], [LiczbaSztuk], [RodzajOpakowan], [StanOpakowanNaGranicy], [IdTowarZWU], [Id], [LiczbaOpakowan], [ZnakiOpakowan] )
VALUES ([RodzajOpakowanPid], [LiczbaSztuk], [RodzajOpakowan], [StanOpakowanNaGranicy], [IdTowarZWU], [Id], [LiczbaOpakowan], [ZnakiOpakowan] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_Zglaszajacy]'
BEGIN
MERGE INTO [aes2].[ZUZ_Zglaszajacy] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_Zglaszajacy]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[WskaznikEksportera]=src.[WskaznikEksportera],
tgt.[PrzedstawicielstwoPid]=src.[PrzedstawicielstwoPid],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[Przedstawicielstwo]=src.[Przedstawicielstwo],
tgt.[NrWpisuNaListe]=src.[NrWpisuNaListe],
tgt.[TIN]=src.[TIN],
tgt.[REGON]=src.[REGON],
tgt.[DataWpisuNaListe]=src.[DataWpisuNaListe],
tgt.[EORI]=src.[EORI],
tgt.[IdDokZUZ]=src.[IdDokZUZ],
tgt.[WskaznikEksporteraPid]=src.[WskaznikEksporteraPid],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [WskaznikEksportera], [PrzedstawicielstwoPid], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [KrajPid], [UlicaNumer], [Przedstawicielstwo], [NrWpisuNaListe], [TIN], [REGON], [DataWpisuNaListe], [EORI], [IdDokZUZ], [WskaznikEksporteraPid], [Email] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [WskaznikEksportera], [PrzedstawicielstwoPid], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [KrajPid], [UlicaNumer], [Przedstawicielstwo], [NrWpisuNaListe], [TIN], [REGON], [DataWpisuNaListe], [EORI], [IdDokZUZ], [WskaznikEksporteraPid], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_Opakowanie]'
BEGIN
MERGE INTO [aes2].[ZWA_Opakowanie] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_Opakowanie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZWA]=src.[IdTowarZWA],
tgt.[RodzajOpakowanPid]=src.[RodzajOpakowanPid],
tgt.[LiczbaSztuk]=src.[LiczbaSztuk],
tgt.[RodzajOpakowan]=src.[RodzajOpakowan],
tgt.[StanOpakowanNaGranicy]=src.[StanOpakowanNaGranicy],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[ZnakiOpakowan]=src.[ZnakiOpakowan]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZWA], [RodzajOpakowanPid], [LiczbaSztuk], [RodzajOpakowan], [StanOpakowanNaGranicy], [Id], [LiczbaOpakowan], [ZnakiOpakowan] )
VALUES ([IdTowarZWA], [RodzajOpakowanPid], [LiczbaSztuk], [RodzajOpakowan], [StanOpakowanNaGranicy], [Id], [LiczbaOpakowan], [ZnakiOpakowan] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[MEX_Towar]'
BEGIN
MERGE INTO [aes2].[MEX_Towar] as tgt
USING [WA_StageHurtownia].[aes2].[MEX_Towar]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodTowarowy]=src.[KodTowarowy],
tgt.[KodTowarowyPid]=src.[KodTowarowyPid],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[OpakowanieZnaki]=src.[OpakowanieZnaki],
tgt.[IdDokMEX]=src.[IdDokMEX],
tgt.[OpakowanieRodzajPid]=src.[OpakowanieRodzajPid],
tgt.[OpisTowaru]=src.[OpisTowaru],
tgt.[OpakowanieLiczba]=src.[OpakowanieLiczba],
tgt.[OpakowanieLiczbaSztuk]=src.[OpakowanieLiczbaSztuk],
tgt.[OpakowanieRodzaj]=src.[OpakowanieRodzaj],
tgt.[NrDokPrzewozowego]=src.[NrDokPrzewozowego]

WHEN NOT MATCHED
THEN INSERT (
[KodTowarowy], [KodTowarowyPid], [NrPozycji], [MasaBrutto], [OpakowanieZnaki], [IdDokMEX], [OpakowanieRodzajPid], [OpisTowaru], [Id], [OpakowanieLiczba], [OpakowanieLiczbaSztuk], [OpakowanieRodzaj], [NrDokPrzewozowego] )
VALUES ([KodTowarowy], [KodTowarowyPid], [NrPozycji], [MasaBrutto], [OpakowanieZnaki], [IdDokMEX], [OpakowanieRodzajPid], [OpisTowaru], [Id], [OpakowanieLiczba], [OpakowanieLiczbaSztuk], [OpakowanieRodzaj], [NrDokPrzewozowego] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Zglaszajacy]'
BEGIN
MERGE INTO [aes2].[ZWU_Zglaszajacy] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Zglaszajacy]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[WskaznikEksportera]=src.[WskaznikEksportera],
tgt.[PrzedstawicielstwoPid]=src.[PrzedstawicielstwoPid],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[KrajPid]=src.[KrajPid],
tgt.[Przedstawicielstwo]=src.[Przedstawicielstwo],
tgt.[NrWpisuNaListe]=src.[NrWpisuNaListe],
tgt.[TIN]=src.[TIN],
tgt.[REGON]=src.[REGON],
tgt.[DataWpisuNaListe]=src.[DataWpisuNaListe],
tgt.[IdDokZWU]=src.[IdDokZWU],
tgt.[EORI]=src.[EORI],
tgt.[WskaznikEksporteraPid]=src.[WskaznikEksporteraPid],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [WskaznikEksportera], [PrzedstawicielstwoPid], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [Przedstawicielstwo], [NrWpisuNaListe], [TIN], [REGON], [DataWpisuNaListe], [IdDokZWU], [EORI], [WskaznikEksporteraPid], [Email] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [WskaznikEksportera], [PrzedstawicielstwoPid], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [Przedstawicielstwo], [NrWpisuNaListe], [TIN], [REGON], [DataWpisuNaListe], [IdDokZWU], [EORI], [WskaznikEksporteraPid], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_Kontener]'
BEGIN
MERGE INTO [aes2].[ZWP_Kontener] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_Kontener]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZWP]=src.[IdTowarZWP],
tgt.[StanKontenera]=src.[StanKontenera],
tgt.[NrKontenera]=src.[NrKontenera]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZWP], [StanKontenera], [Id], [NrKontenera] )
VALUES ([IdTowarZWP], [StanKontenera], [Id], [NrKontenera] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_ZamkniecieCelne]'
BEGIN
MERGE INTO [aes2].[ZWU_ZamkniecieCelne] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_ZamkniecieCelne]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[ZnakiZamkniec]=src.[ZnakiZamkniec],
tgt.[IdDokZWU]=src.[IdDokZWU]

WHEN NOT MATCHED
THEN INSERT (
[IdDokZWU], [Id], [ZnakiZamkniec] )
VALUES ([IdDokZWU], [Id], [ZnakiZamkniec] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWA_Dokument]'
BEGIN
MERGE INTO [aes2].[DWA_Dokument] as tgt
USING [WA_StageHurtownia].[aes2].[DWA_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[UrzadZlozeniaPid]=src.[UrzadZlozeniaPid],
tgt.[DataRejestracji]=src.[DataRejestracji],
tgt.[Miejsce]=src.[Miejsce],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[PrzedstTowPozaUCKodPid]=src.[PrzedstTowPozaUCKodPid],
tgt.[UrzadWyprowadzeniaZmPid]=src.[UrzadWyprowadzeniaZmPid],
tgt.[LiczbaPozycjiNaGranicy]=src.[LiczbaPozycjiNaGranicy],
tgt.[LiczbaOpakowanNaGranicy]=src.[LiczbaOpakowanNaGranicy],
tgt.[PrzedstTowUC]=src.[PrzedstTowUC],
tgt.[Telefon]=src.[Telefon],
tgt.[LiczbaPozycjiNaGranicyKom]=src.[LiczbaPozycjiNaGranicyKom],
tgt.[DataZwolnienia]=src.[DataZwolnienia],
tgt.[LiczbaPozycji]=src.[LiczbaPozycji],
tgt.[TerminAutomPrzyjZgloszenia]=src.[TerminAutomPrzyjZgloszenia],
tgt.[KontrolaWywozKodPid]=src.[KontrolaWywozKodPid],
tgt.[MasaBruttoNaGranicy]=src.[MasaBruttoNaGranicy],
tgt.[DataWyprowadzenia]=src.[DataWyprowadzenia],
tgt.[PrzedstTowPozaUCKod]=src.[PrzedstTowPozaUCKod],
tgt.[TerminNaDecyzjeOZwolnieniu]=src.[TerminNaDecyzjeOZwolnieniu],
tgt.[DataPowiadomienia]=src.[DataPowiadomienia],
tgt.[MasaBruttoNaGranicyKom]=src.[MasaBruttoNaGranicyKom],
tgt.[KodTypOplatTransp]=src.[KodTypOplatTransp],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[NrWlasny]=src.[NrWlasny],
tgt.[Skladowanie]=src.[Skladowanie],
tgt.[UrzadWyprowadzenia]=src.[UrzadWyprowadzenia],
tgt.[DataPrzyjecia]=src.[DataPrzyjecia],
tgt.[EmailZwrotny]=src.[EmailZwrotny],
tgt.[UrządCelnyWyprowadzenia]=src.[UrządCelnyWyprowadzenia],
tgt.[PodpisElektroniczny]=src.[PodpisElektroniczny],
tgt.[DataZatrzymania]=src.[DataZatrzymania],
tgt.[SpecyficzneOkolicznosciPid]=src.[SpecyficzneOkolicznosciPid],
tgt.[LiczbaOpakowanNaGranicyKom]=src.[LiczbaOpakowanNaGranicyKom],
tgt.[KontrolaWywozKod]=src.[KontrolaWywozKod],
tgt.[PrzedstTowUCPid]=src.[PrzedstTowUCPid],
tgt.[MRN]=src.[MRN],
tgt.[UrzadZlozenia]=src.[UrzadZlozenia],
tgt.[Data]=src.[Data],
tgt.[PrzedstTowPozaUCBezKodu]=src.[PrzedstTowPozaUCBezKodu],
tgt.[SpecyficzneOkolicznosci]=src.[SpecyficzneOkolicznosci],
tgt.[KodTypOplatTranspPid]=src.[KodTypOplatTranspPid],
tgt.[UrzadWyprowadzeniaZm]=src.[UrzadWyprowadzeniaZm],
tgt.[CRN]=src.[CRN],
tgt.[DataPrzedstawienia]=src.[DataPrzedstawienia],
tgt.[UrzadWyprowadzeniaPid]=src.[UrzadWyprowadzeniaPid],
tgt.[DataZgody]=src.[DataZgody],
tgt.[Status]=src.[Status]

WHEN NOT MATCHED
THEN INSERT (
[UrzadZlozeniaPid], [DataRejestracji], [MasaBrutto], [PrzedstTowPozaUCKodPid], [LiczbaOpakowanNaGranicy], [PrzedstTowUC], [LiczbaPozycjiNaGranicyKom], [LiczbaPozycji], [PrzedstTowPozaUCKod], [DataPowiadomienia], [MasaBruttoNaGranicyKom], [LiczbaOpakowan], [NrWlasny], [UrzadWyprowadzenia], [DataPrzyjecia], [EmailZwrotny], [UrządCelnyWyprowadzenia], [PodpisElektroniczny], [DataZatrzymania], [SpecyficzneOkolicznosciPid], [LiczbaOpakowanNaGranicyKom], [MRN], [SpecyficzneOkolicznosci], [KodTypOplatTranspPid], [DataPrzedstawienia], [DataZgody], [Miejsce], [UrzadWyprowadzeniaZmPid], [LiczbaPozycjiNaGranicy], [Telefon], [DataZwolnienia], [TerminAutomPrzyjZgloszenia], [KontrolaWywozKodPid], [MasaBruttoNaGranicy], [DataWyprowadzenia], [TerminNaDecyzjeOZwolnieniu], [KodTypOplatTransp], [Skladowanie], [KontrolaWywozKod], [PrzedstTowUCPid], [UrzadZlozenia], [Id], [Data], [PrzedstTowPozaUCBezKodu], [UrzadWyprowadzeniaZm], [CRN], [UrzadWyprowadzeniaPid], [Status] )
VALUES ([UrzadZlozeniaPid], [DataRejestracji], [MasaBrutto], [PrzedstTowPozaUCKodPid], [LiczbaOpakowanNaGranicy], [PrzedstTowUC], [LiczbaPozycjiNaGranicyKom], [LiczbaPozycji], [PrzedstTowPozaUCKod], [DataPowiadomienia], [MasaBruttoNaGranicyKom], [LiczbaOpakowan], [NrWlasny], [UrzadWyprowadzenia], [DataPrzyjecia], [EmailZwrotny], [UrządCelnyWyprowadzenia], [PodpisElektroniczny], [DataZatrzymania], [SpecyficzneOkolicznosciPid], [LiczbaOpakowanNaGranicyKom], [MRN], [SpecyficzneOkolicznosci], [KodTypOplatTranspPid], [DataPrzedstawienia], [DataZgody], [Miejsce], [UrzadWyprowadzeniaZmPid], [LiczbaPozycjiNaGranicy], [Telefon], [DataZwolnienia], [TerminAutomPrzyjZgloszenia], [KontrolaWywozKodPid], [MasaBruttoNaGranicy], [DataWyprowadzenia], [TerminNaDecyzjeOZwolnieniu], [KodTypOplatTransp], [Skladowanie], [KontrolaWywozKod], [PrzedstTowUCPid], [UrzadZlozenia], [Id], [Data], [PrzedstTowPozaUCBezKodu], [UrzadWyprowadzeniaZm], [CRN], [UrzadWyprowadzeniaPid], [Status] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_ZamkniecieCelne]'
BEGIN
MERGE INTO [aes2].[QUERY_ZamkniecieCelne] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_ZamkniecieCelne]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokQUERY]=src.[IdDokQUERY],
tgt.[ZnakiZamkniec]=src.[ZnakiZamkniec],
tgt.[KodJezykaZnakowZamkniec]=src.[KodJezykaZnakowZamkniec]

WHEN NOT MATCHED
THEN INSERT (
[IdDokQUERY], [Id], [ZnakiZamkniec], [KodJezykaZnakowZamkniec] )
VALUES ([IdDokQUERY], [Id], [ZnakiZamkniec], [KodJezykaZnakowZamkniec] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_TowarKomentarz]'
BEGIN
MERGE INTO [aes2].[ZWP_TowarKomentarz] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_TowarKomentarz]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZWP]=src.[IdTowarZWP],
tgt.[Komentarz]=src.[Komentarz]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZWP], [Id], [Komentarz] )
VALUES ([IdTowarZWP], [Id], [Komentarz] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_DokumentPoprzedni]'
BEGIN
MERGE INTO [aes2].[QUERY_DokumentPoprzedni] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_DokumentPoprzedni]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodJezykaDokPoprz]=src.[KodJezykaDokPoprz],
tgt.[NrDokPoprz]=src.[NrDokPoprz],
tgt.[IdTowarQUERY]=src.[IdTowarQUERY],
tgt.[KodDokPoprz]=src.[KodDokPoprz],
tgt.[KodDokPoprzPid]=src.[KodDokPoprzPid]

WHEN NOT MATCHED
THEN INSERT (
[KodJezykaDokPoprz], [NrDokPoprz], [IdTowarQUERY], [KodDokPoprz], [KodDokPoprzPid], [Id] )
VALUES ([KodJezykaDokPoprz], [NrDokPoprz], [IdTowarQUERY], [KodDokPoprz], [KodDokPoprzPid], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWA_TowarPodmiot]'
BEGIN
MERGE INTO [aes2].[DWA_TowarPodmiot] as tgt
USING [WA_StageHurtownia].[aes2].[DWA_TowarPodmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[KrajPid]=src.[KrajPid],
tgt.[IdTowarDWA]=src.[IdTowarDWA],
tgt.[TIN]=src.[TIN],
tgt.[REGON]=src.[REGON],
tgt.[EORI]=src.[EORI],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [IdTowarDWA], [TIN], [REGON], [EORI], [RodzPodmiotu], [Email] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [IdTowarDWA], [TIN], [REGON], [EORI], [RodzPodmiotu], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWA_DokumentWymagany]'
BEGIN
MERGE INTO [aes2].[DWA_DokumentWymagany] as tgt
USING [WA_StageHurtownia].[aes2].[DWA_DokumentWymagany]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarDWA]=src.[IdTowarDWA],
tgt.[StanNaGranicyKom]=src.[StanNaGranicyKom],
tgt.[KodDokZrodl]=src.[KodDokZrodl],
tgt.[StanNaGranicy]=src.[StanNaGranicy],
tgt.[NrDokWym]=src.[NrDokWym]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarDWA], [StanNaGranicyKom], [KodDokZrodl], [StanNaGranicy], [NrDokWym], [Id] )
VALUES ([IdTowarDWA], [StanNaGranicyKom], [KodDokZrodl], [StanNaGranicy], [NrDokWym], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_KodDodatkowyPLWUzupln]'
BEGIN
MERGE INTO [aes2].[ZUZ_KodDodatkowyPLWUzupln] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_KodDodatkowyPLWUzupln]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodPL]=src.[KodPL],
tgt.[KodPLPid]=src.[KodPLPid],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ]

WHEN NOT MATCHED
THEN INSERT (
[KodPL], [KodPLPid], [IdTowarZUZ], [Id] )
VALUES ([KodPL], [KodPLPid], [IdTowarZUZ], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_DokumentWymagany]'
BEGIN
MERGE INTO [aes2].[ZWP_DokumentWymagany] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_DokumentWymagany]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[StanNaGranicyKom]=src.[StanNaGranicyKom],
tgt.[IdTowarZWP]=src.[IdTowarZWP],
tgt.[KodDokWymPid]=src.[KodDokWymPid],
tgt.[Tranzyt]=src.[Tranzyt],
tgt.[StanNaGranicy]=src.[StanNaGranicy],
tgt.[NrDokWym]=src.[NrDokWym],
tgt.[KodDokWym]=src.[KodDokWym]

WHEN NOT MATCHED
THEN INSERT (
[StanNaGranicyKom], [IdTowarZWP], [KodDokWymPid], [Tranzyt], [StanNaGranicy], [NrDokWym], [Id], [KodDokWym] )
VALUES ([StanNaGranicyKom], [IdTowarZWP], [KodDokWymPid], [Tranzyt], [StanNaGranicy], [NrDokWym], [Id], [KodDokWym] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_Dokument]'
BEGIN
MERGE INTO [aes2].[ZWP_Dokument] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[UrzadWyprowadzeniaDekl]=src.[UrzadWyprowadzeniaDekl],
tgt.[Tranzyt]=src.[Tranzyt],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[PrzedstTowPozaUCKodPid]=src.[PrzedstTowPozaUCKodPid],
tgt.[KodWynikuKontroliPrzedTranzyt]=src.[KodWynikuKontroliPrzedTranzyt],
tgt.[LiczbaOpakowanNaGranicy]=src.[LiczbaOpakowanNaGranicy],
tgt.[PrzedstTowUC]=src.[PrzedstTowUC],
tgt.[LiczbaPozycjiNaGranicyKom]=src.[LiczbaPozycjiNaGranicyKom],
tgt.[ZamkCelneLiczba]=src.[ZamkCelneLiczba],
tgt.[LiczbaPozycji]=src.[LiczbaPozycji],
tgt.[CRNRozbieznoscKom]=src.[CRNRozbieznoscKom],
tgt.[PrzedstTowPozaUCKod]=src.[PrzedstTowPozaUCKod],
tgt.[KrajWysylki]=src.[KrajWysylki],
tgt.[DataPowiadomienia]=src.[DataPowiadomienia],
tgt.[MasaBruttoNaGranicyKom]=src.[MasaBruttoNaGranicyKom],
tgt.[NrWlasny]=src.[NrWlasny],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[UrzadWyprowadzeniaDeklPid]=src.[UrzadWyprowadzeniaDeklPid],
tgt.[UrzadWyprowadzenia]=src.[UrzadWyprowadzenia],
tgt.[DataPrzyjecia]=src.[DataPrzyjecia],
tgt.[DataWyslania]=src.[DataWyslania],
tgt.[DataZatrzymania]=src.[DataZatrzymania],
tgt.[ZnakiSrodkaPrzewozNaGranicy]=src.[ZnakiSrodkaPrzewozNaGranicy],
tgt.[SpecyficzneOkolicznosciPid]=src.[SpecyficzneOkolicznosciPid],
tgt.[LiczbaOpakowanNaGranicyKom]=src.[LiczbaOpakowanNaGranicyKom],
tgt.[MRN]=src.[MRN],
tgt.[SpecyficzneOkolicznosci]=src.[SpecyficzneOkolicznosci],
tgt.[KodTypOplatTranspPid]=src.[KodTypOplatTranspPid],
tgt.[SkladTowPozaUCKod]=src.[SkladTowPozaUCKod],
tgt.[TerminWysylkiKontr]=src.[TerminWysylkiKontr],
tgt.[DataPrzedstawienia]=src.[DataPrzedstawienia],
tgt.[FaktycznaDataPrzedstawienia]=src.[FaktycznaDataPrzedstawienia],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[ZnakiSrodkaPrzewozNaGranicyKom]=src.[ZnakiSrodkaPrzewozNaGranicyKom],
tgt.[Miejsce]=src.[Miejsce],
tgt.[UrzadWywozu]=src.[UrzadWywozu],
tgt.[UrzadWyprowadzeniaZmPid]=src.[UrzadWyprowadzeniaZmPid],
tgt.[LiczbaPozycjiNaGranicy]=src.[LiczbaPozycjiNaGranicy],
tgt.[CzyECS]=src.[CzyECS],
tgt.[1aPid]=src.[1aPid],
tgt.[UrzadWywozuPid]=src.[UrzadWywozuPid],
tgt.[DataZwolnienia]=src.[DataZwolnienia],
tgt.[KodWynikuKontroliPrzedTranzytPid]=src.[KodWynikuKontroliPrzedTranzytPid],
tgt.[KontrolaWywozKodPid]=src.[KontrolaWywozKodPid],
tgt.[KrajWysylkiPid]=src.[KrajWysylkiPid],
tgt.[KodEAD]=src.[KodEAD],
tgt.[MasaBruttoNaGranicy]=src.[MasaBruttoNaGranicy],
tgt.[DataWyprowadzenia]=src.[DataWyprowadzenia],
tgt.[Kontenery]=src.[Kontenery],
tgt.[KodTypOplatTransp]=src.[KodTypOplatTransp],
tgt.[SkladTowPozaUCBezKodu]=src.[SkladTowPozaUCBezKodu],
tgt.[KontrolaWyprKodPid]=src.[KontrolaWyprKodPid],
tgt.[Skladowanie]=src.[Skladowanie],
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[KodTypOplatTranspRozbieznoscKom]=src.[KodTypOplatTranspRozbieznoscKom],
tgt.[KontrolaWyprKod]=src.[KontrolaWyprKod],
tgt.[KontrolaWywozKod]=src.[KontrolaWywozKod],
tgt.[TerminUrzadWypr]=src.[TerminUrzadWypr],
tgt.[PrzedstTowUCPid]=src.[PrzedstTowUCPid],
tgt.[ZnakiSrodkaPrzewoz]=src.[ZnakiSrodkaPrzewoz],
tgt.[Data]=src.[Data],
tgt.[PrzedstTowPozaUCBezKodu]=src.[PrzedstTowPozaUCBezKodu],
tgt.[CRNRozbieznosc]=src.[CRNRozbieznosc],
tgt.[UrzadWyprowadzeniaZm]=src.[UrzadWyprowadzeniaZm],
tgt.[1a]=src.[1a],
tgt.[KontrolaWyprStan]=src.[KontrolaWyprStan],
tgt.[KodEADPid]=src.[KodEADPid],
tgt.[CRN]=src.[CRN],
tgt.[KodTypOplatTranspRozbieznosc]=src.[KodTypOplatTranspRozbieznosc],
tgt.[UrzadWyprowadzeniaPid]=src.[UrzadWyprowadzeniaPid],
tgt.[Status]=src.[Status]

WHEN NOT MATCHED
THEN INSERT (
[UrzadWyprowadzeniaDekl], [Tranzyt], [MasaBrutto], [PrzedstTowPozaUCKodPid], [KodWynikuKontroliPrzedTranzyt], [LiczbaOpakowanNaGranicy], [PrzedstTowUC], [LiczbaPozycjiNaGranicyKom], [ZamkCelneLiczba], [LiczbaPozycji], [CRNRozbieznoscKom], [PrzedstTowPozaUCKod], [KrajWysylki], [DataPowiadomienia], [MasaBruttoNaGranicyKom], [NrWlasny], [LiczbaOpakowan], [UrzadWyprowadzeniaDeklPid], [UrzadWyprowadzenia], [DataPrzyjecia], [DataWyslania], [DataZatrzymania], [ZnakiSrodkaPrzewozNaGranicy], [SpecyficzneOkolicznosciPid], [LiczbaOpakowanNaGranicyKom], [MRN], [SpecyficzneOkolicznosci], [KodTypOplatTranspPid], [SkladTowPozaUCKod], [TerminWysylkiKontr], [DataPrzedstawienia], [FaktycznaDataPrzedstawienia], [KrajPrzeznaczeniaPid], [ZnakiSrodkaPrzewozNaGranicyKom], [Miejsce], [UrzadWywozu], [UrzadWyprowadzeniaZmPid], [LiczbaPozycjiNaGranicy], [CzyECS], [1aPid], [UrzadWywozuPid], [DataZwolnienia], [KodWynikuKontroliPrzedTranzytPid], [KontrolaWywozKodPid], [KrajWysylkiPid], [KodEAD], [MasaBruttoNaGranicy], [DataWyprowadzenia], [Kontenery], [KodTypOplatTransp], [SkladTowPozaUCBezKodu], [KontrolaWyprKodPid], [Skladowanie], [KrajPrzeznaczenia], [KodTypOplatTranspRozbieznoscKom], [KontrolaWyprKod], [KontrolaWywozKod], [TerminUrzadWypr], [PrzedstTowUCPid], [ZnakiSrodkaPrzewoz], [Id], [Data], [PrzedstTowPozaUCBezKodu], [CRNRozbieznosc], [UrzadWyprowadzeniaZm], [1a], [KontrolaWyprStan], [KodEADPid], [CRN], [KodTypOplatTranspRozbieznosc], [UrzadWyprowadzeniaPid], [Status] )
VALUES ([UrzadWyprowadzeniaDekl], [Tranzyt], [MasaBrutto], [PrzedstTowPozaUCKodPid], [KodWynikuKontroliPrzedTranzyt], [LiczbaOpakowanNaGranicy], [PrzedstTowUC], [LiczbaPozycjiNaGranicyKom], [ZamkCelneLiczba], [LiczbaPozycji], [CRNRozbieznoscKom], [PrzedstTowPozaUCKod], [KrajWysylki], [DataPowiadomienia], [MasaBruttoNaGranicyKom], [NrWlasny], [LiczbaOpakowan], [UrzadWyprowadzeniaDeklPid], [UrzadWyprowadzenia], [DataPrzyjecia], [DataWyslania], [DataZatrzymania], [ZnakiSrodkaPrzewozNaGranicy], [SpecyficzneOkolicznosciPid], [LiczbaOpakowanNaGranicyKom], [MRN], [SpecyficzneOkolicznosci], [KodTypOplatTranspPid], [SkladTowPozaUCKod], [TerminWysylkiKontr], [DataPrzedstawienia], [FaktycznaDataPrzedstawienia], [KrajPrzeznaczeniaPid], [ZnakiSrodkaPrzewozNaGranicyKom], [Miejsce], [UrzadWywozu], [UrzadWyprowadzeniaZmPid], [LiczbaPozycjiNaGranicy], [CzyECS], [1aPid], [UrzadWywozuPid], [DataZwolnienia], [KodWynikuKontroliPrzedTranzytPid], [KontrolaWywozKodPid], [KrajWysylkiPid], [KodEAD], [MasaBruttoNaGranicy], [DataWyprowadzenia], [Kontenery], [KodTypOplatTransp], [SkladTowPozaUCBezKodu], [KontrolaWyprKodPid], [Skladowanie], [KrajPrzeznaczenia], [KodTypOplatTranspRozbieznoscKom], [KontrolaWyprKod], [KontrolaWywozKod], [TerminUrzadWypr], [PrzedstTowUCPid], [ZnakiSrodkaPrzewoz], [Id], [Data], [PrzedstTowPozaUCBezKodu], [CRNRozbieznosc], [UrzadWyprowadzeniaZm], [1a], [KontrolaWyprStan], [KodEADPid], [CRN], [KodTypOplatTranspRozbieznosc], [UrzadWyprowadzeniaPid], [Status] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_Ilosc]'
BEGIN
MERGE INTO [aes2].[ZUZ_Ilosc] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_Ilosc]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KwalifikatorJm]=src.[KwalifikatorJm],
tgt.[Ilosc]=src.[Ilosc],
tgt.[JmPid]=src.[JmPid],
tgt.[KwalifikatorJmWUzupln]=src.[KwalifikatorJmWUzupln],
tgt.[KwalifikatorJmWUzuplnPid]=src.[KwalifikatorJmWUzuplnPid],
tgt.[Jm]=src.[Jm],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[JmWUzupln]=src.[JmWUzupln],
tgt.[JmWUzuplnPid]=src.[JmWUzuplnPid],
tgt.[KwalifikatorJmPid]=src.[KwalifikatorJmPid],
tgt.[IloscWUzupln]=src.[IloscWUzupln]

WHEN NOT MATCHED
THEN INSERT (
[KwalifikatorJm], [KwalifikatorJmWUzuplnPid], [IloscWUzupln], [Id], [Ilosc], [JmPid], [KwalifikatorJmWUzupln], [Jm], [IdTowarZUZ], [JmWUzupln], [JmWUzuplnPid], [KwalifikatorJmPid] )
VALUES ([KwalifikatorJm], [KwalifikatorJmWUzuplnPid], [IloscWUzupln], [Id], [Ilosc], [JmPid], [KwalifikatorJmWUzupln], [Jm], [IdTowarZUZ], [JmWUzupln], [JmWUzuplnPid], [KwalifikatorJmPid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[TRS_Dokument]'
BEGIN
MERGE INTO [aes2].[TRS_Dokument] as tgt
USING [WA_StageHurtownia].[aes2].[TRS_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Wersja]=src.[Wersja],
tgt.[DataPrzyjeciaZgloszeniaNCTS]=src.[DataPrzyjeciaZgloszeniaNCTS],
tgt.[TypDeklaracjiPrzekazanyPrzezNCTS]=src.[TypDeklaracjiPrzekazanyPrzezNCTS],
tgt.[NumerWlasny]=src.[NumerWlasny],
tgt.[MRN]=src.[MRN],
tgt.[Status]=src.[Status]

WHEN NOT MATCHED
THEN INSERT (
[Wersja], [DataPrzyjeciaZgloszeniaNCTS], [TypDeklaracjiPrzekazanyPrzezNCTS], [NumerWlasny], [MRN], [Id], [Status] )
VALUES ([Wersja], [DataPrzyjeciaZgloszeniaNCTS], [TypDeklaracjiPrzekazanyPrzezNCTS], [NumerWlasny], [MRN], [Id], [Status] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWA_Podmiot]'
BEGIN
MERGE INTO [aes2].[DWA_Podmiot] as tgt
USING [WA_StageHurtownia].[aes2].[DWA_Podmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[WskaznikEksportera]=src.[WskaznikEksportera],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[KrajPid]=src.[KrajPid],
tgt.[Przedstawicielstwo]=src.[Przedstawicielstwo],
tgt.[NrWpisuNaListe]=src.[NrWpisuNaListe],
tgt.[IdDokDWA]=src.[IdDokDWA],
tgt.[TIN]=src.[TIN],
tgt.[REGON]=src.[REGON],
tgt.[DataWpisuNaListe]=src.[DataWpisuNaListe],
tgt.[EORI]=src.[EORI],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [WskaznikEksportera], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [Przedstawicielstwo], [NrWpisuNaListe], [IdDokDWA], [TIN], [REGON], [DataWpisuNaListe], [EORI], [RodzPodmiotu], [Email] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [WskaznikEksportera], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [Przedstawicielstwo], [NrWpisuNaListe], [IdDokDWA], [TIN], [REGON], [DataWpisuNaListe], [EORI], [RodzPodmiotu], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWU_Opakowanie]'
BEGIN
MERGE INTO [aes2].[DWU_Opakowanie] as tgt
USING [WA_StageHurtownia].[aes2].[DWU_Opakowanie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[RodzajOpakowanPid]=src.[RodzajOpakowanPid],
tgt.[IdTowarDWU]=src.[IdTowarDWU],
tgt.[LiczbaSztuk]=src.[LiczbaSztuk],
tgt.[RodzajOpakowan]=src.[RodzajOpakowan],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[ZnakiOpakowan]=src.[ZnakiOpakowan]

WHEN NOT MATCHED
THEN INSERT (
[RodzajOpakowanPid], [IdTowarDWU], [LiczbaSztuk], [RodzajOpakowan], [Id], [LiczbaOpakowan], [ZnakiOpakowan] )
VALUES ([RodzajOpakowanPid], [IdTowarDWU], [LiczbaSztuk], [RodzajOpakowan], [Id], [LiczbaOpakowan], [ZnakiOpakowan] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_ZamkniecieCelne]'
BEGIN
MERGE INTO [aes2].[ZWP_ZamkniecieCelne] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_ZamkniecieCelne]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokZWP]=src.[IdDokZWP],
tgt.[ZnakiZamkniec]=src.[ZnakiZamkniec]

WHEN NOT MATCHED
THEN INSERT (
[IdDokZWP], [Id], [ZnakiZamkniec] )
VALUES ([IdDokZWP], [Id], [ZnakiZamkniec] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWU_WynikAnalizyRyzyka]'
BEGIN
MERGE INTO [aes2].[DWU_WynikAnalizyRyzyka] as tgt
USING [WA_StageHurtownia].[aes2].[DWU_WynikAnalizyRyzyka]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Cz2KoduAnalizyRyzykaId]=src.[Cz2KoduAnalizyRyzykaId],
tgt.[Cz3KoduAnalizyRyzykaIdPid]=src.[Cz3KoduAnalizyRyzykaIdPid],
tgt.[OpisKoduAnalizyRyzyka]=src.[OpisKoduAnalizyRyzyka],
tgt.[Cz2KoduAnalizyRyzykaIdPid]=src.[Cz2KoduAnalizyRyzykaIdPid],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[Cz1KoduAnalizyRyzykaId]=src.[Cz1KoduAnalizyRyzykaId],
tgt.[Cz3KoduAnalizyRyzykaId]=src.[Cz3KoduAnalizyRyzykaId],
tgt.[KodAnalizyRyzyka]=src.[KodAnalizyRyzyka],
tgt.[Cz1KoduAnalizyRyzykaIdPid]=src.[Cz1KoduAnalizyRyzykaIdPid],
tgt.[KodJezyka]=src.[KodJezyka],
tgt.[IdDokDWU]=src.[IdDokDWU]

WHEN NOT MATCHED
THEN INSERT (
[Cz3KoduAnalizyRyzykaIdPid], [Cz2KoduAnalizyRyzykaIdPid], [NrPozycji], [Cz1KoduAnalizyRyzykaId], [Id], [KodJezyka], [IdDokDWU], [Cz2KoduAnalizyRyzykaId], [OpisKoduAnalizyRyzyka], [Cz3KoduAnalizyRyzykaId], [KodAnalizyRyzyka], [Cz1KoduAnalizyRyzykaIdPid] )
VALUES ([Cz3KoduAnalizyRyzykaIdPid], [Cz2KoduAnalizyRyzykaIdPid], [NrPozycji], [Cz1KoduAnalizyRyzykaId], [Id], [KodJezyka], [IdDokDWU], [Cz2KoduAnalizyRyzykaId], [OpisKoduAnalizyRyzyka], [Cz3KoduAnalizyRyzykaId], [KodAnalizyRyzyka], [Cz1KoduAnalizyRyzykaIdPid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Komentarz]'
BEGIN
MERGE INTO [aes2].[ZWU_Komentarz] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Komentarz]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Komentarz]=src.[Komentarz],
tgt.[IdDokZWU]=src.[IdDokZWU]

WHEN NOT MATCHED
THEN INSERT (
[IdDokZWU], [Id], [Komentarz] )
VALUES ([IdDokZWU], [Id], [Komentarz] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_Podmiot]'
BEGIN
MERGE INTO [aes2].[QUERY_Podmiot] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_Podmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokQUERY]=src.[IdDokQUERY],
tgt.[Nazwa]=src.[Nazwa],
tgt.[TIN]=src.[TIN],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[IdDokQUERY], [Nazwa], [TIN], [Miejscowosc], [KodPocztowy], [RodzPodmiotu], [Id], [Kraj], [KrajPid], [UlicaNumer], [Email] )
VALUES ([IdDokQUERY], [Nazwa], [TIN], [Miejscowosc], [KodPocztowy], [RodzPodmiotu], [Id], [Kraj], [KrajPid], [UlicaNumer], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWP_Towar]'
BEGIN
MERGE INTO [aes2].[ZWP_Towar] as tgt
USING [WA_StageHurtownia].[aes2].[ZWP_Towar]as src
ON (tgt.[id]=src.[id])
WHEN MATCHED
THEN UPDATE SET
tgt.[OplatyTransportoweUCP]=src.[OplatyTransportoweUCP],
tgt.[WalutaUCP]=src.[WalutaUCP],
tgt.[KodTowarowyPid]=src.[KodTowarowyPid],
tgt.[ProceduraWnioskowana]=src.[ProceduraWnioskowana],
tgt.[ProceduraWnioskowanaPid]=src.[ProceduraWnioskowanaPid],
tgt.[KodDod]=src.[KodDod],
tgt.[KodTowarowyNaGranicy]=src.[KodTowarowyNaGranicy],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[KodTARIC]=src.[KodTARIC],
tgt.[KodDodPid]=src.[KodDodPid],
tgt.[KodScalony]=src.[KodScalony],
tgt.[KrajWysylki]=src.[KrajWysylki],
tgt.[TowarNiebezpiecznyUCP]=src.[TowarNiebezpiecznyUCP],
tgt.[DodKodTARIC1UCP]=src.[DodKodTARIC1UCP],
tgt.[KodTowarowyNaGranicyPid]=src.[KodTowarowyNaGranicyPid],
tgt.[WalutaWartosciStat]=src.[WalutaWartosciStat],
tgt.[IdDokZWP]=src.[IdDokZWP],
tgt.[WartoscStatystycznaUCP]=src.[WartoscStatystycznaUCP],
tgt.[DodKodTARIC1]=src.[DodKodTARIC1],
tgt.[KodTypOplTransp]=src.[KodTypOplTransp],
tgt.[ProceduraKrajowa]=src.[ProceduraKrajowa],
tgt.[DodKodTARIC2UCP]=src.[DodKodTARIC2UCP],
tgt.[KodTARICUCP]=src.[KodTARICUCP],
tgt.[MasaNettoNaGranicy]=src.[MasaNettoNaGranicy],
tgt.[KodTypOplTranspPid]=src.[KodTypOplTranspPid],
tgt.[OpisTowaruNaGranicy]=src.[OpisTowaruNaGranicy],
tgt.[WartoscStatystyczna]=src.[WartoscStatystyczna],
tgt.[ProceduraWymaganaPid]=src.[ProceduraWymaganaPid],
tgt.[KodTowarowyUCP]=src.[KodTowarowyUCP],
tgt.[KodTowarowy]=src.[KodTowarowy],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[DodKodTARIC2]=src.[DodKodTARIC2],
tgt.[TowarNiebezpieczny]=src.[TowarNiebezpieczny],
tgt.[MasaNetto]=src.[MasaNetto],
tgt.[KrajWysylkiPid]=src.[KrajWysylkiPid],
tgt.[MasaBruttoNaGranicy]=src.[MasaBruttoNaGranicy],
tgt.[DodKodTARIC1Pid]=src.[DodKodTARIC1Pid],
tgt.[TowarNiebezpiecznyPid]=src.[TowarNiebezpiecznyPid],
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[ProceduraWymagana]=src.[ProceduraWymagana],
tgt.[DodKodTARIC2Pid]=src.[DodKodTARIC2Pid],
tgt.[StanTowaruNaGranicy]=src.[StanTowaruNaGranicy],
tgt.[ProceduraKrajowaPid]=src.[ProceduraKrajowaPid],
tgt.[WalutaWartosciStatPid]=src.[WalutaWartosciStatPid],
tgt.[OpisTowaru]=src.[OpisTowaru],
tgt.[CRNRozbieznosc]=src.[CRNRozbieznosc],
tgt.[CRN]=src.[CRN],
tgt.[SzczegolyProceduryUCP]=src.[SzczegolyProceduryUCP]

WHEN NOT MATCHED
THEN INSERT (
[OplatyTransportoweUCP], [WalutaUCP], [KodTowarowyPid], [ProceduraWnioskowana], [ProceduraWnioskowanaPid], [KodDod], [KodTowarowyNaGranicy], [NrPozycji], [MasaBrutto], [KodTARIC], [KodDodPid], [KodScalony], [KrajWysylki], [TowarNiebezpiecznyUCP], [DodKodTARIC1UCP], [KodTowarowyNaGranicyPid], [WalutaWartosciStat], [IdDokZWP], [WartoscStatystycznaUCP], [DodKodTARIC1], [KodTypOplTransp], [ProceduraKrajowa], [DodKodTARIC2UCP], [KodTARICUCP], [MasaNettoNaGranicy], [KodTypOplTranspPid], [OpisTowaruNaGranicy], [WartoscStatystyczna], [ProceduraWymaganaPid], [KodTowarowyUCP], [KodTowarowy], [KrajPrzeznaczeniaPid], [DodKodTARIC2], [TowarNiebezpieczny], [id], [MasaNetto], [KrajWysylkiPid], [MasaBruttoNaGranicy], [DodKodTARIC1Pid], [TowarNiebezpiecznyPid], [KrajPrzeznaczenia], [ProceduraWymagana], [DodKodTARIC2Pid], [StanTowaruNaGranicy], [ProceduraKrajowaPid], [WalutaWartosciStatPid], [OpisTowaru], [CRNRozbieznosc], [CRN], [SzczegolyProceduryUCP] )
VALUES ([OplatyTransportoweUCP], [WalutaUCP], [KodTowarowyPid], [ProceduraWnioskowana], [ProceduraWnioskowanaPid], [KodDod], [KodTowarowyNaGranicy], [NrPozycji], [MasaBrutto], [KodTARIC], [KodDodPid], [KodScalony], [KrajWysylki], [TowarNiebezpiecznyUCP], [DodKodTARIC1UCP], [KodTowarowyNaGranicyPid], [WalutaWartosciStat], [IdDokZWP], [WartoscStatystycznaUCP], [DodKodTARIC1], [KodTypOplTransp], [ProceduraKrajowa], [DodKodTARIC2UCP], [KodTARICUCP], [MasaNettoNaGranicy], [KodTypOplTranspPid], [OpisTowaruNaGranicy], [WartoscStatystyczna], [ProceduraWymaganaPid], [KodTowarowyUCP], [KodTowarowy], [KrajPrzeznaczeniaPid], [DodKodTARIC2], [TowarNiebezpieczny], [id], [MasaNetto], [KrajWysylkiPid], [MasaBruttoNaGranicy], [DodKodTARIC1Pid], [TowarNiebezpiecznyPid], [KrajPrzeznaczenia], [ProceduraWymagana], [DodKodTARIC2Pid], [StanTowaruNaGranicy], [ProceduraKrajowaPid], [WalutaWartosciStatPid], [OpisTowaru], [CRNRozbieznosc], [CRN], [SzczegolyProceduryUCP] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_ProceduraGospodarcza]'
BEGIN
MERGE INTO [aes2].[ZUZ_ProceduraGospodarcza] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_ProceduraGospodarcza]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodDokumentuWUzupln]=src.[KodDokumentuWUzupln],
tgt.[IdTowarZUZ]=src.[IdTowarZUZ],
tgt.[NumerIdentyfikacyjnyWUzupln]=src.[NumerIdentyfikacyjnyWUzupln],
tgt.[NumerIdentyfikacyjny]=src.[NumerIdentyfikacyjny],
tgt.[KodDokumentu]=src.[KodDokumentu]

WHEN NOT MATCHED
THEN INSERT (
[KodDokumentuWUzupln], [IdTowarZUZ], [NumerIdentyfikacyjnyWUzupln], [Id], [NumerIdentyfikacyjny], [KodDokumentu] )
VALUES ([KodDokumentuWUzupln], [IdTowarZUZ], [NumerIdentyfikacyjnyWUzupln], [Id], [NumerIdentyfikacyjny], [KodDokumentu] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Korekta]'
BEGIN
MERGE INTO [aes2].[ZWU_Korekta] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Korekta]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Wartosc]=src.[Wartosc],
tgt.[KodKorekty]=src.[KodKorekty],
tgt.[IdTowarZWU]=src.[IdTowarZWU]

WHEN NOT MATCHED
THEN INSERT (
[Wartosc], [IdTowarZWU], [Id], [KodKorekty] )
VALUES ([Wartosc], [IdTowarZWU], [Id], [KodKorekty] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWA_Kontener]'
BEGIN
MERGE INTO [aes2].[DWA_Kontener] as tgt
USING [WA_StageHurtownia].[aes2].[DWA_Kontener]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarDWA]=src.[IdTowarDWA],
tgt.[StanKontenera]=src.[StanKontenera],
tgt.[NrKontenera]=src.[NrKontenera]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarDWA], [StanKontenera], [Id], [NrKontenera] )
VALUES ([IdTowarDWA], [StanKontenera], [Id], [NrKontenera] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_InformacjaDodatkowa]'
BEGIN
MERGE INTO [aes2].[QUERY_InformacjaDodatkowa] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_InformacjaDodatkowa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodInfDodPid]=src.[KodInfDodPid],
tgt.[Tekst]=src.[Tekst],
tgt.[KodJezykaInfDod]=src.[KodJezykaInfDod],
tgt.[IdTowarQUERY]=src.[IdTowarQUERY],
tgt.[KodInfDod]=src.[KodInfDod]

WHEN NOT MATCHED
THEN INSERT (
[KodInfDodPid], [Tekst], [KodJezykaInfDod], [IdTowarQUERY], [KodInfDod], [Id] )
VALUES ([KodInfDodPid], [Tekst], [KodJezykaInfDod], [IdTowarQUERY], [KodInfDod], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWU_DokumentWymagany]'
BEGIN
MERGE INTO [aes2].[DWU_DokumentWymagany] as tgt
USING [WA_StageHurtownia].[aes2].[DWU_DokumentWymagany]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarDWU]=src.[IdTowarDWU],
tgt.[NrDokWym]=src.[NrDokWym],
tgt.[KodDokWym]=src.[KodDokWym]

WHEN NOT MATCHED
THEN INSERT (
[NrDokWym], [IdTowarDWU], [Id], [KodDokWym] )
VALUES ([NrDokWym], [IdTowarDWU], [Id], [KodDokWym] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZUZ_Podmiot]'
BEGIN
MERGE INTO [aes2].[ZUZ_Podmiot] as tgt
USING [WA_StageHurtownia].[aes2].[ZUZ_Podmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[TINUzupeln]=src.[TINUzupeln],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[TIN]=src.[TIN],
tgt.[REGON]=src.[REGON],
tgt.[EORI]=src.[EORI],
tgt.[EORIUzupeln]=src.[EORIUzupeln],
tgt.[IdDokZUZ]=src.[IdDokZUZ],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [TINUzupeln], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [KrajPid], [UlicaNumer], [TIN], [REGON], [EORI], [RodzPodmiotu], [EORIUzupeln], [IdDokZUZ], [Email] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [TINUzupeln], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [KrajPid], [UlicaNumer], [TIN], [REGON], [EORI], [RodzPodmiotu], [EORIUzupeln], [IdDokZUZ], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_TowarPodmiot]'
BEGIN
MERGE INTO [aes2].[ZWU_TowarPodmiot] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_TowarPodmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[KrajPid]=src.[KrajPid],
tgt.[TIN]=src.[TIN],
tgt.[REGON]=src.[REGON],
tgt.[EORI]=src.[EORI],
tgt.[IdTowarZWU]=src.[IdTowarZWU],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [TIN], [REGON], [EORI], [RodzPodmiotu], [IdTowarZWU], [Email] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [TIN], [REGON], [EORI], [RodzPodmiotu], [IdTowarZWU], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_TowarPodmiot]'
BEGIN
MERGE INTO [aes2].[ZWA_TowarPodmiot] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_TowarPodmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[KrajPid]=src.[KrajPid],
tgt.[IdTowarZWA]=src.[IdTowarZWA],
tgt.[TIN]=src.[TIN],
tgt.[Emai]=src.[Emai],
tgt.[EORI]=src.[EORI]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [IdTowarZWA], [TIN], [Emai], [EORI], [RodzPodmiotu] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [UlicaNumer], [KrajPid], [IdTowarZWA], [TIN], [Emai], [EORI], [RodzPodmiotu] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_Towar]'
BEGIN
MERGE INTO [aes2].[QUERY_Towar] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_Towar]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[ProceduraPoprz]=src.[ProceduraPoprz],
tgt.[ProceduraPoprzPid]=src.[ProceduraPoprzPid],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[KodTARIC]=src.[KodTARIC],
tgt.[DodatkowyKodKrajowy]=src.[DodatkowyKodKrajowy],
tgt.[DodKodTARIC2]=src.[DodKodTARIC2],
tgt.[KodJezykaOpisuTowaru]=src.[KodJezykaOpisuTowaru],
tgt.[TowarNiebezpieczny]=src.[TowarNiebezpieczny],
tgt.[MasaNetto]=src.[MasaNetto],
tgt.[KrajWysylkiPid]=src.[KrajWysylkiPid],
tgt.[DodKodTARIC1Pid]=src.[DodKodTARIC1Pid],
tgt.[KrajWysylki]=src.[KrajWysylki],
tgt.[TowarNiebezpiecznyPid]=src.[TowarNiebezpiecznyPid],
tgt.[KodTypOplatTransp]=src.[KodTypOplatTransp],
tgt.[Procedura]=src.[Procedura],
tgt.[WalutaWartosciStat]=src.[WalutaWartosciStat],
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[IdDokQUERY]=src.[IdDokQUERY],
tgt.[KodTowaruNomenklaturaScalona]=src.[KodTowaruNomenklaturaScalona],
tgt.[DodKodTARIC2Pid]=src.[DodKodTARIC2Pid],
tgt.[DodKodTARIC1]=src.[DodKodTARIC1],
tgt.[ProceduraKrajowaPid]=src.[ProceduraKrajowaPid],
tgt.[WalutaWartosciStatPid]=src.[WalutaWartosciStatPid],
tgt.[OpisTowaru]=src.[OpisTowaru],
tgt.[ProceduraPid]=src.[ProceduraPid],
tgt.[ProceduraKrajowa]=src.[ProceduraKrajowa],
tgt.[KodTypOplatTranspPid]=src.[KodTypOplatTranspPid],
tgt.[CRN]=src.[CRN],
tgt.[WartoscStatystyczna]=src.[WartoscStatystyczna]

WHEN NOT MATCHED
THEN INSERT (
[ProceduraPoprz], [ProceduraPoprzPid], [KrajPrzeznaczeniaPid], [NrPozycji], [MasaBrutto], [KodTARIC], [DodatkowyKodKrajowy], [DodKodTARIC2], [KodJezykaOpisuTowaru], [TowarNiebezpieczny], [MasaNetto], [KrajWysylkiPid], [DodKodTARIC1Pid], [KrajWysylki], [TowarNiebezpiecznyPid], [KodTypOplatTransp], [Procedura], [WalutaWartosciStat], [KrajPrzeznaczenia], [IdDokQUERY], [KodTowaruNomenklaturaScalona], [DodKodTARIC2Pid], [DodKodTARIC1], [ProceduraKrajowaPid], [WalutaWartosciStatPid], [OpisTowaru], [Id], [ProceduraPid], [ProceduraKrajowa], [KodTypOplatTranspPid], [CRN], [WartoscStatystyczna] )
VALUES ([ProceduraPoprz], [ProceduraPoprzPid], [KrajPrzeznaczeniaPid], [NrPozycji], [MasaBrutto], [KodTARIC], [DodatkowyKodKrajowy], [DodKodTARIC2], [KodJezykaOpisuTowaru], [TowarNiebezpieczny], [MasaNetto], [KrajWysylkiPid], [DodKodTARIC1Pid], [KrajWysylki], [TowarNiebezpiecznyPid], [KodTypOplatTransp], [Procedura], [WalutaWartosciStat], [KrajPrzeznaczenia], [IdDokQUERY], [KodTowaruNomenklaturaScalona], [DodKodTARIC2Pid], [DodKodTARIC1], [ProceduraKrajowaPid], [WalutaWartosciStatPid], [OpisTowaru], [Id], [ProceduraPid], [ProceduraKrajowa], [KodTypOplatTranspPid], [CRN], [WartoscStatystyczna] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWA_Opakowanie]'
BEGIN
MERGE INTO [aes2].[DWA_Opakowanie] as tgt
USING [WA_StageHurtownia].[aes2].[DWA_Opakowanie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarDWA]=src.[IdTowarDWA],
tgt.[RodzajOpakowanPid]=src.[RodzajOpakowanPid],
tgt.[LiczbaSztuk]=src.[LiczbaSztuk],
tgt.[RodzajOpakowan]=src.[RodzajOpakowan],
tgt.[StanOpakowanNaGranicy]=src.[StanOpakowanNaGranicy],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[ZnakiOpakowan]=src.[ZnakiOpakowan]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarDWA], [RodzajOpakowanPid], [LiczbaSztuk], [RodzajOpakowan], [StanOpakowanNaGranicy], [Id], [LiczbaOpakowan], [ZnakiOpakowan] )
VALUES ([IdTowarDWA], [RodzajOpakowanPid], [LiczbaSztuk], [RodzajOpakowan], [StanOpakowanNaGranicy], [Id], [LiczbaOpakowan], [ZnakiOpakowan] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWU_Ilosc]'
BEGIN
MERGE INTO [aes2].[ZWU_Ilosc] as tgt
USING [WA_StageHurtownia].[aes2].[ZWU_Ilosc]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KwalifikatorJm]=src.[KwalifikatorJm],
tgt.[Ilosc]=src.[Ilosc],
tgt.[JmPid]=src.[JmPid],
tgt.[NrPozycjiDokumentuWymaganego]=src.[NrPozycjiDokumentuWymaganego],
tgt.[Jm]=src.[Jm],
tgt.[KwalifikatorJmPid]=src.[KwalifikatorJmPid],
tgt.[IdTowarZWU]=src.[IdTowarZWU]

WHEN NOT MATCHED
THEN INSERT (
[KwalifikatorJm], [Ilosc], [JmPid], [NrPozycjiDokumentuWymaganego], [Jm], [KwalifikatorJmPid], [IdTowarZWU], [Id] )
VALUES ([KwalifikatorJm], [Ilosc], [JmPid], [NrPozycjiDokumentuWymaganego], [Jm], [KwalifikatorJmPid], [IdTowarZWU], [Id] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWU_Kontener]'
BEGIN
MERGE INTO [aes2].[DWU_Kontener] as tgt
USING [WA_StageHurtownia].[aes2].[DWU_Kontener]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarDWU]=src.[IdTowarDWU],
tgt.[NrKontenera]=src.[NrKontenera]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarDWU], [Id], [NrKontenera] )
VALUES ([IdTowarDWU], [Id], [NrKontenera] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[DWU_Podmiot]'
BEGIN
MERGE INTO [aes2].[DWU_Podmiot] as tgt
USING [WA_StageHurtownia].[aes2].[DWU_Podmiot]as src
ON (tgt.[Id]=src.[Id] AND tgt.[RodzPodmiotu]=src.[RodzPodmiotu])
WHEN MATCHED
THEN UPDATE SET
tgt.[Nazwa]=src.[Nazwa],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[IdGrupyNumerowAEOPodmiotu]=src.[IdGrupyNumerowAEOPodmiotu],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[IdDokDWU]=src.[IdDokDWU],
tgt.[TIN]=src.[TIN],
tgt.[REGON]=src.[REGON],
tgt.[EORI]=src.[EORI],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [KrajPid], [UlicaNumer], [IdDokDWU], [TIN], [REGON], [EORI], [RodzPodmiotu], [Email] )
VALUES ([Nazwa], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [IdGrupyNumerowAEOPodmiotu], [KrajPid], [UlicaNumer], [IdDokDWU], [TIN], [REGON], [EORI], [RodzPodmiotu], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_Dokument]'
BEGIN
MERGE INTO [aes2].[QUERY_Dokument] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[DataZlozeniaZgloszenia]=src.[DataZlozeniaZgloszenia],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[KrajWysylki1Pid]=src.[KrajWysylki1Pid],
tgt.[UrzadWywozu]=src.[UrzadWywozu],
tgt.[DataWygenerowaniaZapytania]=src.[DataWygenerowaniaZapytania],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[UrzadWywozuPid]=src.[UrzadWywozuPid],
tgt.[DataZwolnienia]=src.[DataZwolnienia],
tgt.[LiczbaPozycji]=src.[LiczbaPozycji],
tgt.[TypDeklaracji]=src.[TypDeklaracji],
tgt.[KrajWysylkiPid]=src.[KrajWysylkiPid],
tgt.[EksportDoAnalityki]=src.[EksportDoAnalityki],
tgt.[IdSrodkaTransportu]=src.[IdSrodkaTransportu],
tgt.[KodJezykaDokEADPid]=src.[KodJezykaDokEADPid],
tgt.[DodatkPytanieOStatusOperWywoz]=src.[DodatkPytanieOStatusOperWywoz],
tgt.[KrajWysylki]=src.[KrajWysylki],
tgt.[MPPid]=src.[MPPid],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[KonteneryNaGranicy]=src.[KonteneryNaGranicy],
tgt.[PrzewidywanaDataDotarciaTowaru]=src.[PrzewidywanaDataDotarciaTowaru],
tgt.[DataPrzyjecia]=src.[DataPrzyjecia],
tgt.[UrzadWyprowadzenia]=src.[UrzadWyprowadzenia],
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[KodWynikuKontroli]=src.[KodWynikuKontroli],
tgt.[KrajWysylki1]=src.[KrajWysylki1],
tgt.[SpecyficzneOkolicznosciPid]=src.[SpecyficzneOkolicznosciPid],
tgt.[IdKomunikatuZapytania ]=src.[IdKomunikatuZapytania ],
tgt.[KodWynikuKontroliPid]=src.[KodWynikuKontroliPid],
tgt.[UrzadZapytaniaPid]=src.[UrzadZapytaniaPid],
tgt.[MRN]=src.[MRN],
tgt.[SpecyficzneOkolicznosci]=src.[SpecyficzneOkolicznosci],
tgt.[KodJezykaDokEAD]=src.[KodJezykaDokEAD],
tgt.[PrzyczynaODeklaracje]=src.[PrzyczynaODeklaracje],
tgt.[KodJezykaDodatkPytania]=src.[KodJezykaDodatkPytania],
tgt.[KodJezykaOpisuSrodkaTransportu]=src.[KodJezykaOpisuSrodkaTransportu],
tgt.[KodJezykaOdp]=src.[KodJezykaOdp],
tgt.[MP]=src.[MP],
tgt.[UrzadZapytania]=src.[UrzadZapytania],
tgt.[LiczbaZamkniecCelnych]=src.[LiczbaZamkniecCelnych],
tgt.[CRN]=src.[CRN],
tgt.[TypStatusuOperWywoz]=src.[TypStatusuOperWywoz],
tgt.[OdpNaDodatkPytanieOStatusOperWywoz]=src.[OdpNaDodatkPytanieOStatusOperWywoz],
tgt.[UrzadWyprowadzeniaPid]=src.[UrzadWyprowadzeniaPid],
tgt.[Status]=src.[Status]

WHEN NOT MATCHED
THEN INSERT (
[DataZlozeniaZgloszenia], [KrajPrzeznaczeniaPid], [KrajWysylki1Pid], [UrzadWywozu], [DataWygenerowaniaZapytania], [MasaBrutto], [UrzadWywozuPid], [DataZwolnienia], [LiczbaPozycji], [TypDeklaracji], [KrajWysylkiPid], [EksportDoAnalityki], [IdSrodkaTransportu], [KodJezykaDokEADPid], [DodatkPytanieOStatusOperWywoz], [KrajWysylki], [MPPid], [LiczbaOpakowan], [KonteneryNaGranicy], [PrzewidywanaDataDotarciaTowaru], [DataPrzyjecia], [UrzadWyprowadzenia], [KrajPrzeznaczenia], [KodWynikuKontroli], [KrajWysylki1], [SpecyficzneOkolicznosciPid], [IdKomunikatuZapytania ], [KodWynikuKontroliPid], [UrzadZapytaniaPid], [MRN], [Id], [SpecyficzneOkolicznosci], [KodJezykaDokEAD], [PrzyczynaODeklaracje], [KodJezykaDodatkPytania], [KodJezykaOpisuSrodkaTransportu], [KodJezykaOdp], [MP], [UrzadZapytania], [LiczbaZamkniecCelnych], [CRN], [TypStatusuOperWywoz], [OdpNaDodatkPytanieOStatusOperWywoz], [UrzadWyprowadzeniaPid], [Status] )
VALUES ([DataZlozeniaZgloszenia], [KrajPrzeznaczeniaPid], [KrajWysylki1Pid], [UrzadWywozu], [DataWygenerowaniaZapytania], [MasaBrutto], [UrzadWywozuPid], [DataZwolnienia], [LiczbaPozycji], [TypDeklaracji], [KrajWysylkiPid], [EksportDoAnalityki], [IdSrodkaTransportu], [KodJezykaDokEADPid], [DodatkPytanieOStatusOperWywoz], [KrajWysylki], [MPPid], [LiczbaOpakowan], [KonteneryNaGranicy], [PrzewidywanaDataDotarciaTowaru], [DataPrzyjecia], [UrzadWyprowadzenia], [KrajPrzeznaczenia], [KodWynikuKontroli], [KrajWysylki1], [SpecyficzneOkolicznosciPid], [IdKomunikatuZapytania ], [KodWynikuKontroliPid], [UrzadZapytaniaPid], [MRN], [Id], [SpecyficzneOkolicznosci], [KodJezykaDokEAD], [PrzyczynaODeklaracje], [KodJezykaDodatkPytania], [KodJezykaOpisuSrodkaTransportu], [KodJezykaOdp], [MP], [UrzadZapytania], [LiczbaZamkniecCelnych], [CRN], [TypStatusuOperWywoz], [OdpNaDodatkPytanieOStatusOperWywoz], [UrzadWyprowadzeniaPid], [Status] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[ZWA_DokumentWymagany]'
BEGIN
MERGE INTO [aes2].[ZWA_DokumentWymagany] as tgt
USING [WA_StageHurtownia].[aes2].[ZWA_DokumentWymagany]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdTowarZWA]=src.[IdTowarZWA],
tgt.[StanNaGranicyKom]=src.[StanNaGranicyKom],
tgt.[KodDokWymPid]=src.[KodDokWymPid],
tgt.[Tranzyt]=src.[Tranzyt],
tgt.[StanNaGranicy]=src.[StanNaGranicy],
tgt.[NrDokWym]=src.[NrDokWym],
tgt.[KodDokWym]=src.[KodDokWym]

WHEN NOT MATCHED
THEN INSERT (
[IdTowarZWA], [StanNaGranicyKom], [KodDokWymPid], [Tranzyt], [StanNaGranicy], [NrDokWym], [Id], [KodDokWym] )
VALUES ([IdTowarZWA], [StanNaGranicyKom], [KodDokWymPid], [Tranzyt], [StanNaGranicy], [NrDokWym], [Id], [KodDokWym] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_Opakowanie]'
BEGIN
MERGE INTO [aes2].[QUERY_Opakowanie] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_Opakowanie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[RodzajOpakowanPid]=src.[RodzajOpakowanPid],
tgt.[IdTowarQUERY]=src.[IdTowarQUERY],
tgt.[KodJezykaZnakowOpakowan]=src.[KodJezykaZnakowOpakowan],
tgt.[LiczbaSztuk]=src.[LiczbaSztuk],
tgt.[RodzajOpakowan]=src.[RodzajOpakowan],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[ZnakiOpakowan]=src.[ZnakiOpakowan]

WHEN NOT MATCHED
THEN INSERT (
[RodzajOpakowanPid], [IdTowarQUERY], [KodJezykaZnakowOpakowan], [LiczbaSztuk], [RodzajOpakowan], [Id], [LiczbaOpakowan], [ZnakiOpakowan] )
VALUES ([RodzajOpakowanPid], [IdTowarQUERY], [KodJezykaZnakowOpakowan], [LiczbaSztuk], [RodzajOpakowan], [Id], [LiczbaOpakowan], [ZnakiOpakowan] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[MEX_Dokument]'
BEGIN
MERGE INTO [aes2].[MEX_Dokument] as tgt
USING [WA_StageHurtownia].[aes2].[MEX_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[UrzadWyprowadzenia]=src.[UrzadWyprowadzenia],
tgt.[KodWynikuKontroli]=src.[KodWynikuKontroli],
tgt.[MRX]=src.[MRX],
tgt.[Miejsce]=src.[Miejsce],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[KodWynikuKontroliPid]=src.[KodWynikuKontroliPid],
tgt.[Data]=src.[Data],
tgt.[LiczbaPozycji]=src.[LiczbaPozycji],
tgt.[DataPrzyjeciaNaEwid]=src.[DataPrzyjeciaNaEwid],
tgt.[DataPrzedstawienia]=src.[DataPrzedstawienia],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[NrWlasny]=src.[NrWlasny],
tgt.[UrzadWyprowadzeniaPid]=src.[UrzadWyprowadzeniaPid],
tgt.[Status]=src.[Status]

WHEN NOT MATCHED
THEN INSERT (
[UrzadWyprowadzenia], [KodWynikuKontroli], [MRX], [Miejsce], [MasaBrutto], [KodWynikuKontroliPid], [Id], [Data], [LiczbaPozycji], [DataPrzyjeciaNaEwid], [DataPrzedstawienia], [LiczbaOpakowan], [NrWlasny], [UrzadWyprowadzeniaPid], [Status] )
VALUES ([UrzadWyprowadzenia], [KodWynikuKontroli], [MRX], [Miejsce], [MasaBrutto], [KodWynikuKontroliPid], [Id], [Data], [LiczbaPozycji], [DataPrzyjeciaNaEwid], [DataPrzedstawienia], [LiczbaOpakowan], [NrWlasny], [UrzadWyprowadzeniaPid], [Status] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[QUERY_Trasa]'
BEGIN
MERGE INTO [aes2].[QUERY_Trasa] as tgt
USING [WA_StageHurtownia].[aes2].[QUERY_Trasa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokQUERY]=src.[IdDokQUERY],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid]

WHEN NOT MATCHED
THEN INSERT (
[IdDokQUERY], [Id], [Kraj], [KrajPid] )
VALUES ([IdDokQUERY], [Id], [Kraj], [KrajPid] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[TRS_DokumentyDeklaracji]'
BEGIN
MERGE INTO [aes2].[TRS_DokumentyDeklaracji] as tgt
USING [WA_StageHurtownia].[aes2].[TRS_DokumentyDeklaracji]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[NumerDokumentu]=src.[NumerDokumentu],
tgt.[Wersja]=src.[Wersja],
tgt.[IdPozycjiTRS]=src.[IdPozycjiTRS],
tgt.[Uwagi]=src.[Uwagi],
tgt.[NrPozycjiWywozowej]=src.[NrPozycjiWywozowej],
tgt.[KodDokumentu]=src.[KodDokumentu]

WHEN NOT MATCHED
THEN INSERT (
[NumerDokumentu], [Wersja], [IdPozycjiTRS], [Uwagi], [NrPozycjiWywozowej], [Id], [KodDokumentu] )
VALUES ([NumerDokumentu], [Wersja], [IdPozycjiTRS], [Uwagi], [NrPozycjiWywozowej], [Id], [KodDokumentu] );

SET @Merged = 1;
 END
IF @TableName = '[aes2].[TRS_Pozycje]'
BEGIN
MERGE INTO [aes2].[TRS_Pozycje] as tgt
USING [WA_StageHurtownia].[aes2].[TRS_Pozycje]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KrajPrzeznaczenia]=src.[KrajPrzeznaczenia],
tgt.[KodTowarowy]=src.[KodTowarowy],
tgt.[KodTowarowyPid]=src.[KodTowarowyPid],
tgt.[Wersja]=src.[Wersja],
tgt.[IdDokTRS]=src.[IdDokTRS],
tgt.[KrajPrzeznaczeniaPid]=src.[KrajPrzeznaczeniaPid],
tgt.[KrajPochodzenia]=src.[KrajPochodzenia],
tgt.[NrPozycjiTranzytowej]=src.[NrPozycjiTranzytowej],
tgt.[TypDeklaracjiPrzekazanyPrzezNCTS]=src.[TypDeklaracjiPrzekazanyPrzezNCTS],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[KrajPochodzeniaPid]=src.[KrajPochodzeniaPid],
tgt.[OpisTowaru]=src.[OpisTowaru],
tgt.[MasaNetto]=src.[MasaNetto],
tgt.[MRNEksportowy]=src.[MRNEksportowy]

WHEN NOT MATCHED
THEN INSERT (
[KrajPrzeznaczenia], [KodTowarowy], [KodTowarowyPid], [Wersja], [IdDokTRS], [KrajPrzeznaczeniaPid], [KrajPochodzenia], [NrPozycjiTranzytowej], [TypDeklaracjiPrzekazanyPrzezNCTS], [MasaBrutto], [KrajPochodzeniaPid], [OpisTowaru], [Id], [MasaNetto], [MRNEksportowy] )
VALUES ([KrajPrzeznaczenia], [KodTowarowy], [KodTowarowyPid], [Wersja], [IdDokTRS], [KrajPrzeznaczeniaPid], [KrajPochodzenia], [NrPozycjiTranzytowej], [TypDeklaracjiPrzekazanyPrzezNCTS], [MasaBrutto], [KrajPochodzeniaPid], [OpisTowaru], [Id], [MasaNetto], [MRNEksportowy] );

SET @Merged = 1;
 END









	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END