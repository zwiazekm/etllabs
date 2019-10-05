CREATE TABLE [aies].[ecs_exp_deferred_payment] (
    [id]                   NUMERIC (19) NOT NULL,
    [ref]                  VARCHAR (17) NULL,
    [declcoexport_decl_id] NUMERIC (19) NOT NULL,
    CONSTRAINT [pk_ecs_exp_deferred_payment] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

