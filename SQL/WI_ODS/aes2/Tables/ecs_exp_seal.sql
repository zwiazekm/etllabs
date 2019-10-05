CREATE TABLE [aes2].[ecs_exp_seal] (
    [id]                   NUMERIC (19)   NOT NULL,
    [ident]                NVARCHAR (765) NULL,
    [declcoexport_decl_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_exp_seal$pk_ecs_exp_seal] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_seal$fk_seal_decl_co_export] FOREIGN KEY ([declcoexport_decl_id]) REFERENCES [aes2].[ecs_exp_declcoexport] ([decl_id])
);

