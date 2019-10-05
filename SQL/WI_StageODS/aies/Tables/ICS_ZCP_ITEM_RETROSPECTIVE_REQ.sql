﻿CREATE TABLE [aies].[ICS_ZCP_ITEM_RETROSPECTIVE_REQ] (
    [ID]          NUMERIC (19) NOT NULL,
    [ZCP_ITEM_ID] NUMERIC (19) NULL,
    [DATE]        DATETIME     NULL,
    [LRN]         VARCHAR (35) NULL,
    [PREFERENCES] VARCHAR (3)  NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_RETROSPECTIVE_REQ] PRIMARY KEY CLUSTERED ([ID] ASC)
);

