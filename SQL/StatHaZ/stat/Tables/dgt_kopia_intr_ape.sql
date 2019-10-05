CREATE TABLE [stat].[dgt_kopia_intr_ape] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NOT NULL,
    [ape]           VARCHAR (2)  NULL,
    [poczatek_obow] DATETIME     NULL,
    [koniec_obow]   DATETIME     NULL,
    [generacjaId]   INT          NOT NULL,
    [WaznaOdRokMc]  AS           (datepart(month,[poczatek_obow])+(100)*datepart(year,[poczatek_obow])),
    [WaznaDoRokMc]  AS           (isnull(datepart(month,[koniec_obow]),(12))+(100)*isnull(datepart(year,[koniec_obow]),(2100))),
    CONSTRAINT [PK_dgt_kopia_intr_ape] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC, [generacjaId] ASC) ON [StatIndeksy]
);

