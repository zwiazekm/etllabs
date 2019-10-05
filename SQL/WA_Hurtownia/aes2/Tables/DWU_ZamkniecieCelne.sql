CREATE TABLE [aes2].[DWU_ZamkniecieCelne] (
    [Id]           NUMERIC (19)   NOT NULL,
    [IdDokDWU]     NUMERIC (19)   NULL,
    [NrZamkniecia] NVARCHAR (255) NULL,
    CONSTRAINT [DWU_ZamkniecieCelne$PK_DWU_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__DWU_ZamkniecieCelne_IdDokDWU__DWU_Dokument_id] FOREIGN KEY ([IdDokDWU]) REFERENCES [aes2].[DWU_Dokument] ([Id])
);

