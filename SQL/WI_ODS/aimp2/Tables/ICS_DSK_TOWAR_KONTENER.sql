﻿CREATE TABLE [aimp2].[ICS_DSK_TOWAR_KONTENER] (
    [ID]               NUMERIC (19)  NOT NULL,
    [ICS_DSK_TOWAR_ID] NUMERIC (19)  NULL,
    [NUMER_KONTENERA]  NVARCHAR (17) NULL,
    [version]          INT           NOT NULL,
    CONSTRAINT [ICS_DSK_TOWAR_KONTENER$PK_ICS_DSK_TOWAR_KONTENER] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_DSK_TOWAR_KONTENER$FK_ICS_DSK_TOWAR_KONTENER_ICS_DSK_TOWAR] FOREIGN KEY ([ICS_DSK_TOWAR_ID]) REFERENCES [aimp2].[ICS_DSK_TOWAR] ([ID])
);

