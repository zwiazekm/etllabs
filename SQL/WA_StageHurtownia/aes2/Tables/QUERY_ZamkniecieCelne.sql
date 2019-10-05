CREATE TABLE [aes2].[QUERY_ZamkniecieCelne] (
    [Id]                      NUMERIC (19)   NOT NULL,
    [ZnakiZamkniec]           NVARCHAR (255) NULL,
    [KodJezykaZnakowZamkniec] NVARCHAR (255) NULL,
    [IdDokQUERY]              NUMERIC (19)   NULL,
    CONSTRAINT [QUERY_ZamkniecieCelne$PK_QUERY_ZamkniecieCelne] PRIMARY KEY CLUSTERED ([Id] ASC)
);

