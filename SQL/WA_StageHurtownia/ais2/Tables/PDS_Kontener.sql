﻿CREATE TABLE [ais2].[PDS_Kontener] (
    [Id]            NUMERIC (19)  NOT NULL,
    [NrKontenera]   VARCHAR (255) NULL,
    [StanKontenera] VARCHAR (4)   NULL,
    [IdTowarPDS]    NUMERIC (19)  NULL,
    CONSTRAINT [PDS_Kontener$PK_PDS_Kontener] PRIMARY KEY CLUSTERED ([Id] ASC)
);

