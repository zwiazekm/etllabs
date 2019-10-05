﻿CREATE TABLE [ais2].[PTW_Dokument] (
    [Id]                        NUMERIC (19)    NOT NULL,
    [NrWlasny]                  VARCHAR (35)    NULL,
    [DataPrzyjecia]             DATETIME2 (3)   NULL,
    [Kontener]                  TINYINT         NULL,
    [DataPrzybycia]             DATETIME2 (3)   NULL,
    [KodKraju]                  VARCHAR (2)     NULL,
    [KodKrajuPid]               INT             NULL,
    [UCWprowadzenia]            VARCHAR (8)     NULL,
    [UCWprowadzeniaPid]         INT             NULL,
    [MasaBrutto]                NUMERIC (14, 3) NULL,
    [MasaBruttoUCWprow]         NUMERIC (14, 3) NULL,
    [MasaBruttoUCWprowKom]      VARCHAR (255)   NULL,
    [DataWprowadzenia]          DATETIME2 (3)   NULL,
    [LiczbaPozycji]             INT             NULL,
    [LiczbaPozycjiUCWprow]      INT             NULL,
    [LiczbaPozycjiUCWprowKom]   VARCHAR (255)   NULL,
    [LiczbaOpakowan]            INT             NULL,
    [LiczbaOpakowanUCWprow]     INT             NULL,
    [LiczbaOpakowanUCWprowKom]  VARCHAR (255)   NULL,
    [DataPrzedstawienia]        DATETIME2 (3)   NULL,
    [EmailWprowadzajacego]      VARCHAR (70)    NULL,
    [DataRejestracji]           DATETIME2 (3)   NULL,
    [Status]                    VARCHAR (4)     NULL,
    [TransportZnaki]            VARCHAR (31)    NULL,
    [TransportRodzaj]           VARCHAR (2)     NULL,
    [TransportRodzajPid]        INT             NULL,
    [TransportNaGranicy_Rodzaj] VARCHAR (4)     NULL,
    [TransportNaGranicy_Znaki]  VARCHAR (35)    NULL,
    [MiejsceIData_Data]         DATETIME2 (3)   NULL,
    [MiejsceIData_Miejsce]      VARCHAR (35)    NULL,
    [TAB_COUN]                  VARCHAR (2)     NULL,
    [DataIE302]                 DATETIME2 (3)   NULL,
    [PierwszyUCWprow]           VARCHAR (8)     NULL,
    [PierwszyUCWprowPid]        INT             NULL,
    [NrDokumentu]               VARCHAR (35)    NULL,
    CONSTRAINT [PTW_Dokument$PK_PTW_Dokument] PRIMARY KEY CLUSTERED ([Id] ASC)
);

