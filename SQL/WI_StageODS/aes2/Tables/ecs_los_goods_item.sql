CREATE TABLE [aes2].[ecs_los_goods_item] (
    [id]                     NUMERIC (19)    NOT NULL,
    [gi_cn_code]             NVARCHAR (8)    NULL,
    [gi_crn]                 NVARCHAR (70)   NULL,
    [gi_desc]                NVARCHAR (280)  NULL,
    [gi_gross_mass]          NUMERIC (18, 3) NULL,
    [gi_item_no]             INT             NULL,
    [transport_fee_pay_type] NVARCHAR (1)    NULL,
    [gi_un_dangerous_goods]  NVARCHAR (4)    NULL,
    [losdeclcoexit_decl_id]  NUMERIC (19)    NULL,
    CONSTRAINT [ecs_los_goods_item$ecs_los_go_243841251] PRIMARY KEY CLUSTERED ([id] ASC)
);

