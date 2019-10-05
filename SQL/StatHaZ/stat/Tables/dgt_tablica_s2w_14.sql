CREATE TABLE [stat].[dgt_tablica_s2w_14] (
    [ts_pcn]           VARCHAR (4)  NULL,
    [ts_mp_wartosc]    DECIMAL (14) NULL,
    [ts_mb_wartosc]    DECIMAL (14) NULL,
    [ts_mp_wartosc100] DECIMAL (14) NULL
);


GO
CREATE STATISTICS [ts_mb_wartosc]
    ON [stat].[dgt_tablica_s2w_14]([ts_mb_wartosc]);


GO
CREATE STATISTICS [ts_mp_wartosc]
    ON [stat].[dgt_tablica_s2w_14]([ts_mp_wartosc]);


GO
CREATE STATISTICS [ts_mp_wartosc100]
    ON [stat].[dgt_tablica_s2w_14]([ts_mp_wartosc100]);


GO
CREATE STATISTICS [ts_pcn]
    ON [stat].[dgt_tablica_s2w_14]([ts_pcn]);

