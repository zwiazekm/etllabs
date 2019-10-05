CREATE TABLE [zc].[DWU_DokumentWymagany] (
    [Id]         DECIMAL (19) NOT NULL,
    [KodDokWym]  VARCHAR (4)  NULL,
    [NrDokWym]   VARCHAR (35) NULL,
    [IdTowarDWU] DECIMAL (19) NULL,
    CONSTRAINT [PK_DWU_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWU_DokumentWymagany_IdTowarDWU_DWU_Towar_Id] FOREIGN KEY ([IdTowarDWU]) REFERENCES [zc].[DWU_Towar] ([Id])
);

