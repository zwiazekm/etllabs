CREATE TABLE [aies].[sec_user_history] (
    [id]          NUMERIC (19)  NOT NULL,
    [user_id]     NUMERIC (19)  NOT NULL,
    [group_id]    NUMERIC (19)  NULL,
    [group_name]  VARCHAR (40)  NULL,
    [department]  VARCHAR (255) NULL,
    [startdate]   DATETIME      NULL,
    [enddate]     DATETIME      NULL,
    [user_status] TINYINT       NULL,
    CONSTRAINT [sec_user_h_18880067262] PRIMARY KEY CLUSTERED ([id] ASC)
);

