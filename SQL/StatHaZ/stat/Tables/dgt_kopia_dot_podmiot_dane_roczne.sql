CREATE TABLE [stat].[dgt_kopia_dot_podmiot_dane_roczne] (
    [nip]                     VARCHAR (10)    NULL,
    [rok]                     INT             NULL,
    [ilosc_intrastat_przywoz] INT             NULL,
    [ilosc_intrastat_wywoz]   INT             NULL,
    [ilosc_vat_przywoz]       INT             NULL,
    [ilosc_vat_wywoz]         INT             NULL,
    [sr_vat_przywoz]          DECIMAL (38, 6) NULL,
    [sr_vat_wywoz]            DECIMAL (38, 6) NULL,
    [generacjaId]             INT             NULL
) ON [StatDane];

