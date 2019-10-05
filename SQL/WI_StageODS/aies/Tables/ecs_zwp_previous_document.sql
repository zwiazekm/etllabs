CREATE TABLE [aies].[ecs_zwp_previous_document] (
    [id]            NUMERIC (19)  NOT NULL,
    [type_f]        VARCHAR (6)   NULL,
    [ref_f]         NVARCHAR (70) NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    CONSTRAINT [pk_ecs_zwp_previous_document] PRIMARY KEY CLUSTERED ([id] ASC)
);

