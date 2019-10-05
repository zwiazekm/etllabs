CREATE TABLE [aes2].[ecs_mft_goodsitem] (
    [id]                    NUMERIC (19)    NOT NULL,
    [gi_gross_mass]         NUMERIC (18, 3) NULL,
    [gino_of_packages]      INT             NULL,
    [gi_item_no]            INT             NULL,
    [gi_transport_document] NVARCHAR (105)  NULL,
    [gi_kind_of_packages]   NVARCHAR (3)    NULL,
    [gi_marks_of_packages]  NVARCHAR (126)  NULL,
    [gi_no_of_pieces]       INT             NULL,
    [gi_commodity_code]     NVARCHAR (8)    NULL,
    [gi_item_desc]          NVARCHAR (840)  NULL,
    [manifest_decl_id]      NUMERIC (19)    NOT NULL,
    CONSTRAINT [ecs_mft_goodsitem$pk_ecs_mft_goodsitem] PRIMARY KEY CLUSTERED ([id] ASC)
);

