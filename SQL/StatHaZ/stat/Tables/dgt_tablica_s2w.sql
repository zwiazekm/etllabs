CREATE TABLE [stat].[dgt_tablica_s2w] (
    [ts_pcn]           VARCHAR (4)     NULL,
    [ts_on_wartosc]    DECIMAL (14)    NULL,
    [ts_on_wartosc100] DECIMAL (15, 1) NULL,
    [ts_mb_wartosc]    DECIMAL (14)    NULL,
    [ts_mb_wartosc100] DECIMAL (15, 1) NULL,
    [ts_mp_wartosc100] DECIMAL (15, 1) NULL
) ON [StatDane];


GO
CREATE STATISTICS [ts_mb_wartosc]
    ON [stat].[dgt_tablica_s2w]([ts_mb_wartosc]);


GO
CREATE STATISTICS [ts_mb_wartosc100]
    ON [stat].[dgt_tablica_s2w]([ts_mb_wartosc100]);


GO
CREATE STATISTICS [ts_mp_wartosc100]
    ON [stat].[dgt_tablica_s2w]([ts_mp_wartosc100]);


GO
CREATE STATISTICS [ts_on_wartosc]
    ON [stat].[dgt_tablica_s2w]([ts_on_wartosc]);


GO
CREATE STATISTICS [ts_on_wartosc100]
    ON [stat].[dgt_tablica_s2w]([ts_on_wartosc100]);


GO
CREATE STATISTICS [ts_pcn]
    ON [stat].[dgt_tablica_s2w]([ts_pcn]);

