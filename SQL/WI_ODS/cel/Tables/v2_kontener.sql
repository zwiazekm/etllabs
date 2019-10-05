CREATE TABLE [cel].[v2_kontener] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [Nr]      VARCHAR (17) NULL,
    CONSTRAINT [PK_V2_KONTENER] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_KONTENER_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr])
);

