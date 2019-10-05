CREATE TABLE [aies].[s_logs_error_codes] (
    [id]         NUMERIC (19) NOT NULL,
    [log_id]     NUMERIC (19) NULL,
    [error_code] VARCHAR (4)  NOT NULL,
    CONSTRAINT [s_logs_err_7881948272] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

