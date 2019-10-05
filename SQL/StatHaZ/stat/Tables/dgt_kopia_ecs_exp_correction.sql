CREATE TABLE [stat].[dgt_kopia_ecs_exp_correction] (
    [id]            NUMERIC (19)    NOT NULL,
    [code]          VARCHAR (4)     NULL,
    [value]         NUMERIC (17, 2) NULL,
    [goods_item_id] NUMERIC (19)    NOT NULL,
    [generacjaId]   INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_correction] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [code]
    ON [stat].[dgt_kopia_ecs_exp_correction]([code]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_correction]([generacjaId]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_correction]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_correction]([id]);


GO
CREATE STATISTICS [value]
    ON [stat].[dgt_kopia_ecs_exp_correction]([value]);

