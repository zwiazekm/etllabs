CREATE TABLE [aes2].[ecs_zwp_previous_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [type_f]        NVARCHAR (6)   NULL,
    [ref_f]         NVARCHAR (210) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_zwp_previous_document$PK_ecs_zwp_previous_document] PRIMARY KEY CLUSTERED ([id] ASC)
);

