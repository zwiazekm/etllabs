﻿CREATE TABLE [aes2].[ecs_zwp_container] (
    [id]            NUMERIC (19)    NOT NULL,
    [state_br]      NCHAR (1)       NOT NULL,
    [identity_f]    NVARCHAR (1530) NULL,
    [goods_item_id] NUMERIC (19)    NOT NULL,
    CONSTRAINT [ecs_zwp_container$PK_ecs_zwp_container] PRIMARY KEY CLUSTERED ([id] ASC)
);

