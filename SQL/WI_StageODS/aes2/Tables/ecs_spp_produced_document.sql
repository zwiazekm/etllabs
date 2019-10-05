CREATE TABLE [aes2].[ecs_spp_produced_document] (
    [id]            NUMERIC (19)  NOT NULL,
    [ref]           NVARCHAR (35) NULL,
    [ref_spp]       NVARCHAR (35) NULL,
    [type]          NVARCHAR (4)  NULL,
    [type_spp]      NVARCHAR (4)  NULL,
    [goods_item_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_spp_produced_document$ecs_spp_pr_918603631] PRIMARY KEY CLUSTERED ([id] ASC)
);

