CREATE TABLE [aies].[ecs_query_exporter] (
    [id]             NUMERIC (19)  NOT NULL,
    [city]           VARCHAR (255) NULL,
    [country]        VARCHAR (255) NULL,
    [name_f]         VARCHAR (255) NULL,
    [postcode]       VARCHAR (255) NULL,
    [street_and_no]  VARCHAR (255) NULL,
    [tin]            VARCHAR (255) NULL,
    [exportquery_id] NUMERIC (19)  NULL,
    [email]          VARCHAR (35)  NULL,
    CONSTRAINT [ecs_query__11311480441] PRIMARY KEY CLUSTERED ([id] ASC)
);

