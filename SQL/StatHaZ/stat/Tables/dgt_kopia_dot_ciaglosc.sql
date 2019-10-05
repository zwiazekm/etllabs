CREATE TABLE [stat].[dgt_kopia_dot_ciaglosc] (
    [nip]                 VARCHAR (10) NULL,
    [rok]                 INT          NOT NULL,
    [intr_zerowy_przywoz] VARCHAR (1)  NOT NULL,
    [intr_zerowy_wywoz]   VARCHAR (1)  NOT NULL,
    [vat_zerowy_przywoz]  VARCHAR (1)  NOT NULL,
    [vat_zerowy_wywoz]    VARCHAR (1)  NOT NULL,
    [generacjaId]         INT          NULL
) ON [StatDane];

