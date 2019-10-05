CREATE TABLE [aes2].[ecs_spp_package] (
    [id]                 NUMERIC (19)  NOT NULL,
    [kind]               NVARCHAR (2)  NULL,
    [kind_spp]           NVARCHAR (2)  NULL,
    [marks]              NVARCHAR (42) NULL,
    [no_of_packages]     INT           NULL,
    [no_of_packages_spp] INT           NULL,
    [no_of_pieces]       INT           NULL,
    [no_of_pieces_spp]   INT           NULL,
    [goods_item_id]      NUMERIC (19)  NULL,
    CONSTRAINT [ecs_spp_package$ecs_spp_pa_21433436691] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_package$fk_spp_package_goods_it] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_spp_goods_item] ([id])
);

