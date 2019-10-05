CREATE TABLE [aies].[ecs_ext_special_mention] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          VARCHAR (5)  NULL,
    [goods_item_id] NUMERIC (19) NOT NULL,
    [text]          VARCHAR (70) NULL,
    [textlng]       VARCHAR (2)  NULL,
    CONSTRAINT [pk_ecs_ext_special_mention] PRIMARY KEY CLUSTERED ([id] ASC)
);

