﻿CREATE TABLE [zc].[ZWA_Kontener] (
    [Id]            DECIMAL (19)   NOT NULL,
    [NrKontenera]   NVARCHAR (255) NULL,
    [StanKontenera] CHAR (1)       NULL,
    [IdTowarZWA]    DECIMAL (19)   NULL,
    CONSTRAINT [PK_ZWA_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC)
);

