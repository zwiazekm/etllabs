CREATE TABLE [aes2].[ecs_zwp_consignee_of_item] (
    [id]                       NUMERIC (19)   NOT NULL,
    [street_and_no]            NVARCHAR (210) NULL,
    [postcode]                 NVARCHAR (9)   NULL,
    [city]                     NVARCHAR (210) NULL,
    [name_f]                   NVARCHAR (210) NULL,
    [country]                  NVARCHAR (2)   NULL,
    [tin]                      NVARCHAR (17)  NULL,
    [goods_item_id]            NUMERIC (19)   NOT NULL,
    [eori]                     NVARCHAR (17)  NULL,
    [email]                    NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_zwp_consignee_of_item$PK_ecs_zwp_consignee_of_item] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_zwp_consignee_of_item$FK_ecs_zwp_consignee_of_item_ecs_zwp_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_zwp_goods_item] ([id])
);

