CREATE TABLE [pta].[AD_SADPrzywozu] (
    [Id]      BIGINT        NOT NULL,
    [NrSAD]   NVARCHAR (21) NOT NULL,
    [IdDokAD] BIGINT        NOT NULL,
    CONSTRAINT [PK_AD_SADPrzywozu] PRIMARY KEY CLUSTERED ([Id] ASC)
);

