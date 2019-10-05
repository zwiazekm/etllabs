CREATE TABLE [aes2].[ecs_spp_exporter] (
    [id]                        NUMERIC (19)   NOT NULL,
    [city]                      NVARCHAR (255) NULL,
    [country]                   NVARCHAR (255) NULL,
    [name_f]                    NVARCHAR (255) NULL,
    [postcode]                  NVARCHAR (255) NULL,
    [street_and_no]             NVARCHAR (255) NULL,
    [tin]                       NVARCHAR (255) NULL,
    [eori]                      NVARCHAR (17)  NULL,
    [regon]                     NVARCHAR (14)  NULL,
    [eori_spp]                  NVARCHAR (17)  NULL,
    [tin_spp]                   NVARCHAR (17)  NULL,
    [declcoexportsuppl_decl_id] NUMERIC (19)   NULL,
    [email]                     NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID]  NUMERIC (19)   NULL,
    CONSTRAINT [ecs_spp_exporter$ecs_spp_ex_19513429851] PRIMARY KEY CLUSTERED ([id] ASC)
);

