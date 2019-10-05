﻿CREATE TABLE [aies].[ICS_ZCP_ITEM_WDZ] (
    [ID]                 NUMERIC (19) NOT NULL,
    [ZCP_ITEM_ID]        NUMERIC (19) NULL,
    [MRN]                VARCHAR (18) NULL,
    [WDZ_NO]             NUMERIC (5)  NULL,
    [PROPRIETARY_WDZ_NO] VARCHAR (35) NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_WDZ] PRIMARY KEY CLUSTERED ([ID] ASC)
);

