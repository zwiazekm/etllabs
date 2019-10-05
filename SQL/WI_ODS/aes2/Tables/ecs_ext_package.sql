CREATE TABLE [aes2].[ecs_ext_package] (
    [id]             NUMERIC (19)   NOT NULL,
    [no_of_packages] INT            NULL,
    [kind]           NVARCHAR (2)   NULL,
    [no_of_pieces]   INT            NULL,
    [state_br]       NCHAR (1)      NOT NULL,
    [marks]          NVARCHAR (126) NULL,
    [goods_item_id]  NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_ext_package$pk_ecs_ext_package] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_ext_package$fk_ext_package_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_ext_goods_item] ([id])
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180109-181401]
    ON [aes2].[ecs_ext_package]([goods_item_id] ASC)
    ON [FG_AES2];

