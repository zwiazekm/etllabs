CREATE TABLE [aes2].[ecs_exp_correction] (
    [id]            NUMERIC (19)    NOT NULL,
    [code]          NVARCHAR (4)    NULL,
    [value]         NUMERIC (17, 2) NULL,
    [goods_item_id] NUMERIC (19)    NOT NULL,
    CONSTRAINT [ecs_exp_correction$pk_ecs_exp_correction] PRIMARY KEY CLUSTERED ([id] ASC)
);

