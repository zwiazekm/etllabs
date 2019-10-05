CREATE TABLE [aes2].[ZWA_ZamkniecieCelne] (
    [Id]            NUMERIC (19)  NOT NULL,
    [ZnakiZamkniec] NVARCHAR (60) NULL,
    [IdDokZWA]      NUMERIC (19)  NULL,
    CONSTRAINT [ZWA_ZamkniecieCelne$PK_ZWA_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWA_ZamkniecieCelne_IdDokZWA__ZWA_Dokument_id] FOREIGN KEY ([IdDokZWA]) REFERENCES [aes2].[ZWA_Dokument] ([Id])
);

