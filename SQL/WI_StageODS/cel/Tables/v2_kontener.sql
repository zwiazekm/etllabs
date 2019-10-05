CREATE TABLE [cel].[v2_kontener] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [Nr]      VARCHAR (17) NULL,
    CONSTRAINT [PK_V2_KONTENER] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

