CREATE TABLE [aies].[ecs_query_itinerary] (
    [id]             NUMERIC (19) NOT NULL,
    [country]        VARCHAR (2)  NULL,
    [exportquery_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_query__6156702101] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

