CREATE TABLE [aies].[ecs_exp_previous_document] (
    [id]            NUMERIC (19)  NOT NULL,
    [type]          VARCHAR (6)   NULL,
    [ref]           NVARCHAR (35) NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    CONSTRAINT [pk_ecs_exp_previous_document] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

