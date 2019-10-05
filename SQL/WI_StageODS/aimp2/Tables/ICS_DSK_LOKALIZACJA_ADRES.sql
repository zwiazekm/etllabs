﻿CREATE TABLE [aimp2].[ICS_DSK_LOKALIZACJA_ADRES] (
    [ID]                     NUMERIC (19)  NOT NULL,
    [ICS_DSK_LOKALIZACJA_ID] NUMERIC (19)  NOT NULL,
    [KOD_POCZTOWY]           NVARCHAR (9)  NULL,
    [KRAJ]                   NCHAR (2)     NULL,
    [MIEJSCOWOSC]            NVARCHAR (35) NULL,
    [ULICA_I_NR]             NVARCHAR (70) NULL,
    [version]                INT           NOT NULL,
    CONSTRAINT [ICS_DSK_LOKALIZACJA_ADRES$PK_ICS_DSK_LOKALIZACJA_ADRES] PRIMARY KEY CLUSTERED ([ID] ASC)
);

