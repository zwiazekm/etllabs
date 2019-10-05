CREATE TABLE [int].[intr_ustalenia] (
    [nr_ustalenia]   INT           NOT NULL,
    [id_jedn]        VARCHAR (20)  NOT NULL,
    [data]           DATETIME      NULL,
    [operator]       VARCHAR (40)  NULL,
    [forma_kont]     CHAR (1)      NULL,
    [kategoria]      CHAR (1)      NULL,
    [opis]           VARCHAR (512) NULL,
    [id_pisma]       VARCHAR (35)  NULL,
    [data_wys_pisma] DATETIME      NULL,
    [nip]            VARCHAR (10)  NOT NULL,
    [rok]            INT           NOT NULL,
    [miesiac]        INT           NOT NULL,
    [typ]            CHAR (1)      NOT NULL,
    [termin_real]    DATETIME      NULL,
    [reakcja]        CHAR (1)      NULL,
    [id_dok]         VARCHAR (30)  NULL,
    [id_dok_nr_poz]  SMALLINT      NULL
);

