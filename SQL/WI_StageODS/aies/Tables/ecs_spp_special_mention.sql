CREATE TABLE [aies].[ecs_spp_special_mention] (
    [id]            NUMERIC (19) NOT NULL,
    [code]          VARCHAR (5)  NULL,
    [text]          VARCHAR (70) NULL,
    [goods_item_id] NUMERIC (19) NULL,
    CONSTRAINT [ecs_spp_sp_2198608191] PRIMARY KEY CLUSTERED ([id] ASC)
);

