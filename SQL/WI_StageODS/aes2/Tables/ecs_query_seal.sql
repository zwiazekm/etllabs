﻿CREATE TABLE [aes2].[ecs_query_seal] (
    [id]             NUMERIC (19)   NOT NULL,
    [ident]          NVARCHAR (255) NULL,
    [identityLang]   NVARCHAR (255) NULL,
    [exportquery_id] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_query_seal$ecs_query__1321924901] PRIMARY KEY CLUSTERED ([id] ASC)
);

