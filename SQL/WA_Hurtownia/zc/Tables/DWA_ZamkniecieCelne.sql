CREATE TABLE [zc].[DWA_ZamkniecieCelne] (
    [Id]           DECIMAL (19)  NOT NULL,
    [NrZamkniecia] VARCHAR (255) NULL,
    [IdDokDWA]     DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWA_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWA_ZamkniecieCelne_IdDokDWA_DWA_Dokument_Id] FOREIGN KEY ([IdDokDWA]) REFERENCES [zc].[DWA_Dokument] ([Id])
);

