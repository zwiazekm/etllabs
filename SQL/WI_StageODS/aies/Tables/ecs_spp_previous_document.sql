CREATE TABLE [aies].[ecs_spp_previous_document] (
    [id]            NUMERIC (19) NOT NULL,
    [ref]           VARCHAR (35) NULL,
    [ref_spp]       VARCHAR (35) NULL,
    [type]          VARCHAR (6)  NULL,
    [type_spp]      VARCHAR (6)  NULL,
    [goods_item_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_spp_pr_598602491] PRIMARY KEY CLUSTERED ([id] ASC)
);

