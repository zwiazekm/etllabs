﻿CREATE TABLE [zef2].[RZIS_Pozycje] (
    [Opis]                              NVARCHAR (250)   NULL,
    [NumerWiersza]                      NUMERIC (32, 16) NULL,
    [StanNaKoniecRokuPoprzedniego]      NUMERIC (32, 16) NULL,
    [StanNaKoniecRokuBiezacego]         NUMERIC (32, 16) NULL,
    [KodWiersza]                        NVARCHAR (10)    NULL,
    [IdSprawozdania]                    BIGINT           NULL,
    [Wymiar]                            BIGINT           NULL,
    [Klasyfikacja]                      BIGINT           NULL,
    [Dzial]                             NVARCHAR (10)    NULL,
    [Rozdzial]                          NVARCHAR (10)    NULL,
    [Paragraf]                          NVARCHAR (10)    NULL,
    [KodProjektu]                       NVARCHAR (18)    NULL,
    [IdProgramu]                        NVARCHAR (18)    NULL,
    [KodGrupyZatrudnienia]              NVARCHAR (10)    NULL,
    [KontoKsiegowe]                     BIGINT           NULL,
    [DataGodzOstatnModyfikacji]         DATETIME         NULL,
    [IdUzytkownikaOstatnModyfikujacego] NVARCHAR (8)     NULL,
    [IdTransakcjiModyfikacji]           BIGINT           NULL,
    [DataGodzUtworzeniaRekordu]         DATETIME         NULL,
    [IdUzytkownikaTworzacego]           NVARCHAR (8)     NULL,
    [IdTransakcjiUtworzeniaRekordu]     BIGINT           NULL,
    [WersjaRekordu]                     INT              NULL,
    [Partycja]                          BIGINT           NULL,
    [IdentyfikatoRekordu]               BIGINT           NOT NULL,
    [Dzialanie]                         NVARCHAR (15)    NULL,
    [Czesc]                             INT              NULL,
    [NazwaProgramu]                     NVARCHAR (200)   NULL,
    [NazwaOdbiorcy]                     NVARCHAR (200)   NULL,
    [AdresOdbiorcy]                     NVARCHAR (250)   NULL,
    [PrzyczynyDecyzjiUmorzenia]         INT              NULL,
    [KodPozycjiTrezor]                  NVARCHAR (60)    NULL,
    [KodSekcjiTrezor]                   NVARCHAR (60)    NULL,
    [Uwagi]                             NVARCHAR (150)   NULL,
    [operacja]                          NVARCHAR (1)     NULL,
    CONSTRAINT [RZIS_Pozycje_pk] PRIMARY KEY CLUSTERED ([IdentyfikatoRekordu] ASC),
    CHECK ([IdentyfikatoRekordu]<>(0))
);

