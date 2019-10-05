CREATE TABLE [aies].[sec_groups_history] (
    [id]         NUMERIC (19) NOT NULL,
    [action_id]  NUMERIC (19) NOT NULL,
    [group_id]   NUMERIC (19) NULL,
    [group_name] VARCHAR (40) NULL,
    [startdate]  DATETIME     NULL,
    [enddate]    DATETIME     NULL,
    CONSTRAINT [sec_groups_7005264982] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

