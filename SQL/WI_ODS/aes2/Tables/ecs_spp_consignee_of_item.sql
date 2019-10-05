CREATE TABLE [aes2].[ecs_spp_consignee_of_item] (
    [id]                       NUMERIC (19)   NOT NULL,
    [city]                     NVARCHAR (255) NULL,
    [country]                  NVARCHAR (255) NULL,
    [name_f]                   NVARCHAR (255) NULL,
    [postcode]                 NVARCHAR (255) NULL,
    [street_and_no]            NVARCHAR (255) NULL,
    [tin]                      NVARCHAR (255) NULL,
    [eori]                     NVARCHAR (17)  NULL,
    [regon]                    NVARCHAR (14)  NULL,
    [goods_item_id]            NUMERIC (19)   NULL,
    [email]                    NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_spp_consignee_of_item$ecs_spp_co_17913424151] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_consignee_of_item$fk_spp_cons_item_goods] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_spp_goods_item] ([id])
);

