CREATE TABLE [aies].[ecs_spp_deferred_payment] (
    [id]                     NUMERIC (19) NOT NULL,
    [ref]                    VARCHAR (17) NULL,
    [ref_spp]                VARCHAR (17) NULL,
    [declcoexpsuppl_decl_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_spp_de_19193428711] PRIMARY KEY CLUSTERED ([id] ASC)
);

