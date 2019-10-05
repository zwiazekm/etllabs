CREATE TABLE [aes2].[ecs_ext_previous_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [type_f]        NVARCHAR (6)   NULL,
    [ref_f]         NVARCHAR (105) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_ext_previous_document$pk_ecs_ext_previous_document] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_ext_previous_document$fk_ext_prev_doc_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_ext_goods_item] ([id])
);

