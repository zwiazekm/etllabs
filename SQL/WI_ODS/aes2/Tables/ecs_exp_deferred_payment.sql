CREATE TABLE [aes2].[ecs_exp_deferred_payment] (
    [id]                   NUMERIC (19)  NOT NULL,
    [ref]                  NVARCHAR (35) NULL,
    [declcoexport_decl_id] NUMERIC (19)  NOT NULL,
    CONSTRAINT [ecs_exp_deferred_payment$pk_ecs_exp_deferred_payment] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_deferred_payment$fk_defer_pay_decl_co_export] FOREIGN KEY ([declcoexport_decl_id]) REFERENCES [aes2].[ecs_exp_declcoexport] ([decl_id])
);

