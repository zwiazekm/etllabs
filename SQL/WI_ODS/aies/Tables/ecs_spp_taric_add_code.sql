CREATE TABLE [aies].[ecs_spp_taric_add_code] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          VARCHAR (4)  NULL,
    [goods_item_id] NUMERIC (19) NULL,
    [codeSpp]       VARCHAR (4)  NULL,
    CONSTRAINT [ecs_spp_ta_2838610471] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

