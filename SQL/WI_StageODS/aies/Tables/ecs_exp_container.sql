CREATE TABLE [aies].[ecs_exp_container] (
    [id]            NUMERIC (19) NOT NULL,
    [state_br]      CHAR (1)     NOT NULL,
    [identity_f]    VARCHAR (17) NULL,
    [goods_item_id] NUMERIC (19) NOT NULL,
    CONSTRAINT [pk_ecs_exp_container] PRIMARY KEY CLUSTERED ([id] ASC)
);

