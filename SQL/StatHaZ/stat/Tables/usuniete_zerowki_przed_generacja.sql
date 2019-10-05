CREATE TABLE [stat].[usuniete_zerowki_przed_generacja] (
    [id_dok]              VARCHAR (30) NOT NULL,
    [status]              CHAR (1)     NULL,
    [typ]                 CHAR (1)     NULL,
    [miesiac]             INT          NULL,
    [numer]               SMALLINT     NULL,
    [nip_zobowiazanego]   VARCHAR (10) NULL,
    [regon_zobowiazanego] VARCHAR (14) NULL,
    [rok]                 INT          NULL,
    [wersja]              VARCHAR (3)  NULL,
    [generacjaId]         INT          NOT NULL
);

