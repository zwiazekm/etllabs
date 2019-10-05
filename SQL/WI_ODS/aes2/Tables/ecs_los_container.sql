CREATE TABLE [aes2].[ecs_los_container] (
    [id]            NUMERIC (19)  NOT NULL,
    [identity_f]    NVARCHAR (17) NULL,
    [goods_item_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_los_container$ecs_los_co_20118672031] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_los_container$fk_los_container_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_los_goods_item] ([id])
);

