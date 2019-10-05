﻿CREATE TABLE [emcs2].[EMCS_USER_TASK_TYPES] (
    [TASK_TYPE]   VARCHAR (40)  NOT NULL,
    [DESCRIPTION] VARCHAR (350) NOT NULL,
    CONSTRAINT [PK_USER_TASKS_TYPES] PRIMARY KEY CLUSTERED ([TASK_TYPE] ASC)
);

