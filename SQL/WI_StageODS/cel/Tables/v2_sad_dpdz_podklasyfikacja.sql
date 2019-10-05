CREATE TABLE [cel].[v2_sad_dpdz_podklasyfikacja] (
    [idDokNr]       BIGINT      NOT NULL,
    [PozId]         SMALLINT    NOT NULL,
    [Atrybut_PozId] SMALLINT    NOT NULL,
    [KodAtrybutu]   NUMERIC (6) NULL,
    [KodWartosci]   NUMERIC (6) NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_PODKLASYFIKACJA] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Atrybut_PozId] ASC) WITH (FILLFACTOR = 90)
);

