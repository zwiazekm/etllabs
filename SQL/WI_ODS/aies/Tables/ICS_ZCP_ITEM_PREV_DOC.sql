﻿CREATE TABLE [aies].[ICS_ZCP_ITEM_PREV_DOC] (
    [ID]          NUMERIC (19) NOT NULL,
    [ZCP_ITEM_ID] NUMERIC (19) NULL,
    [CATEGORY]    VARCHAR (1)  NULL,
    [CODE]        VARCHAR (3)  NULL,
    [PREV_DOC_NO] NUMERIC (5)  NULL,
    [NUMBER]      VARCHAR (35) NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_PREV_DOC] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

