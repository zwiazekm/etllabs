﻿CREATE TABLE [aimp2].[ICS_ZCP_ITEM_VALUE_INFO] (
    [ID]                NUMERIC (19)    NOT NULL,
    [ZCP_ITEM_ID]       NUMERIC (19)    NULL,
    [VALUATION_METHOD]  NVARCHAR (3)    NULL,
    [STATISTICAL_VALUE] NUMERIC (16, 2) NOT NULL,
    [ITEM_VALUE]        NUMERIC (16, 2) NULL,
    [version]           INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_VALUE_INFO$PK_ICS_ZCP_ITEM_VALUE_INFO] PRIMARY KEY CLUSTERED ([ID] ASC)
);

