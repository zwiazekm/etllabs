CREATE TABLE [aies].[ecs_spp_tax] (
    [id]                    NUMERIC (19)    NOT NULL,
    [amount]                NUMERIC (15, 2) NULL,
    [amount_spp]            NUMERIC (15, 2) NULL,
    [base]                  NUMERIC (17, 2) NULL,
    [base_spp]              NUMERIC (17, 2) NULL,
    [method_of_payment]     VARCHAR (1)     NULL,
    [method_of_payment_spp] VARCHAR (1)     NULL,
    [rate]                  NUMERIC (7, 2)  NULL,
    [rate_spp]              NUMERIC (7, 2)  NULL,
    [type]                  VARCHAR (3)     NULL,
    [type_spp]              VARCHAR (3)     NULL,
    [goods_item_id]         NUMERIC (19)    NULL,
    CONSTRAINT [ecs_spp_ta_3478612751] PRIMARY KEY CLUSTERED ([id] ASC)
);

