﻿CREATE TABLE [aies].[ICS_DSK_NIESKUTECZNE_ZAB] (
    [ID]           NUMERIC (19)  NOT NULL,
    [ICS_DSK_ID]   NUMERIC (19)  NOT NULL,
    [NR_POZYCJI]   NUMERIC (5)   NULL,
    [UZASADNIENIE] VARCHAR (256) NULL
) ON [FG_AIES];

