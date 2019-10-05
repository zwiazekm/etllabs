CREATE TABLE [aes2].[ZWP_DokumentPoprzedni] (
    [Id]             NUMERIC (19)   NOT NULL,
    [KodDokPoprz]    NVARCHAR (6)   NULL,
    [KodDokPoprzPid] NVARCHAR (6)   NULL,
    [NrDokPoprz]     NVARCHAR (210) NULL,
    [IdTowarZWP]     NUMERIC (19)   NULL,
    CONSTRAINT [ZWP_DokumentPoprzedni$PK_ZWP_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWP_DokumentPoprzedni_IdTowarZWP__ZWP_Towar_id] FOREIGN KEY ([IdTowarZWP]) REFERENCES [aes2].[ZWP_Towar] ([id])
);

