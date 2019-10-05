CREATE TABLE [aes2].[ecs_exp_taric_add_code] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          NVARCHAR (4) NULL,
    [goods_item_id] NUMERIC (19) NOT NULL,
    CONSTRAINT [ecs_exp_taric_add_code$pk_ecs_exp_taric_add_code] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_taric_add_code$fk_taric_add_code_goods_it] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_exp_goods_item] ([id])
);

