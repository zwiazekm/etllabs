CREATE TABLE [stat].[dgt_kopia_ecs_exp_declarant] (
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
    [generacjaId]              INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_declarant] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [city]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([city]);


GO
CREATE STATISTICS [country]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([country]);


GO
CREATE STATISTICS [date_of_entry_agent_list]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([date_of_entry_agent_list]);


GO
CREATE STATISTICS [declcoexport_decl_id]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([declcoexport_decl_id]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([generacjaId]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([id]);


GO
CREATE STATISTICS [indication]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([indication]);


GO
CREATE STATISTICS [name_f]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([name_f]);


GO
CREATE STATISTICS [no_of_entry_agents_list]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([no_of_entry_agents_list]);


GO
CREATE STATISTICS [postcode]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([postcode]);


GO
CREATE STATISTICS [regon]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([regon]);


GO
CREATE STATISTICS [representative_status]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([representative_status]);


GO
CREATE STATISTICS [street_and_no]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([street_and_no]);


GO
CREATE STATISTICS [tin]
    ON [stat].[dgt_kopia_ecs_exp_declarant]([tin]);

