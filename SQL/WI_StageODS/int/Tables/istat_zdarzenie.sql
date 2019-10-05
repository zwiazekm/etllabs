CREATE TABLE [int].[istat_zdarzenie] (
    [data_zdarzenia]    DATETIME      NULL,
    [id_dok_dekl_wynik] VARCHAR (30)  NOT NULL,
    [id_zdarzenia]      VARCHAR (30)  NOT NULL,
    [komentarz]         VARCHAR (255) NULL,
    [operacja]          VARCHAR (10)  NULL,
    [wykonal]           VARCHAR (40)  NULL,
    [id_jedn]           VARCHAR (20)  NULL,
    CONSTRAINT [PK_ISTAT_ZDARZENIE] PRIMARY KEY CLUSTERED ([id_zdarzenia] ASC, [id_dok_dekl_wynik] ASC) WITH (FILLFACTOR = 90)
);

