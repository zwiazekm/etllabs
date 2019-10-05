﻿CREATE TABLE [ais2].[ICS_DIRT_POSITION] (
    [id]           NUMERIC (19) NOT NULL,
    [directive_id] NUMERIC (19) NULL,
    [position]     NUMERIC (5)  NOT NULL,
    CONSTRAINT [ICS_DIRT_POSITION$ICS_DIRT_P_14581012041] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIS2],
    CONSTRAINT [ICS_DIRT_POSITION$ICS_DIRT_P_1111112118] FOREIGN KEY ([directive_id]) REFERENCES [ais2].[ICS_DIRT] ([ID])
);

