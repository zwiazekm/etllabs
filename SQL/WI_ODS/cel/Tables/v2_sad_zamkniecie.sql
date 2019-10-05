CREATE TABLE [cel].[v2_sad_zamkniecie] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [Nr]      VARCHAR (20) NULL,
    CONSTRAINT [PK_V2_SAD_ZAMKNIECIE] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_ZAMK_DOK_SAD] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_sad] ([idDokNr])
);

