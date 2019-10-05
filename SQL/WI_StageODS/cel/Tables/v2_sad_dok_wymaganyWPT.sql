CREATE TABLE [cel].[v2_sad_dok_wymaganyWPT] (
    [idDokNr]         BIGINT       NOT NULL,
    [PozId]           SMALLINT     NOT NULL,
    [DokWymWPT_PozId] SMALLINT     NOT NULL,
    [Kod]             VARCHAR (3)  NULL,
    [Nr]              VARCHAR (20) NULL,
    [Uwagi]           VARCHAR (26) NULL,
    CONSTRAINT [PK_V2_SAD_DOK_WYMAGANYWPT] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [DokWymWPT_PozId] ASC) WITH (FILLFACTOR = 90)
);

