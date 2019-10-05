CREATE TABLE [aes2].[QUERY_DokumentPoprzedni] (
    [Id]                NUMERIC (19)  NOT NULL,
    [NrDokPoprz]        NVARCHAR (35) NULL,
    [KodJezykaDokPoprz] NVARCHAR (2)  NULL,
    [KodDokPoprz]       NVARCHAR (6)  NULL,
    [KodDokPoprzPid]    INT           NULL,
    [IdTowarQUERY]      NUMERIC (19)  NULL,
    CONSTRAINT [QUERY_DokumentPoprzedni$PK_QUERY_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([Id] ASC)
);

