CREATE TABLE [aies].[ecs_zwp_risk_analysis] (
    [id]                    NUMERIC (19)  NOT NULL,
    [ra_desc]               VARCHAR (350) NULL,
    [ra_desc_lng]           VARCHAR (2)   NULL,
    [ra_item_no]            INT           NULL,
    [war_code]              VARCHAR (5)   NULL,
    [declcopresent_decl_id] NUMERIC (19)  NULL,
    CONSTRAINT [pk_ecs_zwp_risk_analysis] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

