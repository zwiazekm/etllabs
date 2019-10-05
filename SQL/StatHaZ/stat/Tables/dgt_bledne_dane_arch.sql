CREATE TABLE [stat].[dgt_bledne_dane_arch] (
    [bd_RokMc]          INT            NULL,
    [bd_rodzaj]         VARCHAR (100)  NULL,
    [bd_tabela]         VARCHAR (100)  NULL,
    [bd_bledna_wartosc] VARCHAR (100)  NULL,
    [bd_nowa_wartosc]   VARCHAR (100)  NULL,
    [bd_iddoknr]        BIGINT         NULL,
    [bd_id_dok]         VARCHAR (35)   NULL,
    [bd_iddoknr_pozid]  BIGINT         NULL,
    [bd_id_dok_pozid]   BIGINT         NULL,
    [bd_do_usuniecia]   CHAR (1)       NULL,
    [bd_koment]         VARCHAR (500)  NULL,
    [bd_pk]             BIGINT         NOT NULL,
    [bd_status]         CHAR (1)       NULL,
    [bd_autor]          VARCHAR (10)   NULL,
    [bd_id_pliku]       NUMERIC (18)   NULL,
    [bd_data_wpisu]     DATETIME       NULL,
    [bd_typ]            CHAR (1)       NULL,
    [uname]             VARCHAR (50)   NULL,
    [zm_statusu]        NVARCHAR (255) NULL,
    [bd_kto]            VARCHAR (30)   CONSTRAINT [DF__dgt_bledn__bd_kt__0F19C8E3] DEFAULT (suser_sname()) NULL,
    [bd_kiedy]          DATETIME       CONSTRAINT [DF__dgt_bledn__bd_ki__100DED1C] DEFAULT (getdate()) NULL
) ON [StatDane];

