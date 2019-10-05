CREATE TABLE [int].[istat_dekl_wynik_blad] (
    [id_dok]  VARCHAR (30)  NOT NULL,
    [pozid]   SMALLINT      NOT NULL,
    [numer]   SMALLINT      NOT NULL,
    [typ]     CHAR (1)      NULL,
    [kod]     VARCHAR (10)  NULL,
    [opis]    VARCHAR (255) NULL,
    [id_jedn] VARCHAR (20)  NULL,
    CONSTRAINT [PK_istat_dekl_wynik_blad] PRIMARY KEY CLUSTERED ([id_dok] ASC, [pozid] ASC, [numer] ASC) WITH (FILLFACTOR = 70)
);

