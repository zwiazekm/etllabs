CREATE TABLE [cel].[v2_sad_dpdz_kod_dodatkowy_UE] (
    [idDokNr]              BIGINT      NOT NULL,
    [PozId]                SMALLINT    NOT NULL,
    [KodDodatkowyUE_PozId] SMALLINT    NOT NULL,
    [Kod]                  VARCHAR (4) NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_KOD_DODATKOWY_U] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [KodDodatkowyUE_PozId] ASC) WITH (FILLFACTOR = 90)
);

