CREATE TABLE [osoz].[struktura_organizacyjna] (
    [id]                     BIGINT         NOT NULL,
    [czas_modyfikacji]       DATETIME       NULL,
    [aktywna]                BIT            NOT NULL,
    [kod]                    VARCHAR (8)    NOT NULL,
    [nazwa]                  NVARCHAR (255) NOT NULL,
    [opis]                   NVARCHAR (255) NULL,
    [adres_kod_pocztowy]     VARCHAR (9)    NOT NULL,
    [adres_kraj]             VARCHAR (150)  NOT NULL,
    [adres_miejscowosc]      NVARCHAR (100) NOT NULL,
    [adres_numer_lokalu]     VARCHAR (4)    NULL,
    [email]                  VARCHAR (255)  NULL,
    [kod_kraju_jednostki]    VARCHAR (2)    NOT NULL,
    [organ_jednostki]        VARCHAR (255)  NULL,
    [poziom_jednostki]       VARCHAR (2)    NULL,
    [rodzaj_jednostki]       INT            NULL,
    [jednostka_nadrzedna_id] BIGINT         NULL,
    [id_pdr]                 INT            NULL,
    [adres_ulica_nr_budynku] NVARCHAR (100) NULL,
    CONSTRAINT [PK__struktur__3213E83F0152749B] PRIMARY KEY CLUSTERED ([id] ASC)
);

