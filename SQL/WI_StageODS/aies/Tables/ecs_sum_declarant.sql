CREATE TABLE [aies].[ecs_sum_declarant] (
    [id]                       NUMERIC (19)  NOT NULL,
    [street_and_no]            VARCHAR (210) NULL,
    [postcode]                 VARCHAR (9)   NULL,
    [city]                     VARCHAR (50)  NULL,
    [name_f]                   VARCHAR (255) NULL,
    [country]                  CHAR (2)      NULL,
    [tin]                      VARCHAR (17)  NULL,
    [representative_status]    VARCHAR (1)   NULL,
    [indication]               VARCHAR (5)   NULL,
    [no_of_entry_agents_list]  VARCHAR (35)  NULL,
    [date_of_entry_agent_list] DATETIME      NULL,
    [sumdeclcoexit_decl_id]    NUMERIC (19)  NULL,
    [email]                    VARCHAR (35)  NULL,
    CONSTRAINT [ecs_sum_de_7374346701] PRIMARY KEY CLUSTERED ([id] ASC)
);

