CREATE TABLE [stat].[dot_struktura_miesieczna_agr_miesiac] (
    [typ]                    CHAR (1)        NULL,
    [rok]                    INT             NULL,
    [kod_towarowy]           VARCHAR (8)     NULL,
    [ile_poz]                INT             NULL,
    [wartosc_faktury]        DECIMAL (38)    NULL,
    [min_cena_za_kilogram]   DECIMAL (15, 6) NULL,
    [max_cena_za_kilogram]   DECIMAL (15, 6) NULL,
    [avg_cena_za_kilogram]   DECIMAL (15, 6) NULL,
    [stdev_cena_za_kilogram] DECIMAL (15, 6) NULL,
    [min_cena_za_sztuke]     DECIMAL (15, 6) NULL,
    [max_cena_za_sztuke]     DECIMAL (15, 6) NULL,
    [avg_cena_za_sztuke]     DECIMAL (15, 6) NULL,
    [stdev_cena_za_sztuke]   DECIMAL (15, 6) NULL
) ON [StatDane];

