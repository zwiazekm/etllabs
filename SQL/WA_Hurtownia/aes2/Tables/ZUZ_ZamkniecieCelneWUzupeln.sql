CREATE TABLE [aes2].[ZUZ_ZamkniecieCelneWUzupeln] (
    [Id]            NUMERIC (19)   NOT NULL,
    [ZnakiZamkniec] NVARCHAR (255) NULL,
    [IdDokZUZ]      NUMERIC (19)   NULL,
    CONSTRAINT [ZUZ_ZamkniecieCelneWUzupeln$PK_ZUZ_ZamkniecieCelneWUzupeln] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__ZUZ_ZamkniecieCelneWUzupeln_IdDokZUZ__ZUZ_Dokument_id] FOREIGN KEY ([IdDokZUZ]) REFERENCES [aes2].[ZUZ_Dokument] ([Id])
);

