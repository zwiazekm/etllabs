CREATE TABLE [ncts2].[UwagiRozladunkoweZamknieciaCelne] (
    [Id]                  BIGINT        NOT NULL,
    [IdUwagiRozladunkowe] BIGINT        NULL,
    [IdPozycji]           INT           NULL,
    [Numer]               NVARCHAR (20) NULL,
    CONSTRAINT [UwagiRozladunkoweZamknieciaCelne_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [UwagiRozladunkoweZamknieciaCelne_IdUwagiRozladunkowe_UwagiRozladunkowe_fk] FOREIGN KEY ([IdUwagiRozladunkowe]) REFERENCES [ncts2].[UwagiRozladunkowe] ([Id])
);

