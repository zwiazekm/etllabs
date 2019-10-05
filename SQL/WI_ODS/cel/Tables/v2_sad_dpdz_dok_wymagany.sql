CREATE TABLE [cel].[v2_sad_dpdz_dok_wymagany] (
    [idDokNr]      BIGINT       NOT NULL,
    [PozId]        SMALLINT     NOT NULL,
    [DokWym_PozId] SMALLINT     NOT NULL,
    [Kod]          VARCHAR (4)  NULL,
    [Nr]           VARCHAR (35) NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_DOK_WYMAGANY] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [DokWym_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_DOK_WYMAG_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

