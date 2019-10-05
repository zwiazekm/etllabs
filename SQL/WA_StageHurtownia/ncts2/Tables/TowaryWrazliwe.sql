﻿CREATE TABLE [ncts2].[TowaryWrazliwe] (
    [IdTowaru]                   BIGINT          NULL,
    [Kod]                        NVARCHAR (2)    NULL,
    [Ilosc]                      NUMERIC (14, 3) NULL,
    [IdPozycji]                  INT             NULL,
    [Id]                         BIGINT          NOT NULL,
    [TrybUtworzeniaPozycji]      NVARCHAR (1)    NULL,
    [IteracjaUwagRozladunkowych] SMALLINT        NULL,
    CONSTRAINT [TowaryWrazliwe_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

