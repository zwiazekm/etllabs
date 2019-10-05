CREATE TABLE [ncts2].[ZdarzeniaKontenery] (
    [Id]          BIGINT        NOT NULL,
    [IdZdarzenia] BIGINT        NULL,
    [IdPozycji]   INT           NULL,
    [Numer]       NVARCHAR (17) NULL,
    CONSTRAINT [ZdarzeniaKontenery_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

