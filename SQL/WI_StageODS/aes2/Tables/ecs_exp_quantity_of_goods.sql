CREATE TABLE [aes2].[ecs_exp_quantity_of_goods] (
    [id]                NUMERIC (19)    NOT NULL,
    [unit]              NVARCHAR (3)    NULL,
    [qualifier_of_unit] NVARCHAR (1)    NULL,
    [quantity]          NUMERIC (18, 3) NULL,
    [goods_item_id]     NUMERIC (19)    NOT NULL,
    [poz_id_req_doc]    NUMERIC (5)     NULL,
    CONSTRAINT [ecs_exp_quantity_of_goods$pk_ecs_exp_quantity_of_goods] PRIMARY KEY CLUSTERED ([id] ASC)
);

