CREATE TABLE [aes2].[ecs_spp_container] (
    [id]             NUMERIC (19)  NOT NULL,
    [identity_f]     NVARCHAR (17) NULL,
    [identity_f_spp] NVARCHAR (17) NULL,
    [goods_item_id]  NUMERIC (19)  NULL,
    CONSTRAINT [ecs_spp_container$ecs_spp_co_18233425291] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_container$fk_spp_container_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_spp_goods_item] ([id])
);

