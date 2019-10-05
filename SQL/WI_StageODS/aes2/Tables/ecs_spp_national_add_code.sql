CREATE TABLE [aes2].[ecs_spp_national_add_code] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          NVARCHAR (4) NULL,
    [goods_item_id] NUMERIC (19) NULL,
    [codeSpp]       NVARCHAR (4) NULL,
    CONSTRAINT [ecs_spp_national_add_code$ecs_spp_na_21113435551] PRIMARY KEY CLUSTERED ([id] ASC)
);

