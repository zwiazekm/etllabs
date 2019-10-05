CREATE TABLE [aies].[ecs_exp_produced_document] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      CHAR (1)       DEFAULT ('U') NOT NULL,
    [state_br_c]    NVARCHAR (140) NULL,
    [type]          VARCHAR (4)    NULL,
    [ref]           NVARCHAR (35)  NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [pk_ecs_exp_produced_document] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

