﻿CREATE TABLE [aimp2].[ICS_ZCP_TRANSACTION] (
    [ID]                  NUMERIC (19)    NOT NULL,
    [ZCP_ID]              NUMERIC (19)    NULL,
    [CURRENCY]            NUMERIC (12, 5) NULL,
    [TYPE]                NUMERIC (2)     NULL,
    [CURRENCY_OF_INVOICE] NVARCHAR (3)    NULL,
    [VALUE_DETAIL]        NVARCHAR (1)    NULL,
    [version]             INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_TRANSACTION$PK_ICS_ZCP_TRANSACTION] PRIMARY KEY CLUSTERED ([ID] ASC)
);

