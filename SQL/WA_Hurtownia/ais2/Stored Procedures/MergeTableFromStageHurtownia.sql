


-- =============================================
-- Author:	
-- Create date: 2014-07-31
-- Description:	
-- =============================================

CREATE PROCEDURE [ais2].[MergeTableFromStageHurtownia] (@TableName VARCHAR(50) = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Merged BIT = 0;

	IF (@TableName IS NULL) BEGIN
		;THROW 51001, 'Nie wskazano nazwy tabeli w parametrze @TableName procedury.', 0;
	END


IF @TableName = '[ais2].[PTW_Podmiot]'
BEGIN
MERGE INTO [ais2].[PTW_Podmiot] as tgt
USING [WA_StageHurtownia].[ais2].[PTW_Podmiot]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[RodzajPodmiotu]=src.[RodzajPodmiotu],
tgt.[Nazwa]=src.[Nazwa],
tgt.[TIN]=src.[TIN],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[IdDokPTW]=src.[IdDokPTW],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[RodzajPodmiotu], [Nazwa], [TIN], [Miejscowosc], [KodPocztowy], [IdDokPTW], [Id], [Kraj], [KrajPid], [UlicaNumer], [Email] )
VALUES ([RodzajPodmiotu], [Nazwa], [TIN], [Miejscowosc], [KodPocztowy], [IdDokPTW], [Id], [Kraj], [KrajPid], [UlicaNumer], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_Zamkniecie]'
BEGIN
MERGE INTO [ais2].[PDS_Zamkniecie] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_Zamkniecie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokPDS]=src.[IdDokPDS],
tgt.[NumerZnaki]=src.[NumerZnaki]

WHEN NOT MATCHED
THEN INSERT (
[Id], [IdDokPDS], [NumerZnaki] )
VALUES ([Id], [IdDokPDS], [NumerZnaki] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_TowarPodmiot]'
BEGIN
MERGE INTO [ais2].[PDS_TowarPodmiot] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_TowarPodmiot]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[RodzajPodmiotu]=src.[RodzajPodmiotu],
tgt.[Nazwa]=src.[Nazwa],
tgt.[TIN]=src.[TIN],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[IdTowarPDS]=src.[IdTowarPDS],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[RodzajPodmiotu], [Nazwa], [TIN], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [KrajPid], [UlicaNumer], [IdTowarPDS], [Email] )
VALUES ([RodzajPodmiotu], [Nazwa], [TIN], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [KrajPid], [UlicaNumer], [IdTowarPDS], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_Towar]'
BEGIN
MERGE INTO [ais2].[PDS_Towar] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_Towar]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[MsceWyladunku]=src.[MsceWyladunku],
tgt.[CzyPozBilansowana]=src.[CzyPozBilansowana],
tgt.[KodTowarowy]=src.[KodTowarowy],
tgt.[KodTowarowyPid]=src.[KodTowarowyPid],
tgt.[UCWprowadzeniaPid]=src.[UCWprowadzeniaPid],
tgt.[StanPozTowUCWprow]=src.[StanPozTowUCWprow],
tgt.[KodTowNiebezp]=src.[KodTowNiebezp],
tgt.[NrPozycji]=src.[NrPozycji],
tgt.[MsceWyladunkuUCWprowKom]=src.[MsceWyladunkuUCWprowKom],
tgt.[IdDokPDS]=src.[IdDokPDS],
tgt.[MasaBruttoSaldowanie]=src.[MasaBruttoSaldowanie],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[OpisTowaruUCWprow]=src.[OpisTowaruUCWprow],
tgt.[FlagaCzyObsługaPTWzakonczona]=src.[FlagaCzyObsługaPTWzakonczona],
tgt.[StanPozTowUCWprowKom]=src.[StanPozTowUCWprowKom],
tgt.[KodTowNiebezpPid]=src.[KodTowNiebezpPid],
tgt.[OplTranspPid]=src.[OplTranspPid],
tgt.[KodTowarowyUCWprow]=src.[KodTowarowyUCWprow],
tgt.[MsceZaladunkuUCWprowKom]=src.[MsceZaladunkuUCWprowKom],
tgt.[MsceZaladunku]=src.[MsceZaladunku],
tgt.[MsceWyladunkuUCWprow]=src.[MsceWyladunkuUCWprow],
tgt.[KodTowNiebezpUCWprowKomPid]=src.[KodTowNiebezpUCWprowKomPid],
tgt.[OplTranspUCWprowPid]=src.[OplTranspUCWprowPid],
tgt.[IloscOpakowanSaldowanie]=src.[IloscOpakowanSaldowanie],
tgt.[OplTranspUCWprowKom]=src.[OplTranspUCWprowKom],
tgt.[OplTransp]=src.[OplTransp],
tgt.[OplTranspUCWprow]=src.[OplTranspUCWprow],
tgt.[KodTowNiebezpUCWprow]=src.[KodTowNiebezpUCWprow],
tgt.[KodTowNiebezpUCWprowPid]=src.[KodTowNiebezpUCWprowPid],
tgt.[KodTowNiebezpUCWprowKom]=src.[KodTowNiebezpUCWprowKom],
tgt.[OpisTowaru]=src.[OpisTowaru],
tgt.[UCWprowadzenia]=src.[UCWprowadzenia],
tgt.[MsceZaladunkuUCWprow]=src.[MsceZaladunkuUCWprow],
tgt.[MasaBruttoUCWprow]=src.[MasaBruttoUCWprow],
tgt.[KodTowarowyUCWprowPid]=src.[KodTowarowyUCWprowPid],
tgt.[CRNUCWprow]=src.[CRNUCWprow],
tgt.[FlagaWprowadzenia]=src.[FlagaWprowadzenia],
tgt.[PowiadomienieOPrzybyciu_MRZ]=src.[PowiadomienieOPrzybyciu_MRZ],
tgt.[CRN]=src.[CRN],
tgt.[CzyRoznicaIlosciPozycji]=src.[CzyRoznicaIlosciPozycji],
tgt.[Status]=src.[Status]

WHEN NOT MATCHED
THEN INSERT (
[MsceWyladunku], [CzyPozBilansowana], [KodTowarowy], [KodTowarowyPid], [UCWprowadzeniaPid], [StanPozTowUCWprow], [KodTowNiebezp], [NrPozycji], [MsceWyladunkuUCWprowKom], [IdDokPDS], [MasaBruttoSaldowanie], [MasaBrutto], [OpisTowaruUCWprow], [FlagaCzyObsługaPTWzakonczona], [StanPozTowUCWprowKom], [KodTowNiebezpPid], [OplTranspPid], [KodTowarowyUCWprow], [MsceZaladunkuUCWprowKom], [MsceZaladunku], [MsceWyladunkuUCWprow], [KodTowNiebezpUCWprowKomPid], [OplTranspUCWprowPid], [IloscOpakowanSaldowanie], [OplTranspUCWprowKom], [OplTransp], [OplTranspUCWprow], [KodTowNiebezpUCWprow], [KodTowNiebezpUCWprowPid], [KodTowNiebezpUCWprowKom], [OpisTowaru], [UCWprowadzenia], [Id], [MsceZaladunkuUCWprow], [MasaBruttoUCWprow], [KodTowarowyUCWprowPid], [CRNUCWprow], [FlagaWprowadzenia], [PowiadomienieOPrzybyciu_MRZ], [CRN], [CzyRoznicaIlosciPozycji], [Status] )
VALUES ([MsceWyladunku], [CzyPozBilansowana], [KodTowarowy], [KodTowarowyPid], [UCWprowadzeniaPid], [StanPozTowUCWprow], [KodTowNiebezp], [NrPozycji], [MsceWyladunkuUCWprowKom], [IdDokPDS], [MasaBruttoSaldowanie], [MasaBrutto], [OpisTowaruUCWprow], [FlagaCzyObsługaPTWzakonczona], [StanPozTowUCWprowKom], [KodTowNiebezpPid], [OplTranspPid], [KodTowarowyUCWprow], [MsceZaladunkuUCWprowKom], [MsceZaladunku], [MsceWyladunkuUCWprow], [KodTowNiebezpUCWprowKomPid], [OplTranspUCWprowPid], [IloscOpakowanSaldowanie], [OplTranspUCWprowKom], [OplTransp], [OplTranspUCWprow], [KodTowNiebezpUCWprow], [KodTowNiebezpUCWprowPid], [KodTowNiebezpUCWprowKom], [OpisTowaru], [UCWprowadzenia], [Id], [MsceZaladunkuUCWprow], [MasaBruttoUCWprow], [KodTowarowyUCWprowPid], [CRNUCWprow], [FlagaWprowadzenia], [PowiadomienieOPrzybyciu_MRZ], [CRN], [CzyRoznicaIlosciPozycji], [Status] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_Podmiot]'
BEGIN
MERGE INTO [ais2].[PDS_Podmiot] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_Podmiot]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[RodzajPodmiotu]=src.[RodzajPodmiotu],
tgt.[Nazwa]=src.[Nazwa],
tgt.[TIN]=src.[TIN],
tgt.[IdDokPDS]=src.[IdDokPDS],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer],
tgt.[Email]=src.[Email]

WHEN NOT MATCHED
THEN INSERT (
[RodzajPodmiotu], [Nazwa], [TIN], [IdDokPDS], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [KrajPid], [UlicaNumer], [Email] )
VALUES ([RodzajPodmiotu], [Nazwa], [TIN], [IdDokPDS], [Miejscowosc], [KodPocztowy], [Id], [Kraj], [KrajPid], [UlicaNumer], [Email] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_Trasa]'
BEGIN
MERGE INTO [ais2].[PDS_Trasa] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_Trasa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[IdDokPDS]=src.[IdDokPDS],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid]

WHEN NOT MATCHED
THEN INSERT (
[Id], [Kraj], [KrajPid], [IdDokPDS] )
VALUES ([Id], [Kraj], [KrajPid], [IdDokPDS] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_TransportNaGranicy]'
BEGIN
MERGE INTO [ais2].[PDS_TransportNaGranicy] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_TransportNaGranicy]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KrajUCWprowPid]=src.[KrajUCWprowPid],
tgt.[RodzajTransportuNaGranicy]=src.[RodzajTransportuNaGranicy],
tgt.[RodzajTransportuNaGranicyPid]=src.[RodzajTransportuNaGranicyPid],
tgt.[Komentarz]=src.[Komentarz],
tgt.[StanTransportuNaGranicy]=src.[StanTransportuNaGranicy],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid],
tgt.[KrajUCWprow]=src.[KrajUCWprow],
tgt.[ZnakiTranspNaGranicy]=src.[ZnakiTranspNaGranicy],
tgt.[IdTowarPDS]=src.[IdTowarPDS]

WHEN NOT MATCHED
THEN INSERT (
[KrajUCWprowPid], [RodzajTransportuNaGranicy], [RodzajTransportuNaGranicyPid], [Komentarz], [StanTransportuNaGranicy], [Id], [Kraj], [KrajPid], [KrajUCWprow], [ZnakiTranspNaGranicy], [IdTowarPDS] )
VALUES ([KrajUCWprowPid], [RodzajTransportuNaGranicy], [RodzajTransportuNaGranicyPid], [Komentarz], [StanTransportuNaGranicy], [Id], [Kraj], [KrajPid], [KrajUCWprow], [ZnakiTranspNaGranicy], [IdTowarPDS] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PTW_Towar]'
BEGIN
MERGE INTO [ais2].[PTW_Towar] as tgt
USING [WA_StageHurtownia].[ais2].[PTW_Towar]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[DokPrzewozowyKod]=src.[DokPrzewozowyKod],
tgt.[ZnacznikWprowadzenia]=src.[ZnacznikWprowadzenia],
tgt.[NrPozTow]=src.[NrPozTow],
tgt.[IdDokPTW]=src.[IdDokPTW],
tgt.[DokPrzewozowyNr]=src.[DokPrzewozowyNr]

WHEN NOT MATCHED
THEN INSERT (
[DokPrzewozowyKod], [ZnacznikWprowadzenia], [NrPozTow], [IdDokPTW], [Id], [DokPrzewozowyNr] )
VALUES ([DokPrzewozowyKod], [ZnacznikWprowadzenia], [NrPozTow], [IdDokPTW], [Id], [DokPrzewozowyNr] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_DokumentWymagany]'
BEGIN
MERGE INTO [ais2].[PDS_DokumentWymagany] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_DokumentWymagany]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodDokWymPid]=src.[KodDokWymPid],
tgt.[DokumentyWymaganeKomentarzNaGranicy]=src.[DokumentyWymaganeKomentarzNaGranicy],
tgt.[DokumentyWymaganeNaGranicy]=src.[DokumentyWymaganeNaGranicy],
tgt.[NrDokWym]=src.[NrDokWym],
tgt.[KodDokWym]=src.[KodDokWym],
tgt.[IdTowarPDS]=src.[IdTowarPDS]

WHEN NOT MATCHED
THEN INSERT (
[KodDokWymPid], [DokumentyWymaganeKomentarzNaGranicy], [DokumentyWymaganeNaGranicy], [NrDokWym], [Id], [KodDokWym], [IdTowarPDS] )
VALUES ([KodDokWymPid], [DokumentyWymaganeKomentarzNaGranicy], [DokumentyWymaganeNaGranicy], [NrDokWym], [Id], [KodDokWym], [IdTowarPDS] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_Opakowanie]'
BEGIN
MERGE INTO [ais2].[PDS_Opakowanie] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_Opakowanie]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[RodzajNaGranicy]=src.[RodzajNaGranicy],
tgt.[RodzajNaGranicyPid]=src.[RodzajNaGranicyPid],
tgt.[LiczbaSztuk]=src.[LiczbaSztuk],
tgt.[LiczbaOpakowanNaGranicy]=src.[LiczbaOpakowanNaGranicy],
tgt.[StanOpakowanNaGranicy]=src.[StanOpakowanNaGranicy],
tgt.[LiczbaSztukNaGranicy]=src.[LiczbaSztukNaGranicy],
tgt.[IdTowarPDS]=src.[IdTowarPDS],
tgt.[RodzajOpakowanPid]=src.[RodzajOpakowanPid],
tgt.[ZnakiNaGranicy]=src.[ZnakiNaGranicy],
tgt.[RodzajOpakowan]=src.[RodzajOpakowan],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[ZnakiOpakowan]=src.[ZnakiOpakowan]

WHEN NOT MATCHED
THEN INSERT (
[RodzajNaGranicy], [RodzajNaGranicyPid], [LiczbaSztuk], [LiczbaOpakowanNaGranicy], [StanOpakowanNaGranicy], [LiczbaSztukNaGranicy], [Id], [IdTowarPDS], [RodzajOpakowanPid], [ZnakiNaGranicy], [RodzajOpakowan], [LiczbaOpakowan], [ZnakiOpakowan] )
VALUES ([RodzajNaGranicy], [RodzajNaGranicyPid], [LiczbaSztuk], [LiczbaOpakowanNaGranicy], [StanOpakowanNaGranicy], [LiczbaSztukNaGranicy], [Id], [IdTowarPDS], [RodzajOpakowanPid], [ZnakiNaGranicy], [RodzajOpakowan], [LiczbaOpakowan], [ZnakiOpakowan] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_Kontener]'
BEGIN
MERGE INTO [ais2].[PDS_Kontener] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_Kontener]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[StanKontenera]=src.[StanKontenera],
tgt.[NrKontenera]=src.[NrKontenera],
tgt.[IdTowarPDS]=src.[IdTowarPDS]

WHEN NOT MATCHED
THEN INSERT (
[StanKontenera], [Id], [NrKontenera], [IdTowarPDS] )
VALUES ([StanKontenera], [Id], [NrKontenera], [IdTowarPDS] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PTW_Dokument]'
BEGIN
MERGE INTO [ais2].[PTW_Dokument] as tgt
USING [WA_StageHurtownia].[ais2].[PTW_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[UCWprowadzeniaPid]=src.[UCWprowadzeniaPid],
tgt.[TransportNaGranicy_Znaki]=src.[TransportNaGranicy_Znaki],
tgt.[DataRejestracji]=src.[DataRejestracji],
tgt.[DataWprowadzenia]=src.[DataWprowadzenia],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[DataPrzybycia]=src.[DataPrzybycia],
tgt.[TransportRodzajPid]=src.[TransportRodzajPid],
tgt.[LiczbaPozycji]=src.[LiczbaPozycji],
tgt.[TransportRodzaj]=src.[TransportRodzaj],
tgt.[LiczbaPozycjiUCWprow]=src.[LiczbaPozycjiUCWprow],
tgt.[MiejsceIData_Miejsce]=src.[MiejsceIData_Miejsce],
tgt.[PierwszyUCWprow]=src.[PierwszyUCWprow],
tgt.[LiczbaOpakowanUCWprowKom]=src.[LiczbaOpakowanUCWprowKom],
tgt.[NrWlasny]=src.[NrWlasny],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[DataPrzyjecia]=src.[DataPrzyjecia],
tgt.[EmailWprowadzajacego]=src.[EmailWprowadzajacego],
tgt.[PierwszyUCWprowPid]=src.[PierwszyUCWprowPid],
tgt.[MasaBruttoUCWprowKom]=src.[MasaBruttoUCWprowKom],
tgt.[TransportZnaki]=src.[TransportZnaki],
tgt.[UCWprowadzenia]=src.[UCWprowadzenia],
tgt.[KodKrajuPid]=src.[KodKrajuPid],
tgt.[Kontener]=src.[Kontener],
tgt.[MasaBruttoUCWprow]=src.[MasaBruttoUCWprow],
tgt.[LiczbaPozycjiUCWprowKom]=src.[LiczbaPozycjiUCWprowKom],
tgt.[LiczbaOpakowanUCWprow]=src.[LiczbaOpakowanUCWprow],
tgt.[MiejsceIData_Data]=src.[MiejsceIData_Data],
tgt.[KodKraju]=src.[KodKraju],
tgt.[TAB_COUN]=src.[TAB_COUN],
tgt.[DataPrzedstawienia]=src.[DataPrzedstawienia],
tgt.[TransportNaGranicy_Rodzaj]=src.[TransportNaGranicy_Rodzaj],
tgt.[Status]=src.[Status],
tgt.[DataIE302]=src.[DataIE302],
tgt.[NrDokumentu]=src.[NrDokumentu]

WHEN NOT MATCHED
THEN INSERT (
[UCWprowadzeniaPid], [TransportNaGranicy_Znaki], [DataRejestracji], [DataWprowadzenia], [MasaBrutto], [DataPrzybycia], [TransportRodzajPid], [LiczbaPozycji], [TransportRodzaj], [LiczbaPozycjiUCWprow], [MiejsceIData_Miejsce], [PierwszyUCWprow], [LiczbaOpakowanUCWprowKom], [NrWlasny], [LiczbaOpakowan], [DataPrzyjecia], [EmailWprowadzajacego], [PierwszyUCWprowPid], [MasaBruttoUCWprowKom], [TransportZnaki], [UCWprowadzenia], [Id], [KodKrajuPid], [Kontener], [MasaBruttoUCWprow], [LiczbaPozycjiUCWprowKom], [LiczbaOpakowanUCWprow], [MiejsceIData_Data], [KodKraju], [TAB_COUN], [DataPrzedstawienia], [TransportNaGranicy_Rodzaj], [Status], [DataIE302], [NrDokumentu] )
VALUES ([UCWprowadzeniaPid], [TransportNaGranicy_Znaki], [DataRejestracji], [DataWprowadzenia], [MasaBrutto], [DataPrzybycia], [TransportRodzajPid], [LiczbaPozycji], [TransportRodzaj], [LiczbaPozycjiUCWprow], [MiejsceIData_Miejsce], [PierwszyUCWprow], [LiczbaOpakowanUCWprowKom], [NrWlasny], [LiczbaOpakowan], [DataPrzyjecia], [EmailWprowadzajacego], [PierwszyUCWprowPid], [MasaBruttoUCWprowKom], [TransportZnaki], [UCWprowadzenia], [Id], [KodKrajuPid], [Kontener], [MasaBruttoUCWprow], [LiczbaPozycjiUCWprowKom], [LiczbaOpakowanUCWprow], [MiejsceIData_Data], [KodKraju], [TAB_COUN], [DataPrzedstawienia], [TransportNaGranicy_Rodzaj], [Status], [DataIE302], [NrDokumentu] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_Dokument]'
BEGIN
MERGE INTO [ais2].[PDS_Dokument] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_Dokument]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[AEO_CTRL_BTN]=src.[AEO_CTRL_BTN],
tgt.[dts]=src.[dts],
tgt.[DataRejestracji]=src.[DataRejestracji],
tgt.[UCZlozeniaPid]=src.[UCZlozeniaPid],
tgt.[Typ]=src.[Typ],
tgt.[MasaBrutto]=src.[MasaBrutto],
tgt.[PodpisCyfrowy]=src.[PodpisCyfrowy],
tgt.[CONTAINERS]=src.[CONTAINERS],
tgt.[DataPrzybycia]=src.[DataPrzybycia],
tgt.[TransportRodzajPid]=src.[TransportRodzajPid],
tgt.[FlagaOptimisticLock]=src.[FlagaOptimisticLock],
tgt.[TransportKraj]=src.[TransportKraj],
tgt.[LiczbaPozycji]=src.[LiczbaPozycji],
tgt.[MiejsceZaladunku]=src.[MiejsceZaladunku],
tgt.[TransportRodzaj]=src.[TransportRodzaj],
tgt.[REPR_CUST_EMAIL]=src.[REPR_CUST_EMAIL],
tgt.[OplatyTransportoweMP]=src.[OplatyTransportoweMP],
tgt.[NrPrzewozowy]=src.[NrPrzewozowy],
tgt.[NrWlasny]=src.[NrWlasny],
tgt.[LiczbaOpakowan]=src.[LiczbaOpakowan],
tgt.[DataPrzyjecia]=src.[DataPrzyjecia],
tgt.[TransportKrajPid]=src.[TransportKrajPid],
tgt.[SpecyficzneOkolicznosciPid]=src.[SpecyficzneOkolicznosciPid],
tgt.[LODGMENT]=src.[LODGMENT],
tgt.[MRN]=src.[MRN],
tgt.[TransportZnaki]=src.[TransportZnaki],
tgt.[SpecyficzneOkolicznosci]=src.[SpecyficzneOkolicznosci],
tgt.[TerminNaWynikWGranicy]=src.[TerminNaWynikWGranicy],
tgt.[MiejsceWyladunku]=src.[MiejsceWyladunku],
tgt.[STATUS]=src.[STATUS],
tgt.[AnalizaRyzyka]=src.[AnalizaRyzyka],
tgt.[IdPlacowkiPodmiotu]=src.[IdPlacowkiPodmiotu],
tgt.[PrzedstawienieTowaru]=src.[PrzedstawienieTowaru],
tgt.[FlagaIE351]=src.[FlagaIE351],
tgt.[UCWprowadzeniaPid]=src.[UCWprowadzeniaPid],
tgt.[Miejsce]=src.[Miejsce],
tgt.[Manualna]=src.[Manualna],
tgt.[UCWprowadzeniaZmienionyNa]=src.[UCWprowadzeniaZmienionyNa],
tgt.[FlagaPochodzeniaZgloszenia]=src.[FlagaPochodzeniaZgloszenia],
tgt.[REGI_CUST_EMAIL]=src.[REGI_CUST_EMAIL],
tgt.[RETR_EMAIL]=src.[RETR_EMAIL],
tgt.[NrDokumentu]=src.[NrDokumentu],
tgt.[UCWprowadzenia]=src.[UCWprowadzenia],
tgt.[Data]=src.[Data],
tgt.[UCWprowadzeniaStanNaGranicy]=src.[UCWprowadzeniaStanNaGranicy],
tgt.[UCZlozenia]=src.[UCZlozenia],
tgt.[FlagaWprowadzenia]=src.[FlagaWprowadzenia],
tgt.[CRN]=src.[CRN],
tgt.[FlagaIE319]=src.[FlagaIE319],
tgt.[DataZatwierdzeniaWAR]=src.[DataZatwierdzeniaWAR],
tgt.[OplatyTransportoweMPPid]=src.[OplatyTransportoweMPPid]

WHEN NOT MATCHED
THEN INSERT (
[AEO_CTRL_BTN], [dts], [DataRejestracji], [UCZlozeniaPid], [Typ], [MasaBrutto], [PodpisCyfrowy], [CONTAINERS], [DataPrzybycia], [TransportRodzajPid], [FlagaOptimisticLock], [TransportKraj], [LiczbaPozycji], [MiejsceZaladunku], [TransportRodzaj], [REPR_CUST_EMAIL], [OplatyTransportoweMP], [NrPrzewozowy], [NrWlasny], [LiczbaOpakowan], [DataPrzyjecia], [TransportKrajPid], [SpecyficzneOkolicznosciPid], [LODGMENT], [MRN], [TransportZnaki], [SpecyficzneOkolicznosci], [TerminNaWynikWGranicy], [MiejsceWyladunku], [STATUS], [AnalizaRyzyka], [IdPlacowkiPodmiotu], [PrzedstawienieTowaru], [FlagaIE351], [UCWprowadzeniaPid], [Miejsce], [Manualna], [UCWprowadzeniaZmienionyNa], [FlagaPochodzeniaZgloszenia], [REGI_CUST_EMAIL], [RETR_EMAIL], [NrDokumentu], [UCWprowadzenia], [Id], [Data], [UCWprowadzeniaStanNaGranicy], [UCZlozenia], [FlagaWprowadzenia], [CRN], [FlagaIE319], [DataZatwierdzeniaWAR], [OplatyTransportoweMPPid] )
VALUES ([AEO_CTRL_BTN], [dts], [DataRejestracji], [UCZlozeniaPid], [Typ], [MasaBrutto], [PodpisCyfrowy], [CONTAINERS], [DataPrzybycia], [TransportRodzajPid], [FlagaOptimisticLock], [TransportKraj], [LiczbaPozycji], [MiejsceZaladunku], [TransportRodzaj], [REPR_CUST_EMAIL], [OplatyTransportoweMP], [NrPrzewozowy], [NrWlasny], [LiczbaOpakowan], [DataPrzyjecia], [TransportKrajPid], [SpecyficzneOkolicznosciPid], [LODGMENT], [MRN], [TransportZnaki], [SpecyficzneOkolicznosci], [TerminNaWynikWGranicy], [MiejsceWyladunku], [STATUS], [AnalizaRyzyka], [IdPlacowkiPodmiotu], [PrzedstawienieTowaru], [FlagaIE351], [UCWprowadzeniaPid], [Miejsce], [Manualna], [UCWprowadzeniaZmienionyNa], [FlagaPochodzeniaZgloszenia], [REGI_CUST_EMAIL], [RETR_EMAIL], [NrDokumentu], [UCWprowadzenia], [Id], [Data], [UCWprowadzeniaStanNaGranicy], [UCZlozenia], [FlagaWprowadzenia], [CRN], [FlagaIE319], [DataZatwierdzeniaWAR], [OplatyTransportoweMPPid] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_KolejnyUrzadWprowadzenia]'
BEGIN
MERGE INTO [ais2].[PDS_KolejnyUrzadWprowadzenia] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_KolejnyUrzadWprowadzenia]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[UCWprowadzeniaPid]=src.[UCWprowadzeniaPid],
tgt.[Nazwa]=src.[Nazwa],
tgt.[IdDokPDS]=src.[IdDokPDS],
tgt.[Miejscowosc]=src.[Miejscowosc],
tgt.[KodPocztowy]=src.[KodPocztowy],
tgt.[UCWprowadzenia]=src.[UCWprowadzenia],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid],
tgt.[UlicaNumer]=src.[UlicaNumer]

WHEN NOT MATCHED
THEN INSERT (
[UCWprowadzeniaPid], [Nazwa], [IdDokPDS], [Miejscowosc], [KodPocztowy], [UCWprowadzenia], [Id], [Kraj], [KrajPid], [UlicaNumer] )
VALUES ([UCWprowadzeniaPid], [Nazwa], [IdDokPDS], [Miejscowosc], [KodPocztowy], [UCWprowadzenia], [Id], [Kraj], [KrajPid], [UlicaNumer] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PDS_InformacjaDodatkowa]'
BEGIN
MERGE INTO [ais2].[PDS_InformacjaDodatkowa] as tgt
USING [WA_StageHurtownia].[ais2].[PDS_InformacjaDodatkowa]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[KodInfDodatkowej]=src.[KodInfDodatkowej],
tgt.[KodInfDodatkowejPid]=src.[KodInfDodatkowejPid],
tgt.[IdTowarPDS]=src.[IdTowarPDS]

WHEN NOT MATCHED
THEN INSERT (
[KodInfDodatkowej], [Id], [KodInfDodatkowejPid], [IdTowarPDS] )
VALUES ([KodInfDodatkowej], [Id], [KodInfDodatkowejPid], [IdTowarPDS] );

SET @Merged = 1;
 END
IF @TableName = '[ais2].[PTW_DaneCelne]'
BEGIN
MERGE INTO [ais2].[PTW_DaneCelne] as tgt
USING [WA_StageHurtownia].[ais2].[PTW_DaneCelne]as src
ON (tgt.[Id]=src.[Id])
WHEN MATCHED
THEN UPDATE SET
tgt.[Szczegoly]=src.[Szczegoly],
tgt.[ENS_ID]=src.[ENS_ID],
tgt.[ZnacznikWprowadzenia]=src.[ZnacznikWprowadzenia],
tgt.[MRN]=src.[MRN],
tgt.[Kraj]=src.[Kraj],
tgt.[KrajPid]=src.[KrajPid],
tgt.[FlagaOdrzucenie]=src.[FlagaOdrzucenie],
tgt.[FlagaOdrzucenieStatus]=src.[FlagaOdrzucenieStatus],
tgt.[FlagaModyfikacji]=src.[FlagaModyfikacji],
tgt.[IdTowarPTW]=src.[IdTowarPTW],
tgt.[FlagaIE303]=src.[FlagaIE303],
tgt.[FlagaOdrzuceniePrzyczyna]=src.[FlagaOdrzuceniePrzyczyna]

WHEN NOT MATCHED
THEN INSERT (
[Szczegoly], [ENS_ID], [ZnacznikWprowadzenia], [MRN], [Id], [Kraj], [KrajPid], [FlagaOdrzucenie], [FlagaOdrzucenieStatus], [FlagaModyfikacji], [IdTowarPTW], [FlagaIE303], [FlagaOdrzuceniePrzyczyna] )
VALUES ([Szczegoly], [ENS_ID], [ZnacznikWprowadzenia], [MRN], [Id], [Kraj], [KrajPid], [FlagaOdrzucenie], [FlagaOdrzucenieStatus], [FlagaModyfikacji], [IdTowarPTW], [FlagaIE303], [FlagaOdrzuceniePrzyczyna] );

SET @Merged = 1;
 END




	IF (@Merged = 0)
	BEGIN
		DECLARE @Info VARCHAR(500) = 'W procedurze nie znaleziono bloku odpowiadającego tabeli [' + @TableName + '] z parametru @TableName.';
		THROW 51002, @Info, 0;
	END


END