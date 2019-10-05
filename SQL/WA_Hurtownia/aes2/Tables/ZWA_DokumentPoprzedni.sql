CREATE TABLE [aes2].[ZWA_DokumentPoprzedni] (
    [Id]             NUMERIC (19)   NOT NULL,
    [KodDokPoprz]    NVARCHAR (6)   NULL,
    [KodDokPoprzPid] NVARCHAR (6)   NULL,
    [NrDokPoprz]     NVARCHAR (105) NULL,
    [IdTowarZWA]     NUMERIC (19)   NULL,
    CONSTRAINT [ZWA_DokumentPoprzedni$PK_ZWA_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWA_DokumentPoprzedni_IdTowarZWA__ZWA_Towar_id] FOREIGN KEY ([IdTowarZWA]) REFERENCES [aes2].[ZWA_Towar] ([Id])
);

