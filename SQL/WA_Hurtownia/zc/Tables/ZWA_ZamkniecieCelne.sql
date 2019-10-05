CREATE TABLE [zc].[ZWA_ZamkniecieCelne] (
    [Id]            DECIMAL (19)  NOT NULL,
    [ZnakiZamkniec] NVARCHAR (20) NULL,
    [IdDokZWA]      DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWA_ZamknieciaCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_ZC],
    CONSTRAINT [FK_ZWA_ZamknieciaCelne_IdDokZWA_ZWA_Dokument_IdDok] FOREIGN KEY ([IdDokZWA]) REFERENCES [zc].[ZWA_Dokument] ([Id])
);

