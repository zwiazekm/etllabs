CREATE TABLE [zc].[DWU_ZamkniecieCelne] (
    [Id]           DECIMAL (19)  NOT NULL,
    [NrZamkniecia] VARCHAR (255) NULL,
    [IdDokDWU]     DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWU_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DWU_ZamkniecieCelne_IdDokDWU_DWU_Dokument_Id] FOREIGN KEY ([IdDokDWU]) REFERENCES [zc].[DWU_Dokument] ([Id])
);

