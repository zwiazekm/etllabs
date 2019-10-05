CREATE TABLE [aies].[sec_users_groups] (
    [user_id]  NUMERIC (19) NOT NULL,
    [group_id] NUMERIC (19) NOT NULL,
    CONSTRAINT [pk_sec_users_groups] PRIMARY KEY CLUSTERED ([user_id] ASC, [group_id] ASC)
);

