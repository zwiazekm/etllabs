CREATE TABLE [aes2].[ecs_exp_correction] (
    [id]            NUMERIC (19)    NOT NULL,
    [code]          NVARCHAR (4)    NULL,
    [value]         NUMERIC (17, 2) NULL,
    [goods_item_id] NUMERIC (19)    NOT NULL,
    CONSTRAINT [ecs_exp_correction$pk_ecs_exp_correction] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_correction$fk_correction_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_exp_goods_item] ([id])
);

