CREATE TABLE [aes2].[ecs_zwp_itinerary] (
    [id]                    NUMERIC (19) NOT NULL,
    [country]               NVARCHAR (2) NULL,
    [declcopresent_decl_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_zwp_itinerary$PK_ecs_zwp_itinerary] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_zwp_itinerary$FK_ecs_zwp_itinerary_ecs_zwp_declcopresent] FOREIGN KEY ([declcopresent_decl_id]) REFERENCES [aes2].[ecs_zwp_declcopresent] ([decl_id])
);

