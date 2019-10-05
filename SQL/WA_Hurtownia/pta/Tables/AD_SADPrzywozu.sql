CREATE TABLE [pta].[AD_SADPrzywozu] (
    [Id]      BIGINT        NOT NULL,
    [NrSAD]   NVARCHAR (21) NOT NULL,
    [IdDokAD] BIGINT        NOT NULL,
    CONSTRAINT [PK_AD_SADPrzywozu] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_PTA],
    CONSTRAINT [FK_AD_SADPrzywozu_IdDokAD_AD_Dokument_Id] FOREIGN KEY ([IdDokAD]) REFERENCES [pta].[AD_Dokument] ([Id])
);

