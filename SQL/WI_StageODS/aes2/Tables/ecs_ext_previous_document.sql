CREATE TABLE [aes2].[ecs_ext_previous_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [type_f]        NVARCHAR (6)   NULL,
    [ref_f]         NVARCHAR (105) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [ecs_ext_previous_document$pk_ecs_ext_previous_document] PRIMARY KEY CLUSTERED ([id] ASC)
);

