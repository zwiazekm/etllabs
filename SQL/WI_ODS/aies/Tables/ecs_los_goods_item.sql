CREATE TABLE [aies].[ecs_los_goods_item] (
    [id]                     NUMERIC (19)    NOT NULL,
    [gi_cn_code]             VARCHAR (8)     NULL,
    [gi_crn]                 VARCHAR (70)    NULL,
    [gi_desc]                VARCHAR (280)   NULL,
    [gi_gross_mass]          NUMERIC (18, 3) NULL,
    [gi_item_no]             INT             NULL,
    [transport_fee_pay_type] VARCHAR (1)     NULL,
    [gi_un_dangerous_goods]  VARCHAR (4)     NULL,
    [losdeclcoexit_decl_id]  NUMERIC (19)    NULL,
    CONSTRAINT [ecs_los_go_243841251] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

