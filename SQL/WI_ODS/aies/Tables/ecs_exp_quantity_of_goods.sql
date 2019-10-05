CREATE TABLE [aies].[ecs_exp_quantity_of_goods] (
    [id]                NUMERIC (19)    NOT NULL,
    [unit]              VARCHAR (3)     NULL,
    [qualifier_of_unit] VARCHAR (1)     NULL,
    [quantity]          NUMERIC (18, 3) NULL,
    [goods_item_id]     NUMERIC (19)    NOT NULL,
    CONSTRAINT [pk_ecs_exp_quantity_of_goods] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

