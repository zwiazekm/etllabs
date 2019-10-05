﻿CREATE TABLE [ncts].[ENQ_REM] (
    [DAT_ENQ_REM]      DATETIME    NOT NULL,
    [ENQ_COMM_SID]     INT         NOT NULL,
    [HIGH_AUTH_OFF_ID] VARCHAR (8) NOT NULL,
    CONSTRAINT [PK_ENQ_REM] PRIMARY KEY CLUSTERED ([DAT_ENQ_REM] ASC, [ENQ_COMM_SID] ASC, [HIGH_AUTH_OFF_ID] ASC) ON [FG_NCTS],
    CONSTRAINT [ER_ECS_OF_CO] FOREIGN KEY ([ENQ_COMM_SID]) REFERENCES [ncts].[ENQ_COMM] ([SID]),
    CONSTRAINT [ER_HAOI_OF_CO] FOREIGN KEY ([HIGH_AUTH_OFF_ID]) REFERENCES [ncts].[CUST_OFF] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [ER_ECS_I]
    ON [ncts].[ENQ_REM]([ENQ_COMM_SID] ASC)
    ON [FG_NCTS];


GO
CREATE NONCLUSTERED INDEX [ER_HAOI_I]
    ON [ncts].[ENQ_REM]([HIGH_AUTH_OFF_ID] ASC)
    ON [FG_NCTS];

