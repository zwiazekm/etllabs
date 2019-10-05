CREATE TABLE [cel].[v2_sad_dpdz_srodek] (
    [idDokNr]            BIGINT          NOT NULL,
    [PozId]              SMALLINT        NOT NULL,
    [Srodek_PozId]       SMALLINT        NOT NULL,
    [SID]                NUMERIC (15)    NULL,
    [Seria]              VARCHAR (2)     NULL,
    [Typ]                VARCHAR (6)     NULL,
    [ObszarGeograficzny] VARCHAR (4)     NULL,
    [NrPorzadkowy]       VARCHAR (6)     NULL,
    [Ujm]                VARCHAR (3)     NULL,
    [KwalifikatorUjm]    VARCHAR (1)     NULL,
    [RaportowanaIlosc]   NUMERIC (21, 5) NULL,
    [Njm]                VARCHAR (2)     NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_SRODEK] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Srodek_PozId] ASC) WITH (FILLFACTOR = 90)
);

