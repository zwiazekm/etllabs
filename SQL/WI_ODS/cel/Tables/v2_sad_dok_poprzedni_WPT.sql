CREATE TABLE [cel].[v2_sad_dok_poprzedni_WPT] (
    [idDokNr]                    BIGINT       NOT NULL,
    [PozId]                      SMALLINT     NOT NULL,
    [DokumentPoprzedniWPT_PozId] SMALLINT     NOT NULL,
    [Kod]                        VARCHAR (6)  NULL,
    [Nr]                         VARCHAR (20) NULL,
    [Uwagi]                      VARCHAR (26) NULL,
    CONSTRAINT [PK_V2_SAD_DOK_POPRZEDNI_WPT] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [DokumentPoprzedniWPT_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_D_POP_W_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

