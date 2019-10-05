CREATE TABLE [cel].[v2_dok_wymagany] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [Kod]     VARCHAR (4)  NULL,
    [Nr]      VARCHAR (35) NULL,
    CONSTRAINT [PK_V2_DOK_WYMAGANY] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

