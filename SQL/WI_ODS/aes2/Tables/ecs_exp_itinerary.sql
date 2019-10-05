CREATE TABLE [aes2].[ecs_exp_itinerary] (
    [id]                   NUMERIC (19) NOT NULL,
    [country]              NVARCHAR (2) NULL,
    [declcoexport_decl_id] NUMERIC (19) NOT NULL,
    CONSTRAINT [ecs_exp_itinerary$pk_ecs_exp_itinerary] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_itinerary$fk_itinerary_decl_co_export] FOREIGN KEY ([declcoexport_decl_id]) REFERENCES [aes2].[ecs_exp_declcoexport] ([decl_id])
);

