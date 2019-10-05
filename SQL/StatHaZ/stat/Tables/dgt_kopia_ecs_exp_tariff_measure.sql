CREATE TABLE [stat].[dgt_kopia_ecs_exp_tariff_measure] (
    [id]                   NUMERIC (19) NOT NULL,
    [taric_sid]            NUMERIC (19) NOT NULL,
    [series]               VARCHAR (1)  NULL,
    [geographical_area]    VARCHAR (4)  NULL,
    [order_no]             VARCHAR (6)  NULL,
    [suppl_unit]           VARCHAR (3)  NULL,
    [suppl_unit_qualifier] VARCHAR (1)  NULL,
    [type]                 VARCHAR (3)  NULL,
    [goods_item_id]        NUMERIC (19) NOT NULL,
    [generacjaId]          INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_tariff_measure] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_tariff_measure]([generacjaId]);


GO
CREATE STATISTICS [geographical_area]
    ON [stat].[dgt_kopia_ecs_exp_tariff_measure]([geographical_area]);


GO
CREATE STATISTICS [goods_item_id]
    ON [stat].[dgt_kopia_ecs_exp_tariff_measure]([goods_item_id]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_tariff_measure]([id]);


GO
CREATE STATISTICS [order_no]
    ON [stat].[dgt_kopia_ecs_exp_tariff_measure]([order_no]);


GO
CREATE STATISTICS [series]
    ON [stat].[dgt_kopia_ecs_exp_tariff_measure]([series]);


GO
CREATE STATISTICS [suppl_unit]
    ON [stat].[dgt_kopia_ecs_exp_tariff_measure]([suppl_unit]);


GO
CREATE STATISTICS [suppl_unit_qualifier]
    ON [stat].[dgt_kopia_ecs_exp_tariff_measure]([suppl_unit_qualifier]);


GO
CREATE STATISTICS [taric_sid]
    ON [stat].[dgt_kopia_ecs_exp_tariff_measure]([taric_sid]);


GO
CREATE STATISTICS [type]
    ON [stat].[dgt_kopia_ecs_exp_tariff_measure]([type]);

