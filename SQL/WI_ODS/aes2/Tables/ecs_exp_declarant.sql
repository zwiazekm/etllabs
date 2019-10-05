CREATE TABLE [aes2].[ecs_exp_declarant] (
    [id]                       NUMERIC (19)   NOT NULL,
    [street_and_no]            NVARCHAR (105) NULL,
    [postcode]                 NVARCHAR (9)   NULL,
    [city]                     NVARCHAR (105) NULL,
    [name_f]                   NVARCHAR (105) NULL,
    [country]                  NVARCHAR (2)   NULL,
    [tin]                      NVARCHAR (17)  NULL,
    [regon]                    NVARCHAR (14)  NULL,
    [representative_status]    NVARCHAR (1)   NULL,
    [indication]               NVARCHAR (5)   NULL,
    [no_of_entry_agents_list]  NVARCHAR (105) NULL,
    [date_of_entry_agent_list] DATETIME2 (3)  NULL,
    [declcoexport_decl_id]     NUMERIC (19)   NOT NULL,
    [eori]                     NVARCHAR (17)  NULL,
    [email]                    NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_exp_declarant$pk_ecs_exp_declarant] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_declarant$fk_declarant_decl_co_export] FOREIGN KEY ([declcoexport_decl_id]) REFERENCES [aes2].[ecs_exp_declcoexport] ([decl_id])
);


GO
ALTER TABLE [aes2].[ecs_exp_declarant] NOCHECK CONSTRAINT [ecs_exp_declarant$fk_declarant_decl_co_export];

