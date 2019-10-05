CREATE TABLE [zc].[ZWU_DokumentPoprzedni] (
    [Id]             DECIMAL (19)  NOT NULL,
    [KodDokPoprz]    VARCHAR (6)   NULL,
    [KodDokPoprzPid] INT           NULL,
    [NrDokPoprz]     NVARCHAR (35) NULL,
    [IdTowarZWU]     DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWU_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([Id] ASC)
);

