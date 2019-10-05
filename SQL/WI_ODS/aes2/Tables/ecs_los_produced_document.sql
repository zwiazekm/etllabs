CREATE TABLE [aes2].[ecs_los_produced_document] (
    [id]            NUMERIC (19)  NOT NULL,
    [ref]           NVARCHAR (35) NULL,
    [type]          NVARCHAR (4)  NULL,
    [goods_item_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_los_produced_document$ecs_los_pr_1203844671] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_los_produced_document$fk_los_prod_doc_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_los_goods_item] ([id])
);

