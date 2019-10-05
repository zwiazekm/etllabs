CREATE TABLE [aes2].[ecs_sum_produced_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      NCHAR (1)      NULL,
    [state_br_c]    NVARCHAR (140) NULL,
    [type]          NVARCHAR (4)   NULL,
    [ref]           NVARCHAR (35)  NULL,
    [goods_item_id] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_sum_produced_document$ecs_sum_pr_8494350691] PRIMARY KEY CLUSTERED ([id] ASC)
);

