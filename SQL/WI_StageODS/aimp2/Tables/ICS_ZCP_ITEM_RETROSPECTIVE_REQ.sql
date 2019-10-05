﻿CREATE TABLE [aimp2].[ICS_ZCP_ITEM_RETROSPECTIVE_REQ] (
    [ID]          NUMERIC (19)  NOT NULL,
    [ZCP_ITEM_ID] NUMERIC (19)  NULL,
    [DATE]        DATETIME2 (3) NULL,
    [LRN]         NVARCHAR (35) NULL,
    [PREFERENCES] NVARCHAR (3)  NULL,
    [version]     INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_RETROSPECTIVE_REQ$PK_ICS_ZCP_ITEM_RETROSPECTIVE_REQ] PRIMARY KEY CLUSTERED ([ID] ASC)
);

