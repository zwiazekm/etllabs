﻿CREATE TABLE [aimp2].[ariadna_owk] (
    [id]                          NUMERIC (19)    NOT NULL,
    [dokument_id]                 NUMERIC (19)    NOT NULL,
    [numer_dokumentu_ZISAR]       NVARCHAR (300)  NULL,
    [zrodlo]                      NVARCHAR (108)  NULL,
    [nr_algorytmu]                NVARCHAR (90)   NULL,
    [autor]                       NVARCHAR (90)   NULL,
    [WAR1]                        NVARCHAR (108)  NULL,
    [WAR1_SO]                     NVARCHAR (108)  NULL,
    [WAR24]                       NVARCHAR (108)  NULL,
    [WAR24_SO]                    NVARCHAR (108)  NULL,
    [WAR5_SO]                     NVARCHAR (108)  NULL,
    [Zmiana_WAR_uzasadnienie_SO]  NVARCHAR (600)  NULL,
    [obszar_ryzyka]               NVARCHAR (108)  NULL,
    [Zmiana_mk_uz_SO]             NVARCHAR (600)  NULL,
    [tresc_dyrektywy]             NVARCHAR (1050) NULL,
    [informacja_dla_dyspozytora]  NVARCHAR (600)  NULL,
    [decyzja_dyspozytora_SO]      BIT             NOT NULL,
    [odst_od_kontroli_uz_SO]      NVARCHAR (300)  NULL,
    [adresaci_dyrektywy_SO]       NVARCHAR (3000) NULL,
    [zalecenie_dyspozytora_SO]    NVARCHAR (1050) NULL,
    [ddk_UC_wprowadzenia_SO]      NVARCHAR (1500) NULL,
    [zakres_przebieg_kontroli_SO] NVARCHAR (600)  NULL,
    [wynik_kontroli_SO]           NVARCHAR (108)  NULL,
    CONSTRAINT [ariadna_obsluga_wskazan_kontroli_PK] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIMP2],
    CONSTRAINT [ariadna_obsluga_wskazan_kontroli$ariadna_ob_1287112745] FOREIGN KEY ([dokument_id]) REFERENCES [aimp2].[ariadna_dokument] ([id])
);

