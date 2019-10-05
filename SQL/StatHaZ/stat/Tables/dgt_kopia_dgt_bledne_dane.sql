CREATE TABLE [stat].[dgt_kopia_dgt_bledne_dane] (
    [bd_mmrr]           VARCHAR (4)    NULL,
    [bd_rodzaj]         VARCHAR (100)  NULL,
    [bd_tabela]         VARCHAR (100)  NULL,
    [bd_bledna_wartosc] VARCHAR (100)  NULL,
    [bd_nowa_wartosc]   VARCHAR (100)  NULL,
    [bd_iddoknr]        BIGINT         NULL,
    [bd_id_dok]         VARCHAR (35)   NULL,
    [bd_iddoknr_pozid]  BIGINT         NULL,
    [bd_id_dok_pozid]   BIGINT         NULL,
    [bd_do_usuniecia]   VARCHAR (1)    NULL,
    [bd_koment]         VARCHAR (500)  NULL,
    [bd_pk]             NUMERIC (18)   NULL,
    [bd_status]         VARCHAR (1)    NULL,
    [bd_autor]          VARCHAR (10)   NULL,
    [bd_id_pliku]       NUMERIC (18)   NULL,
    [bd_data_wpisu]     DATETIME       NULL,
    [bd_typ]            VARCHAR (1)    NULL,
    [uname]             VARCHAR (50)   NULL,
    [zm_statusu]        NVARCHAR (255) NULL
) ON [StatDane];


GO
CREATE STATISTICS [bd_autor]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_autor]);


GO
CREATE STATISTICS [bd_bledna_wartosc]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_bledna_wartosc]);


GO
CREATE STATISTICS [bd_data_wpisu]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_data_wpisu]);


GO
CREATE STATISTICS [bd_do_usuniecia]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_do_usuniecia]);


GO
CREATE STATISTICS [bd_id_dok]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_id_dok]);


GO
CREATE STATISTICS [bd_id_dok_pozid]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_id_dok_pozid]);


GO
CREATE STATISTICS [bd_id_pliku]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_id_pliku]);


GO
CREATE STATISTICS [bd_iddoknr]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_iddoknr]);


GO
CREATE STATISTICS [bd_iddoknr_pozid]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_iddoknr_pozid]);


GO
CREATE STATISTICS [bd_koment]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_koment]);


GO
CREATE STATISTICS [bd_mmrr]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_mmrr]);


GO
CREATE STATISTICS [bd_nowa_wartosc]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_nowa_wartosc]);


GO
CREATE STATISTICS [bd_pk]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_pk]);


GO
CREATE STATISTICS [bd_rodzaj]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_rodzaj]);


GO
CREATE STATISTICS [bd_status]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_status]);


GO
CREATE STATISTICS [bd_tabela]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_tabela]);


GO
CREATE STATISTICS [bd_typ]
    ON [stat].[dgt_kopia_dgt_bledne_dane]([bd_typ]);

