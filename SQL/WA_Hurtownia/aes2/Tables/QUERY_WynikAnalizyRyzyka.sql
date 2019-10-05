CREATE TABLE [aes2].[QUERY_WynikAnalizyRyzyka] (
    [Id]                              NUMERIC (19)   NOT NULL,
    [NrPozycji]                       INT            NULL,
    [KodJezykaOpisuKoduAnalizyRyzyka] NVARCHAR (2)   NULL,
    [KodAnalizyRyzyka]                NVARCHAR (5)   NULL,
    [OpisKoduAnalizyRyzyka]           NVARCHAR (350) NULL,
    [IdDokQUERY]                      NUMERIC (19)   NULL,
    CONSTRAINT [QUERY_WynikAnalizyRyzyka$PK_QUERY_WynikAnalizyRyzyka] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__QUERY_WynikAnalizyRyzyka_IdDokQUERY__QUERY_Dokument_id] FOREIGN KEY ([IdDokQUERY]) REFERENCES [aes2].[QUERY_Dokument] ([Id])
);

