CREATE TABLE [aes2].[ecs_query_exporter] (
    [id]             NUMERIC (19)   NOT NULL,
    [city]           NVARCHAR (255) NULL,
    [country]        NVARCHAR (255) NULL,
    [name_f]         NVARCHAR (255) NULL,
    [postcode]       NVARCHAR (255) NULL,
    [street_and_no]  NVARCHAR (255) NULL,
    [tin]            NVARCHAR (255) NULL,
    [exportquery_id] NUMERIC (19)   NULL,
    [email]          NVARCHAR (70)  NULL,
    CONSTRAINT [ecs_query_exporter$ecs_query__11311480441] PRIMARY KEY CLUSTERED ([id] ASC)
);

