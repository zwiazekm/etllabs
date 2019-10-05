CREATE TABLE [stat].[dot_podmiot_dane_roczne] (
    [nip]                     VARCHAR (10)    NULL,
    [rok]                     INT             NULL,
    [ilosc_intrastat_przywoz] INT             NULL,
    [ilosc_intrastat_wywoz]   INT             NULL,
    [ilosc_vat_przywoz]       INT             NULL,
    [ilosc_vat_wywoz]         INT             NULL,
    [sr_vat_przywoz]          DECIMAL (38, 6) NULL,
    [sr_vat_wywoz]            DECIMAL (38, 6) NULL
) ON [StatDane];


GO
CREATE NONCLUSTERED INDEX [idx_dot_podmiot_dane_roczne]
    ON [stat].[dot_podmiot_dane_roczne]([rok] ASC, [nip] ASC)
    ON [StatIndeksy];

