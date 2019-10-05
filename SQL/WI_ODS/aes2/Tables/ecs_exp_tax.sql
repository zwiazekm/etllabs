CREATE TABLE [aes2].[ecs_exp_tax] (
    [id]                NUMERIC (19)    NOT NULL,
    [base]              NUMERIC (17, 2) NULL,
    [rate]              NUMERIC (7, 2)  NULL,
    [amount]            NUMERIC (15, 2) NULL,
    [method_of_payment] NVARCHAR (1)    NULL,
    [type]              NVARCHAR (3)    NULL,
    [goods_item_id]     NUMERIC (19)    NOT NULL,
    CONSTRAINT [ecs_exp_tax$pk_ecs_exp_tax] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_tax$fk_tax_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_exp_goods_item] ([id])
);

