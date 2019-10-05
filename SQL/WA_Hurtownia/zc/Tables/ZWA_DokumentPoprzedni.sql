CREATE TABLE [zc].[ZWA_DokumentPoprzedni] (
    [Id]          DECIMAL (19)  NOT NULL,
    [KodDokPoprz] VARCHAR (6)   NULL,
    [NrDokPoprz]  NVARCHAR (35) NULL,
    [IdTowarZWA]  DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWA_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWA_DokumentPoprzedni_IdTowarZWA_ZWA_Towar_Id] FOREIGN KEY ([IdTowarZWA]) REFERENCES [zc].[ZWA_Towar] ([Id])
);

