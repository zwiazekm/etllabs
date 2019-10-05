CREATE TABLE [cel].[sl_pcn] (
    [id_pcn]        VARCHAR (40)  NOT NULL,
    [data_od]       DATETIME      NOT NULL,
    [aktywny]       CHAR (1)      NOT NULL,
    [kod_pcn]       VARCHAR (20)  NULL,
    [jest_stawka]   CHAR (1)      NOT NULL,
    [kod_pcn_nadrz] VARCHAR (20)  NULL,
    [id_pcn_nadrz]  VARCHAR (40)  NULL,
    [kolejnosc]     INT           NULL,
    [opis1]         VARCHAR (255) NULL,
    [opis2]         VARCHAR (255) NULL,
    [opis3]         VARCHAR (255) NULL,
    [id_poz]        INT           NULL,
    CONSTRAINT [PK_sl_pcn] PRIMARY KEY CLUSTERED ([id_pcn] ASC) WITH (FILLFACTOR = 90)
);

