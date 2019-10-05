CREATE TABLE [aes2].[ecs_spp_declarant] (
    [id]                       NUMERIC (19)   NOT NULL,
    [city]                     NVARCHAR (255) NULL,
    [country]                  NVARCHAR (255) NULL,
    [name_f]                   NVARCHAR (255) NULL,
    [postcode]                 NVARCHAR (255) NULL,
    [street_and_no]            NVARCHAR (255) NULL,
    [tin]                      NVARCHAR (255) NULL,
    [eori]                     NVARCHAR (17)  NULL,
    [regon]                    NVARCHAR (14)  NULL,
    [date_of_entry_agent_list] DATETIME2 (3)  NULL,
    [indication]               NVARCHAR (5)   NULL,
    [no_of_entry_agents_list]  NVARCHAR (35)  NULL,
    [representative_status]    NVARCHAR (1)   NULL,
    [declcoexpsuppl_decl_id]   NUMERIC (19)   NULL,
    [email]                    NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_spp_declarant$ecs_spp_de_18553426431] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_declarant$fk_declarant_decl_spp] FOREIGN KEY ([declcoexpsuppl_decl_id]) REFERENCES [aes2].[ecs_spp_declcoexpsuppl] ([decl_id])
);

