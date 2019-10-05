﻿CREATE TABLE [intr2].[QRTZ_TRIGGERS] (
    [SCHED_NAME]     NVARCHAR (120) NOT NULL,
    [TRIGGER_NAME]   NVARCHAR (80)  NOT NULL,
    [TRIGGER_GROUP]  NVARCHAR (80)  NOT NULL,
    [JOB_NAME]       NVARCHAR (80)  NOT NULL,
    [JOB_GROUP]      NVARCHAR (80)  NOT NULL,
    [DESCRIPTION]    NVARCHAR (120) NULL,
    [NEXT_FIRE_TIME] NUMERIC (13)   NULL,
    [PREV_FIRE_TIME] NUMERIC (13)   NULL,
    [PRIORITY]       INT            NULL,
    [TRIGGER_STATE]  NVARCHAR (16)  NOT NULL,
    [TRIGGER_TYPE]   NVARCHAR (8)   NOT NULL,
    [START_TIME]     NUMERIC (13)   NOT NULL,
    [END_TIME]       NUMERIC (13)   NULL,
    [CALENDAR_NAME]  NVARCHAR (80)  NULL,
    [MISFIRE_INSTR]  SMALLINT       NULL,
    [JOB_DATA]       IMAGE          NULL,
    CONSTRAINT [QRTZ_TRIGGERS$PK_qrtz_triggers] PRIMARY KEY CLUSTERED ([SCHED_NAME] ASC, [TRIGGER_NAME] ASC, [TRIGGER_GROUP] ASC) ON [FG_INTR2],
    CONSTRAINT [QRTZ_TRIGGERS$FK_triggers_job_details] FOREIGN KEY ([SCHED_NAME], [JOB_NAME], [JOB_GROUP]) REFERENCES [intr2].[QRTZ_JOB_DETAILS] ([SCHED_NAME], [JOB_NAME], [JOB_GROUP])
) TEXTIMAGE_ON [FG_INTR2];

