CREATE TABLE [aes2].[DWA_DokumentWymagany] (
    [Id]               NUMERIC (19)   NOT NULL,
    [StanNaGranicy]    NCHAR (1)      NULL,
    [StanNaGranicyKom] NVARCHAR (140) NULL,
    [KodDokZrodl]      NVARCHAR (4)   NULL,
    [NrDokWym]         NVARCHAR (35)  NULL,
    [IdTowarDWA]       NUMERIC (19)   NULL,
    CONSTRAINT [DWA_DokumentWymagany$PK_DWA_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWA_DokumentWymagany_IdTowarDWA__DWA_Towar_id] FOREIGN KEY ([IdTowarDWA]) REFERENCES [aes2].[DWA_Towar] ([Id])
);

