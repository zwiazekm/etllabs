CREATE TABLE [aes2].[ecs_spp_taric_add_code] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          NVARCHAR (4) NULL,
    [goods_item_id] NUMERIC (19) NULL,
    [codeSpp]       NVARCHAR (4) NULL,
    CONSTRAINT [ecs_spp_taric_add_code$ecs_spp_ta_2838610471] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_taric_add_code$fk_tar_add_code_goods_i] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_spp_goods_item] ([id])
);

