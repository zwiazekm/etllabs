CREATE TABLE [aes2].[ecs_query_special_mention] (
    [id]        NUMERIC (19)  NOT NULL,
    [code]      NVARCHAR (5)  NULL,
    [text]      NVARCHAR (70) NULL,
    [text_lang] NVARCHAR (2)  NULL,
    [gi_id]     NUMERIC (19)  NULL,
    CONSTRAINT [ecs_query_special_mention$ecs_query__3241931741] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_query_special_mention$fk_query_specmen_goods_item] FOREIGN KEY ([gi_id]) REFERENCES [aes2].[ecs_query_goods_item] ([id])
);

