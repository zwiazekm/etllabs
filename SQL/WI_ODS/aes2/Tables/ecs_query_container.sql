CREATE TABLE [aes2].[ecs_query_container] (
    [id]         NUMERIC (19)  NOT NULL,
    [identity_f] NVARCHAR (17) NULL,
    [gi_id]      NUMERIC (19)  NULL,
    CONSTRAINT [ecs_query_container$ecs_query__7791467901] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_query_container$fk_query_contain_goods_item] FOREIGN KEY ([gi_id]) REFERENCES [aes2].[ecs_query_goods_item] ([id])
);

