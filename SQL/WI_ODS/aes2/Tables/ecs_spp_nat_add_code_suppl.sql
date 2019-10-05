CREATE TABLE [aes2].[ecs_spp_nat_add_code_suppl] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          NVARCHAR (4) NULL,
    [goods_item_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_spp_nat_add_code_suppl$ecs_spp_na_20793434411] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_nat_add_code_suppl$fk_nat_add_code_g_i] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_spp_goods_item] ([id])
);

