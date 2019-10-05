CREATE TABLE [stat].[dgt_kopia_dot_struktura_miesieczna_agr_rodztran] (
    [typ]                    CHAR (1)         NULL,
    [miesiac]                INT              NULL,
    [rok]                    INT              NULL,
    [kod_towarowy]           VARCHAR (8)      NULL,
    [kraj_pochodzenia]       VARCHAR (2)      NULL,
    [kraj_przezn_wysyl]      VARCHAR (2)      NULL,
    [ile_poz]                INT              NULL,
    [wartosc_faktury]        DECIMAL (38)     NULL,
    [min_cena_za_kilogram]   DECIMAL (27, 12) NULL,
    [max_cena_za_kilogram]   DECIMAL (27, 12) NULL,
    [avg_cena_za_kilogram]   DECIMAL (38, 12) NULL,
    [stdev_cena_za_kilogram] FLOAT (53)       NULL,
    [min_cena_za_sztuke]     DECIMAL (27, 12) NULL,
    [max_cena_za_sztuke]     DECIMAL (27, 12) NULL,
    [avg_cena_za_sztuke]     DECIMAL (38, 12) NULL,
    [stdev_cena_za_sztuke]   FLOAT (53)       NULL,
    [generacjaId]            INT              NULL
) ON [StatDane];

