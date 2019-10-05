CREATE TABLE [aes2].[ecs_query_consignee_of_item] (
    [id]            NUMERIC (19)   NOT NULL,
    [city]          NVARCHAR (255) NULL,
    [country]       NVARCHAR (255) NULL,
    [name_f]        NVARCHAR (255) NULL,
    [postcode]      NVARCHAR (255) NULL,
    [street_and_no] NVARCHAR (255) NULL,
    [tin]           NVARCHAR (255) NULL,
    [gi_id]         NUMERIC (19)   NULL,
    [email]         NVARCHAR (70)  NULL,
    CONSTRAINT [ecs_query_consignee_of_item$ecs_query__4271455361] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_query_consignee_of_item$fk_query_cons_item_goods] FOREIGN KEY ([gi_id]) REFERENCES [aes2].[ecs_query_goods_item] ([id])
);

