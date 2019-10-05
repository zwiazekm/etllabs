CREATE TABLE [aies].[ecs_exp_taric_add_code] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          VARCHAR (4)  NULL,
    [goods_item_id] NUMERIC (19) NOT NULL,
    CONSTRAINT [pk_ecs_exp_taric_add_code] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

