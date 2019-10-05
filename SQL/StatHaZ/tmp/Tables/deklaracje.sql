CREATE TABLE [tmp].[deklaracje] (
    [nip]               VARCHAR (10)   NULL,
    [id_pod]            VARCHAR (35)   NULL,
    [RokMc]             INT            NULL,
    [typ]               VARCHAR (1)    NULL,
    [wartosc_dekl]      BIGINT         NULL,
    [warunki_dostawy]   INT            NULL,
    [rodzaj_transportu] INT            NULL,
    [wartosc_stat]      INT            NULL,
    [wartosc_rdin]      BIGINT         NULL,
    [wspolczynnik]      DECIMAL (5, 2) NULL,
    [id_jedn]           VARCHAR (6)    NULL
);

