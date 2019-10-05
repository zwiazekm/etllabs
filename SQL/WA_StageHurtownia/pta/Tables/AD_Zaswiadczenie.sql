CREATE TABLE [pta].[AD_Zaswiadczenie] (
    [Id]         BIGINT         NOT NULL,
    [NrDok]      NVARCHAR (350) NULL,
    [KrotkiOpis] NVARCHAR (350) NULL,
    [IdDokAD]    BIGINT         NOT NULL,
    CONSTRAINT [PK_AD_Zaswiadczenie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

