CREATE TABLE [aes2].[ZWU_DokumentPoprzedni] (
    [Id]             NUMERIC (19)   NOT NULL,
    [KodDokPoprz]    NVARCHAR (6)   NULL,
    [KodDokPoprzPid] NVARCHAR (6)   NULL,
    [NrDokPoprz]     NVARCHAR (105) NULL,
    [IdTowarZWU]     NUMERIC (19)   NULL,
    CONSTRAINT [ZWU_DokumentPoprzedni$PK_ZWU_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWU_DokumentPoprzedni_IdTowarZWU_ZWU_Towar_id] FOREIGN KEY ([IdTowarZWU]) REFERENCES [aes2].[ZWU_Towar] ([Id])
);

