CREATE TABLE [aes2].[ecs_spp_consignee] (
    [id]                       NUMERIC (19)   NOT NULL,
    [city]                     NVARCHAR (255) NULL,
    [country]                  NVARCHAR (255) NULL,
    [name_f]                   NVARCHAR (255) NULL,
    [postcode]                 NVARCHAR (255) NULL,
    [street_and_no]            NVARCHAR (255) NULL,
    [tin]                      NVARCHAR (255) NULL,
    [eori]                     NVARCHAR (17)  NULL,
    [regon]                    NVARCHAR (14)  NULL,
    [declcosuppl_decl_id]      NUMERIC (19)   NULL,
    [email]                    NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_spp_consignee$ecs_spp_co_17593423011] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_consignee$fk_consignee_decl_co_suppl] FOREIGN KEY ([declcosuppl_decl_id]) REFERENCES [aes2].[ecs_spp_declcoexpsuppl] ([decl_id])
);

