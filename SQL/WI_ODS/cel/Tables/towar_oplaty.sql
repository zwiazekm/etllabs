CREATE TABLE [cel].[towar_oplaty] (
    [id_dok]      VARCHAR (30)    NOT NULL,
    [PozId]       NUMERIC (2)     NOT NULL,
    [OplatyPozID] NUMERIC (2)     NOT NULL,
    [Typ]         VARCHAR (10)    NULL,
    [Podst]       NUMERIC (14, 2) NULL,
    [Stawka]      NUMERIC (14, 2) NULL,
    [Kwota]       NUMERIC (14, 2) NULL,
    CONSTRAINT [PK_TOWAR_OPLATY] PRIMARY KEY CLUSTERED ([id_dok] ASC, [PozId] ASC, [OplatyPozID] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_TOWAR_OP_REFERENCE_TOWAR] FOREIGN KEY ([id_dok], [PozId]) REFERENCES [cel].[towar] ([id_dok], [PozId])
);

