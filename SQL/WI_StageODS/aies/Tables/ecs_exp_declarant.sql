CREATE TABLE [aies].[ecs_exp_declarant] (
    [id]                       NUMERIC (19)  NOT NULL,
    [street_and_no]            NVARCHAR (35) NULL,
    [postcode]                 VARCHAR (9)   NULL,
    [city]                     NVARCHAR (35) NULL,
    [name_f]                   NVARCHAR (35) NULL,
    [country]                  VARCHAR (2)   NULL,
    [tin]                      VARCHAR (17)  NULL,
    [regon]                    VARCHAR (14)  NULL,
    [representative_status]    VARCHAR (1)   NULL,
    [indication]               VARCHAR (5)   NULL,
    [no_of_entry_agents_list]  NVARCHAR (35) NULL,
    [date_of_entry_agent_list] DATETIME      NULL,
    [declcoexport_decl_id]     NUMERIC (19)  NOT NULL,
    [eori]                     VARCHAR (17)  NULL,
    [email]                    VARCHAR (35)  NULL,
    CONSTRAINT [pk_ecs_exp_declarant] PRIMARY KEY CLUSTERED ([id] ASC)
);

