CREATE TABLE [stat].[udzial_doszacowan_ek] (
    [Kod_CN]                      VARCHAR (8)     NULL,
    [Wartosc_rzeczywista]         NUMERIC (38, 6) NOT NULL,
    [Wartosc_doszacowana]         NUMERIC (38, 6) NOT NULL,
    [REGON]                       VARCHAR (14)    NULL,
    [nip]                         VARCHAR (10)    NULL,
    [wartosc_doszacowan podmiotu] NUMERIC (38, 6) NOT NULL,
    [opis_cn]                     VARCHAR (4000)  NULL
) ON [StatDane];


GO
CREATE STATISTICS [wartosc_doszacowan podmiotu]
    ON [stat].[udzial_doszacowan_ek]([wartosc_doszacowan podmiotu]);


GO
CREATE STATISTICS [Wartosc_doszacowana]
    ON [stat].[udzial_doszacowan_ek]([Wartosc_doszacowana]);


GO
CREATE STATISTICS [Wartosc_rzeczywista]
    ON [stat].[udzial_doszacowan_ek]([Wartosc_rzeczywista]);

