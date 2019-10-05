﻿CREATE TABLE [aimp2].[ICS_ZCP_CANCEL_REQUEST] (
    [ID]      NUMERIC (19)    NOT NULL,
    [ZCP_ID]  NUMERIC (19)    NULL,
    [MRN]     NVARCHAR (18)   NULL,
    [ITEM_NO] NUMERIC (5)     NULL,
    [STATE]   NVARCHAR (4)    NULL,
    [REASON]  NVARCHAR (1024) NULL,
    [version] INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_CANCEL_REQUEST$PK_ICS_ZCP_CANCEL_REQUEST] PRIMARY KEY CLUSTERED ([ID] ASC)
);

