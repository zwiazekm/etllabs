CREATE TABLE [aes2].[ecs_query_package] (
    [id]             NUMERIC (19)  NOT NULL,
    [kind]           NVARCHAR (3)  NULL,
    [marks]          NVARCHAR (42) NULL,
    [marks_lang]     NVARCHAR (2)  NULL,
    [no_of_packages] INT           NULL,
    [no_of_pieces]   INT           NULL,
    [gi_id]          NUMERIC (19)  NULL,
    CONSTRAINT [ecs_query_package$ecs_query__9836715211] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_query_package$fk_query_pkg_goods_item] FOREIGN KEY ([gi_id]) REFERENCES [aes2].[ecs_query_goods_item] ([id])
);

