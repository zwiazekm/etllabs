﻿CREATE TABLE [aies].[ICS_DSK_WSP_MIEJSCE_WYLADUNKU] (
    [ID]                     NUMERIC (19)  NOT NULL,
    [ICS_DSK_ID]             NUMERIC (19)  NULL,
    [ICS_DSK_TOWAR_ID]       NUMERIC (19)  NULL,
    [KOD]                    VARCHAR (17)  NULL,
    [KRAJ]                   CHAR (2)      NULL,
    [OPIS_MIEJSCA_WYLADUNKU] VARCHAR (256) NULL,
    CONSTRAINT [pk_ICS_DSK_WSP_MIEJSCE_WYLADUNKU] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

