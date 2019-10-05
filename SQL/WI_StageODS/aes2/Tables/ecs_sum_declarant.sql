CREATE TABLE [aes2].[ecs_sum_declarant] (
    [id]                       NUMERIC (19)   NOT NULL,
    [street_and_no]            NVARCHAR (255) NULL,
    [postcode]                 NVARCHAR (255) NULL,
    [city]                     NVARCHAR (255) NULL,
    [name_f]                   NVARCHAR (255) NULL,
    [country]                  NVARCHAR (255) NULL,
    [tin]                      NVARCHAR (255) NULL,
    [representative_status]    NVARCHAR (1)   NULL,
    [indication]               NVARCHAR (5)   NULL,
    [no_of_entry_agents_list]  NVARCHAR (35)  NULL,
    [date_of_entry_agent_list] DATETIME2 (3)  NULL,
    [sumdeclcoexit_decl_id]    NUMERIC (19)   NULL,
    [email]                    NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_sum_declarant$ecs_sum_de_7374346701] PRIMARY KEY CLUSTERED ([id] ASC)
);

