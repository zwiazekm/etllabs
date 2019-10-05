CREATE TABLE [aies].[ecs_exp_seal] (
    [id]                   NUMERIC (19)   NOT NULL,
    [ident]                NVARCHAR (255) NULL,
    [declcoexport_decl_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [pk_ecs_exp_seal] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

