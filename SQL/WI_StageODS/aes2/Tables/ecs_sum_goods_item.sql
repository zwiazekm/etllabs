CREATE TABLE [aes2].[ecs_sum_goods_item] (
    [id]                        NUMERIC (19)    NOT NULL,
    [gi_gross_mass]             NUMERIC (18, 3) NULL,
    [gi_item_no]                INT             NULL,
    [state_br]                  NCHAR (1)       NULL,
    [gi_crn]                    NVARCHAR (70)   NULL,
    [gi_desc_br]                NVARCHAR (280)  NULL,
    [gi_cn_code]                NVARCHAR (8)    NULL,
    [gi_gross_mass_br]          NUMERIC (18, 3) NULL,
    [gi_un_dangerous_goods]     NVARCHAR (4)    NULL,
    [transport_fee_pay_type]    NVARCHAR (1)    NULL,
    [gi_crn_br]                 NVARCHAR (70)   NULL,
    [gi_cn_code_br]             NVARCHAR (8)    NULL,
    [gi_un_dangerous_goods_br]  NVARCHAR (4)    NULL,
    [transport_fee_pay_type_br] NVARCHAR (1)    NULL,
    [gi_desc]                   NVARCHAR (280)  NULL,
    [sumdeclcoexit_decl_id]     NUMERIC (19)    NULL,
    CONSTRAINT [ecs_sum_goods_item$ecs_sum_go_8014348981] PRIMARY KEY CLUSTERED ([id] ASC)
);

