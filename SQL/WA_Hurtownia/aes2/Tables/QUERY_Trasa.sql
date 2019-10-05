CREATE TABLE [aes2].[QUERY_Trasa] (
    [Id]         NUMERIC (19) NOT NULL,
    [Kraj]       NVARCHAR (2) NULL,
    [KrajPid]    INT          NULL,
    [IdDokQUERY] NUMERIC (19) NULL,
    CONSTRAINT [QUERY_Trasa$PK_QUERY_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__QUERY_Trasa_IdDokQUERY__QUERY_Dokument_id] FOREIGN KEY ([IdDokQUERY]) REFERENCES [aes2].[QUERY_Dokument] ([Id])
);

