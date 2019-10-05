﻿CREATE TABLE [MF\FPLC].[klucz_AIS] (
    [status_deklaracji]                 NVARCHAR (4)    NULL,
    [status_pozycji]                    NVARCHAR (4)    NULL,
    [nr_MRN]                            NVARCHAR (35)   NULL,
    [nr_własny]                         NVARCHAR (35)   NULL,
    [ROk]                               INT             NULL,
    [kwartal]                           INT             NULL,
    [rok_miesiąc]                       VARCHAR (4)     NULL,
    [data_przyjęcia]                    VARCHAR (10)    NULL,
    [Data_zwolnienia_towaru]            VARCHAR (10)    NULL,
    [Typ_Zgłoszenia]                    NVARCHAR (3)    NULL,
    [ADDITIONAL_DECL_TYPE]              NVARCHAR (5)    NULL,
    [Urząd_celny_zgłoszenia]            NVARCHAR (8)    NULL,
    [Urząd_celny_wprowadzenia]          NVARCHAR (8)    NULL,
    [Urząd_celny_Przedstawienia_towaru] BIT             NOT NULL,
    [Masa_brutto]                       NUMERIC (16, 6) NULL,
    [Liczba_pozycji]                    NUMERIC (5)     NULL,
    [Liczba_opakowań]                   NUMERIC (8)     NULL,
    [Odbiorca]                          NVARCHAR (14)   NULL,
    [NIP_O]                             NVARCHAR (17)   NULL,
    [Eori_O]                            NVARCHAR (17)   NULL,
    [Nazwa_O]                           NVARCHAR (70)   NULL,
    [Kraj_Wysyłki_Dekl]                 NVARCHAR (2)    NULL,
    [Kraj_Przeznaczenia_Dekl]           NVARCHAR (2)    NULL,
    [NrPozyc]                           NUMERIC (5)     NULL,
    [kod_CN]                            NVARCHAR (8)    NULL,
    [Kod_TARIC]                         NVARCHAR (2)    NULL,
    [OpisCN]                            NVARCHAR (1000) NULL,
    [Kod_preferencji]                   NVARCHAR (3)    NULL,
    [kod_kraju_pochodzenia]             NVARCHAR (2)    NULL,
    [Procedura]                         NVARCHAR (7)    NULL,
    [Procedura_poprzednia]              NVARCHAR (2)    NULL,
    [KwotaAKC]                          NUMERIC (16, 2) NULL
);

