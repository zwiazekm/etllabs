﻿CREATE TABLE [aimp2].[ICS_ZCP_CONTAINER] (
    [ID]                NUMERIC (19)  NOT NULL,
    [ZCP_ID]            NUMERIC (19)  NULL,
    [CONTAINER_NUMBER]  NVARCHAR (17) NOT NULL,
    [ZCP_CONTAINER_ACF] NTEXT         NULL,
    [version]           INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_CONTAINER$ICS_ZCP_CO_7520026791] PRIMARY KEY CLUSTERED ([ID] ASC)
);

