﻿CREATE TABLE [aies].[ICS_ZCP_ITEM_CONTRACT] (
    [ID]          NUMERIC (19) NOT NULL,
    [ZCP_ITEM_ID] NUMERIC (19) NULL,
    [CONTR_DATE]  DATETIME     NULL,
    [CONTR_NO]    VARCHAR (35) NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_CONTRACT] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

