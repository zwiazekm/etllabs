﻿CREATE TABLE [aies].[ICS_DISREPANCY] (
    [id]        NUMERIC (19)   NOT NULL,
    [dirt_id]   NUMERIC (19)   NULL,
    [pointer]   VARCHAR (255)  NULL,
    [was_value] VARCHAR (1024) NULL,
    [is_value]  VARCHAR (1024) NULL,
    CONSTRAINT [ICS_DISREP_18518666331] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

