CREATE TABLE [cel].[v2_dok_wymagany] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [Kod]     VARCHAR (4)  NULL,
    [Nr]      VARCHAR (35) NULL,
    CONSTRAINT [PK_V2_DOK_WYMAGANY] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_WYMAG_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr])
);

