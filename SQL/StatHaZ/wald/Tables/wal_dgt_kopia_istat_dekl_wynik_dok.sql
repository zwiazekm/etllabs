CREATE TABLE [wald].[wal_dgt_kopia_istat_dekl_wynik_dok] (
    [id_dok]              VARCHAR (30) NOT NULL,
    [status]              CHAR (1)     NULL,
    [typ]                 CHAR (1)     NULL,
    [numer]               SMALLINT     NULL,
    [nip_zobowiazanego]   VARCHAR (10) NULL,
    [regon_zobowiazanego] VARCHAR (14) NULL,
    [RokMc]               INT          NULL,
    [wersja]              VARCHAR (3)  NULL,
    [generacjaId]         INT          NOT NULL,
    CONSTRAINT [PK_wal_dgt_kopia_istat_dekl_wynik_dok] PRIMARY KEY CLUSTERED ([id_dok] ASC) ON [WaldDane]
);

