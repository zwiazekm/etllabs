CREATE TABLE [cel].[v2_sad_dpdz_srodek] (
    [idDokNr]            BIGINT          NOT NULL,
    [PozId]              SMALLINT        NOT NULL,
    [Srodek_PozId]       SMALLINT        NOT NULL,
    [SID]                DECIMAL (15)    NULL,
    [Seria]              VARCHAR (2)     NULL,
    [Typ]                VARCHAR (6)     NULL,
    [ObszarGeograficzny] VARCHAR (4)     NULL,
    [NrPorzadkowy]       VARCHAR (6)     NULL,
    [Ujm]                VARCHAR (3)     NULL,
    [KwalifikatorUjm]    CHAR (1)        NULL,
    [NJm]                VARCHAR (2)     NULL,
    [RaportowanaIlosc]   DECIMAL (21, 5) NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_SRODEK] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [Srodek_PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_DPDZ_SROD_SAD_DPDZ_T] FOREIGN KEY ([idDokNr], [PozId]) REFERENCES [cel].[v2_sad_dpdz_tow] ([idDokNr], [PozId])
);

