CREATE TABLE [wald].[dgt_bledne_dane_aktual] (
    [bd_mmrr]           VARCHAR (4)   NULL,
    [bd_rodzaj]         VARCHAR (100) NULL,
    [bd_tabela]         VARCHAR (100) NULL,
    [bd_bledna_wartosc] VARCHAR (100) NULL,
    [bd_nowa_wartosc]   VARCHAR (100) NULL,
    [bd_iddoknr]        BIGINT        NULL,
    [bd_id_dok]         VARCHAR (35)  NULL,
    [bd_iddoknr_pozid]  BIGINT        NULL,
    [bd_id_dok_pozid]   BIGINT        NULL,
    [bd_do_usuniecia]   VARCHAR (1)   NULL,
    [bd_koment]         VARCHAR (500) NULL,
    [bd_pk]             DECIMAL (18)  NULL,
    [bd_status]         VARCHAR (1)   NULL,
    [bd_autor]          VARCHAR (10)  NULL,
    [bd_id_pliku]       DECIMAL (18)  NULL,
    [bd_data_wpisu]     DATETIME      NULL,
    [bd_typ]            VARCHAR (1)   NULL
) ON [WaldDane];

