CREATE TABLE [aes2].[ecs_ext_seal] (
    [id]         NUMERIC (19)  NOT NULL,
    [identity_f] NVARCHAR (60) NULL,
    [decl_id]    NUMERIC (19)  NOT NULL,
    CONSTRAINT [ecs_ext_seal$pk_ecs_ext_seal] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_ext_seal$fk_seal_decl_co_exit] FOREIGN KEY ([decl_id]) REFERENCES [aes2].[ecs_ext_declcoexit] ([decl_id])
);

