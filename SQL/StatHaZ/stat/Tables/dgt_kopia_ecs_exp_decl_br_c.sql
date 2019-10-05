CREATE TABLE [stat].[dgt_kopia_ecs_exp_decl_br_c] (
    [id]                   NUMERIC (19)   NOT NULL,
    [comment_f]            NVARCHAR (140) NULL,
    [declcoexport_decl_id] NUMERIC (19)   NOT NULL,
    [generacjaId]          INT            NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_decl_br_c] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [comment_f]
    ON [stat].[dgt_kopia_ecs_exp_decl_br_c]([comment_f]);


GO
CREATE STATISTICS [declcoexport_decl_id]
    ON [stat].[dgt_kopia_ecs_exp_decl_br_c]([declcoexport_decl_id]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_decl_br_c]([generacjaId]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_decl_br_c]([id]);

