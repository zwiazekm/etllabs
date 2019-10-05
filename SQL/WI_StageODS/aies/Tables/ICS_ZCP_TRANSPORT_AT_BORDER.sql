﻿CREATE TABLE [aies].[ICS_ZCP_TRANSPORT_AT_BORDER] (
    [ID]                           NUMERIC (19) NOT NULL,
    [ZCP_ID]                       NUMERIC (19) NULL,
    [TRANSPORT_AFFIL_ACTIVE_MEANS] VARCHAR (2)  NULL,
    [KIND_OF_TRANSPORT]            VARCHAR (4)  NULL,
    [MARKINGS]                     VARCHAR (35) NULL,
    CONSTRAINT [pk_ICS_ZCP_TRANSPORT_AT_BORDER] PRIMARY KEY CLUSTERED ([ID] ASC)
);

