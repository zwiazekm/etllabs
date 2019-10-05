CREATE TABLE [stat].[dgt_kopia_dgt_tablica_i1p] (
    [ti_pcn]             VARCHAR (4)     NOT NULL,
    [ti_on_wartosc]      DECIMAL (14)    NULL,
    [ti_on_masa]         BIGINT          NULL,
    [ti_on_srednia_cena] DECIMAL (14, 2) NULL,
    [ti_op_wartosc]      DECIMAL (14)    NULL,
    [ti_op_masa]         BIGINT          NULL,
    [ti_op_srednia_cena] DECIMAL (14, 2) NULL,
    [ti_mb_wartosc]      DECIMAL (14)    NULL,
    [ti_mb_masa]         BIGINT          NULL,
    [ti_mb_srednia_cena] DECIMAL (14, 2) NULL,
    [generacjaId]        INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dgt_tablica_i1p] PRIMARY KEY CLUSTERED ([ti_pcn] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [ti_mb_masa]
    ON [stat].[dgt_kopia_dgt_tablica_i1p]([ti_mb_masa]);


GO
CREATE STATISTICS [ti_mb_srednia_cena]
    ON [stat].[dgt_kopia_dgt_tablica_i1p]([ti_mb_srednia_cena]);


GO
CREATE STATISTICS [ti_mb_wartosc]
    ON [stat].[dgt_kopia_dgt_tablica_i1p]([ti_mb_wartosc]);


GO
CREATE STATISTICS [ti_on_masa]
    ON [stat].[dgt_kopia_dgt_tablica_i1p]([ti_on_masa]);


GO
CREATE STATISTICS [ti_on_srednia_cena]
    ON [stat].[dgt_kopia_dgt_tablica_i1p]([ti_on_srednia_cena]);


GO
CREATE STATISTICS [ti_on_wartosc]
    ON [stat].[dgt_kopia_dgt_tablica_i1p]([ti_on_wartosc]);


GO
CREATE STATISTICS [ti_op_masa]
    ON [stat].[dgt_kopia_dgt_tablica_i1p]([ti_op_masa]);


GO
CREATE STATISTICS [ti_op_srednia_cena]
    ON [stat].[dgt_kopia_dgt_tablica_i1p]([ti_op_srednia_cena]);


GO
CREATE STATISTICS [ti_op_wartosc]
    ON [stat].[dgt_kopia_dgt_tablica_i1p]([ti_op_wartosc]);

