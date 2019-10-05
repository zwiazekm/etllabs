CREATE TABLE [aes2].[ecs_zwp_item_pt_c] (
    [id]            NUMERIC (19)   NOT NULL,
    [comment_f]     NVARCHAR (840) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_zwp_item_pt_c$PK_ecs_zwp_item_pt_c] PRIMARY KEY CLUSTERED ([id] ASC)
);

