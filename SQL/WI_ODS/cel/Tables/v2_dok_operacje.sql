CREATE TABLE [cel].[v2_dok_operacje] (
    [idDokNr]        BIGINT         NOT NULL,
    [PozId]          BIGINT         NOT NULL,
    [DataZm]         DATETIME       NULL,
    [UC]             VARCHAR (9)    NULL,
    [IdUsr]          VARCHAR (30)   NULL,
    [SymbolOperacji] VARCHAR (16)   NULL,
    [Adnotacja]      VARCHAR (2000) NULL,
    [RodzAdnotacji]  VARCHAR (10)   NULL,
    CONSTRAINT [PK_V2_DOK_OPERACJE] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_OPERAC_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr])
);

