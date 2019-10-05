CREATE TABLE [aes2].[ecs_exp_tariff_measure] (
    [id]                    NUMERIC (19)  NOT NULL,
    [taric_sid]             NUMERIC (19)  NOT NULL,
    [series]                NVARCHAR (2)  NULL,
    [geographical_area]     NVARCHAR (4)  NULL,
    [order_no]              NVARCHAR (6)  NULL,
    [suppl_unit]            NVARCHAR (3)  NULL,
    [suppl_unit_qualifier]  NVARCHAR (1)  NULL,
    [type]                  NVARCHAR (6)  NULL,
    [goods_item_id]         NUMERIC (19)  NOT NULL,
    [tariff_measure_source] NVARCHAR (15) NULL,
    [footnotes]             BIT           NOT NULL,
    [archiv]                BIT           NOT NULL,
    [rec_date]              DATETIME2 (3) NULL,
    CONSTRAINT [ecs_exp_tariff_measure$pk_ecs_exp_tariff_measure] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_tariff_measure$fk_tarif_measure_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_exp_goods_item] ([id])
);

