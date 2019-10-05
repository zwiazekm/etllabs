CREATE TABLE [aes2].[ecs_spp_seal_suppl] (
    [id]                    NUMERIC (19)   NOT NULL,
    [ident]                 NVARCHAR (255) NULL,
    [declcoexp_spp_decl_id] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_spp_seal_suppl$ecs_spp_se_1878607051] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_seal_suppl$fk_seal_suppl_decl_spp] FOREIGN KEY ([declcoexp_spp_decl_id]) REFERENCES [aes2].[ecs_spp_declcoexpsuppl] ([decl_id])
);

