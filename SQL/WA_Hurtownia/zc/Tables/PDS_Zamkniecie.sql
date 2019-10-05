CREATE TABLE [zc].[PDS_Zamkniecie] (
    [Id]         DECIMAL (19) NOT NULL,
    [NumerZnaki] VARCHAR (20) NULL,
    [IdDokPDS]   DECIMAL (19) NULL,
    CONSTRAINT [PK_PDS_Zamkniecie] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PDS_Zamkniecie_IdDokPDS_PDS_Dokument_Id] FOREIGN KEY ([IdDokPDS]) REFERENCES [zc].[PDS_Dokument] ([Id])
);

