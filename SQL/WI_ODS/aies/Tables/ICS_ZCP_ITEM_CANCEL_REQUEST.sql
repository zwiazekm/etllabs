﻿CREATE TABLE [aies].[ICS_ZCP_ITEM_CANCEL_REQUEST] (
    [ID]          NUMERIC (19)   NOT NULL,
    [ZCP_ITEM_ID] NUMERIC (19)   NULL,
    [MRN]         VARCHAR (18)   NULL,
    [ITEM_NO]     NUMERIC (5)    NULL,
    [STATE]       VARCHAR (4)    NULL,
    [REASON]      VARCHAR (1024) NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_CANCEL_REQUEST] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

