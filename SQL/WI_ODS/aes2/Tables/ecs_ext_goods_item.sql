﻿CREATE TABLE [aes2].[ecs_ext_goods_item] (
    [id]                        NUMERIC (19)    NOT NULL,
    [gi_gross_mass]             NUMERIC (18, 3) NULL,
    [gi_country_of_export]      NVARCHAR (2)    NULL,
    [gi_country_of_destination] NVARCHAR (2)    NULL,
    [gi_gross_mass_br]          NUMERIC (18, 3) NULL,
    [gi_item_no]                INT             NULL,
    [gi_commodity_code]         NVARCHAR (22)   NULL,
    [gi_state_br]               NCHAR (1)       NOT NULL,
    [gi_desc_br]                NVARCHAR (840)  NULL,
    [gi_commodity_code_br]      NVARCHAR (22)   NULL,
    [gi_net_mass]               NUMERIC (18, 3) NULL,
    [gi_net_mass_br]            NUMERIC (18, 3) NULL,
    [gi_desc]                   NVARCHAR (840)  NULL,
    [declcoexit_decl_id]        NUMERIC (19)    NOT NULL,
    [gi_pro_req]                NVARCHAR (2)    NULL,
    [gi_pre_pro]                NVARCHAR (2)    NULL,
    [gi_com_nom_di]             NVARCHAR (8)    NULL,
    [gi_tar_cod_di]             NVARCHAR (2)    NULL,
    [gi_met_of_pay]             NVARCHAR (1)    NULL,
    [gi_com_nat_pro]            NVARCHAR (3)    NULL,
    [gi_sta_val_cur]            NVARCHAR (3)    NULL,
    [gi_sta_val_amo]            NUMERIC (17, 2) NULL,
    [gi_com_ref_num]            NVARCHAR (70)   NULL,
    [gi_un_dan_goo_cod]         NVARCHAR (4)    NULL,
    [gi_com_nom]                NVARCHAR (8)    NULL,
    [gi_tar_cod]                NVARCHAR (2)    NULL,
    [gi_tar_fir_add_cod]        NVARCHAR (4)    NULL,
    [gi_tar_sec_add_cod]        NVARCHAR (4)    NULL,
    [gi_nat_dd_cod]             NVARCHAR (4)    NULL,
    [gi_com_nat_pro_di]         NVARCHAR (3)    NULL,
    [gi_com_ref_num_di]         NVARCHAR (70)   NULL,
    [gi_met_of_pay_di]          NVARCHAR (1)    NULL,
    [gi_sta_val_amo_di]         NUMERIC (17, 2) NULL,
    [gi_sta_val_cur_di]         NVARCHAR (3)    NULL,
    [gi_tar_fir_add_cod_di]     NVARCHAR (4)    NULL,
    [gi_tar_sec_add_cod_di]     NVARCHAR (4)    NULL,
    [gi_un_dan_goo_cod_di]      NVARCHAR (4)    NULL,
    CONSTRAINT [ecs_ext_goods_item$pk_ecs_ext_goods_item] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_ext_goods_item$fk_goods_item_decl_co_exit] FOREIGN KEY ([declcoexit_decl_id]) REFERENCES [aes2].[ecs_ext_declcoexit] ([decl_id])
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20180109-180332]
    ON [aes2].[ecs_ext_goods_item]([declcoexit_decl_id] ASC)
    ON [FG_AES2];

