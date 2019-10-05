CREATE TABLE [ncts2].[OperacjaTranzytoweGwarancje] (
    [Id]                    BIGINT       NOT NULL,
    [IdOperacjiTranzytowej] BIGINT       NULL,
    [Rodzaj]                NVARCHAR (1) NULL,
    [IdPozycji]             INT          NULL,
    CONSTRAINT [OperacjaTranzytoweGwarancje_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [OperacjaTranzytoweGwarancje_IdOperacjiTranzytowej_OperacjeTranzytowe_fk] FOREIGN KEY ([IdOperacjiTranzytowej]) REFERENCES [ncts2].[OperacjeTranzytowe] ([Id])
);

