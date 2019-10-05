CREATE TABLE [aes2].[ecs_zwp_previous_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [type_f]        NVARCHAR (6)   NULL,
    [ref_f]         NVARCHAR (210) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_zwp_previous_document$PK_ecs_zwp_previous_document] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_zwp_previous_document$FK_ecs_zwp_previous_document_ecs_zwp_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_zwp_goods_item] ([id])
);

