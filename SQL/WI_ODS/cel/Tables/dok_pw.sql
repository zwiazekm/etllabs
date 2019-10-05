CREATE TABLE [cel].[dok_pw] (
    [id_dok]    VARCHAR (30) NOT NULL,
    [Status]    CHAR (1)     NULL,
    [KodTransp] VARCHAR (2)  NULL,
    CONSTRAINT [PK_DOK_PW] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_PW_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

