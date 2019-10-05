CREATE TABLE [aes2].[ecs_query_produced_document] (
    [id]       NUMERIC (19)  NOT NULL,
    [ref]      NVARCHAR (35) NULL,
    [ref_lang] NVARCHAR (2)  NULL,
    [type]     NVARCHAR (6)  NULL,
    [gi_id]    NUMERIC (19)  NULL,
    CONSTRAINT [ecs_query_produced_document$ecs_query__16396738581] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_query_produced_document$fk_query_proddoc_goods_item] FOREIGN KEY ([gi_id]) REFERENCES [aes2].[ecs_query_goods_item] ([id])
);

