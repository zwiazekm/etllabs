CREATE TABLE [aes2].[ecs_zwp_produced_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      NCHAR (1)      NOT NULL,
    [state_br_c]    NVARCHAR (840) NULL,
    [type_f]        NVARCHAR (4)   NULL,
    [ref_t]         NVARCHAR (210) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    [transit]       INT            NULL,
    CONSTRAINT [ecs_zwp_produced_document$PK_ecs_zwp_produced_document] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_zwp_produced_document$FK_ecs_zwp_produced_document_ecs_zwp_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_zwp_goods_item] ([id])
);

