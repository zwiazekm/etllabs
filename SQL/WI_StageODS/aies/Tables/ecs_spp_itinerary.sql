CREATE TABLE [aies].[ecs_spp_itinerary] (
    [id]                     NUMERIC (19) NOT NULL,
    [country]                VARCHAR (2)  NULL,
    [declcoexpsuppl_decl_id] NUMERIC (19) NULL,
    [countrySpp]             VARCHAR (2)  NULL,
    CONSTRAINT [ecs_spp_it_20473433271] PRIMARY KEY CLUSTERED ([id] ASC)
);

