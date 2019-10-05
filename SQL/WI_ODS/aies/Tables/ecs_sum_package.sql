CREATE TABLE [aies].[ecs_sum_package] (
    [id]             NUMERIC (19) NOT NULL,
    [no_of_packages] INT          NULL,
    [no_of_pieces]   INT          NULL,
    [state_br]       CHAR (1)     NULL,
    [kind]           VARCHAR (2)  NULL,
    [marks]          VARCHAR (42) NULL,
    [goods_item_id]  NUMERIC (19) NULL,
    CONSTRAINT [ecs_sum_pa_8334350121] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

