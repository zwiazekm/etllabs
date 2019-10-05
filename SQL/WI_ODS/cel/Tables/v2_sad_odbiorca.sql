CREATE TABLE [cel].[v2_sad_odbiorca] (
    [idDokNr] BIGINT       NOT NULL,
    [idKntr]  INT          NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [EORI]    VARCHAR (20) NULL,
    CONSTRAINT [PK_V2_SAD_ODBIORCA] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [idKntr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_ODB_DOK_SAD] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr]),
    CONSTRAINT [FK_SAD_ODB_KONTRAHENCI] FOREIGN KEY ([idKntr]) REFERENCES [cel].[v2_kontrahenci] ([idKntr])
);


GO
CREATE NONCLUSTERED INDEX [IDX_KONTRAHENT]
    ON [cel].[v2_sad_odbiorca]([idKntr] ASC)
    ON [FG_CEL];

