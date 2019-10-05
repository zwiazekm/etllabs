CREATE TABLE [aes2].[ecs_exp_national_add_code] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          NVARCHAR (4) NULL,
    [goods_item_id] NUMERIC (19) NOT NULL,
    CONSTRAINT [ecs_exp_national_add_code$pk_ecs_exp_national_add_code] PRIMARY KEY CLUSTERED ([id] ASC)
);

