CREATE TABLE [intr2].[istat_dok_zrodlowy] (
    [id_dok_zrd]                NVARCHAR (30)  NOT NULL,
    [sym_dok_zrd]               NVARCHAR (40)  NULL,
    [rodz_dok_zrd]              NVARCHAR (4)   NULL,
    [sposob_wpr_zrd]            NCHAR (1)      NULL,
    [data_wpr_zrd]              DATETIME2 (3)  NULL,
    [wprowadzil]                NVARCHAR (50)  NULL,
    [xml]                       NTEXT          NULL,
    [id_dok_dekl_wynik]         NVARCHAR (30)  NULL,
    [regon]                     NVARCHAR (14)  NULL,
    [email]                     NVARCHAR (128) NULL,
    [id_pliku]                  NVARCHAR (100) NULL,
    [nip]                       NVARCHAR (10)  NULL,
    [status]                    NCHAR (1)      NULL,
    [wersja]                    NVARCHAR (3)   NULL,
    [id_osoby]                  NVARCHAR (50)  NULL,
    [id_podmiotu]               NVARCHAR (50)  NULL,
    [id_podmiotu_posr]          NVARCHAR (50)  NULL,
    [nr_wlasny]                 NVARCHAR (14)  NULL,
    [data_dokonania_zgloszenia] DATETIME2 (3)  NULL,
    [manual]                    BIT            NOT NULL,
    [pomin_identyfikacje]       BIT            NOT NULL,
    [id_osoby_seap]             NVARCHAR (50)  NULL,
    [status_celina]             NCHAR (1)      NULL,
    [id_dekl_roboczej]          INT            NULL,
    [data_ze_zgloszenia]        DATETIME2 (3)  NULL,
    [login]                     NVARCHAR (100) NULL,
    [data_ost_zdarzenia]        DATETIME       NULL,
    CONSTRAINT [istat_dok_zrodlowy$PK_ISTAT_DOK_ZRODLOWY] PRIMARY KEY CLUSTERED ([id_dok_zrd] ASC) ON [FG_INTR2],
    CONSTRAINT [istat_dok_zrodlowy$FK_istat_dok_zrodlowy_id_dok_dekl_wynik__istat_dekl_wynik_dok_id_dok] FOREIGN KEY ([id_dok_dekl_wynik]) REFERENCES [intr2].[istat_dekl_wynik_dok] ([id_dok])
) TEXTIMAGE_ON [FG_INTR2];


GO
ALTER TABLE [intr2].[istat_dok_zrodlowy] NOCHECK CONSTRAINT [istat_dok_zrodlowy$FK_istat_dok_zrodlowy_id_dok_dekl_wynik__istat_dekl_wynik_dok_id_dok];

