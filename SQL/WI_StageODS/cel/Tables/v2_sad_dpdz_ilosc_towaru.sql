CREATE TABLE [cel].[v2_sad_dpdz_ilosc_towaru] (
    [idDokNr]           BIGINT          NOT NULL,
    [PozId]             SMALLINT        NOT NULL,
    [IloscTowaru_PozId] SMALLINT        NOT NULL,
    [Jm]                VARCHAR (3)     NULL,
    [KwalifikatorJm]    VARCHAR (1)     NULL,
    [Ilosc]             NUMERIC (20, 5) NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_ILOSC_TOWARU] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [IloscTowaru_PozId] ASC) WITH (FILLFACTOR = 90)
);

