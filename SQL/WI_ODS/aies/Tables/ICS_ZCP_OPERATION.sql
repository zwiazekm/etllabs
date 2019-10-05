﻿CREATE TABLE [aies].[ICS_ZCP_OPERATION] (
    [ID]         NUMERIC (19)   NOT NULL,
    [ZCP_ID]     NUMERIC (19)   NULL,
    [ANNOTATION] VARCHAR (1024) NULL,
    [DATE]       DATETIME       NULL,
    [NAME]       VARCHAR (4)    NULL,
    [NOTES]      VARCHAR (1024) NULL,
    [MADE_BY]    VARCHAR (40)   NULL,
    CONSTRAINT [pk_ICS_ZCP_OPERATION] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

