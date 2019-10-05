﻿CREATE TABLE [aies].[ICS_ZCP_NAT_ADD_CODES] (
    [ID]            NUMERIC (19) NOT NULL,
    [ZCP_ITEM_ID]   NUMERIC (19) NULL,
    [NATIONAL_CODE] VARCHAR (4)  NULL,
    CONSTRAINT [pk_ICS_ZCP_NAT_ADD_CODES] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

