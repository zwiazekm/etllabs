﻿CREATE TABLE [aimp2].[ICS_ZCP_TRANSPORT_AT_BORDER] (
    [ID]                           NUMERIC (19)  NOT NULL,
    [ZCP_ID]                       NUMERIC (19)  NULL,
    [TRANSPORT_AFFIL_ACTIVE_MEANS] NVARCHAR (2)  NULL,
    [KIND_OF_TRANSPORT]            NVARCHAR (4)  NULL,
    [MARKINGS]                     NVARCHAR (35) NULL,
    [TRANSPORT_MEANS_ID]           NUMERIC (2)   NULL,
    [version]                      INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_TRANSPORT_AT_BORDER$PK_ICS_ZCP_TRANSPORT_AT_BORDER] PRIMARY KEY CLUSTERED ([ID] ASC)
);

