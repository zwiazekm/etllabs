CREATE TABLE [aes2].[ecs_los_package] (
    [id]             NUMERIC (19)  NOT NULL,
    [kind]           NVARCHAR (2)  NULL,
    [marks]          NVARCHAR (42) NULL,
    [no_of_packages] INT           NULL,
    [no_of_pieces]   INT           NULL,
    [goods_item_id]  NUMERIC (19)  NULL,
    CONSTRAINT [ecs_los_package$ecs_los_pa_883843531] PRIMARY KEY CLUSTERED ([id] ASC)
);

