CREATE TABLE [intr2].[istat_dekl_wynik_dok] (
    [id_dok]              NVARCHAR (30) NOT NULL,
    [status]              NCHAR (1)     NULL,
    [typ]                 NCHAR (1)     NULL,
    [rok]                 INT           NULL,
    [miesiac]             INT           NULL,
    [numer]               SMALLINT      NULL,
    [nip_zobowiazanego]   NVARCHAR (10) NULL,
    [regon_zobowiazanego] NVARCHAR (14) NULL,
    [wersja]              NVARCHAR (3)  NULL,
    [sym_dok]             NVARCHAR (40) NULL,
    [id_sprawy]           NVARCHAR (50) NULL,
    [data_utworzenia]     DATETIME2 (3) NULL,
    CONSTRAINT [istat_dekl_wynik_dok$PK_ISTAT_DEKL_WYNIK_DOK] PRIMARY KEY CLUSTERED ([id_dok] ASC) ON [FG_INTR2]
);

