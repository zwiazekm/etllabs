CREATE TABLE [cel].[v2_pod_towar] (
    [idDokNr]     BIGINT       NOT NULL,
    [PozId]       NUMERIC (18) NOT NULL,
    [KodTowarowy] VARCHAR (8)  NULL,
    [KodTaric]    VARCHAR (2)  NULL,
    CONSTRAINT [PK_v2_pod_towar] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

