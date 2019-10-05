CREATE TABLE [aes2].[ecs_los_seal] (
    [id]                    NUMERIC (19)   NOT NULL,
    [ident]                 NVARCHAR (255) NULL,
    [losdeclcoexit_decl_id] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_los_seal$ecs_los_se_1523845811] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_los_seal$fk_seal_losdecl_co_exit] FOREIGN KEY ([losdeclcoexit_decl_id]) REFERENCES [aes2].[ecs_los_declcoexit] ([decl_id])
);

