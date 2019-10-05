CREATE TABLE [aies].[ecs_query_special_mention] (
    [id]        NUMERIC (19) NOT NULL,
    [code]      VARCHAR (5)  NULL,
    [text]      VARCHAR (70) NULL,
    [text_lang] VARCHAR (2)  NULL,
    [gi_id]     NUMERIC (19) NULL,
    CONSTRAINT [ecs_query__3241931741] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

