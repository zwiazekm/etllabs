CREATE TABLE [aies].[ecs_exp_special_mention] (
    [id]            NUMERIC (19)  NOT NULL,
    [code]          VARCHAR (5)   NULL,
    [text]          NVARCHAR (70) NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    CONSTRAINT [pk_ecs_exp_special_mention] PRIMARY KEY CLUSTERED ([id] ASC)
);

