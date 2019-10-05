CREATE TABLE [ncts2].[OperacjaTranzytoweGwarancje] (
    [Id]                    BIGINT       NOT NULL,
    [IdOperacjiTranzytowej] BIGINT       NULL,
    [Rodzaj]                NVARCHAR (1) NULL,
    [IdPozycji]             INT          NULL,
    CONSTRAINT [OperacjaTranzytoweGwarancje_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

