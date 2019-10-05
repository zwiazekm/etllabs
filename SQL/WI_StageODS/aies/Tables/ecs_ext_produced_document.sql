CREATE TABLE [aies].[ecs_ext_produced_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      CHAR (1)       NOT NULL,
    [state_br_c]    NVARCHAR (140) NULL,
    [type_f]        VARCHAR (4)    NULL,
    [ref_t]         NVARCHAR (35)  NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    [transit]       INT            NULL,
    CONSTRAINT [pk_ecs_ext_produced_document] PRIMARY KEY CLUSTERED ([id] ASC)
);

