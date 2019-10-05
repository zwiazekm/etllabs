CREATE TABLE [MF\CSCI].[MW_MF_60_cel] (
    [Data przyjęcia]              CHAR (10)       NULL,
    [Nr zgłoszenia]               VARCHAR (40)    NULL,
    [1. DEKLARACJA]               VARCHAR (3)     NULL,
    [5. Pozycje]                  SMALLINT        NULL,
    [7. Numer akt]                VARCHAR (14)    NULL,
    [8.Odbiorca: REGON]           VARCHAR (14)    NULL,
    [8.Odbiorca: NIP]             VARCHAR (12)    NULL,
    [8.Odbiorca: Firma]           VARCHAR (35)    NULL,
    [8.Odbiorca: Ulica]           VARCHAR (35)    NULL,
    [8.Odbiorca: Kod pocztowy]    VARCHAR (9)     NULL,
    [8.Odbiorca: Miejscowość]     VARCHAR (35)    NULL,
    [8.Odbiorca: Kraj]            VARCHAR (2)     NULL,
    [22.Waluta]                   VARCHAR (3)     NULL,
    [22.Wartość faktury]          DECIMAL (17, 2) NULL,
    [31.Opis towaru]              VARCHAR (1000)  NULL,
    [32.Nr pozycji]               SMALLINT        NULL,
    [33.Kod CN]                   VARCHAR (8)     NULL,
    [37.Procedura]                VARCHAR (4)     NULL,
    [38.Masa netto kg]            DECIMAL (14, 3) NULL,
    [46.Wartość statystyczna PLN] BIGINT          NULL
);

