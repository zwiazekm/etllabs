CREATE TABLE [pta].[AD_Zaswiadczenie] (
    [Id]         BIGINT         NOT NULL,
    [NrDok]      NVARCHAR (350) NULL,
    [KrotkiOpis] NVARCHAR (350) NULL,
    [IdDokAD]    BIGINT         NOT NULL,
    CONSTRAINT [PK_AD_Zaswiadczenie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_PTA],
    CONSTRAINT [FK_AD_Zaswiadczenie_IdDokAD_AD_Dokument_Id] FOREIGN KEY ([IdDokAD]) REFERENCES [pta].[AD_Dokument] ([Id])
);

