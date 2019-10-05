CREATE TABLE [cel].[v2_dok_ppzc] (
    [idDokNr]            BIGINT        NOT NULL,
    [Tresc]              VARCHAR (512) NULL,
    [ZgloszenieNrWlasny] VARCHAR (10)  NULL,
    [ZgloszenieNrCelina] VARCHAR (40)  NULL,
    [NrPZC]              VARCHAR (40)  NULL,
    [DataPotwierdzenia]  DATETIME      NULL,
    CONSTRAINT [PK_v2_dok_ppzc] PRIMARY KEY CLUSTERED ([idDokNr] ASC) WITH (FILLFACTOR = 90)
);

