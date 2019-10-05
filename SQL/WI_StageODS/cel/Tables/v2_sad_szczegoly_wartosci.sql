CREATE TABLE [cel].[v2_sad_szczegoly_wartosci] (
    [idDokNr]         BIGINT      NOT NULL,
    [PozId]           SMALLINT    NOT NULL,
    [SzczegWar_PozId] SMALLINT    NOT NULL,
    [Kod]             VARCHAR (5) NULL,
    CONSTRAINT [PK_V2_SAD_SZCZEGOLY_WARTOSCI] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [SzczegWar_PozId] ASC) WITH (FILLFACTOR = 90)
);

