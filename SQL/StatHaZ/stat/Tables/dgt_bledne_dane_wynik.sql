CREATE TABLE [stat].[dgt_bledne_dane_wynik] (
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
    [bd_liczba_wierszy] BIGINT        NULL,
    [bd_kto]            VARCHAR (30)  CONSTRAINT [DF__dgt_bledn__bd_kt__48875069] DEFAULT (suser_sname()) NULL,
    [bd_kiedy]          DATETIME      CONSTRAINT [DF__dgt_bledn__bd_ki__497B74A2] DEFAULT (getdate()) NULL,
    [bd_typ]            CHAR (1)      NULL
) ON [StatDane];


GO
CREATE STATISTICS [bd_do_usuniecia]
    ON [stat].[dgt_bledne_dane_wynik]([bd_do_usuniecia]);


GO
CREATE STATISTICS [bd_id_dok_pozid]
    ON [stat].[dgt_bledne_dane_wynik]([bd_id_dok_pozid]);


GO
CREATE STATISTICS [bd_iddoknr_pozid]
    ON [stat].[dgt_bledne_dane_wynik]([bd_iddoknr_pozid]);


GO
CREATE STATISTICS [bd_koment]
    ON [stat].[dgt_bledne_dane_wynik]([bd_koment]);


GO
CREATE STATISTICS [bd_mmrr]
    ON [stat].[dgt_bledne_dane_wynik]([bd_RokMc]);


GO
CREATE STATISTICS [bd_nowa_wartosc]
    ON [stat].[dgt_bledne_dane_wynik]([bd_nowa_wartosc]);


GO
CREATE STATISTICS [bd_tabela]
    ON [stat].[dgt_bledne_dane_wynik]([bd_tabela]);


GO
CREATE STATISTICS [bd_typ]
    ON [stat].[dgt_bledne_dane_wynik]([bd_typ]);

