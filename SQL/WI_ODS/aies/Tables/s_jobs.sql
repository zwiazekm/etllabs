CREATE TABLE [aies].[s_jobs] (
    [id]          NUMERIC (19)  NOT NULL,
    [version]     INT           NOT NULL,
    [status]      CHAR (1)      NOT NULL,
    [order_id]    VARCHAR (80)  NOT NULL,
    [system_name] VARCHAR (30)  NOT NULL,
    [queue]       VARCHAR (120) NOT NULL,
    [no_tries]    INT           DEFAULT ((0)) NOT NULL,
    [tm_start]    DATETIME      NULL,
    [tm_end]      DATETIME      NULL,
    [tm_restart]  DATETIME      NULL,
    [error_info]  VARCHAR (40)  NULL,
    CONSTRAINT [pk_S_JOBS] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

