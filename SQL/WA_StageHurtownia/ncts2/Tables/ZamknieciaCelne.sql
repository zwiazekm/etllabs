CREATE TABLE [ncts2].[ZamknieciaCelne] (
    [IdOperacjiTranzytowej] BIGINT        NULL,
    [Numer]                 NVARCHAR (20) NULL,
    [Id]                    BIGINT        NOT NULL,
    [IdPozycji]             INT           NULL,
    CONSTRAINT [ZamknieciaCelne_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

