CREATE TABLE [stat].[dgt_kopia_intr_fwpdk] (
    [id_pod]        VARCHAR (35) NOT NULL,
    [nr_poz]        INT          NOT NULL,
    [fw]            VARCHAR (3)  NULL,
    [pkd]           VARCHAR (5)  NULL,
    [poczatek_obow] DATETIME     NULL,
    [koniec_obow]   DATETIME     NULL,
    [generacjaId]   INT          NOT NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [PK_dgt_kopia_intr_fwpdk]
    ON [stat].[dgt_kopia_intr_fwpdk]([id_pod] ASC, [nr_poz] ASC, [generacjaId] ASC)
    ON [StatIndeksy];


GO
CREATE STATISTICS [fw]
    ON [stat].[dgt_kopia_intr_fwpdk]([fw]);


GO
CREATE STATISTICS [koniec_obow]
    ON [stat].[dgt_kopia_intr_fwpdk]([koniec_obow]);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dgt_kopia_intr_fwpdk]([nr_poz]);


GO
CREATE STATISTICS [pkd]
    ON [stat].[dgt_kopia_intr_fwpdk]([pkd]);


GO
CREATE STATISTICS [poczatek_obow]
    ON [stat].[dgt_kopia_intr_fwpdk]([poczatek_obow]);

