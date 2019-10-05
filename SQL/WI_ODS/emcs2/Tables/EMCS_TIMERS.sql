﻿CREATE TABLE [emcs2].[EMCS_TIMERS] (
    [ID]           NUMERIC (38)  NOT NULL,
    [TYPE]         VARCHAR (20)  NOT NULL,
    [START_DATE]   DATETIME2 (6) NOT NULL,
    [RUNNING]      CHAR (1)      NOT NULL,
    [EXPIRED]      CHAR (1)      NOT NULL,
    [LIMIT_DATE]   DATETIME2 (6) NOT NULL,
    [STOP_DATE]    DATETIME2 (6) NULL,
    [MVMT_ID]      NUMERIC (38)  NULL,
    [USER_TASK_ID] NUMERIC (38)  NULL,
    [ACO_ID]       NUMERIC (38)  NULL,
    CONSTRAINT [PK_TIMERS] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_EMCS2],
    CONSTRAINT [FK_TIMERS_1] FOREIGN KEY ([TYPE]) REFERENCES [emcs2].[EMCS_TIMER_TYPES] ([TIMER_TYPE]),
    CONSTRAINT [FK_TIMERS_2] FOREIGN KEY ([MVMT_ID]) REFERENCES [emcs2].[MOVEMENTS] ([ID]),
    CONSTRAINT [FK_TIMERS_3] FOREIGN KEY ([USER_TASK_ID]) REFERENCES [emcs2].[EMCS_USER_TASKS] ([ID]),
    CONSTRAINT [FK_TIMERS_4] FOREIGN KEY ([ACO_ID]) REFERENCES [emcs2].[EMCS_ACO] ([ID])
);

