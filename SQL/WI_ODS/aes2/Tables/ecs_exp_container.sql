CREATE TABLE [aes2].[ecs_exp_container] (
    [id]            NUMERIC (19)  NOT NULL,
    [state_br]      NCHAR (1)     NOT NULL,
    [identity_f]    NVARCHAR (17) NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    CONSTRAINT [ecs_exp_container$pk_ecs_exp_container] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_container$fk_exp_container_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_exp_goods_item] ([id])
);

