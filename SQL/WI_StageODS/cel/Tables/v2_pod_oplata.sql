CREATE TABLE [cel].[v2_pod_oplata] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   NUMERIC (18) NOT NULL,
    [Typ]     VARCHAR (3)  NULL,
    [Kwota]   NUMERIC (30) NULL,
    [MP]      VARCHAR (1)  NULL,
    CONSTRAINT [PK_v2_pod_oplata] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

