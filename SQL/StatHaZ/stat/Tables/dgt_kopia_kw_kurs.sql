CREATE TABLE [stat].[dgt_kopia_kw_kurs] (
    [nr_tabeli]   VARCHAR (20)    NOT NULL,
    [rodzaj]      CHAR (1)        NOT NULL,
    [z_dnia]      DATETIME        NOT NULL,
    [nr_poz]      INT             NOT NULL,
    [id_waluty]   VARCHAR (6)     NULL,
    [kurs]        DECIMAL (12, 4) NULL,
    [mnoznik]     INT             NULL,
    [kurs_sprzed] DECIMAL (12, 4) NULL,
    [kurs_skup]   DECIMAL (12, 4) NULL,
    [generacjaId] INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_kw_kurs] PRIMARY KEY CLUSTERED ([nr_tabeli] ASC, [rodzaj] ASC, [z_dnia] ASC, [nr_poz] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE NONCLUSTERED INDEX [idx_kw_kurs_nr_tabeli_id_waluty]
    ON [stat].[dgt_kopia_kw_kurs]([nr_tabeli] ASC, [id_waluty] ASC)
    ON [StatIndeksy];

