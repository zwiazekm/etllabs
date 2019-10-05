CREATE TABLE [intr2].[istat_zmiana_danych] (
    [id_zdarzenia]  NVARCHAR (30)   NOT NULL,
    [pozid]         NUMERIC (11)    NOT NULL,
    [nazwa_danej]   NVARCHAR (1000) NULL,
    [pozycja_danej] SMALLINT        NOT NULL,
    [wartosc_przed] NVARCHAR (320)  NULL,
    [wartosc_po]    NVARCHAR (320)  NULL,
    CONSTRAINT [istat_zmiana_danych$PK_ISTAT_ZMIANA_DANYCH] PRIMARY KEY CLUSTERED ([id_zdarzenia] ASC, [pozid] ASC, [pozycja_danej] ASC) ON [FG_INTR2]
);

