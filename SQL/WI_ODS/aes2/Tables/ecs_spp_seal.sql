CREATE TABLE [aes2].[ecs_spp_seal] (
    [id]                     NUMERIC (19)   NOT NULL,
    [ident]                  NVARCHAR (255) NULL,
    [declcoexpsuppl_decl_id] NUMERIC (19)   NULL,
    [ident_spp]              NVARCHAR (255) NULL,
    CONSTRAINT [ecs_spp_seal$ecs_spp_se_1558605911] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_seal$fk_seal_decl_spp] FOREIGN KEY ([declcoexpsuppl_decl_id]) REFERENCES [aes2].[ecs_spp_declcoexpsuppl] ([decl_id])
);

