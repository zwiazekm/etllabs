﻿CREATE TABLE [aes2].[ecs_ext_seal] (
    [id]         NUMERIC (19)  NOT NULL,
    [identity_f] NVARCHAR (60) NULL,
    [decl_id]    NUMERIC (19)  NOT NULL,
    CONSTRAINT [ecs_ext_seal$pk_ecs_ext_seal] PRIMARY KEY CLUSTERED ([id] ASC)
);

