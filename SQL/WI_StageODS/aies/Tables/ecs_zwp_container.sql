CREATE TABLE [aies].[ecs_zwp_container] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      CHAR (1)       NOT NULL,
    [identity_f]    NVARCHAR (510) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [pk_ecs_zwp_container] PRIMARY KEY CLUSTERED ([id] ASC)
);

