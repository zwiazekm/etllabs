﻿CREATE TABLE [aies].[ecs_ext_container] (
    [id]            NUMERIC (19)   NOT NULL,
    [state_br]      CHAR (1)       DEFAULT ('U') NOT NULL,
    [identity_f]    NVARCHAR (255) NULL,
    [goods_item_id] NUMERIC (19)   NOT NULL,
    CONSTRAINT [pk_ecs_ext_container] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

