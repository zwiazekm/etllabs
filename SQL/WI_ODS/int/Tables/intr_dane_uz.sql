﻿CREATE TABLE [int].[intr_dane_uz] (
    [id_uz]       VARCHAR (35)  NOT NULL,
    [id_pod]      VARCHAR (35)  NOT NULL,
    [nip]         VARCHAR (10)  NULL,
    [regon]       VARCHAR (14)  NULL,
    [nazwa]       VARCHAR (255) NULL,
    [imie]        VARCHAR (35)  NULL,
    [nazwisko]    VARCHAR (35)  NULL,
    [kod_kraj]    VARCHAR (2)   NULL,
    [kod_gmina]   VARCHAR (7)   NULL,
    [kod_poczt]   VARCHAR (8)   NULL,
    [poczta]      VARCHAR (35)  NULL,
    [miejscowosc] VARCHAR (35)  NULL,
    [ulica]       VARCHAR (45)  NULL,
    [nr_dom]      VARCHAR (9)   NULL,
    [nr_lok]      VARCHAR (5)   NULL,
    [telefon]     VARCHAR (35)  NULL,
    [faks]        VARCHAR (35)  NULL,
    [email]       VARCHAR (128) NULL,
    [uwagi]       VARCHAR (512) NULL,
    [dane_potw]   CHAR (1)      NULL,
    [pytanie]     CHAR (1)      NULL,
    [data_wpisu]  DATETIME      NULL,
    [data_aktual] DATETIME      NULL,
    CONSTRAINT [PK_INTR_DANE_UZ] PRIMARY KEY CLUSTERED ([id_uz] ASC) WITH (FILLFACTOR = 90) ON [FG_INT]
);

