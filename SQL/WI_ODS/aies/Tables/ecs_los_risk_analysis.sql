CREATE TABLE [aies].[ecs_los_risk_analysis] (
    [id]                    NUMERIC (19)  NOT NULL,
    [ra_desc]               VARCHAR (350) NULL,
    [ra_desc_lng]           VARCHAR (2)   NULL,
    [ra_item_no]            INT           NULL,
    [war_code]              VARCHAR (5)   NULL,
    [losdeclcoexit_decl_id] NUMERIC (19)  NULL,
    CONSTRAINT [ecs_los_ri_14894373491] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

