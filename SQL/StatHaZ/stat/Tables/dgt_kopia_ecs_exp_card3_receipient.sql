CREATE TABLE [stat].[dgt_kopia_ecs_exp_card3_receipient] (
    [id]                   NUMERIC (19)  NOT NULL,
    [street_and_no]        NVARCHAR (35) NULL,
    [postcode]             VARCHAR (9)   NULL,
    [city]                 NVARCHAR (35) NULL,
    [name_f]               NVARCHAR (35) NULL,
    [country]              VARCHAR (2)   NULL,
    [declcoexport_decl_id] NUMERIC (19)  NOT NULL,
    [generacjaId]          INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_card3_receipient] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [city]
    ON [stat].[dgt_kopia_ecs_exp_card3_receipient]([city]);


GO
CREATE STATISTICS [country]
    ON [stat].[dgt_kopia_ecs_exp_card3_receipient]([country]);


GO
CREATE STATISTICS [declcoexport_decl_id]
    ON [stat].[dgt_kopia_ecs_exp_card3_receipient]([declcoexport_decl_id]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_card3_receipient]([generacjaId]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_card3_receipient]([id]);


GO
CREATE STATISTICS [name_f]
    ON [stat].[dgt_kopia_ecs_exp_card3_receipient]([name_f]);


GO
CREATE STATISTICS [postcode]
    ON [stat].[dgt_kopia_ecs_exp_card3_receipient]([postcode]);


GO
CREATE STATISTICS [street_and_no]
    ON [stat].[dgt_kopia_ecs_exp_card3_receipient]([street_and_no]);

