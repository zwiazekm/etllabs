CREATE TABLE [stat].[dgt_kopia_v2_sad_dpdz_tow] (
    [IdDokNr]               BIGINT          NOT NULL,
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
    [procedura]             VARCHAR (4)     NULL,
    [ProceduraSzczegoly]    VARCHAR (3)     NULL,
    [MasaNetto]             DECIMAL (14, 3) NULL,
    [IloscUzupelniajacaJm]  DECIMAL (14, 3) NULL,
    [idNadawca]             INT             NULL,
    [idOdbiorca]            INT             NULL,
    [WartoscPozycji]        DECIMAL (17, 2) NULL,
    [MetodaWartosciowania]  VARCHAR (1)     NULL,
    [WartoscStatystyczna]   BIGINT          NULL,
    [TowarStrategiczny]     BIT             NULL,
    [Podklasyf_IdWzorca]    DECIMAL (6)     NULL,
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
    [generacjaId]           INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_sad_dpdz_tow] PRIMARY KEY CLUSTERED ([IdDokNr] ASC, [PozId] ASC, [generacjaId] ASC) ON [StatDane]
);


GO
CREATE NONCLUSTERED INDEX [dgt_kopia_v2_sad_dpdz_tow4]
    ON [stat].[dgt_kopia_v2_sad_dpdz_tow]([IdDokNr] ASC, [PozId] ASC, [KodTowarowy] ASC)
    ON [StatDane];

