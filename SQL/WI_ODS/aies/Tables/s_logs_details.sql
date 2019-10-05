CREATE TABLE [aies].[s_logs_details] (
    [id]     NUMERIC (19)   NOT NULL,
    [log_id] NUMERIC (19)   NULL,
    [name]   VARCHAR (255)  NOT NULL,
    [value]  VARCHAR (1024) NOT NULL,
    CONSTRAINT [pk_s_logs_details] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

