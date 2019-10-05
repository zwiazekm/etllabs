CREATE TABLE [aes2].[ecs_ext_special_mention] (
    [id]            NUMERIC (19)  NOT NULL,
    [code]          NVARCHAR (5)  NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    [text]          NVARCHAR (70) NULL,
    [textlng]       NVARCHAR (2)  NULL,
    CONSTRAINT [ecs_ext_special_mention$pk_ecs_ext_special_mention] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_ext_special_mention$fk_special_mention_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_ext_goods_item] ([id])
);

