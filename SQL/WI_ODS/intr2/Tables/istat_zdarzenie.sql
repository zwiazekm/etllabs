CREATE TABLE [intr2].[istat_zdarzenie] (
    [id_zdarzenia]      NVARCHAR (30)  NOT NULL,
    [id_dok_dekl_wynik] NVARCHAR (30)  NULL,
    [data_zdarzenia]    DATETIME2 (3)  NULL,
    [operacja]          NVARCHAR (10)  NULL,
    [wykonal]           NVARCHAR (40)  NULL,
    [komentarz]         NVARCHAR (360) NULL,
    [id_dok_dekl_zrd]   NVARCHAR (30)  NULL,
    [identity_id]       NUMERIC (20)   NOT NULL,
    CONSTRAINT [istat_zdarzenie$PK_ISTAT_ZDARZENIE] PRIMARY KEY CLUSTERED ([id_zdarzenia] ASC) ON [FG_INTR2],
    CONSTRAINT [istat_zdarzenie$FK_ISTAT_ZD_REFERENCE_ISTAT_DE] FOREIGN KEY ([id_dok_dekl_wynik]) REFERENCES [intr2].[istat_dekl_wynik_dok] ([id_dok]),
    CONSTRAINT [istat_zdarzenie$FK_ISTAT_ZDARZENIE_ISTAT_DOK_ZRODLOWY_ID] FOREIGN KEY ([id_dok_dekl_zrd]) REFERENCES [intr2].[istat_dok_zrodlowy] ([id_dok_zrd])
);

