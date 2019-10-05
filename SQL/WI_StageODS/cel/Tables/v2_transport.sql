CREATE TABLE [cel].[v2_transport] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   SMALLINT     NOT NULL,
    [Rodzaj]  VARCHAR (1)  NULL,
    [Znaki]   VARCHAR (27) NULL,
    [Kraj]    VARCHAR (2)  NULL,
    CONSTRAINT [PK_V2_TRANSPORT] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

