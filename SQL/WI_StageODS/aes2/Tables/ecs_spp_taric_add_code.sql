CREATE TABLE [aes2].[ecs_spp_taric_add_code] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          NVARCHAR (4) NULL,
    [goods_item_id] NUMERIC (19) NULL,
    [codeSpp]       NVARCHAR (4) NULL,
    CONSTRAINT [ecs_spp_taric_add_code$ecs_spp_ta_2838610471] PRIMARY KEY CLUSTERED ([id] ASC)
);

