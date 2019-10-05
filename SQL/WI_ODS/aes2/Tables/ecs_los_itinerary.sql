CREATE TABLE [aes2].[ecs_los_itinerary] (
    [id]                    NUMERIC (19) NOT NULL,
    [country]               NVARCHAR (2) NULL,
    [losdeclcoexit_decl_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_los_itinerary$ecs_los_it_563842391] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_los_itinerary$fk_itinerary_losdecl_co_exit] FOREIGN KEY ([losdeclcoexit_decl_id]) REFERENCES [aes2].[ecs_los_declcoexit] ([decl_id])
);

