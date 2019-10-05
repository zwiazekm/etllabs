CREATE TABLE [ncts2].[KrajeWyslaneInfoOTranzycie] (
    [Id]                    BIGINT       NOT NULL,
    [IdOperacjiTranzytowej] BIGINT       NULL,
    [KodKraju]              NVARCHAR (2) NULL,
    [UrzadTranzytowy]       NVARCHAR (8) NULL,
    CONSTRAINT [KrajeWyslaneInfoOTranzycie_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

