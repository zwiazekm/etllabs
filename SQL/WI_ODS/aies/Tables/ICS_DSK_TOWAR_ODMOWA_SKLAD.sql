﻿CREATE TABLE [aies].[ICS_DSK_TOWAR_ODMOWA_SKLAD] (
    [ID]                    NUMERIC (19)   NOT NULL,
    [ICS_DSK_TOWAR_ID]      NUMERIC (19)   NULL,
    [OPIS_NIEPRAWIDLOWOSCI] VARCHAR (1024) NULL,
    [UZASADNIENIE]          VARCHAR (256)  NULL,
    CONSTRAINT [pk_ICS_DSK_TOWAR_ODMOWA_SKLAD] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

