CREATE TABLE [intr2].[istat_dok_zrodlowy_roboczy] (
    [id]                        INT            NOT NULL,
    [login]                     NVARCHAR (100) NOT NULL,
    [data_utworzenia]           DATETIME2 (3)  NOT NULL,
    [date_modyfikacji]          DATETIME2 (3)  NOT NULL,
    [xml]                       NTEXT          NULL,
    [data_dokonania_zgloszenia] DATETIME2 (3)  NULL,
    [komentarz]                 NTEXT          NULL,
    [zrodlo_wpr]                NVARCHAR (1)   NULL,
    [status_uploadu]            NVARCHAR (1)   NULL,
    [id_dok_zrd]                NVARCHAR (30)  NULL,
    [nip]                       NVARCHAR (10)  NULL,
    [nr_wlasny]                 NVARCHAR (14)  NULL,
    [data_wprowadzenia]         DATETIME2 (3)  NULL,
    CONSTRAINT [istat_dok_zrodlowy_roboczy$PK_istat_dok_zrodlowy_roboczy] PRIMARY KEY CLUSTERED ([id] ASC)
);

