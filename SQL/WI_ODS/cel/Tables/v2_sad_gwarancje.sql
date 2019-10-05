CREATE TABLE [cel].[v2_sad_gwarancje] (
    [idDokNr] BIGINT   NOT NULL,
    [PozId]   SMALLINT NOT NULL,
    [Rodzaj]  CHAR (1) NULL,
    CONSTRAINT [PK_V2_SAD_GWARANCJE] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_GWAR_DOK_SAD] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr])
);

