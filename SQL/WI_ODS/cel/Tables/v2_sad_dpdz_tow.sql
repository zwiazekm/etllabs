CREATE TABLE [cel].[v2_sad_dpdz_tow] (
    [idDokNr]               BIGINT          NOT NULL,
    [PozId]                 SMALLINT        NOT NULL,
    [P1c]                   VARCHAR (5)     NULL,
    [KrajWysylki]           VARCHAR (2)     NULL,
    [KrajPrzeznaczenia]     VARCHAR (2)     NULL,
    [OpisTowaru]            VARCHAR (1000)  NULL,
    [KodTowarowy]           VARCHAR (8)     NULL,
    [KodTaric]              VARCHAR (2)     NULL,
    [KrajPochodzenia]       VARCHAR (2)     NULL,
    [MasaBrutto]            DECIMAL (14, 3) NULL,
    [Preferencje]           CHAR (3)        NULL,
    [Procedura]             VARCHAR (4)     NULL,
    [ProceduraSzczegoly]    VARCHAR (3)     NULL,
    [MasaNetto]             DECIMAL (14, 3) NULL,
    [IloscUzupelniajacaJm]  DECIMAL (14, 3) NULL,
    [idNadawca]             INT             NULL,
    [idOdbiorca]            INT             NULL,
    [WartoscPozycji]        DECIMAL (17, 2) NULL,
    [MetodaWartosciowania]  VARCHAR (1)     NULL,
    [WartoscStatystyczna]   BIGINT          NULL,
    [TowarStrategiczny]     BIT             NULL,
    [Podklasyf_IdWzorca]    NUMERIC (6)     NULL,
    [Samochod_Marka]        VARCHAR (3)     NULL,
    [Samochod_NrNadwozia]   VARCHAR (35)    NULL,
    [Samochod_NrSilnika]    VARCHAR (35)    NULL,
    [Samochod_Pojemnosc]    INT             NULL,
    [Samochod_RodzajPaliwa] VARCHAR (2)     NULL,
    [Samochod_RokProdukcji] INT             NULL,
    [KodReceptury]          VARCHAR (35)    NULL,
    [Pochodzenie]           CHAR (1)        NULL,
    [Przeladunek]           BIT             NULL,
    [KrajPrzeladunku]       VARCHAR (2)     NULL,
    CONSTRAINT [PK_V2_SAD_DPDZ_TOW] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_SAD_DPDZ_T_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr]),
    CONSTRAINT [FK_SAD_DPDZ_T_KONTRAHENCI] FOREIGN KEY ([idNadawca]) REFERENCES [cel].[v2_kontrahenci] ([idKntr]),
    CONSTRAINT [FK_SAD_DPDZ_T_KONTRENCI] FOREIGN KEY ([idOdbiorca]) REFERENCES [cel].[v2_kontrahenci] ([idKntr])
);


GO
CREATE NONCLUSTERED INDEX [IDX_NADAWCA_KONTRAHENT]
    ON [cel].[v2_sad_dpdz_tow]([idNadawca] ASC)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [IDX_ODBIORCA_KONTRAHENT]
    ON [cel].[v2_sad_dpdz_tow]([idOdbiorca] ASC)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [ind_vin]
    ON [cel].[v2_sad_dpdz_tow]([Samochod_NrNadwozia] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];

