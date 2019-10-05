﻿CREATE TABLE [MF\BZRJ].[EM_celina_wawrz] (
    [Status]               CHAR (1)        NULL,
    [numer]                VARCHAR (40)    NULL,
    [DataPrzyjecia]        VARCHAR (10)    NULL,
    [Nadawca]              VARCHAR (14)    NULL,
    [NIP]                  VARCHAR (12)    NULL,
    [Nazwa]                VARCHAR (35)    NULL,
    [Ulica]                VARCHAR (35)    NULL,
    [Kod]                  VARCHAR (9)     NULL,
    [Miejscowosc]          VARCHAR (35)    NULL,
    [Odbiorca]             VARCHAR (14)    NULL,
    [TIN1]                 VARCHAR (12)    NULL,
    [Nazwa1]               VARCHAR (35)    NULL,
    [Ulica1]               VARCHAR (35)    NULL,
    [Kod1]                 VARCHAR (9)     NULL,
    [Miejscowosc1]         VARCHAR (35)    NULL,
    [Zgłaszający]          VARCHAR (14)    NULL,
    [TIN2]                 VARCHAR (12)    NULL,
    [Nazwa2]               VARCHAR (35)    NULL,
    [Ulica2]               VARCHAR (35)    NULL,
    [Kod2]                 VARCHAR (9)     NULL,
    [Miejscowosc2]         VARCHAR (35)    NULL,
    [KrajW]                VARCHAR (2)     NULL,
    [KodDos]               VARCHAR (3)     NULL,
    [Miejsce_dostawy]      VARCHAR (35)    NULL,
    [Kod_msc]              CHAR (1)        NULL,
    [Waluta]               VARCHAR (3)     NULL,
    [KursW]                DECIMAL (10, 4) NULL,
    [WartFak]              DECIMAL (17, 2) NULL,
    [UC_wwozu]             VARCHAR (8)     NULL,
    [NrPozyc]              SMALLINT        NULL,
    [CN]                   VARCHAR (8)     NULL,
    [OpisCN]               VARCHAR (1000)  NULL,
    [KrajPoch]             VARCHAR (2)     NULL,
    [Proce]                VARCHAR (4)     NULL,
    [WartoscPozycji]       DECIMAL (17, 2) NULL,
    [MasaNetto]            DECIMAL (14, 3) NULL,
    [IloscUzupelniajacaJm] DECIMAL (14, 3) NULL,
    [WarStat]              BIGINT          NULL,
    [rodz_dyrekt]          CHAR (1)        NULL,
    [tresc_dyr]            VARCHAR (1024)  NULL,
    [czaskontroli]         DATETIME        NULL,
    [koment_dysp]          VARCHAR (512)   NULL,
    [uwagi_dla_podm]       VARCHAR (255)   NULL
);

