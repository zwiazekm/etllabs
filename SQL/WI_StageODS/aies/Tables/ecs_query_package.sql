CREATE TABLE [aies].[ecs_query_package] (
    [id]             NUMERIC (19) NOT NULL,
    [kind]           VARCHAR (3)  NULL,
    [marks]          VARCHAR (42) NULL,
    [marks_lang]     VARCHAR (2)  NULL,
    [no_of_packages] INT          NULL,
    [no_of_pieces]   INT          NULL,
    [gi_id]          NUMERIC (19) NULL,
    CONSTRAINT [ecs_query__9836715211] PRIMARY KEY CLUSTERED ([id] ASC)
);

