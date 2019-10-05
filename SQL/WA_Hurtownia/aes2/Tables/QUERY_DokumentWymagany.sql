CREATE TABLE [aes2].[QUERY_DokumentWymagany] (
    [Id]              NUMERIC (19)  NOT NULL,
    [NrDokWym]        NVARCHAR (35) NULL,
    [KodJezykaDokWym] NVARCHAR (2)  NULL,
    [KodDokWym]       NVARCHAR (6)  NULL,
    [KodDokWymPid]    INT           NULL,
    [IdTowarQUERY]    NUMERIC (19)  NULL,
    CONSTRAINT [QUERY_DokumentWymagany$PK_QUERY_DokumentWymagany] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__QUERY_DokumentWymagany_IdTowarQUERY__QUERY_Towar_id] FOREIGN KEY ([IdTowarQUERY]) REFERENCES [aes2].[QUERY_Towar] ([Id])
);

