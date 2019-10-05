CREATE TABLE [stat].[dgt_kopia_dgt_tablica_s2p] (
    [ts_pcn]           VARCHAR (4)     NOT NULL,
    [ts_on_wartosc]    DECIMAL (14)    NULL,
    [ts_on_wartosc100] DECIMAL (15, 1) NULL,
    [ts_mb_wartosc]    DECIMAL (14)    NULL,
    [ts_mb_wartosc100] DECIMAL (15, 1) NULL,
    [ts_mp_wartosc100] DECIMAL (15, 1) NULL,
    [generacjaId]      INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dgt_tablica_s2p] PRIMARY KEY CLUSTERED ([ts_pcn] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [ts_mb_wartosc]
    ON [stat].[dgt_kopia_dgt_tablica_s2p]([ts_mb_wartosc]);


GO
CREATE STATISTICS [ts_mb_wartosc100]
    ON [stat].[dgt_kopia_dgt_tablica_s2p]([ts_mb_wartosc100]);


GO
CREATE STATISTICS [ts_mp_wartosc100]
    ON [stat].[dgt_kopia_dgt_tablica_s2p]([ts_mp_wartosc100]);


GO
CREATE STATISTICS [ts_on_wartosc]
    ON [stat].[dgt_kopia_dgt_tablica_s2p]([ts_on_wartosc]);


GO
CREATE STATISTICS [ts_on_wartosc100]
    ON [stat].[dgt_kopia_dgt_tablica_s2p]([ts_on_wartosc100]);

