CREATE TABLE [stat].[dgt_kopia_ecs_exp_national_add_code] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          VARCHAR (4)  NULL,
    [goods_item_id] NUMERIC (19) NOT NULL,
    [generacjaId]   INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_national_add_code] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [code]
    ON [stat].[dgt_kopia_ecs_exp_national_add_code]([code]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_national_add_code]([generacjaId]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_national_add_code]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_national_add_code]([id]);

