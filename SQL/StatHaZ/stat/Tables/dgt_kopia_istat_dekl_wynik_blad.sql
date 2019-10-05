CREATE TABLE [stat].[dgt_kopia_istat_dekl_wynik_blad] (
    [id_dok]      VARCHAR (30)  NOT NULL,
    [pozid]       SMALLINT      NOT NULL,
    [numer]       SMALLINT      NOT NULL,
    [typ]         CHAR (1)      NULL,
    [kod]         VARCHAR (10)  NULL,
    [opis]        VARCHAR (255) NULL,
    [generacjaId] INT           NOT NULL
) ON [StatIndeksy];

