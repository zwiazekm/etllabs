﻿CREATE TABLE [aimp2].[ICS_ZCP_CONTROL_CO] (
    [ID]             NUMERIC (19) NOT NULL,
    [ZCP_ID]         NUMERIC (19) NULL,
    [CODE]           NVARCHAR (8) NULL,
    [NAME]           NVARCHAR (8) NULL,
    [ZCP_ADDRESS_ID] NUMERIC (19) NULL,
    [version]        INT          NOT NULL,
    CONSTRAINT [ICS_ZCP_CONTROL_CO$PK_ICS_ZCP_CONTROL_CO] PRIMARY KEY CLUSTERED ([ID] ASC)
);

