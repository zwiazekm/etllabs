CREATE TABLE [aes2].[ecs_spp_tar_add_cod_spp] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          NVARCHAR (4) NULL,
    [goods_item_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_spp_tar_add_cod_spp$ecs_spp_ta_2518609331] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_tar_add_cod_spp$fk_t_a_c_suppl_goods_i] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_spp_goods_item] ([id])
);

