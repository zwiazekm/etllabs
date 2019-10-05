CREATE TABLE [stat].[dgt_kopia_ecs_exp_item_br_c] (
    [id]            NUMERIC (19)   NOT NULL,
    [comment_f]     NVARCHAR (140) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    [generacjaId]   INT            NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_item_br_c] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [comment_f]
    ON [stat].[dgt_kopia_ecs_exp_item_br_c]([comment_f]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_item_br_c]([generacjaId]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_item_br_c]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_item_br_c]([id]);

