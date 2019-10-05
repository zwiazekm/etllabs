CREATE TABLE [ncts2].[ZamknieciaCelne] (
    [IdOperacjiTranzytowej] BIGINT        NULL,
    [Numer]                 NVARCHAR (20) NULL,
    [Id]                    BIGINT        NOT NULL,
    [IdPozycji]             INT           NULL,
    CONSTRAINT [ZamknieciaCelne_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [ZamknieciaCelne_IdOperacjiTranzytowej_OperacjeTranzytowe_fk] FOREIGN KEY ([IdOperacjiTranzytowej]) REFERENCES [ncts2].[OperacjeTranzytowe] ([Id])
);

