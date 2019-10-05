﻿CREATE TABLE [aimp2].[ICS_DSK_PODM_W_LANCUCHU] (
    [ID]            NUMERIC (19)  NOT NULL,
    [ICS_DSK_ID]    NUMERIC (19)  NOT NULL,
    [ROLA]          NCHAR (3)     NOT NULL,
    [IDENTYFIKATOR] NVARCHAR (17) NOT NULL,
    [version]       INT           NOT NULL,
    CONSTRAINT [PK_ICS_DSK_PODM_W_LANCUCHU] PRIMARY KEY CLUSTERED ([ID] ASC)
);

