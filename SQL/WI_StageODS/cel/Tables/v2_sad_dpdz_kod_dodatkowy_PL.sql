CREATE TABLE [cel].[v2_sad_dpdz_kod_dodatkowy_PL] (
    [idDokNr]              BIGINT      NOT NULL,
    [PozId]                SMALLINT    NOT NULL,
    [KodDodatkowyPL_PozId] SMALLINT    NOT NULL,
    [Kod]                  VARCHAR (4) NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_KOD_DODATKOWY_P] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [KodDodatkowyPL_PozId] ASC) WITH (FILLFACTOR = 90)
);

