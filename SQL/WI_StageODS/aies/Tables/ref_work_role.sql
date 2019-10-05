CREATE TABLE [aies].[ref_work_role] (
    [id]               NUMERIC (19) NOT NULL,
    [work_position_id] NUMERIC (19) NOT NULL,
    [role_f]           VARCHAR (20) NOT NULL,
    [transport]        VARCHAR (20) NOT NULL,
    CONSTRAINT [pk_ref_work_role] PRIMARY KEY CLUSTERED ([id] ASC)
);

