CREATE TABLE [aes2].[ecs_query_itinerary] (
    [id]             NUMERIC (19) NOT NULL,
    [country]        NVARCHAR (2) NULL,
    [exportquery_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_query_itinerary$ecs_query__6156702101] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_query_itinerary$fk_itinerary_exportquery] FOREIGN KEY ([exportquery_id]) REFERENCES [aes2].[ecs_query_exportquery] ([q_query_decl_id])
);

