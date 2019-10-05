CREATE TABLE [ncts2].[KrajeWyslaneInfoOTranzycie] (
    [Id]                    BIGINT       NOT NULL,
    [IdOperacjiTranzytowej] BIGINT       NULL,
    [KodKraju]              NVARCHAR (2) NULL,
    [UrzadTranzytowy]       NVARCHAR (8) NULL,
    CONSTRAINT [KrajeWyslaneInfoOTranzycie_pk] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_NCTS2],
    CONSTRAINT [KrajeWyslaneInfoOTranzycie_IdOperacjiTranzytowej_OperacjeTranzytowe_fk] FOREIGN KEY ([IdOperacjiTranzytowej]) REFERENCES [ncts2].[OperacjeTranzytowe] ([Id])
);

