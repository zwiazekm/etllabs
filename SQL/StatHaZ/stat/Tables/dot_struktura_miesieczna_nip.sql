CREATE TABLE [stat].[dot_struktura_miesieczna_nip] (
    [typ]                    CHAR (1)        NULL,
    [nip]                    VARCHAR (10)    NULL,
    [RokMc]                  INT             NULL,
    [kod_towarowy]           VARCHAR (8)     NULL,
    [kraj_pochodzenia]       CHAR (2)        NULL,
    [kraj_przezn_wysyl]      CHAR (2)        NULL,
    [rodzaj_transakcji]      VARCHAR (2)     NULL,
    [ile_poz]                INT             NULL,
    [wartosc_faktury]        DECIMAL (38)    NULL,
    [wartosc_stat]           DECIMAL (38)    NULL,
    [sum_masa_netto]         DECIMAL (38)    NULL,
    [sum_uzup_jm]            DECIMAL (38)    NULL,
    [udzial_pozycji]         DECIMAL (7, 6)  NULL,
    [min_cena_za_kilogram]   DECIMAL (15, 6) NULL,
    [max_cena_za_kilogram]   DECIMAL (15, 6) NULL,
    [avg_cena_za_kilogram]   DECIMAL (15, 6) NULL,
    [stdev_cena_za_kilogram] DECIMAL (21, 6) NULL,
    [min_cena_za_sztuke]     DECIMAL (15, 6) NULL,
    [max_cena_za_sztuke]     DECIMAL (15, 6) NULL,
    [avg_cena_za_sztuke]     DECIMAL (15, 6) NULL,
    [stdev_cena_za_sztuke]   DECIMAL (15, 6) NULL
) ON [StatDane];


GO
CREATE NONCLUSTERED INDEX [idx_dot_struktura_miesieczna_nip]
    ON [stat].[dot_struktura_miesieczna_nip]([RokMc] ASC, [typ] ASC, [nip] ASC)
    INCLUDE([udzial_pozycji])
    ON [StatIndeksy];

