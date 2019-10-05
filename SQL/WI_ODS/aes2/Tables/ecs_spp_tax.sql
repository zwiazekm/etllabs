CREATE TABLE [aes2].[ecs_spp_tax] (
    [id]                    NUMERIC (19)    NOT NULL,
    [amount]                NUMERIC (15, 2) NULL,
    [amount_spp]            NUMERIC (15, 2) NULL,
    [base]                  NUMERIC (17, 2) NULL,
    [base_spp]              NUMERIC (17, 2) NULL,
    [method_of_payment]     NVARCHAR (1)    NULL,
    [method_of_payment_spp] NVARCHAR (1)    NULL,
    [rate]                  NUMERIC (7, 2)  NULL,
    [rate_spp]              NUMERIC (7, 2)  NULL,
    [type]                  NVARCHAR (3)    NULL,
    [type_spp]              NVARCHAR (3)    NULL,
    [goods_item_id]         NUMERIC (19)    NULL,
    CONSTRAINT [ecs_spp_tax$ecs_spp_ta_3478612751] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_tax$fk_tax_goods_i] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_spp_goods_item] ([id])
);

