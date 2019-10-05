CREATE TABLE [aes2].[ecs_los_risk_analysis] (
    [id]                    NUMERIC (19)   NOT NULL,
    [ra_desc]               NVARCHAR (350) NULL,
    [ra_desc_lng]           NVARCHAR (2)   NULL,
    [ra_item_no]            INT            NULL,
    [war_code]              NVARCHAR (5)   NULL,
    [losdeclcoexit_decl_id] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_los_risk_analysis$ecs_los_ri_14894373491] PRIMARY KEY CLUSTERED ([id] ASC)
);

