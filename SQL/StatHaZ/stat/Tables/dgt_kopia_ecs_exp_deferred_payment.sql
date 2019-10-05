CREATE TABLE [stat].[dgt_kopia_ecs_exp_deferred_payment] (
    [id]                   NUMERIC (19) NOT NULL,
    [ref]                  VARCHAR (17) NULL,
    [declcoexport_decl_id] NUMERIC (19) NOT NULL,
    [generacjaId]          INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_deferred_payment] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [declcoexport_decl_id]
    ON [stat].[dgt_kopia_ecs_exp_deferred_payment]([declcoexport_decl_id]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_deferred_payment]([generacjaId]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_deferred_payment]([id]);


GO
CREATE STATISTICS [ref]
    ON [stat].[dgt_kopia_ecs_exp_deferred_payment]([ref]);

