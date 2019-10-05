CREATE TABLE [aies].[ecs_spp_declarant] (
    [id]                       NUMERIC (19)  NOT NULL,
    [city]                     VARCHAR (255) NULL,
    [country]                  VARCHAR (255) NULL,
    [name_f]                   VARCHAR (255) NULL,
    [postcode]                 VARCHAR (255) NULL,
    [street_and_no]            VARCHAR (255) NULL,
    [tin]                      VARCHAR (255) NULL,
    [eori]                     VARCHAR (17)  NULL,
    [regon]                    VARCHAR (14)  NULL,
    [date_of_entry_agent_list] DATETIME      NULL,
    [indication]               VARCHAR (5)   NULL,
    [no_of_entry_agents_list]  VARCHAR (35)  NULL,
    [representative_status]    VARCHAR (1)   NULL,
    [declcoexpsuppl_decl_id]   NUMERIC (19)  NULL,
    [email]                    VARCHAR (35)  NULL,
    CONSTRAINT [ecs_spp_de_18553426431] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

