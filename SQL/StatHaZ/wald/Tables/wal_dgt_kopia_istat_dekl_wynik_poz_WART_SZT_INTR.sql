CREATE TABLE [wald].[wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR] (
    [stat]              NVARCHAR (2)    NULL,
    [koment]            NVARCHAR (50)   NULL,
    [uname]             NVARCHAR (50)   NULL,
    [id_dok]            VARCHAR (50)    NOT NULL,
    [pozid]             BIGINT          NOT NULL,
    [status]            CHAR (1)        NULL,
    [komentarz]         VARCHAR (255)   NULL,
    [opis_towaru]       VARCHAR (255)   NULL,
    [kraj_przezn_wysyl] VARCHAR (2)     NULL,
    [warunki_dostawy]   VARCHAR (3)     NULL,
    [rodzaj_transakcji] VARCHAR (2)     NULL,
    [rodzaj_transportu] VARCHAR (2)     NULL,
    [kod_towarowy]      VARCHAR (8)     NULL,
    [kraj_pochodzenia]  VARCHAR (2)     NULL,
    [masa_netto]        DECIMAL (11)    NULL,
    [uzup_jm]           DECIMAL (11)    NULL,
    [wartosc_faktury]   DECIMAL (15)    NULL,
    [wartosc_stat]      DECIMAL (15)    NULL,
    [wsk_progowy]       CHAR (1)        NULL,
    [flaga]             VARCHAR (6)     NULL,
    [semafor]           VARCHAR (40)    NULL,
    [generacjaId]       INT             NOT NULL,
    [wart_jm]           NUMERIC (38, 2) NULL,
    CONSTRAINT [PK_wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR] PRIMARY KEY CLUSTERED ([id_dok] ASC, [pozid] ASC) ON [WaldDane]
);


GO

CREATE TRIGGER [wald].[uname_wart_szt_intr] ON [wald].[wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR] 
FOR UPDATE
AS
update [wald].[wal_dgt_kopia_istat_dekl_wynik_poz_WART_SZT_INTR] 
set uname=suser_sname()
where id_dok in (select id_dok from deleted) and pozid in (select pozid from deleted)