CREATE TABLE [aes2].[ecs_exp_previous_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [type]          NVARCHAR (6)   NULL,
    [ref]           NVARCHAR (105) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_exp_previous_document$pk_ecs_exp_previous_document] PRIMARY KEY CLUSTERED ([id] ASC)
);

