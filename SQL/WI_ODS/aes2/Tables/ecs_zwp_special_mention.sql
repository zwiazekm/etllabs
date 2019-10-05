CREATE TABLE [aes2].[ecs_zwp_special_mention] (
    [id]            NUMERIC (19)  NOT NULL,
    [code]          NVARCHAR (5)  NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    [text]          NVARCHAR (70) NULL,
    [textlng]       NVARCHAR (2)  NULL,
    CONSTRAINT [ecs_zwp_special_mention$PK_ecs_zwp_special_mention] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_zwp_special_mention$FK_ecs_zwp_special_mention_ecs_zwp_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_zwp_goods_item] ([id])
);

