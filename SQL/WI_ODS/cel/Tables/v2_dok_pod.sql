CREATE TABLE [cel].[v2_dok_pod] (
    [idDokNr]                      BIGINT         NOT NULL,
    [TIN]                          VARCHAR (17)   NULL,
    [DodatkowaKwotaZabezpieczenia] DECIMAL (30)   NULL,
    [Informacja]                   VARCHAR (2048) NULL,
    CONSTRAINT [PK_v2_dok_pod] PRIMARY KEY CLUSTERED ([idDokNr] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

