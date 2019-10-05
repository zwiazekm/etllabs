CREATE TABLE [cel].[v2_pod_oplata] (
    [idDokNr] BIGINT       NOT NULL,
    [PozId]   DECIMAL (18) NOT NULL,
    [Typ]     VARCHAR (3)  NULL,
    [Kwota]   DECIMAL (30) NULL,
    [MP]      CHAR (1)     NULL,
    CONSTRAINT [PK_v2_pod_oplata] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

