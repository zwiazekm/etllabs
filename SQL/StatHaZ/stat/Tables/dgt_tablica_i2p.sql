CREATE TABLE [stat].[dgt_tablica_i2p] (
    [ti_pcn]           VARCHAR (4)     NULL,
    [ti_on_wartosc]    DECIMAL (14)    NULL,
    [ti_on_wartosc100] DECIMAL (15, 1) NULL,
    [ti_mb_wartosc]    DECIMAL (14)    NULL,
    [ti_mb_wartosc100] DECIMAL (15, 1) NULL,
    [ti_mp_wartosc100] DECIMAL (15, 1) NULL
) ON [StatDane];


GO
CREATE STATISTICS [ti_mb_wartosc]
    ON [stat].[dgt_tablica_i2p]([ti_mb_wartosc]);


GO
CREATE STATISTICS [ti_mb_wartosc100]
    ON [stat].[dgt_tablica_i2p]([ti_mb_wartosc100]);


GO
CREATE STATISTICS [ti_mp_wartosc100]
    ON [stat].[dgt_tablica_i2p]([ti_mp_wartosc100]);


GO
CREATE STATISTICS [ti_on_wartosc]
    ON [stat].[dgt_tablica_i2p]([ti_on_wartosc]);


GO
CREATE STATISTICS [ti_on_wartosc100]
    ON [stat].[dgt_tablica_i2p]([ti_on_wartosc100]);


GO
CREATE STATISTICS [ti_pcn]
    ON [stat].[dgt_tablica_i2p]([ti_pcn]);

