CREATE TABLE [stat].[dgt_kopia_ecs_exp_package] (
    [id]             NUMERIC (19)  NOT NULL,
    [no_of_packages] INT           NULL,
    [kind]           VARCHAR (2)   NULL,
    [no_of_pieces]   INT           NULL,
    [state_br]       CHAR (1)      NOT NULL,
    [marks]          NVARCHAR (42) NULL,
    [goods_item_id]  NUMERIC (19)  NOT NULL,
    [generacjaId]    INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_package] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_package]([generacjaId]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_package]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_package]([id]);


GO
CREATE STATISTICS [kind]
    ON [stat].[dgt_kopia_ecs_exp_package]([kind]);


GO
CREATE STATISTICS [marks]
    ON [stat].[dgt_kopia_ecs_exp_package]([marks]);


GO
CREATE STATISTICS [no_of_packages]
    ON [stat].[dgt_kopia_ecs_exp_package]([no_of_packages]);


GO
CREATE STATISTICS [no_of_pieces]
    ON [stat].[dgt_kopia_ecs_exp_package]([no_of_pieces]);


GO
CREATE STATISTICS [state_br]
    ON [stat].[dgt_kopia_ecs_exp_package]([state_br]);

