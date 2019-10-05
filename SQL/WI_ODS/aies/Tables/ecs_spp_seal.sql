CREATE TABLE [aies].[ecs_spp_seal] (
    [id]                     NUMERIC (19)  NOT NULL,
    [ident]                  VARCHAR (255) NULL,
    [declcoexpsuppl_decl_id] NUMERIC (19)  NULL,
    [ident_spp]              VARCHAR (255) NULL,
    CONSTRAINT [ecs_spp_se_1558605911] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

