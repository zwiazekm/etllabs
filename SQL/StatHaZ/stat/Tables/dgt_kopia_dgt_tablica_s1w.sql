CREATE TABLE [stat].[dgt_kopia_dgt_tablica_s1w] (
    [ts_pcn]             VARCHAR (4)     NOT NULL,
    [ts_on_wartosc]      DECIMAL (14)    NULL,
    [ts_on_masa]         BIGINT          NULL,
    [ts_on_srednia_cena] DECIMAL (14, 2) NULL,
    [ts_op_wartosc]      DECIMAL (14)    NULL,
    [ts_op_masa]         BIGINT          NULL,
    [ts_op_srednia_cena] DECIMAL (14, 2) NULL,
    [ts_mb_wartosc]      DECIMAL (14)    NULL,
    [ts_mb_masa]         BIGINT          NULL,
    [ts_mb_srednia_cena] DECIMAL (14, 2) NULL,
    [generacjaId]        INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dgt_tablica_s1w] PRIMARY KEY CLUSTERED ([ts_pcn] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [ts_mb_masa]
    ON [stat].[dgt_kopia_dgt_tablica_s1w]([ts_mb_masa]);


GO
CREATE STATISTICS [ts_mb_srednia_cena]
    ON [stat].[dgt_kopia_dgt_tablica_s1w]([ts_mb_srednia_cena]);


GO
CREATE STATISTICS [ts_mb_wartosc]
    ON [stat].[dgt_kopia_dgt_tablica_s1w]([ts_mb_wartosc]);


GO
CREATE STATISTICS [ts_on_masa]
    ON [stat].[dgt_kopia_dgt_tablica_s1w]([ts_on_masa]);


GO
CREATE STATISTICS [ts_on_srednia_cena]
    ON [stat].[dgt_kopia_dgt_tablica_s1w]([ts_on_srednia_cena]);


GO
CREATE STATISTICS [ts_on_wartosc]
    ON [stat].[dgt_kopia_dgt_tablica_s1w]([ts_on_wartosc]);


GO
CREATE STATISTICS [ts_op_masa]
    ON [stat].[dgt_kopia_dgt_tablica_s1w]([ts_op_masa]);


GO
CREATE STATISTICS [ts_op_srednia_cena]
    ON [stat].[dgt_kopia_dgt_tablica_s1w]([ts_op_srednia_cena]);


GO
CREATE STATISTICS [ts_op_wartosc]
    ON [stat].[dgt_kopia_dgt_tablica_s1w]([ts_op_wartosc]);

