CREATE TABLE [stat].[udzial_doszacowan_im] (
    [Kod_cn]                      VARCHAR (8)     NULL,
    [Wartosc_rzeczywista]         NUMERIC (18, 6) NOT NULL,
    [Wartosc_doszacowana]         NUMERIC (18, 6) NOT NULL,
    [REGON]                       VARCHAR (14)    NULL,
    [nip]                         VARCHAR (10)    NULL,
    [Wartosc_doszacowan podmiotu] NUMERIC (18, 6) NOT NULL,
    [opis_cn]                     VARCHAR (4000)  NULL
) ON [StatDane];


GO
CREATE STATISTICS [Wartosc_doszacowan podmiotu]
    ON [stat].[udzial_doszacowan_im]([Wartosc_doszacowan podmiotu]);


GO
CREATE STATISTICS [Wartosc_doszacowana]
    ON [stat].[udzial_doszacowan_im]([Wartosc_doszacowana]);


GO
CREATE STATISTICS [Wartosc_rzeczywista]
    ON [stat].[udzial_doszacowan_im]([Wartosc_rzeczywista]);

