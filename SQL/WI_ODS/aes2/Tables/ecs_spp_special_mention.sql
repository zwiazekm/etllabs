CREATE TABLE [aes2].[ecs_spp_special_mention] (
    [id]            NUMERIC (19)  NOT NULL,
    [code]          NVARCHAR (5)  NULL,
    [text]          NVARCHAR (70) NULL,
    [goods_item_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_spp_special_mention$ecs_spp_sp_2198608191] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_special_mention$fk_spec_spp_ment_goods_i] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_spp_goods_item] ([id])
);

