CREATE TABLE [aes2].[ecs_exp_decl_br_c] (
    [id]                   NUMERIC (19)   NOT NULL,
    [comment_f]            NVARCHAR (420) NULL,
    [declcoexport_decl_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_exp_decl_br_c$pk_ecs_exp_decl_br_c] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_decl_br_c$fk_decl_br_c_decl_co_export] FOREIGN KEY ([declcoexport_decl_id]) REFERENCES [aes2].[ecs_exp_declcoexport] ([decl_id])
);

