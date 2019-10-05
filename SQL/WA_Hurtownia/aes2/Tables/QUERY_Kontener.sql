CREATE TABLE [aes2].[QUERY_Kontener] (
    [Id]           NUMERIC (19)  NOT NULL,
    [NrKontenera]  NVARCHAR (17) NULL,
    [IdTowarQUERY] NUMERIC (19)  NULL,
    CONSTRAINT [QUERY_Kontener$PK_QUERY_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__QUERY_Kontener_IdTowarQUERY__QUERY_Towar_id] FOREIGN KEY ([IdTowarQUERY]) REFERENCES [aes2].[QUERY_Towar] ([Id])
);

