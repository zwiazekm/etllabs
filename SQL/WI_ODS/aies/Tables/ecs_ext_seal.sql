CREATE TABLE [aies].[ecs_ext_seal] (
    [id]         NUMERIC (19)  NOT NULL,
    [identity_f] NVARCHAR (20) NULL,
    [decl_id]    NUMERIC (19)  NOT NULL,
    CONSTRAINT [pk_ecs_ext_seal] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

