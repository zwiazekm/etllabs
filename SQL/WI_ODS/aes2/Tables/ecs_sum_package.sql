CREATE TABLE [aes2].[ecs_sum_package] (
    [id]             NUMERIC (19)  NOT NULL,
    [no_of_packages] INT           NULL,
    [no_of_pieces]   INT           NULL,
    [state_br]       NCHAR (1)     NULL,
    [kind]           NVARCHAR (2)  NULL,
    [marks]          NVARCHAR (42) NULL,
    [goods_item_id]  NUMERIC (19)  NULL,
    CONSTRAINT [ecs_sum_package$ecs_sum_pa_8334350121] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_sum_package$fk_sum_package_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_sum_goods_item] ([id])
);

