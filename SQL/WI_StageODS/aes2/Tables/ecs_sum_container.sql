CREATE TABLE [aes2].[ecs_sum_container] (
    [id]            NUMERIC (19)  NOT NULL,
    [state_br]      NCHAR (1)     NULL,
    [identity_f]    NVARCHAR (17) NULL,
    [goods_item_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_sum_container$ecs_sum_co_7214346131] PRIMARY KEY CLUSTERED ([id] ASC)
);

