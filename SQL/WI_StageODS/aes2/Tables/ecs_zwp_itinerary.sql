CREATE TABLE [aes2].[ecs_zwp_itinerary] (
    [id]                    NUMERIC (19) NOT NULL,
    [country]               NVARCHAR (2) NULL,
    [declcopresent_decl_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_zwp_itinerary$PK_ecs_zwp_itinerary] PRIMARY KEY CLUSTERED ([id] ASC)
);

