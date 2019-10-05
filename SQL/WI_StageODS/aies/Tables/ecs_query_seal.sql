CREATE TABLE [aies].[ecs_query_seal] (
    [id]             NUMERIC (19)  NOT NULL,
    [ident]          VARCHAR (255) NULL,
    [identityLang]   VARCHAR (255) NULL,
    [exportquery_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_query__1321924901] PRIMARY KEY CLUSTERED ([id] ASC)
);

