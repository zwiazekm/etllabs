CREATE TABLE [aies].[ecs_sum_submitter] (
    [id]                    NUMERIC (19)  NOT NULL,
    [street_and_no]         VARCHAR (210) NULL,
    [postcode]              VARCHAR (9)   NULL,
    [city]                  VARCHAR (50)  NULL,
    [name_f]                VARCHAR (255) NULL,
    [country]               CHAR (2)      NULL,
    [tin]                   VARCHAR (17)  NULL,
    [regon]                 VARCHAR (14)  NULL,
    [eori]                  VARCHAR (17)  NULL,
    [sumdeclcoexit_decl_id] NUMERIC (19)  NULL,
    [email]                 VARCHAR (35)  NULL,
    CONSTRAINT [ecs_sum_su_8814351831] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

