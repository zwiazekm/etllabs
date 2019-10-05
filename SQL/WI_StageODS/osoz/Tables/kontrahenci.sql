CREATE TABLE [osoz].[kontrahenci] (
    [id]                       BIGINT         NOT NULL,
    [czas_modyfikacji]         DATETIME       NULL,
    [adres_kod_pocztowy]       VARCHAR (9)    NULL,
    [adres_kraj]               NVARCHAR (150) NOT NULL,
    [adres_miejscowosc]        NVARCHAR (100) NOT NULL,
    [adres_numer_budynku]      VARCHAR (10)   NULL,
    [adres_numer_lokalu]       VARCHAR (10)   NULL,
    [adres_ulica]              NVARCHAR (100) NULL,
    [eori]                     VARCHAR (17)   NULL,
    [nazwa]                    NVARCHAR (255) NOT NULL,
    [nip]                      VARCHAR (10)   NOT NULL,
    [otrzymywanie_powiadomien] BIT            NOT NULL,
    [regon]                    VARCHAR (14)   NULL,
    [tin]                      VARCHAR (17)   NULL,
    CONSTRAINT [PK__kontrahe__3213E83F703E39B7] PRIMARY KEY CLUSTERED ([id] ASC)
);

