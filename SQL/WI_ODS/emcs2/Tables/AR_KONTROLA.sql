﻿CREATE TABLE [emcs2].[AR_KONTROLA] (
    [ID]                          NUMERIC (38)   NOT NULL,
    [AR_DOKUMENT_ID]              NUMERIC (38)   NULL,
    [NUMER_DOKUMENTU_ZISAR]       VARCHAR (100)  NOT NULL,
    [ZRODLO]                      VARCHAR (36)   NOT NULL,
    [NR_ALGORYTMU]                VARCHAR (30)   NULL,
    [AUTOR]                       VARCHAR (30)   NULL,
    [WAR1]                        VARCHAR (36)   NULL,
    [WAR1_SO]                     VARCHAR (36)   NULL,
    [WAR24]                       VARCHAR (36)   NULL,
    [WAR24_SO]                    VARCHAR (36)   NULL,
    [WAR5_SO]                     VARCHAR (36)   NULL,
    [ZMIANA_WAR_UZASADNIENIE_SO]  VARCHAR (200)  NULL,
    [OBSZAR_RYZYKA]               VARCHAR (36)   NULL,
    [ZMIANA_MK_UZASADNIENIE_SO]   VARCHAR (200)  NULL,
    [TRESC_DYREKTYWY]             VARCHAR (350)  NULL,
    [INFORMACJA_DLA_DYSPOZYTORA]  VARCHAR (200)  NULL,
    [DECYZJA_DYSPOZYTORA_SO]      CHAR (1)       NULL,
    [ODST_OD_KONTROLI_UZASAD_SO]  VARCHAR (100)  NULL,
    [ADRESACI_DYREKTYWY_SO]       VARCHAR (2000) NULL,
    [ZALECENIE_DYSPOZYTORA_SO]    VARCHAR (350)  NULL,
    [DYR_DLA_KOLEJNEGO_UC_WPR_SO] VARCHAR (500)  NULL,
    [ZAKRES_PRZEBIEG_KONTROLI_SO] VARCHAR (200)  NULL,
    [WYNIK_KONTROLI_SO]           VARCHAR (36)   NULL,
    CONSTRAINT [PK_AR_KONTROLA] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_EMCS2]
);

