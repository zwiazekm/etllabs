CREATE TABLE [pta].[AD_KodCzynnosciWino] (
    [Id]               BIGINT   NOT NULL,
    [KodCzynnosciWino] CHAR (2) NOT NULL,
    [IdWyrobAD]        BIGINT   NOT NULL,
    CONSTRAINT [PK_AD_KodCzynnosciWino] PRIMARY KEY CLUSTERED ([Id] ASC)
);

