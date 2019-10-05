CREATE TABLE [emcs2].[AD_Zaswiadczenie] (
    [Id]                      NUMERIC (38)    NOT NULL,
    [NrDok]                   NVARCHAR (1050) NULL,
    [NumerDokumnetuKodJezyka] VARCHAR (2)     NULL,
    [KrotkiOpis]              NVARCHAR (1050) NULL,
    [OpisdokumnetuKodJezyka]  VARCHAR (2)     NULL,
    [IdDokAD]                 NUMERIC (38)    NULL,
    CONSTRAINT [AD_Zaswiadczenie$PK_AD_Zaswiadczenie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_EMCS2],
    CONSTRAINT [FK_AD_Zaswiadczenie] FOREIGN KEY ([IdDokAD]) REFERENCES [emcs2].[AD_Dokument] ([Id])
);

