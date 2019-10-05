CREATE TABLE [aes2].[ecs_ext_special_mention] (
    [id]            NUMERIC (19)  NOT NULL,
    [code]          NVARCHAR (5)  NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    [text]          NVARCHAR (70) NULL,
    [textlng]       NVARCHAR (2)  NULL,
    CONSTRAINT [ecs_ext_special_mention$pk_ecs_ext_special_mention] PRIMARY KEY CLUSTERED ([id] ASC)
);

