CREATE TABLE [aies].[ecs_sum_itinerary] (
    [id]                   NUMERIC (19) NOT NULL,
    [country]              VARCHAR (2)  NULL,
    [declcoexport_decl_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_sum_it_8174349551] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

