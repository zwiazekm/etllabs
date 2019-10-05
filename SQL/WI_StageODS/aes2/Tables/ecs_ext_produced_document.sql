CREATE TABLE [aes2].[ecs_ext_produced_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      NCHAR (1)      NOT NULL,
    [state_br_c]    NVARCHAR (420) NULL,
    [type_f]        NVARCHAR (4)   NULL,
    [ref_t]         NVARCHAR (105) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    [transit]       INT            NULL,
    CONSTRAINT [ecs_ext_produced_document$pk_ecs_ext_produced_document] PRIMARY KEY CLUSTERED ([id] ASC)
);

