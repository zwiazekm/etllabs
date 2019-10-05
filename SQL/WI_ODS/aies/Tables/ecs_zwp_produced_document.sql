CREATE TABLE [aies].[ecs_zwp_produced_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      CHAR (1)       DEFAULT ('U') NOT NULL,
    [state_br_c]    NVARCHAR (280) NULL,
    [type_f]        VARCHAR (4)    NULL,
    [ref_t]         NVARCHAR (70)  NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    [transit]       INT            NULL,
    CONSTRAINT [pk_ecs_zwp_produced_document] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

