CREATE TABLE [wald].[dgt_bledne_dane] (
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
    [bd_typ]            VARCHAR (1)   NULL,
    [bd_pk]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [uname]             NVARCHAR (50) NULL,
    CONSTRAINT [PK_dgt_bledne_dane] PRIMARY KEY CLUSTERED ([bd_pk] ASC) ON [WaldDane]
);

