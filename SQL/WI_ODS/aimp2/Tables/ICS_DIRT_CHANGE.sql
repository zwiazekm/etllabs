﻿CREATE TABLE [aimp2].[ICS_DIRT_CHANGE] (
    [ID]            NUMERIC (19)    NOT NULL,
    [DIRT_ID]       NUMERIC (19)    NULL,
    [AFFECTS]       NVARCHAR (30)   NULL,
    [AFTER]         NVARCHAR (100)  NULL,
    [JUSTIFICATION] NVARCHAR (1024) NULL,
    [INITIAL_VALUE] NVARCHAR (100)  NULL,
    [version]       INT             NOT NULL,
    CONSTRAINT [ICS_DIRT_CHANGE$PK_ICS_DIRT_CHANGE] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_DIRT_CHANGE$FK_ICS_DIRT_CHANGE_ICS_DIRT] FOREIGN KEY ([DIRT_ID]) REFERENCES [aimp2].[ICS_DIRT] ([ID])
);

