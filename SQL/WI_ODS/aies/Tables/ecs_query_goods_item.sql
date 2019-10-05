﻿CREATE TABLE [aies].[ecs_query_goods_item] (
    [id]                          NUMERIC (19)    NOT NULL,
    [cc_combined_nomenclature]    VARCHAR (8)     NULL,
    [cc_national_add_code]        VARCHAR (4)     NULL,
    [cc_taric_code]               VARCHAR (2)     NULL,
    [cc_taric_1st_add_code]       VARCHAR (4)     NULL,
    [cc_taric_2nd_add_code]       VARCHAR (4)     NULL,
    [gi_country_of_destination]   VARCHAR (2)     NULL,
    [gi_country_of_export]        VARCHAR (2)     NULL,
    [gi_crn]                      VARCHAR (70)    NULL,
    [gi_desc]                     VARCHAR (280)   NULL,
    [gi_desc_lang]                VARCHAR (2)     NULL,
    [gi_gross_mass]               NUMERIC (11, 3) NULL,
    [gi_item_no]                  INT             NULL,
    [gi_national_procedure]       VARCHAR (3)     NULL,
    [gi_net_mass]                 NUMERIC (11, 3) NULL,
    [gi_proc_previous]            VARCHAR (2)     NULL,
    [gi_proc_requested]           VARCHAR (2)     NULL,
    [gi_statistical_value]        NUMERIC (17, 2) NULL,
    [gi_statistical_val_currency] VARCHAR (3)     NULL,
    [gi_transport_fee_pay_type]   VARCHAR (1)     NULL,
    [gi_un_dangerous_goods]       VARCHAR (4)     NULL,
    [exportquery_id]              NUMERIC (19)    NULL,
    CONSTRAINT [ecs_query__2316688421] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

