﻿CREATE TABLE [MF\BZRJ].[EM_907_ICS_Tabak] (
    [PDS]                          VARCHAR (35)    NULL,
    [Data otwarcia]                CHAR (10)       NULL,
    [Urząd wprowadzenia]           VARCHAR (8)     NULL,
    [Liczba opakowań]              INT             NULL,
    [Rodzaj opakowań]              VARCHAR (2)     NULL,
    [Nr przewozu]                  VARCHAR (35)    NULL,
    [Miejsce załadunku]            NVARCHAR (35)   NULL,
    [Miejsce wyładunku]            NVARCHAR (35)   NULL,
    [Masa brutto w kg]             NUMERIC (14, 3) NULL,
    [Data przybycia]               CHAR (10)       NULL,
    [Nadawca TIN]                  VARCHAR (17)    NULL,
    [Nadawca Firma]                NVARCHAR (35)   NULL,
    [Nadawca Adres]                NVARCHAR (35)   NULL,
    [Nadawca Miejscowość]          NVARCHAR (35)   NULL,
    [Nadawca Kod poczt]            VARCHAR (9)     NULL,
    [Nadawca Kraj]                 VARCHAR (2)     NULL,
    [Odbiorca TIN]                 VARCHAR (17)    NULL,
    [Odbiorca Firma]               NVARCHAR (35)   NULL,
    [Odbiorca Adres]               NVARCHAR (35)   NULL,
    [Odbiorca Miejscowość]         NVARCHAR (35)   NULL,
    [Odbiorca Kod poczt]           VARCHAR (9)     NULL,
    [Odbiorca Kraj]                VARCHAR (2)     NULL,
    [Składający TIN]               VARCHAR (17)    NULL,
    [Składający Firma]             NVARCHAR (35)   NULL,
    [Składający Adres]             NVARCHAR (35)   NULL,
    [[Składający Miejscowość]      NVARCHAR (35)   NULL,
    [Składający Kod pocztowy]      VARCHAR (9)     NULL,
    [Składający Kraj]              VARCHAR (2)     NULL,
    [Osoba kontaktowa TIN]         VARCHAR (17)    NULL,
    [Osoba kontaktowa Frma]        NVARCHAR (35)   NULL,
    [Osoba kontaktowa Adres]       NVARCHAR (35)   NULL,
    [Osoba kontaktowa Miejscowość] NVARCHAR (35)   NULL,
    [[Osoba kontaktowa Kod poczt]  VARCHAR (9)     NULL,
    [Osoba kontaktowa Kraj]        VARCHAR (2)     NULL,
    [Przedstawiciel TIN]           VARCHAR (17)    NULL,
    [Przedstawiciel Firma]         NVARCHAR (35)   NULL,
    [Przedstawiciel Adres]         NVARCHAR (35)   NULL,
    [Przedstawiciel Miejscowość]   NVARCHAR (35)   NULL,
    [Przedstawiciel Kod pocztowy]  VARCHAR (9)     NULL,
    [Przedstawiciel Kraj]          VARCHAR (2)     NULL,
    [Wprowadzajacy TIN]            VARCHAR (17)    NULL,
    [Wprowadzajacy Firma]          NVARCHAR (35)   NULL,
    [Wprowadzajacy Adres]          NVARCHAR (35)   NULL,
    [Wprowadzajacy Miejscowość]    NVARCHAR (35)   NULL,
    [Wprowadzajacy Kod pocztowy]   VARCHAR (9)     NULL,
    [[Wprowadzajacy Kraj]          VARCHAR (2)     NULL,
    [Transp gr RODZAJ]             VARCHAR (2)     NULL,
    [Transp gr KRAJ]               VARCHAR (2)     NULL,
    [Transp gr ZNAKI]              VARCHAR (31)    NULL,
    [Transp ZNAKI]                 VARCHAR (31)    NULL,
    [Nr Poz Tow]                   INT             NULL,
    [Kod towaru]                   VARCHAR (8)     NULL,
    [Kol Urz Wpr]                  VARCHAR (8)     NULL,
    [Opis towaru]                  NVARCHAR (280)  NULL,
    [Opis towaru gr]               VARCHAR (280)   NULL,
    [Kontenery]                    VARCHAR (255)   NULL,
    [TowNieb]                      VARCHAR (4)     NULL,
    [Status poz tow]               VARCHAR (4)     NULL,
    [Bilansowanie]                 TINYINT         NULL
);

