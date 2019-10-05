﻿CREATE TABLE [aes2].[ecs_exp_goods_item] (
    [id]                          NUMERIC (19)    NOT NULL,
    [gi_gross_mass]               NUMERIC (18, 3) NULL,
    [gi_country_of_export]        NVARCHAR (2)    NULL,
    [gi_country_of_destination]   NVARCHAR (2)    NULL,
    [gi_gross_mass_br]            NUMERIC (18, 3) NULL,
    [gi_crn]                      NVARCHAR (210)  NULL,
    [gi_un_dangerous_goods]       NVARCHAR (4)    NULL,
    [gi_taxes_amount]             NUMERIC (17, 2) NULL,
    [gi_item_no]                  INT             NULL,
    [gi_state_br]                 NCHAR (1)       NOT NULL,
    [vog_statistical_value]       NUMERIC (17, 2) NULL,
    [vog_statistical_currency]    NVARCHAR (3)    NULL,
    [gi_desc_br]                  NVARCHAR (840)  NULL,
    [gi_cn_code]                  NVARCHAR (8)    NULL,
    [gi_taric_code]               NVARCHAR (2)    NULL,
    [gi_commodity_code_br]        NVARCHAR (22)   NULL,
    [gi_country_of_origin]        NVARCHAR (2)    NULL,
    [gi_proc_requested]           NVARCHAR (2)    NULL,
    [gi_proc_previous]            NVARCHAR (2)    NULL,
    [gi_proc_detail]              NVARCHAR (3)    NULL,
    [gi_net_mass]                 NUMERIC (18, 3) NULL,
    [gi_net_mass_br]              NUMERIC (18, 3) NULL,
    [gi_quantity_suppl_unit]      NUMERIC (19, 3) NULL,
    [gi_desc]                     NVARCHAR (840)  NULL,
    [declcoexport_decl_id]        NUMERIC (19)    NULL,
    [gi_transport_charges_mp]     NVARCHAR (1)    NULL,
    [gi_crn_di]                   NVARCHAR (70)   NULL,
    [gi_tar_fir_cod_di]           NVARCHAR (4)    NULL,
    [gi_tar_sec_cod_di]           NVARCHAR (4)    NULL,
    [gi_transport_charges_mp_di]  NVARCHAR (1)    NULL,
    [gi_un_dangerous_goods_di]    NVARCHAR (4)    NULL,
    [vog_statistical_currency_di] NVARCHAR (3)    NULL,
    [vog_statistical_value_di]    NUMERIC (17, 2) NULL,
    [arr_status]                  NVARCHAR (4)    NULL,
    [arr_cont_proc]               BIT             NOT NULL,
    [arr_irr_descr]               NVARCHAR (1024) NULL,
    [arr_saldo]                   NVARCHAR (4)    NULL,
    CONSTRAINT [ecs_exp_goods_item$pk_ecs_exp_goods_item] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_goods_item$fk_goods_item_decl_co_exp] FOREIGN KEY ([declcoexport_decl_id]) REFERENCES [aes2].[ecs_exp_declcoexport] ([decl_id])
);


GO
ALTER TABLE [aes2].[ecs_exp_goods_item] NOCHECK CONSTRAINT [ecs_exp_goods_item$fk_goods_item_decl_co_exp];


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180109-182240]
    ON [aes2].[ecs_exp_goods_item]([declcoexport_decl_id] ASC)
    ON [FG_AES2];

