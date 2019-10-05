CREATE TABLE [aies].[ecs_spp_seal_suppl] (
    [id]                    NUMERIC (19)  NOT NULL,
    [ident]                 VARCHAR (255) NULL,
    [declcoexp_spp_decl_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_spp_se_1878607051] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

