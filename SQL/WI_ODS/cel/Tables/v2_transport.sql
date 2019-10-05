CREATE TABLE [cel].[v2_transport] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [Rodzaj]  CHAR (1)     NULL,
    [Znaki]   VARCHAR (27) NULL,
    [Kraj]    VARCHAR (2)  NULL,
    CONSTRAINT [PK_V2_TRANSPORT] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_TRANSPORT_DOK_INFO] FOREIGN KEY ([idDokNr]) REFERENCES [cel].[v2_dok_info] ([idDokNr])
);

