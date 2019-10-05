CREATE TABLE [osoz].[hipoteki] (
    [id]                           BIGINT          NOT NULL,
    [czas_modyfikacji]             DATETIME        NULL,
    [adres_hipoteki_kod_pocztowy]  VARCHAR (6)     NULL,
    [adres_hipoteki_miejscowosc]   VARCHAR (150)   NULL,
    [adres_hipoteki_numer_budynku] VARCHAR (5)     NULL,
    [adres_hipoteki_numer_lokalu]  VARCHAR (5)     NULL,
    [adres_hipoteki_ulica]         VARCHAR (255)   NULL,
    [numer_ksiegi_wieczystej]      VARCHAR (50)    NOT NULL,
    [wartosc_hipoteki]             NUMERIC (19, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

