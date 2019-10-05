CREATE TABLE [cel].[v2_sad_gwar_niew_kraj] (
    [idDokNr]            BIGINT      NOT NULL,
    [PozId]              SMALLINT    NOT NULL,
    [Gwarancja_PozId]    SMALLINT    NOT NULL,
    [GwarNiewKraj_PozId] SMALLINT    NOT NULL,
    [Kraj]               VARCHAR (2) NULL,
    CONSTRAINT [PK_V2_SAD_GWAR_NIEW_KRAJ] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Gwarancja_PozId] ASC, [GwarNiewKraj_PozId] ASC) WITH (FILLFACTOR = 90)
);

