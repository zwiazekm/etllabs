CREATE TABLE [stat].[dgt_kopia_istat_dekl_wynik_dok] (
    [id_dok]              VARCHAR (30) NOT NULL,
    [Status]              CHAR (1)     NULL,
    [typ]                 CHAR (1)     NULL,
    [numer]               SMALLINT     NULL,
    [nip_zobowiazanego]   VARCHAR (10) NULL,
    [regon_zobowiazanego] VARCHAR (14) NULL,
    [RokMc]               INT          NULL,
    [wersja]              VARCHAR (3)  NULL,
    [generacjaId]         INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_istat_dekl_wynik_dok] PRIMARY KEY CLUSTERED ([id_dok] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE NONCLUSTERED INDEX [idx_dwd_id_dok]
    ON [stat].[dgt_kopia_istat_dekl_wynik_dok]([id_dok] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [idx_dwd_miesiac]
    ON [stat].[dgt_kopia_istat_dekl_wynik_dok]([RokMc] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [idx_dwd_nip_zobowiazanego]
    ON [stat].[dgt_kopia_istat_dekl_wynik_dok]([nip_zobowiazanego] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [idx_dwd_status]
    ON [stat].[dgt_kopia_istat_dekl_wynik_dok]([Status] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [idx_dwd_typ]
    ON [stat].[dgt_kopia_istat_dekl_wynik_dok]([typ] ASC)
    ON [StatIndeksy];


GO
CREATE STATISTICS [numer]
    ON [stat].[dgt_kopia_istat_dekl_wynik_dok]([numer]);


GO
CREATE STATISTICS [wersja]
    ON [stat].[dgt_kopia_istat_dekl_wynik_dok]([wersja]);

