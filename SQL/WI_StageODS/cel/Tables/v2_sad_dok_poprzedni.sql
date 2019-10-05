CREATE TABLE [cel].[v2_sad_dok_poprzedni] (
    [idDokNr]                 BIGINT       NOT NULL,
    [PozId]                   SMALLINT     NOT NULL,
    [DokumentPoprzedni_PozId] SMALLINT     NOT NULL,
    [Kategoria]               VARCHAR (1)  NULL,
    [Kod]                     VARCHAR (3)  NULL,
    [TypSAD]                  VARCHAR (2)  NULL,
    [Nr]                      VARCHAR (35) NULL,
    [NrCelina]                VARCHAR (25) NULL,
    CONSTRAINT [PK_V2_SAD_DOK_POPRZEDNI] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [DokumentPoprzedni_PozId] ASC) WITH (FILLFACTOR = 90)
);

