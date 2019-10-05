CREATE TABLE [aies].[ecs_exp_tariff_measure] (
    [id]                   NUMERIC (19) NOT NULL,
    [taric_sid]            NUMERIC (19) NOT NULL,
    [series]               VARCHAR (1)  NULL,
    [geographical_area]    VARCHAR (4)  NULL,
    [order_no]             VARCHAR (6)  NULL,
    [suppl_unit]           VARCHAR (3)  NULL,
    [suppl_unit_qualifier] VARCHAR (1)  NULL,
    [type]                 VARCHAR (3)  NULL,
    [goods_item_id]        NUMERIC (19) NOT NULL,
    CONSTRAINT [pk_ecs_exp_tariff_measure] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

