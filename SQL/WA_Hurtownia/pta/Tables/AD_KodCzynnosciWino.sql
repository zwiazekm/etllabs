CREATE TABLE [pta].[AD_KodCzynnosciWino] (
    [Id]               BIGINT   NOT NULL,
    [KodCzynnosciWino] CHAR (2) NOT NULL,
    [IdWyrobAD]        BIGINT   NOT NULL,
    CONSTRAINT [PK_AD_KodCzynnosciWino] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_PTA],
    CONSTRAINT [FK_AD_KodCzynnosciWino_IdWyrobAD_AD_Wyrob_Id] FOREIGN KEY ([IdWyrobAD]) REFERENCES [pta].[AD_Wyrob] ([Id])
);

