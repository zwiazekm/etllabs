CREATE TABLE [aies].[ecs_ext_previous_document] (
    [id]            NUMERIC (19)  NOT NULL,
    [type_f]        VARCHAR (6)   NULL,
    [ref_f]         NVARCHAR (35) NULL,
    [goods_item_id] NUMERIC (19)  NOT NULL,
    CONSTRAINT [pk_ecs_ext_previous_document] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

