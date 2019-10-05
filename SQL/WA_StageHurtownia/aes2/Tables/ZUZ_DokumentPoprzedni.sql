﻿CREATE TABLE [aes2].[ZUZ_DokumentPoprzedni] (
    [Id]                    NUMERIC (19)  NOT NULL,
    [NrDokPoprz]            NVARCHAR (35) NULL,
    [NrDokPoprzWUzupln]     NVARCHAR (35) NULL,
    [KodDokPoprz]           NVARCHAR (6)  NULL,
    [KodDokPoprzPid]        NVARCHAR (6)  NULL,
    [KodDokPoprzWUzupln]    NVARCHAR (6)  NULL,
    [KodDokPoprzWUzuplnPid] NVARCHAR (6)  NULL,
    [IdTowarZUZ]            NUMERIC (19)  NULL,
    CONSTRAINT [ZUZ_DokumentPoprzedni$PK_ZUZ_DokumentPoprzedni] PRIMARY KEY CLUSTERED ([Id] ASC)
);

