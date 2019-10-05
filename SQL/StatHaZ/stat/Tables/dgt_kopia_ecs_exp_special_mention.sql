CREATE TABLE [stat].[dgt_kopia_ecs_exp_special_mention] (
    [id]            NUMERIC (19)  NOT NULL,
    [code]          VARCHAR (5)   NULL,
    [text]          NVARCHAR (70) NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    [generacjaId]   INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_special_mention] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [code]
    ON [stat].[dgt_kopia_ecs_exp_special_mention]([code]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_special_mention]([generacjaId]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_special_mention]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_special_mention]([id]);


GO
CREATE STATISTICS [text]
    ON [stat].[dgt_kopia_ecs_exp_special_mention]([text]);

