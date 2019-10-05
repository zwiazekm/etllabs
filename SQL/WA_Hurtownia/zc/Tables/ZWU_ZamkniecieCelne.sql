CREATE TABLE [zc].[ZWU_ZamkniecieCelne] (
    [Id]            DECIMAL (19)   NOT NULL,
    [ZnakiZamkniec] NVARCHAR (255) NULL,
    [IdDokZWU]      DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWU_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWU_ZamknieciaCelne_IdDokZWU_ZWU_Dokument_Id] FOREIGN KEY ([IdDokZWU]) REFERENCES [zc].[ZWU_Dokument] ([Id])
);

