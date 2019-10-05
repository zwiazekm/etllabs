CREATE TABLE [aes2].[ecs_ext_container] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      NCHAR (1)      NOT NULL,
    [identity_f]    NVARCHAR (765) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_ext_container$pk_ecs_ext_container] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_ext_container$fk_ext_container_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_ext_goods_item] ([id])
);

