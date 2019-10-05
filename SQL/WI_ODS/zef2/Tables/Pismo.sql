﻿CREATE TABLE [zef2].[Pismo] (
    [IDPisma]                         INT             NOT NULL,
    [IDSprawyG]                       INT             NULL,
    [NumerPisma]                      NVARCHAR (50)   NULL,
    [NumerKolejnyPismaWSprawie]       INT             NULL,
    [UNP]                             NVARCHAR (50)   NULL,
    [IDJednostki]                     INT             NOT NULL,
    [DataCzasWprowadzenia]            DATETIME        NOT NULL,
    [PismoDotyczy]                    NVARCHAR (MAX)  NULL,
    [IDPismaNaKtoreJestOdpowiedzia]   INT             NULL,
    [IDKierunkuPisma]                 INT             NOT NULL,
    [IDSposobuObslugiPisma]           INT             NOT NULL,
    [MaksymalnaDataCzasOdpowiedzi]    DATETIME        NULL,
    [LiczbaGodzinDlaPowiadomienia]    INT             NULL,
    [NumerPismaPrzychodzacego]        NVARCHAR (150)  NULL,
    [DataWyslaniaPisma]               DATETIME        NULL,
    [DataCzasRozpatrzeniaPisma]       DATETIME        NULL,
    [DataCzasWygenerowaniaOdpowiedzi] DATETIME        NULL,
    [DostepneDoOdczytu]               BIT             CONSTRAINT [DF_Pismo_DostepneDoOdczytu] DEFAULT ((1)) NOT NULL,
    [DataWplynieciaOdpowiedzi]        DATETIME        NULL,
    [IDAutoraPisma]                   INT             NULL,
    [IDPionu]                         INT             NULL,
    [Adresat]                         NVARCHAR (100)  NULL,
    [DataCzasZaznaczeniaWyslania]     DATETIME        NULL,
    [SlowaKluczowe]                   NVARCHAR (500)  NULL,
    [IDStatusuPismaRoboczego]         INT             CONSTRAINT [DF_Pismo_PismoRobocze] DEFAULT ((0)) NULL,
    [DekretacjaXML]                   NTEXT           NULL,
    [NowaSprawaXML]                   NTEXT           NULL,
    [NazwaDostawcy]                   NVARCHAR (200)  NULL,
    [LoginDostawcy]                   NVARCHAR (50)   NULL,
    [Slowniki]                        NVARCHAR (500)  NULL,
    [NrListuPoleconego]               NVARCHAR (50)   NULL,
    [Archiwum]                        BIT             CONSTRAINT [DF_Pismo_Archiwum] DEFAULT ((0)) NOT NULL,
    [OsobaZanoszaca]                  NVARCHAR (100)  NULL,
    [IDPriorytetu]                    INT             CONSTRAINT [DF_Pismo_IDPriorytetu] DEFAULT ((1)) NULL,
    [DataWplyniecia]                  DATETIME        NULL,
    [IDTypuPisma]                     INT             CONSTRAINT [DF_Pismo_IDTypuPisma] DEFAULT ((1)) NOT NULL,
    [IDTypuFormularza]                INT             NULL,
    [IDAkceptujacego]                 INT             NULL,
    [IdMetadaneObiektu]               INT             NULL,
    [INT01]                           INT             NULL,
    [INT02]                           INT             NULL,
    [INT03]                           INT             NULL,
    [INT04]                           INT             NULL,
    [INT05]                           INT             NULL,
    [INT06]                           INT             NULL,
    [INT07]                           INT             NULL,
    [INT08]                           INT             NULL,
    [INT09]                           INT             NULL,
    [INT10]                           INT             NULL,
    [INT11]                           INT             NULL,
    [INT12]                           INT             NULL,
    [INT13]                           INT             NULL,
    [INT14]                           INT             NULL,
    [INT15]                           INT             NULL,
    [BIT01]                           BIT             NULL,
    [BIT02]                           BIT             NULL,
    [BIT03]                           BIT             NULL,
    [BIT04]                           BIT             NULL,
    [BIT05]                           BIT             NULL,
    [BIT06]                           BIT             NULL,
    [BIT07]                           BIT             NULL,
    [BIT08]                           BIT             NULL,
    [BIT09]                           BIT             NULL,
    [BIT10]                           BIT             NULL,
    [TXT01]                           NVARCHAR (255)  NULL,
    [TXT02]                           NVARCHAR (255)  NULL,
    [TXT03]                           NVARCHAR (255)  NULL,
    [TXT04]                           NVARCHAR (MAX)  NULL,
    [TXT05]                           NVARCHAR (MAX)  NULL,
    [TXT06]                           NVARCHAR (MAX)  NULL,
    [TXT07]                           NVARCHAR (255)  NULL,
    [TXT08]                           NVARCHAR (MAX)  NULL,
    [TXT09]                           NVARCHAR (MAX)  NULL,
    [TXT10]                           NVARCHAR (MAX)  NULL,
    [TXT11]                           NVARCHAR (MAX)  NULL,
    [TXT12]                           NVARCHAR (MAX)  NULL,
    [TXT13]                           NVARCHAR (MAX)  NULL,
    [TXT14]                           NVARCHAR (MAX)  NULL,
    [TXT15]                           NVARCHAR (MAX)  NULL,
    [Usuniete]                        BIT             CONSTRAINT [DF_Pismo_Usuniete] DEFAULT ((0)) NOT NULL,
    [DataOstatniejModyfikacji]        DATETIME        CONSTRAINT [DF_Pismo_DataOstatniejModyfikacji] DEFAULT (getdate()) NOT NULL,
    [WersjaElektroniczna]             BIT             NULL,
    [NumerPismaUnp]                   INT             NULL,
    [IDOryginalu]                     INT             NULL,
    [IDInstancji]                     INT             NULL,
    [IDAutoraOstatniejModyfikacji]    INT             NULL,
    [Data01]                          DATETIME        NULL,
    [Data02]                          DATETIME        NULL,
    [Data03]                          DATETIME        NULL,
    [Data04]                          DATETIME        NULL,
    [Data05]                          DATETIME        NULL,
    [Data06]                          DATETIME        NULL,
    [DATA07]                          DATETIME        NULL,
    [DATA08]                          DATETIME        NULL,
    [DATA09]                          DATETIME        NULL,
    [DATA10]                          DATETIME        NULL,
    [DATA11]                          DATETIME        NULL,
    [DATA12]                          DATETIME        NULL,
    [DATA13]                          DATETIME        NULL,
    [DATA14]                          DATETIME        NULL,
    [DATA15]                          DATETIME        NULL,
    [Kwota01]                         DECIMAL (16, 2) NULL,
    [Kwota02]                         DECIMAL (16, 2) NULL,
    [Kwota03]                         DECIMAL (16, 2) NULL,
    [Kwota04]                         DECIMAL (16, 2) NULL,
    [Kwota05]                         DECIMAL (16, 2) NULL,
    [KWOTA06]                         DECIMAL (16, 2) NULL,
    [KWOTA07]                         DECIMAL (16, 2) NULL,
    [KWOTA08]                         DECIMAL (16, 2) NULL,
    [KWOTA09]                         DECIMAL (16, 2) NULL,
    [KWOTA10]                         DECIMAL (16, 2) NULL,
    [KWOTA11]                         DECIMAL (16, 2) NULL,
    [KWOTA12]                         DECIMAL (16, 2) NULL,
    [KWOTA13]                         DECIMAL (16, 2) NULL,
    [KWOTA14]                         DECIMAL (16, 2) NULL,
    [KWOTA15]                         DECIMAL (16, 2) NULL,
    [Liczba01]                        FLOAT (53)      NULL,
    [Liczba02]                        FLOAT (53)      NULL,
    [DaneXML]                         NVARCHAR (MAX)  NULL,
    [DataStemplaPocztowego]           DATETIME        NULL,
    [IDPoziomJawnosci]                INT             CONSTRAINT [DF_PoziomJawnosci] DEFAULT ((1)) NULL,
    [FullTextSearchSlowaKluczowe]     AS              (isnull([SlowaKluczowe],'')),
    [FullTextSearchPismoDotyczy]      AS              (isnull([PismoDotyczy],'')),
    [IdTypuLimitowanego]              INT             NULL,
    [IDZastepcyWykonujacego]          INT             NULL,
    [ZalacznikiOpis]                  NVARCHAR (1000) NULL,
    [ZalacznikiIlosc]                 INT             NULL,
    [KodKreskowy]                     NVARCHAR (50)   NULL,
    [Pismo_ZNosnikaDanych]            INT             NULL,
    [Pismo_OdwzorowanoWCalosci]       INT             NULL,
    [PismoEPUAP_Status]               INT             NULL,
    [PismoEPUAP_Podmiot]              NVARCHAR (200)  NULL,
    [PismoEPUAP_Skrzynka]             NVARCHAR (200)  NULL,
    [PismoEPUAP_CzyDodanyKontrahent]  BIT             NULL,
    [ZamknijSprawe]                   INT             NULL,
    [StatusDanychKontrahenta]         INT             DEFAULT ((0)) NOT NULL,
    [Oryginal_W]                      INT             NULL,
    [Przeczytano]                     NVARCHAR (MAX)  NULL,
    [DatePrzywroceniaZArchiwum]       DATETIME        NULL,
    [DotyczySprawy]                   NVARCHAR (200)  NULL,
    [TrescPisma]                      NVARCHAR (MAX)  NULL,
    [TrescPismaDane]                  VARBINARY (MAX) NULL,
    [IDJednostkiOrganizacyjnej]       INT             NULL,
    [ObszarTematyczny]                INT             NULL,
    [Dostep]                          NVARCHAR (50)   DEFAULT ('publiczne') NULL,
    [Jezyk]                           NVARCHAR (50)   DEFAULT ('pl') NULL,
    [Format]                          NVARCHAR (50)   NULL,
    [Typ]                             NVARCHAR (50)   DEFAULT ('Text') NULL,
    [IDJRWA]                          INT             NULL,
    [IDPismaCRD]                      NVARCHAR (250)  NULL,
    [xDaneXML]                        XML             NULL,
    [IDJednostkiBazowe]               INT             NULL,
    [FullTextSearch]                  NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_Pismo] PRIMARY KEY CLUSTERED ([IDPisma] ASC) WITH (FILLFACTOR = 90) ON [FG_ZEF2],
    CONSTRAINT [IX_Pismo] UNIQUE NONCLUSTERED ([IDPisma] ASC) WITH (FILLFACTOR = 90) ON [FG_ZEF2]
) TEXTIMAGE_ON [FG_ZEF2];


GO
ALTER TABLE [zef2].[Pismo] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20160518-140709]
    ON [zef2].[Pismo]([INT01] ASC)
    ON [FG_ZEF2];

