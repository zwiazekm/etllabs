CREATE TABLE [aies].[ecs_los_exporter] (
    [id]                    NUMERIC (19)  NOT NULL,
    [city]                  VARCHAR (35)  NULL,
    [country]               CHAR (2)      NULL,
    [name_f]                VARCHAR (255) NULL,
    [postcode]              VARCHAR (9)   NULL,
    [street_and_no]         VARCHAR (35)  NULL,
    [tin]                   VARCHAR (17)  NULL,
    [eori]                  VARCHAR (17)  NULL,
    [regon]                 VARCHAR (14)  NULL,
    [losdeclcoexit_decl_id] NUMERIC (19)  NULL,
    [email]                 VARCHAR (35)  NULL,
    CONSTRAINT [ecs_los_ex_21078675451] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

