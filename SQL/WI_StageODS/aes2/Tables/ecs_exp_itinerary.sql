CREATE TABLE [aes2].[ecs_exp_itinerary] (
    [id]                   NUMERIC (19) NOT NULL,
    [country]              NVARCHAR (2) NULL,
    [declcoexport_decl_id] NUMERIC (19) NOT NULL,
    CONSTRAINT [ecs_exp_itinerary$pk_ecs_exp_itinerary] PRIMARY KEY CLUSTERED ([id] ASC)
);

