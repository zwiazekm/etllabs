CREATE TABLE [aies].[ecs_exp_tax] (
    [id]                NUMERIC (19)    NOT NULL,
    [base]              NUMERIC (17, 2) NULL,
    [rate]              NUMERIC (7, 2)  NULL,
    [amount]            NUMERIC (15, 2) NULL,
    [method_of_payment] VARCHAR (1)     NULL,
    [type]              VARCHAR (3)     NULL,
    [goods_item_id]     NUMERIC (19)    NOT NULL,
    CONSTRAINT [pk_ecs_exp_tax] PRIMARY KEY CLUSTERED ([id] ASC)
);

