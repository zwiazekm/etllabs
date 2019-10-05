CREATE TABLE [cel].[v2_sad_kontener] (
    [idDokNr]        BIGINT       NOT NULL,
    [PozId]          SMALLINT     NOT NULL,
    [Kontener_PozId] SMALLINT     NOT NULL,
    [Nr]             VARCHAR (17) NULL,
    CONSTRAINT [PK_V2_SAD_KONTENER] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Kontener_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_KONT_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

