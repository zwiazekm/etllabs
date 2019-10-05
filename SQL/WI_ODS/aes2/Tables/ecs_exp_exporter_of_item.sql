CREATE TABLE [aes2].[ecs_exp_exporter_of_item] (
    [id]                       NUMERIC (19)   NOT NULL,
    [street_and_no]            NVARCHAR (105) NULL,
    [postcode]                 NVARCHAR (9)   NULL,
    [city]                     NVARCHAR (105) NULL,
    [name_f]                   NVARCHAR (105) NULL,
    [country]                  NVARCHAR (2)   NULL,
    [tin]                      NVARCHAR (17)  NULL,
    [regon]                    NVARCHAR (14)  NULL,
    [goods_item_id]            NUMERIC (19)   NOT NULL,
    [eori]                     NVARCHAR (17)  NULL,
    [email]                    NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_exp_exporter_of_item$pk_ecs_exp_exporter_of_item] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_exp_exporter_of_item$fk_exp_item_exp_goods_item] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_exp_goods_item] ([id])
);

