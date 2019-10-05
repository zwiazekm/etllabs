CREATE TABLE [aies].[ecs_spp_exporter] (
    [id]                        NUMERIC (19)  NOT NULL,
    [city]                      VARCHAR (255) NULL,
    [country]                   VARCHAR (255) NULL,
    [name_f]                    VARCHAR (255) NULL,
    [postcode]                  VARCHAR (255) NULL,
    [street_and_no]             VARCHAR (255) NULL,
    [tin]                       VARCHAR (255) NULL,
    [eori]                      VARCHAR (17)  NULL,
    [regon]                     VARCHAR (14)  NULL,
    [eori_spp]                  VARCHAR (17)  NULL,
    [tin_spp]                   VARCHAR (17)  NULL,
    [declcoexportsuppl_decl_id] NUMERIC (19)  NULL,
    [email]                     VARCHAR (35)  NULL,
    CONSTRAINT [ecs_spp_ex_19513429851] PRIMARY KEY CLUSTERED ([id] ASC)
);

