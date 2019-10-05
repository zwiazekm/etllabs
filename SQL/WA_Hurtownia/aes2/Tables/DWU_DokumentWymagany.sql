CREATE TABLE [aes2].[DWU_DokumentWymagany] (
    [Id]         NUMERIC (19)  NOT NULL,
    [NrDokWym]   NVARCHAR (35) NULL,
    [KodDokWym]  NVARCHAR (4)  NULL,
    [IdTowarDWU] NUMERIC (19)  NULL,
    CONSTRAINT [DWU_DokumentWymagany$PK_DWU_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWU_DokumentWymagany_IdTowarDWU__DWU_Towar_id] FOREIGN KEY ([IdTowarDWU]) REFERENCES [aes2].[DWU_Towar] ([Id])
);

