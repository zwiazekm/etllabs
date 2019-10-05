CREATE TABLE [stat].[dot_podmiot_dane_miesieczne] (
    [RokMc]               INT          NOT NULL,
    [nip]                 VARCHAR (10) NULL,
    [intr_zerowy_przywoz] VARCHAR (1)  NOT NULL,
    [intr_zerowy_wywoz]   VARCHAR (1)  NOT NULL,
    [vat_zerowy_przywoz]  VARCHAR (1)  NOT NULL,
    [vat_zerowy_wywoz]    VARCHAR (1)  NOT NULL
) ON [StatDane];


GO
CREATE NONCLUSTERED INDEX [idx_dot_podmiot_dane_miesieczne]
    ON [stat].[dot_podmiot_dane_miesieczne]([RokMc] ASC, [nip] ASC)
    ON [StatIndeksy];

