CREATE TABLE [cel].[v2_sad_dpdz_oplata] (
    [idDokNr]      BIGINT          NOT NULL,
    [PozId]        SMALLINT        NOT NULL,
    [Oplata_PozId] SMALLINT        NOT NULL,
    [Typ]          VARCHAR (3)     NULL,
    [Podstawa]     NUMERIC (17, 2) NULL,
    [Stawka]       NUMERIC (7, 2)  NULL,
    [Kwota]        NUMERIC (17, 2) NULL,
    [Mp]           VARCHAR (1)     NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_OPLATA] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Oplata_PozId] ASC) WITH (FILLFACTOR = 90)
);

