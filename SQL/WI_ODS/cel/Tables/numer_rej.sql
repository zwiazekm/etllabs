CREATE TABLE [cel].[numer_rej] (
    [id_dok] VARCHAR (30) NOT NULL,
    [PozId]  NUMERIC (2)  NOT NULL,
    [Numer]  VARCHAR (40) NULL,
    [Kraj]   VARCHAR (2)  NULL,
    CONSTRAINT [PK_NUMER_REJ] PRIMARY KEY CLUSTERED ([id_dok] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_NUMER_RE_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

