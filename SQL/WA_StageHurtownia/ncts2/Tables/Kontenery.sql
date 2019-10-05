﻿CREATE TABLE [ncts2].[Kontenery] (
    [Id]                         BIGINT        NOT NULL,
    [IdTowaru]                   BIGINT        NULL,
    [NrKonteneru]                NVARCHAR (17) NULL,
    [IdPozycji]                  INT           NULL,
    [TrybUtworzeniaPozycji]      NVARCHAR (1)  NULL,
    [IteracjaUwagRozladunkowych] SMALLINT      NULL,
    CONSTRAINT [Kontenery_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

