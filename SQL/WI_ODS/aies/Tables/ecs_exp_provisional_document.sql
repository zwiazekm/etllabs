CREATE TABLE [aies].[ecs_exp_provisional_document] (
    [id]            NUMERIC (19) NOT NULL,
    [ref]           VARCHAR (35) NULL,
    [type]          VARCHAR (4)  NULL,
    [goods_item_id] NUMERIC (19) NULL
) ON [FG_AIES];

