CREATE TABLE [cel].[v2_pod_decyzja] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   NUMERIC (18) NOT NULL,
    [Nr]      VARCHAR (40) NULL,
    [Data]    DATETIME     NULL,
    CONSTRAINT [PK_v2_pod_decyzja] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

