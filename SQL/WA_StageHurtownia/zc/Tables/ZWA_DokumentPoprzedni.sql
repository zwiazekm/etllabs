CREATE TABLE [zc].[ZWA_DokumentPoprzedni] (
    [Id]             DECIMAL (19)  NOT NULL,
    [KodDokPoprz]    VARCHAR (6)   NULL,
    [KodDokPoprzPid] INT           NULL,
    [NrDokPoprz]     NVARCHAR (35) NULL,
    [IdTowarZWA]     DECIMAL (19)  NULL,
    CONSTRAINT [PK_ZWA_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([Id] ASC)
);

