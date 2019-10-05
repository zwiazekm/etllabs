CREATE TABLE [cel].[v2_dok_zrodl] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [Kod]     VARCHAR (6)  NULL,
    [Nr]      VARCHAR (35) NULL,
    CONSTRAINT [PK_V2_DOK_ZRODL] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

