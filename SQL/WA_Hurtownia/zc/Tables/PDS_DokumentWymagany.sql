CREATE TABLE [zc].[PDS_DokumentWymagany] (
    [Id]         DECIMAL (19) NOT NULL,
    [KodDokWym]  VARCHAR (4)  NULL,
    [NrDokWym]   VARCHAR (35) NULL,
    [IdTowarPDS] DECIMAL (19) NULL,
    CONSTRAINT [PK_PDS_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PDS_DokumentWymagany_IdTowarPDS_PDS_Towar_Id] FOREIGN KEY ([IdTowarPDS]) REFERENCES [zc].[PDS_Towar] ([Id])
);

