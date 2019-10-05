CREATE TABLE [aies].[s_logs] (
    [id]          NUMERIC (19)    NOT NULL,
    [system_name] VARCHAR (30)    NOT NULL,
    [weight]      CHAR (1)        NOT NULL,
    [log_date]    DATETIME        NOT NULL,
    [kind]        VARCHAR (80)    NOT NULL,
    [log_text]    NVARCHAR (4000) NOT NULL,
    [direction]   CHAR (1)        NULL,
    [self_ref]    VARCHAR (22)    NULL,
    CONSTRAINT [pk_s_logs] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

