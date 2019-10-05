CREATE TABLE [cel].[v2_sad_gwarancja] (
    [idDokNr]         BIGINT       NOT NULL,
    [PozId]           SMALLINT     NOT NULL,
    [Gwarancja_PozId] SMALLINT     NOT NULL,
    [Nr]              VARCHAR (35) NULL,
    [GRN]             VARCHAR (17) NULL,
    [KodDostepu]      VARCHAR (4)  NULL,
    [NiewaznaNaUE]    BIT          NULL,
    CONSTRAINT [PK_V2_SAD_GWARANCJA] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Gwarancja_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_GWAR_SAD_GWARANCJE] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_gwarancje] ([idDokNr], [PozId])
);

