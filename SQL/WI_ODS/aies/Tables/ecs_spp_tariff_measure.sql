CREATE TABLE [aies].[ecs_spp_tariff_measure] (
    [id]                       NUMERIC (19) NOT NULL,
    [geographical_area]        VARCHAR (4)  NULL,
    [geographical_area_spp]    VARCHAR (4)  NULL,
    [order_no]                 VARCHAR (6)  NULL,
    [order_no_spp]             VARCHAR (6)  NULL,
    [series]                   VARCHAR (1)  NULL,
    [series_spp]               VARCHAR (1)  NULL,
    [suppl_unit]               VARCHAR (3)  NULL,
    [suppl_unit_qualifier]     VARCHAR (1)  NULL,
    [suppl_unit_qualifier_spp] VARCHAR (1)  NULL,
    [suppl_unit_spp]           VARCHAR (3)  NULL,
    [taric_sid]                NUMERIC (19) NOT NULL,
    [taric_sid_spp]            NUMERIC (19) NOT NULL,
    [type]                     VARCHAR (3)  NULL,
    [type_spp]                 VARCHAR (3)  NULL,
    [goods_item_id]            NUMERIC (19) NULL,
    CONSTRAINT [ecs_spp_ta_3158611611] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

