CREATE TABLE [intr2].[istat_dekl_wynik_blad] (
    [id_dok] NVARCHAR (30)  NOT NULL,
    [pozid]  SMALLINT       NOT NULL,
    [numer]  SMALLINT       NULL,
    [typ]    NCHAR (1)      NULL,
    [kod]    NVARCHAR (255) NULL,
    [opis]   NVARCHAR (255) NULL,
    [id]     NUMERIC (19)   NOT NULL,
    CONSTRAINT [istat_dekl_wynik_blad$PK_ISTAT_DEKL_WYNIK_BLAD] PRIMARY KEY CLUSTERED ([id] ASC)
);

