CREATE TABLE [stat].[dgt_bledne_dane_1] (
    [bd_RokMc]          INT           NULL,
    [bd_rodzaj]         VARCHAR (100) NULL,
    [bd_tabela]         VARCHAR (100) NULL,
    [bd_bledna_wartosc] VARCHAR (100) NULL,
    [bd_nowa_wartosc]   VARCHAR (100) NULL,
    [bd_iddoknr]        BIGINT        NULL,
    [bd_id_dok]         VARCHAR (35)  NULL,
    [bd_iddoknr_pozid]  BIGINT        NULL,
    [bd_id_dok_pozid]   BIGINT        NULL,
    [bd_do_usuniecia]   CHAR (1)      NULL,
    [bd_koment]         VARCHAR (500) NULL,
    [bd_typ]            CHAR (1)      NULL,
    [uname]             NVARCHAR (50) NULL,
    CONSTRAINT [CK_dgt_bledne_dane_1] CHECK (NOT [bd_nowa_wartosc] like '% %' AND NOT [bd_nowa_wartosc] like '%,%' AND NOT [bd_nowa_wartosc] like '%.%')
);

