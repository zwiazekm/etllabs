CREATE TABLE [aes2].[ecs_ext_produced_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      NCHAR (1)      NOT NULL,
    [state_br_c]    NVARCHAR (420) NULL,
    [type_f]        NVARCHAR (4)   NULL,
    [ref_t]         NVARCHAR (105) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    [transit]       INT            NULL,
    CONSTRAINT [ecs_ext_produced_document$pk_ecs_ext_produced_document] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_ext_produced_document$fk_produced_doc_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_ext_goods_item] ([id])
);

