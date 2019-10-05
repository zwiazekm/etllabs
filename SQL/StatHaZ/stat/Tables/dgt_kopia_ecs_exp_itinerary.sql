CREATE TABLE [stat].[dgt_kopia_ecs_exp_itinerary] (
    [id]                   NUMERIC (19) NOT NULL,
    [country]              VARCHAR (2)  NULL,
    [declcoexport_decl_id] NUMERIC (19) NOT NULL,
    [generacjaId]          INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_itinerary] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [country]
    ON [stat].[dgt_kopia_ecs_exp_itinerary]([country]);


GO
CREATE STATISTICS [declcoexport_decl_id]
    ON [stat].[dgt_kopia_ecs_exp_itinerary]([declcoexport_decl_id]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_itinerary]([generacjaId]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_itinerary]([id]);

