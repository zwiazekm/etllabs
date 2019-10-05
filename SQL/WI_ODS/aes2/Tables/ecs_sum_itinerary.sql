CREATE TABLE [aes2].[ecs_sum_itinerary] (
    [id]                   NUMERIC (19) NOT NULL,
    [country]              NVARCHAR (2) NULL,
    [declcoexport_decl_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_sum_itinerary$ecs_sum_it_8174349551] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_sum_itinerary$fk_itinerary_sumdecl_co_exit] FOREIGN KEY ([declcoexport_decl_id]) REFERENCES [aes2].[ecs_sum_declcoexit] ([decl_id])
);

