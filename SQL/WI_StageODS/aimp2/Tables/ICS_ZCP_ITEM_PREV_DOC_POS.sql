﻿CREATE TABLE [aimp2].[ICS_ZCP_ITEM_PREV_DOC_POS] (
    [ID]                   NUMERIC (19) NOT NULL,
    [ZCP_ITEM_PREV_DOC_ID] NUMERIC (19) NOT NULL,
    [PREV_DOC_NO]          NUMERIC (5)  NOT NULL,
    [version]              INT          NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_PREV_DOC_POS$ICS_ZCP_IT_1690486071] PRIMARY KEY CLUSTERED ([ID] ASC)
);

