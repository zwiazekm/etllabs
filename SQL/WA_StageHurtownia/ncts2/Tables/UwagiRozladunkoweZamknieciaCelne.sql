CREATE TABLE [ncts2].[UwagiRozladunkoweZamknieciaCelne] (
    [Id]                  BIGINT        NOT NULL,
    [IdUwagiRozladunkowe] BIGINT        NULL,
    [IdPozycji]           INT           NULL,
    [Numer]               NVARCHAR (20) NULL,
    CONSTRAINT [UwagiRozladunkoweZamknieciaCelne_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

