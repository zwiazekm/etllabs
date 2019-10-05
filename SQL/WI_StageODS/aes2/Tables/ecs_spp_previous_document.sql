CREATE TABLE [aes2].[ecs_spp_previous_document] (
    [id]            NUMERIC (19)  NOT NULL,
    [ref]           NVARCHAR (35) NULL,
    [ref_spp]       NVARCHAR (35) NULL,
    [type]          NVARCHAR (6)  NULL,
    [type_spp]      NVARCHAR (6)  NULL,
    [goods_item_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_spp_previous_document$ecs_spp_pr_598602491] PRIMARY KEY CLUSTERED ([id] ASC)
);

