﻿CREATE TABLE [zef2].[DefinicjaWierszySprawozdania] (
    [KodWiersza]                         NVARCHAR (10)  NULL,
    [Opis]                               NVARCHAR (250) NULL,
    [Kolejnosc]                          INT            NULL,
    [TagXML]                             NVARCHAR (30)  NULL,
    [WierszSumowany]                     NVARCHAR (250) NULL,
    [WierszDynamiczny]                   INT            NULL,
    [NaDzien]                            DATETIME       NULL,
    [KodWierszaSprawozdSkonsolidowanego] NVARCHAR (10)  NULL,
    [IdentyfikatorSprawozdania]          BIGINT         NULL,
    [WierszNaglowkowy]                   INT            NULL,
    [DataGodzOstatnModyfikacji]          DATETIME       NULL,
    [IdUzytkownikaOstatnModyfikujacego]  NVARCHAR (8)   NULL,
    [IdTransakcjiModyfikacji]            BIGINT         NULL,
    [DataGodzUtworzeniaRekordu]          DATETIME       NULL,
    [IdUzytkownikaTworzacego]            NVARCHAR (8)   NULL,
    [IdTransakcjiUtworzeniaRekordu]      BIGINT         NULL,
    [WersjaRekordu]                      INT            NULL,
    [Partycja]                           BIGINT         NULL,
    [IdentyfikatorRekordu]               BIGINT         NOT NULL,
    [TypWierszaKonsolidacja]             INT            NULL,
    [KodSekcjiTrezor]                    NVARCHAR (60)  NULL,
    [KodPozycjiTrezor]                   NVARCHAR (60)  NULL,
    [operacja]                           NVARCHAR (1)   NULL,
    CONSTRAINT [DefinicjaWierszySprawozdania_pk] PRIMARY KEY CLUSTERED ([IdentyfikatorRekordu] ASC),
    CHECK ([IdentyfikatorRekordu]<>(0))
);

