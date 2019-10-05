CREATE TABLE [zc].[DWA_DokumentWymagany] (
    [Id]               DECIMAL (19)  NOT NULL,
    [KodDokZrodl]      VARCHAR (4)   NULL,
    [NrDokWym]         VARCHAR (35)  NULL,
    [StanNaGranicy]    CHAR (1)      NULL,
    [StanNaGranicyKom] VARCHAR (140) NULL,
    [IdTowarDWA]       DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWA_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWA_DokumentWymagany_IdTowarDWA_DWA_Towar_Id] FOREIGN KEY ([IdTowarDWA]) REFERENCES [zc].[DWA_Towar] ([Id])
);

