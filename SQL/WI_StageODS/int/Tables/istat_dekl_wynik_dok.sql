CREATE TABLE [int].[istat_dekl_wynik_dok] (
    [id_dok]              VARCHAR (30) NOT NULL,
    [status]              CHAR (1)     NULL,
    [typ]                 CHAR (1)     NULL,
    [miesiac]             INT          NULL,
    [numer]               SMALLINT     NULL,
    [nip_zobowiazanego]   VARCHAR (10) NULL,
    [regon_zobowiazanego] VARCHAR (14) NULL,
    [rok]                 INT          NULL,
    [wersja]              VARCHAR (3)  NULL,
    [id_jedn]             VARCHAR (20) NULL,
    CONSTRAINT [PK_istat_dekl_wynik_dok] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 70)
);

