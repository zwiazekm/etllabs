﻿CREATE TABLE [aimp2].[ICS_ZCP_ITEM_CONTRACT] (
    [ID]          NUMERIC (19)  NOT NULL,
    [ZCP_ITEM_ID] NUMERIC (19)  NULL,
    [CONTR_DATE]  DATETIME2 (3) NULL,
    [CONTR_NO]    NVARCHAR (35) NULL,
    [version]     INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_CONTRACT$PK_ICS_ZCP_ITEM_CONTRACT] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_ZCP_ITEM_CONTRACT$FK_ICS_ZCP_ITEM_CONTRACT_ICS_ZCP_ITEM] FOREIGN KEY ([ZCP_ITEM_ID]) REFERENCES [aimp2].[ICS_ZCP_ITEM] ([ID])
);

