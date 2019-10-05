CREATE TABLE [aies].[ecs_sum_produced_document] (
    [id]            NUMERIC (19)  NOT NULL,
    [state_br]      CHAR (1)      NULL,
    [state_br_c]    VARCHAR (140) NULL,
    [type]          VARCHAR (4)   NULL,
    [ref]           VARCHAR (35)  NULL,
    [goods_item_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_sum_pr_8494350691] PRIMARY KEY CLUSTERED ([id] ASC)
);

