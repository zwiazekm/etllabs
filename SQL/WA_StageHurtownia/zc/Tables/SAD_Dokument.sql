﻿CREATE TABLE [zc].[SAD_Dokument] (
    [IdDok]                 BIGINT          NOT NULL,
    [RodzajDok]             VARCHAR (4)     NULL,
    [Typ]                   CHAR (1)        NULL,
    [TypPid]                INT             NULL,
    [Podtyp]                CHAR (1)        NULL,
    [PodtypPid]             INT             NULL,
    [CzyPowiadomienie]      BIT             NULL,
    [NrCelina]              VARCHAR (40)    NULL,
    [IdentDok]              VARCHAR (40)    NULL,
    [WersjaXML]             VARCHAR (7)     NULL,
    [IdSkladajacy]          INT             NULL,
    [DataPrzeslania]        DATETIME        NULL,
    [UrzadRejestracji]      VARCHAR (8)     NULL,
    [UrzadRejestracjiPid]   INT             NULL,
    [PasRejestracji]        CHAR (2)        NULL,
    [DataPrzedstawienia]    DATETIME        NULL,
    [NrCelina2]             VARCHAR (40)    NULL,
    [Status]                CHAR (1)        NULL,
    [DataPrzyjecia]         DATETIME        NULL,
    [TerminPU]              DATETIME        NULL,
    [TerminNaSAD]           DATETIME        NULL,
    [DostarczenieSAD]       CHAR (1)        NULL,
    [ZwolnienieTowaru]      CHAR (1)        NULL,
    [PotwierdzenieWywozu]   CHAR (1)        NULL,
    [TerminBilansowania]    DATETIME        NULL,
    [EtapBilansowania]      CHAR (1)        NULL,
    [Zefir]                 CHAR (1)        NULL,
    [RejestrDluguCelnego]   VARCHAR (20)    NULL,
    [Wykaz]                 VARCHAR (30)    NULL,
    [PozycjaWykazu]         INT             NULL,
    [DataRejestracji]       DATETIME        NULL,
    [P1a]                   CHAR (2)        NULL,
    [P1aPid]                INT             NULL,
    [P1b]                   CHAR (1)        NULL,
    [P1bPid]                INT             NULL,
    [P1c]                   VARCHAR (5)     NULL,
    [P1cPid]                INT             NULL,
    [ListyTowarowe]         INT             NULL,
    [Pozycje]               SMALLINT        NULL,
    [LiczbaOpakowan]        INT             NULL,
    [NrAkt]                 VARCHAR (14)    NULL,
    [SzczegolyWartosci]     CHAR (1)        NULL,
    [SzczegolyWartosciPid]  INT             NULL,
    [Przedstawicielstwo]    CHAR (1)        NULL,
    [PrzedstawicielstwoPid] INT             NULL,
    [Wskaznik]              VARCHAR (5)     NULL,
    [WskaznikPid]           INT             NULL,
    [IdZglaszajacy]         INT             NULL,
    [DataWpisu]             DATETIME        NULL,
    [NrWpisu]               VARCHAR (35)    NULL,
    [KrajWysylki]           CHAR (2)        NULL,
    [KrajWysylkiPid]        INT             NULL,
    [KrajPrzeznaczenia]     CHAR (2)        NULL,
    [KrajPrzeznaczeniaPid]  INT             NULL,
    [CzyKontenery]          BIT             NULL,
    [KodDost]               CHAR (3)        NULL,
    [KodDostPid]            INT             NULL,
    [MiejsceDost]           VARCHAR (35)    NULL,
    [MiejsceKodDost]        CHAR (1)        NULL,
    [MiejsceKodDostPid]     INT             NULL,
    [Waluta]                CHAR (3)        NULL,
    [WalutaPid]             INT             NULL,
    [WartoscFaktury]        DECIMAL (17, 2) NULL,
    [KursWaluty]            DECIMAL (10, 4) NULL,
    [RodzTransakcji]        CHAR (2)        NULL,
    [RodzTransakcjiPid]     INT             NULL,
    [MasaBrutto]            DECIMAL (14, 3) NULL,
    [PlatnoscOdroczona]     VARCHAR (25)    NULL,
    [IdOdbiorcaKarty3]      INT             NULL,
    [KodWynikuKontroli]     CHAR (2)        NULL,
    [TerminDostarczenia]    DATETIME        NULL,
    [IloscZamkniec]         SMALLINT        NULL,
    [Miejsce]               VARCHAR (35)    NULL,
    [Data]                  DATETIME        NULL,
    [IdGlownyZobowiazany]   INT             NULL,
    [IdUpowaznionyOdbiorca] INT             NULL,
    CONSTRAINT [PK_SAD_Dokument] PRIMARY KEY CLUSTERED ([IdDok] ASC)
);

