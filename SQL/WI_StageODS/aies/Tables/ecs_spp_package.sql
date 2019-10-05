CREATE TABLE [aies].[ecs_spp_package] (
    [id]                 NUMERIC (19) NOT NULL,
    [kind]               VARCHAR (2)  NULL,
    [kind_spp]           VARCHAR (2)  NULL,
    [marks]              VARCHAR (42) NULL,
    [no_of_packages]     INT          NULL,
    [no_of_packages_spp] INT          NULL,
    [no_of_pieces]       INT          NULL,
    [no_of_pieces_spp]   INT          NULL,
    [goods_item_id]      NUMERIC (19) NULL,
    CONSTRAINT [ecs_spp_pa_21433436691] PRIMARY KEY CLUSTERED ([id] ASC)
);

