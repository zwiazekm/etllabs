CREATE TABLE [aies].[s_jobs_ics] (
    [id]          NUMERIC (19)  NOT NULL,
    [no_tries]    INT           NOT NULL,
    [order_id]    VARCHAR (80)  NOT NULL,
    [queue]       VARCHAR (120) NOT NULL,
    [status]      CHAR (1)      NOT NULL,
    [system_name] VARCHAR (30)  NOT NULL,
    [tm_end]      DATETIME      NULL,
    [tm_restart]  DATETIME      NULL,
    [tm_start]    DATETIME      NULL,
    [version]     INT           NOT NULL,
    [error_info]  VARCHAR (40)  NULL,
    CONSTRAINT [s_jobs_ics_20626273602] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

