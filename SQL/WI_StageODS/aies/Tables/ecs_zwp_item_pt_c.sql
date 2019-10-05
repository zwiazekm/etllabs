CREATE TABLE [aies].[ecs_zwp_item_pt_c] (
    [id]            NUMERIC (19)   NOT NULL,
    [comment_f]     NVARCHAR (280) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [pk_ecs_zwp_item_pt_c] PRIMARY KEY CLUSTERED ([id] ASC)
);

