CREATE TABLE [aies].[ecs_sum_goods_item] (
    [id]                        NUMERIC (19)    NOT NULL,
    [gi_gross_mass]             NUMERIC (18, 3) NULL,
    [gi_item_no]                INT             NULL,
    [state_br]                  CHAR (1)        NULL,
    [gi_crn]                    VARCHAR (70)    NULL,
    [gi_desc_br]                VARCHAR (280)   NULL,
    [gi_cn_code]                VARCHAR (8)     NULL,
    [gi_gross_mass_br]          NUMERIC (18, 3) NULL,
    [gi_un_dangerous_goods]     VARCHAR (4)     NULL,
    [transport_fee_pay_type]    VARCHAR (1)     NULL,
    [gi_crn_br]                 VARCHAR (70)    NULL,
    [gi_cn_code_br]             VARCHAR (8)     NULL,
    [gi_un_dangerous_goods_br]  VARCHAR (4)     NULL,
    [transport_fee_pay_type_br] VARCHAR (1)     NULL,
    [gi_desc]                   VARCHAR (280)   NULL,
    [sumdeclcoexit_decl_id]     NUMERIC (19)    NULL,
    CONSTRAINT [ecs_sum_go_8014348981] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

