CREATE TABLE [cel].[zamkn_celne] (
    [id_dok] VARCHAR (30) NOT NULL,
    [PozId]  NUMERIC (2)  NOT NULL,
    [Rodzaj] VARCHAR (6)  NULL,
    [Nr]     VARCHAR (20) NULL,
    [Ilosc]  NUMERIC (6)  NULL,
    CONSTRAINT [PK_ZAMKN_CELNE] PRIMARY KEY CLUSTERED ([id_dok] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_ZAMKN_CE_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

