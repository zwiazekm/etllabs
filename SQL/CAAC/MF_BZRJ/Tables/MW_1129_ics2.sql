﻿CREATE TABLE [MF\BZRJ].[MW_1129_ics2] (
    [Status]                   VARCHAR (4)     NULL,
    [Nr_własny]                VARCHAR (35)    NULL,
    [PodpisJest]               TINYINT         NULL,
    [Nr_ICS]                   VARCHAR (35)    NULL,
    [ICS_DECL]                 TINYINT         NULL,
    [MRN]                      VARCHAR (18)    NULL,
    [UC_Wprowadzenia_1]        VARCHAR (8)     NULL,
    [UC_Zlozenia]              VARCHAR (255)   NULL,
    [Przedstawienie_Towaru]    TINYINT         NULL,
    [Liczba_Pozycji]           INT             NULL,
    [Liczba_Opk]               INT             NULL,
    [CRN_1]                    NVARCHAR (70)   NULL,
    [Nr_Przewozowy]            VARCHAR (35)    NULL,
    [Miejsce_Zaladunku_1]      NVARCHAR (35)   NULL,
    [Miejsce_Wyładunku_1]      NVARCHAR (35)   NULL,
    [Masa_Brutto_1]            NUMERIC (14, 3) NULL,
    [Spec_Okoliczności]        VARCHAR (1)     NULL,
    [Oplaty_TranspMP]          VARCHAR (1)     NULL,
    [DataRejestracji]          DATETIME2 (3)   NULL,
    [Data_Przybycia]           DATETIME2 (3)   NULL,
    [Data_Akceptacji]          DATETIME2 (3)   NULL,
    [Data_Zatw_WAR]            DATETIME2 (3)   NULL,
    [cust_type_skladający]     VARCHAR (255)   NULL,
    [Skladajacy]               NVARCHAR (35)   NULL,
    [Skladajacy_TIN]           VARCHAR (17)    NULL,
    [Skladajacy_ADR]           NVARCHAR (35)   NULL,
    [Skladajacy_K_POCZT]       VARCHAR (9)     NULL,
    [Skladajacy_MIASTO]        NVARCHAR (35)   NULL,
    [Skladajacy_KRAJ]          VARCHAR (2)     NULL,
    [cust_type_wprowadzajacy]  VARCHAR (255)   NULL,
    [Wprowadzajacy]            NVARCHAR (35)   NULL,
    [Wprowadzajacy_TIN]        VARCHAR (17)    NULL,
    [Wprowadzajacy_ADR]        NVARCHAR (35)   NULL,
    [Wprowadzajacy_K_POCZT]    VARCHAR (9)     NULL,
    [Wprowadzajacy_MIASTO]     NVARCHAR (35)   NULL,
    [Wprowadzajacy_KRAJ]       VARCHAR (2)     NULL,
    [cust_type_nadawca]        VARCHAR (255)   NULL,
    [Nadawca]                  NVARCHAR (35)   NULL,
    [Nadawca_TIN]              VARCHAR (17)    NULL,
    [Nadawca_ADR]              NVARCHAR (35)   NULL,
    [Nadawca_K_POCZT]          VARCHAR (9)     NULL,
    [Nadawca_MIASTO]           NVARCHAR (35)   NULL,
    [Nadawca_KRAJ]             VARCHAR (2)     NULL,
    [cust_type_odbiorca]       VARCHAR (255)   NULL,
    [Odbiorca]                 NVARCHAR (35)   NULL,
    [Odbiorca_TIN]             VARCHAR (17)    NULL,
    [Odbiorca_ADR]             NVARCHAR (35)   NULL,
    [Odbiorca_K_POCZT]         VARCHAR (9)     NULL,
    [Odbiorca_MIASTO]          NVARCHAR (35)   NULL,
    [Odbiorca_KRAJ]            VARCHAR (2)     NULL,
    [cust_type_przedstawiciel] VARCHAR (255)   NULL,
    [Przedstawiciel]           NVARCHAR (35)   NULL,
    [Przedstawiciel_TIN]       VARCHAR (17)    NULL,
    [Przedstawiciel_ADR]       NVARCHAR (35)   NULL,
    [Przedstawiciel_K_POCZT]   VARCHAR (9)     NULL,
    [Przedstawiciel_MIASTO]    NVARCHAR (35)   NULL,
    [Przedstawiciel_KRAJ]      VARCHAR (2)     NULL,
    [cust_type_osKontakt]      VARCHAR (255)   NULL,
    [OsobaKontakt]             NVARCHAR (35)   NULL,
    [OsobaKontakt_TIN]         VARCHAR (17)    NULL,
    [OsobaKontakt_ADR]         NVARCHAR (35)   NULL,
    [OsobaKontakt_K_POCZT]     VARCHAR (9)     NULL,
    [OsobaKontakt_MIASTO]      NVARCHAR (35)   NULL,
    [OsobaKontakt_KRAJ]        VARCHAR (2)     NULL,
    [Rodzaj_transp]            VARCHAR (2)     NULL,
    [Znaki_śr_transportu]      VARCHAR (31)    NULL,
    [Kraj_śr_transportu]       VARCHAR (2)     NULL,
    [ID]                       NUMERIC (19)    NULL,
    [UC_Wprowadzenia]          VARCHAR (8)     NULL,
    [UC_Nazwa]                 VARCHAR (255)   NULL,
    [UC_Ulica]                 VARCHAR (35)    NULL,
    [UC_kod_pocztowy]          VARCHAR (9)     NULL,
    [UC_Miasto]                VARCHAR (35)    NULL,
    [UC_kraj]                  VARCHAR (2)     NULL,
    [Miejsce]                  VARCHAR (35)    NULL,
    [Data]                     DATETIME2 (3)   NULL,
    [towar_Nr]                 INT             NULL,
    [CRN]                      NVARCHAR (70)   NULL,
    [Opis_towaru]              NVARCHAR (280)  NULL,
    [Kod_towarowy]             VARCHAR (8)     NULL,
    [Miejsce_załadunku]        NVARCHAR (35)   NULL,
    [Miejsce_wyładunku]        NVARCHAR (35)   NULL,
    [Masa_brutto]              NUMERIC (14, 3) NULL,
    [Towar_niebezpieczny]      VARCHAR (4)     NULL,
    [Opłaty_transportowe]      VARCHAR (1)     NULL,
    [Bilansowanie]             TINYINT         NULL,
    [NadawcaTow]               NVARCHAR (35)   NULL,
    [NadawcaTow_TIN]           VARCHAR (17)    NULL,
    [NadawcaTow_ADR]           VARCHAR (35)    NULL,
    [NadawcaTow_K_POCZT]       VARCHAR (9)     NULL,
    [NadawcaTow_MIASTO]        VARCHAR (35)    NULL,
    [NadawcaTow_KRAJ]          VARCHAR (2)     NULL,
    [cust_type_odbiorcaTow2]   INT             NULL,
    [OdbiorcaTow]              NVARCHAR (35)   NULL,
    [OdbiorcaTow_TIN]          VARCHAR (17)    NULL,
    [OdbiorcaTow_ADR]          VARCHAR (35)    NULL,
    [OdbiorcaTow_K_POCZT]      VARCHAR (9)     NULL,
    [OdbiorcaTow_MIASTO]       VARCHAR (35)    NULL,
    [OdbiorcaTow_KRAJ]         VARCHAR (2)     NULL,
    [cust_type_osobaKont2]     INT             NULL,
    [OsobaKontakt2]            NVARCHAR (35)   NULL,
    [OsobaKontakt_TIN2]        VARCHAR (17)    NULL,
    [OsobaKontakt_ADR2]        VARCHAR (35)    NULL,
    [OsobaKontakt_K_POCZT2]    VARCHAR (9)     NULL,
    [OsobaKontakt_MIASTO2]     VARCHAR (35)    NULL,
    [OsobaKontakt_KRAJ2]       VARCHAR (2)     NULL,
    [Typ_transp_na_gran]       VARCHAR (2)     NULL,
    [Znaki_trans_na_granicy]   VARCHAR (31)    NULL,
    [Kraj_trans_na_gran]       VARCHAR (2)     NULL
);

