CREATE TABLE [stat].[dgt_kopia_dgt_tablica_i2w] (
    [ti_pcn]           VARCHAR (4)     NOT NULL,
    [ti_on_wartosc]    DECIMAL (14)    NULL,
    [ti_on_wartosc100] DECIMAL (15, 1) NULL,
    [ti_mb_wartosc]    DECIMAL (14)    NULL,
    [ti_mb_wartosc100] DECIMAL (15, 1) NULL,
    [ti_mp_wartosc100] DECIMAL (15, 1) NULL,
    [generacjaId]      INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dgt_tablica_i2w] PRIMARY KEY CLUSTERED ([ti_pcn] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [ti_mb_wartosc]
    ON [stat].[dgt_kopia_dgt_tablica_i2w]([ti_mb_wartosc]);


GO
CREATE STATISTICS [ti_mb_wartosc100]
    ON [stat].[dgt_kopia_dgt_tablica_i2w]([ti_mb_wartosc100]);


GO
CREATE STATISTICS [ti_mp_wartosc100]
    ON [stat].[dgt_kopia_dgt_tablica_i2w]([ti_mp_wartosc100]);


GO
CREATE STATISTICS [ti_on_wartosc]
    ON [stat].[dgt_kopia_dgt_tablica_i2w]([ti_on_wartosc]);


GO
CREATE STATISTICS [ti_on_wartosc100]
    ON [stat].[dgt_kopia_dgt_tablica_i2w]([ti_on_wartosc100]);

