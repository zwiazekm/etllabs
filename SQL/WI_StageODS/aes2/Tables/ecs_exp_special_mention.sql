CREATE TABLE [aes2].[ecs_exp_special_mention] (
    [id]            NUMERIC (19)   NOT NULL,
    [code]          NVARCHAR (5)   NULL,
    [text]          NVARCHAR (210) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_exp_special_mention$pk_ecs_exp_special_mention] PRIMARY KEY CLUSTERED ([id] ASC)
);

