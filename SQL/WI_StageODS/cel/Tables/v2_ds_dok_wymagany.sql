CREATE TABLE [cel].[v2_ds_dok_wymagany] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [Kod]     VARCHAR (4)  NULL,
    [Nr]      VARCHAR (35) NULL,
    [Uwagi]   VARCHAR (35) NULL,
    CONSTRAINT [PK_v2_ds_dok_wymagany] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

