CREATE TABLE [aes2].[ecs_sum_tariff_measure] (
    [id]                    NUMERIC (19)  NOT NULL,
    [taric_sid]             NUMERIC (19)  NOT NULL,
    [series]                NVARCHAR (2)  NULL,
    [geographical_area]     NVARCHAR (4)  NULL,
    [order_no]              NVARCHAR (6)  NULL,
    [suppl_unit]            NVARCHAR (3)  NULL,
    [suppl_unit_qualifier]  NVARCHAR (1)  NULL,
    [type]                  NVARCHAR (6)  NULL,
    [goods_item_id]         NUMERIC (19)  NULL,
    [tariff_measure_source] NVARCHAR (15) NULL,
    [footnotes]             BIT           NOT NULL,
    [archiv]                BIT           NOT NULL,
    [rec_date]              DATETIME2 (3) NULL,
    CONSTRAINT [ecs_sum_tariff_measure$ecs_sum_ta_8974352401] PRIMARY KEY CLUSTERED ([id] ASC)
);

