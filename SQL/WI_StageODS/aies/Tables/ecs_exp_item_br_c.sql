﻿CREATE TABLE [aies].[ecs_exp_item_br_c] (
    [id]            NUMERIC (19)   NOT NULL,
    [comment_f]     NVARCHAR (140) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [pk_ecs_exp_item_br_c] PRIMARY KEY CLUSTERED ([id] ASC)
);

