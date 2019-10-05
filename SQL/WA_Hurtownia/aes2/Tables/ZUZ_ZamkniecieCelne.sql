CREATE TABLE [aes2].[ZUZ_ZamkniecieCelne] (
    [Id]                    NUMERIC (19)   NOT NULL,
    [ZnakiZamkniec]         NVARCHAR (255) NULL,
    [IdDokZUZ]              NUMERIC (19)   NULL,
    [ZnakiZamkniecWUzupeln] NVARCHAR (255) NULL,
    CONSTRAINT [ZUZ_ZamkniecieCelne$PK_ZUZ_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_ZamkniecieCelne_IdDokZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdDokZUZ]) REFERENCES [aes2].[ZUZ_Dokument] ([Id])
);

