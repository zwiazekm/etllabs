CREATE TABLE [cel].[v2_dok_poprz] (
    [idDokNr]  BIGINT       NOT NULL,
    [PozId]    SMALLINT     NOT NULL,
    [Kod]      VARCHAR (3)  NULL,
    [Nr]       VARCHAR (35) NULL,
    [NrCelina] VARCHAR (25) NULL,
    CONSTRAINT [PK_V2_DOK_POPRZ] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_POPRZ_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr])
);

