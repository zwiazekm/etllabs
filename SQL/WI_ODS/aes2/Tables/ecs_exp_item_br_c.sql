CREATE TABLE [aes2].[ecs_exp_item_br_c] (
    [id]            NUMERIC (19)   NOT NULL,
    [comment_f]     NVARCHAR (420) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_exp_item_br_c$pk_ecs_exp_item_br_c] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_item_br_c$fk_exp_item_br_c_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_exp_goods_item] ([id])
);

