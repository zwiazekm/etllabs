CREATE TABLE [aies].[ecs_exp_correction] (
    [id]            NUMERIC (19)    NOT NULL,
    [code]          VARCHAR (4)     NULL,
    [value]         NUMERIC (17, 2) NULL,
    [goods_item_id] NUMERIC (19)    NOT NULL,
    CONSTRAINT [pk_ecs_exp_correction] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

