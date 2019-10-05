CREATE TABLE [ncts2].[ZdarzeniaZamknieciaCelne] (
    [Id]          BIGINT        NOT NULL,
    [IdZdarzenia] BIGINT        NULL,
    [IdPozycji]   INT           NULL,
    [Numer]       NVARCHAR (20) NULL,
    CONSTRAINT [zdarzenia_zamkniecia_celne_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ZdarzeniaZamknieciaCelne_IdZdarzenia_Zdarzenia_fk] FOREIGN KEY ([IdZdarzenia]) REFERENCES [ncts2].[Zdarzenia] ([Id])
);

