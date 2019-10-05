CREATE TABLE [aies].[ecs_query_previous_document] (
    [id]       NUMERIC (19) NOT NULL,
    [ref]      VARCHAR (35) NULL,
    [ref_lang] VARCHAR (2)  NULL,
    [type]     VARCHAR (6)  NULL,
    [gi_id]    NUMERIC (19) NULL,
    CONSTRAINT [ecs_query__13036726611] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

