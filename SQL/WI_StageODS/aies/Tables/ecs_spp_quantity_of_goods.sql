CREATE TABLE [aies].[ecs_spp_quantity_of_goods] (
    [id]                    NUMERIC (19)    NOT NULL,
    [qualifier_of_unit]     VARCHAR (1)     NULL,
    [qualifier_of_unit_spp] VARCHAR (1)     NULL,
    [quantity]              NUMERIC (18, 3) NULL,
    [quantity_spp]          NUMERIC (18, 3) NULL,
    [unit]                  VARCHAR (3)     NULL,
    [unit_spp]              VARCHAR (3)     NULL,
    [goods_item_id]         NUMERIC (19)    NULL,
    CONSTRAINT [ecs_spp_qu_1238604771] PRIMARY KEY CLUSTERED ([id] ASC)
);

