CREATE TABLE [zc].[ZWU_DokumentPoprzedni] (
    [Id]          DECIMAL (19)  NOT NULL,
    [KodDokPoprz] VARCHAR (6)   NULL,
    [NrDokPoprz]  NVARCHAR (35) NULL,
    [IdTowarZWU]  DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWU_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_DokumentPoprzedni_IdTowarZWU_ZWU_Towar_Id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [zc].[ZWU_Towar] ([Id])
);

