CREATE TABLE [aes2].[ecs_sum_seal] (
    [id]                    NUMERIC (19)   NOT NULL,
    [ident]                 NVARCHAR (255) NULL,
    [sumdeclcoexit_decl_id] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_sum_seal$ecs_sum_se_8654351261] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_sum_seal$fk_seal_sumdecl_co_exit] FOREIGN KEY ([sumdeclcoexit_decl_id]) REFERENCES [aes2].[ecs_sum_declcoexit] ([decl_id])
);

