CREATE TABLE [aes2].[ecs_exp_previous_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [type]          NVARCHAR (6)   NULL,
    [ref]           NVARCHAR (105) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_exp_previous_document$pk_ecs_exp_previous_document] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_previous_document$fk_exp_prev_doc_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_exp_goods_item] ([id])
);

