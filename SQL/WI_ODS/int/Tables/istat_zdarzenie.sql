CREATE TABLE [int].[istat_zdarzenie] (
    [data_zdarzenia]    DATETIME      NULL,
    [id_dok_dekl_wynik] VARCHAR (30)  NOT NULL,
    [id_zdarzenia]      VARCHAR (30)  NOT NULL,
    [komentarz]         VARCHAR (255) NULL,
    [operacja]          VARCHAR (10)  NULL,
    [wykonal]           VARCHAR (40)  NULL,
    [id_jedn]           VARCHAR (20)  NULL,
    CONSTRAINT [PK_ISTAT_ZDARZENIE] PRIMARY KEY CLUSTERED ([id_zdarzenia] ASC, [id_dok_dekl_wynik] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE) ON [FG_INT],
    CONSTRAINT [FK_ISTAT_ZD_REFERENCE_ISTAT_DE] FOREIGN KEY ([id_dok_dekl_wynik]) REFERENCES [int].[istat_dekl_wynik_dok] ([id_dok])
);


GO
CREATE NONCLUSTERED INDEX [idx_id_dok_dekl_wynik]
    ON [int].[istat_zdarzenie]([id_dok_dekl_wynik] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
    ON [FG_INT];

