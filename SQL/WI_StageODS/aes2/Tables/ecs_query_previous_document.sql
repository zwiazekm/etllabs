﻿CREATE TABLE [aes2].[ecs_query_previous_document] (
    [id]       NUMERIC (19)  NOT NULL,
    [ref]      NVARCHAR (35) NULL,
    [ref_lang] NVARCHAR (2)  NULL,
    [type]     NVARCHAR (6)  NULL,
    [gi_id]    NUMERIC (19)  NULL,
    CONSTRAINT [ecs_query_previous_document$ecs_query__13036726611] PRIMARY KEY CLUSTERED ([id] ASC)
);

