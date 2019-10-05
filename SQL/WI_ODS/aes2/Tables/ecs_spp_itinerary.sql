CREATE TABLE [aes2].[ecs_spp_itinerary] (
    [id]                     NUMERIC (19) NOT NULL,
    [country]                NVARCHAR (2) NULL,
    [declcoexpsuppl_decl_id] NUMERIC (19) NULL,
    [countrySpp]             NVARCHAR (2) NULL,
    CONSTRAINT [ecs_spp_itinerary$ecs_spp_it_20473433271] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_itinerary$fk_itinerary_decl_spp] FOREIGN KEY ([declcoexpsuppl_decl_id]) REFERENCES [aes2].[ecs_spp_declcoexpsuppl] ([decl_id])
);

