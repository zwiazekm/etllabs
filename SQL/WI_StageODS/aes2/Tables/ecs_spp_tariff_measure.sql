﻿CREATE TABLE [aes2].[ecs_spp_tariff_measure] (
    [id]                       NUMERIC (19)  NOT NULL,
    [geographical_area]        NVARCHAR (4)  NULL,
    [geographical_area_spp]    NVARCHAR (4)  NULL,
    [order_no]                 NVARCHAR (6)  NULL,
    [order_no_spp]             NVARCHAR (6)  NULL,
    [series]                   NVARCHAR (2)  NULL,
    [series_spp]               NVARCHAR (1)  NULL,
    [suppl_unit]               NVARCHAR (3)  NULL,
    [suppl_unit_qualifier]     NVARCHAR (1)  NULL,
    [suppl_unit_qualifier_spp] NVARCHAR (1)  NULL,
    [suppl_unit_spp]           NVARCHAR (3)  NULL,
    [taric_sid]                NUMERIC (19)  NOT NULL,
    [taric_sid_spp]            NUMERIC (19)  NOT NULL,
    [type]                     NVARCHAR (6)  NULL,
    [type_spp]                 NVARCHAR (3)  NULL,
    [goods_item_id]            NUMERIC (19)  NULL,
    [tariff_measure_source]    NVARCHAR (15) NULL,
    [footnotes]                BIT           NOT NULL,
    [archiv]                   BIT           NOT NULL,
    [rec_date]                 DATETIME2 (3) NULL,
    CONSTRAINT [ecs_spp_tariff_measure$ecs_spp_ta_3158611611] PRIMARY KEY CLUSTERED ([id] ASC)
);

