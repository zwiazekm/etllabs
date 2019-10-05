CREATE TABLE [aies].[ecs_spp_national_add_code] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          VARCHAR (4)  NULL,
    [goods_item_id] NUMERIC (19) NULL,
    [codeSpp]       VARCHAR (4)  NULL,
    CONSTRAINT [ecs_spp_na_21113435551] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

