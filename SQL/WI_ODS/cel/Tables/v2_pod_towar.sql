CREATE TABLE [cel].[v2_pod_towar] (
    [idDokNr]     BIGINT       NOT NULL,
    [PozId]       DECIMAL (18) NOT NULL,
    [KodTowarowy] VARCHAR (8)  NULL,
    [KodTaric]    CHAR (2)     NULL,
    CONSTRAINT [PK_v2_pod_towar] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

