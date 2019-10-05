﻿CREATE TABLE [aies].[ICS_ZCP_ITEM_CONTAINER] (
    [ID]               NUMERIC (19) NOT NULL,
    [ZCP_ITEM_ID]      NUMERIC (19) NULL,
    [CONTAINER_NUMBER] VARCHAR (17) NULL,
    CONSTRAINT [pk_ICS_ZCP_ITEM_CONTAINER] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

