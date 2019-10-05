CREATE TABLE [aies].[ecs_exp_itinerary] (
    [id]                   NUMERIC (19) NOT NULL,
    [country]              VARCHAR (2)  NULL,
    [declcoexport_decl_id] NUMERIC (19) NOT NULL,
    CONSTRAINT [pk_ecs_exp_itinerary] PRIMARY KEY CLUSTERED ([id] ASC)
);

