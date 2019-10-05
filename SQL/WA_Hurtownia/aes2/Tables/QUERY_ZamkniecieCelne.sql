CREATE TABLE [aes2].[QUERY_ZamkniecieCelne] (
    [Id]                      NUMERIC (19)   NOT NULL,
    [ZnakiZamkniec]           NVARCHAR (255) NULL,
    [KodJezykaZnakowZamkniec] NVARCHAR (255) NULL,
    [IdDokQUERY]              NUMERIC (19)   NULL,
    CONSTRAINT [QUERY_ZamkniecieCelne$PK_QUERY_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__QUERY_ZamkniecieCelne_IdDokQUERY__QUERY_Dokument_id] FOREIGN KEY ([IdDokQUERY]) REFERENCES [aes2].[QUERY_Dokument] ([Id])
);

