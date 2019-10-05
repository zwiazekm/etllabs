CREATE TABLE [aes2].[ZWP_ZamkniecieCelne] (
    [Id]            NUMERIC (19)   NOT NULL,
    [ZnakiZamkniec] NVARCHAR (120) NULL,
    [IdDokZWP]      NUMERIC (19)   NULL,
    CONSTRAINT [ZWP_ZamkniecieCelne$PK_ZWP_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZWP_ZamkniecieCelne_IdDokZWP__ZWP_Dokument_id] FOREIGN KEY ([IdDokZWP]) REFERENCES [aes2].[ZWP_Dokument] ([Id])
);

