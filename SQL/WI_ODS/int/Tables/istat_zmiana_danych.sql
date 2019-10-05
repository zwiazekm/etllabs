CREATE TABLE [int].[istat_zmiana_danych] (
    [id_dok_dekl_wynik] VARCHAR (30)  NOT NULL,
    [id_zdarzenia]      VARCHAR (30)  NOT NULL,
    [nazwa_danej]       VARCHAR (255) NOT NULL,
    [pozid]             NUMERIC (11)  NOT NULL,
    [pozycja_danej]     SMALLINT      NOT NULL,
    [wartosc_po]        VARCHAR (255) NULL,
    [wartosc_przed]     VARCHAR (255) NULL,
    [id_jedn]           VARCHAR (20)  NULL,
    CONSTRAINT [PK_ISTAT_ZMIANA_DANYCH] PRIMARY KEY CLUSTERED ([id_zdarzenia] ASC, [id_dok_dekl_wynik] ASC, [pozid] ASC, [pozycja_danej] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE) ON [FG_INT],
    CONSTRAINT [FK_ISTAT_ZM_REFERENCE_ISTAT_ZD] FOREIGN KEY ([id_zdarzenia], [id_dok_dekl_wynik]) REFERENCES [int].[istat_zdarzenie] ([id_zdarzenia], [id_dok_dekl_wynik])
);

