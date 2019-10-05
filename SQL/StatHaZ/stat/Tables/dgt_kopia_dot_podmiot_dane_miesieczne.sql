CREATE TABLE [stat].[dgt_kopia_dot_podmiot_dane_miesieczne] (
    [miesiac]             INT          NOT NULL,
    [rok]                 INT          NOT NULL,
    [nip]                 VARCHAR (10) NULL,
    [intr_zerowy_przywoz] VARCHAR (1)  NOT NULL,
    [intr_zerowy_wywoz]   VARCHAR (1)  NOT NULL,
    [vat_zerowy_przywoz]  VARCHAR (1)  NOT NULL,
    [vat_zerowy_wywoz]    VARCHAR (1)  NOT NULL,
    [generacjaId]         INT          NULL
) ON [StatDane];

