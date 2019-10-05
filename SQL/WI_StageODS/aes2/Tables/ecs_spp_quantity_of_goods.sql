CREATE TABLE [aes2].[ecs_spp_quantity_of_goods] (
    [id]                    NUMERIC (19)    NOT NULL,
    [qualifier_of_unit]     NVARCHAR (1)    NULL,
    [qualifier_of_unit_spp] NVARCHAR (1)    NULL,
    [quantity]              NUMERIC (18, 3) NULL,
    [quantity_spp]          NUMERIC (18, 3) NULL,
    [unit]                  NVARCHAR (3)    NULL,
    [unit_spp]              NVARCHAR (3)    NULL,
    [goods_item_id]         NUMERIC (19)    NULL,
    CONSTRAINT [ecs_spp_quantity_of_goods$ecs_spp_qu_1238604771] PRIMARY KEY CLUSTERED ([id] ASC)
);

