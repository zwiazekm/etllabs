CREATE TABLE [aies].[ecs_zwp_itinerary] (
    [id]                    NUMERIC (19) NOT NULL,
    [country]               VARCHAR (2)  NULL,
    [declcopresent_decl_id] NUMERIC (19) NULL,
    CONSTRAINT [pk_ecs_zwp_itinerary] PRIMARY KEY CLUSTERED ([id] ASC)
);

