CREATE TABLE [stat].[dgt_kopia_ecs_exp_quantity_of_goods] (
    [id]                NUMERIC (19)    NOT NULL,
    [unit]              VARCHAR (3)     NULL,
    [qualifier_of_unit] VARCHAR (1)     NULL,
    [quantity]          NUMERIC (18, 3) NULL,
    [goods_item_id]     NUMERIC (19)    NOT NULL,
    [generacjaId]       INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_quantity_of_goods] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_quantity_of_goods]([generacjaId]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_quantity_of_goods]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_quantity_of_goods]([id]);


GO
CREATE STATISTICS [qualifier_of_unit]
    ON [stat].[dgt_kopia_ecs_exp_quantity_of_goods]([qualifier_of_unit]);


GO
CREATE STATISTICS [quantity]
    ON [stat].[dgt_kopia_ecs_exp_quantity_of_goods]([quantity]);


GO
CREATE STATISTICS [unit]
    ON [stat].[dgt_kopia_ecs_exp_quantity_of_goods]([unit]);

