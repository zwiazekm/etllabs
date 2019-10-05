CREATE TABLE [stat].[dgt_kopia_ecs_exp_seal] (
    [id]                   NUMERIC (19)   NOT NULL,
    [ident]                NVARCHAR (255) NULL,
    [declcoexport_decl_id] NUMERIC (19)   NOT NULL,
    [generacjaId]          INT            NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_seal] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [declcoexport_decl_id]
    ON [stat].[dgt_kopia_ecs_exp_seal]([declcoexport_decl_id]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_seal]([generacjaId]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_seal]([id]);


GO
CREATE STATISTICS [ident]
    ON [stat].[dgt_kopia_ecs_exp_seal]([ident]);

