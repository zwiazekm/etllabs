CREATE TABLE [aies].[ecs_spp_consignee] (
    [id]                  NUMERIC (19)  NOT NULL,
    [city]                VARCHAR (255) NULL,
    [country]             VARCHAR (255) NULL,
    [name_f]              VARCHAR (255) NULL,
    [postcode]            VARCHAR (255) NULL,
    [street_and_no]       VARCHAR (255) NULL,
    [tin]                 VARCHAR (255) NULL,
    [eori]                VARCHAR (17)  NULL,
    [regon]               VARCHAR (14)  NULL,
    [declcosuppl_decl_id] NUMERIC (19)  NULL,
    [email]               VARCHAR (35)  NULL,
    CONSTRAINT [ecs_spp_co_17593423011] PRIMARY KEY CLUSTERED ([id] ASC)
);

