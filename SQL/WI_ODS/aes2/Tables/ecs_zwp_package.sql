CREATE TABLE [aes2].[ecs_zwp_package] (
    [id]             NUMERIC (19)   NOT NULL,
    [no_of_packages] INT            NULL,
    [kind]           NVARCHAR (2)   NULL,
    [no_of_pieces]   INT            NULL,
    [state_br]       NCHAR (1)      NOT NULL,
    [marks]          NVARCHAR (252) NULL,
    [goods_item_id]  NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_zwp_package$PK_ecs_zwp_package] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_zwp_package$FK_ecs_zwp_package_ecs_zwp_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_zwp_goods_item] ([id])
);

