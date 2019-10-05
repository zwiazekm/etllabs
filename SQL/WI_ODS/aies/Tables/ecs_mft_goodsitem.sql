CREATE TABLE [aies].[ecs_mft_goodsitem] (
    [id]                    NUMERIC (19)    NOT NULL,
    [gi_gross_mass]         NUMERIC (18, 3) NULL,
    [gino_of_packages]      INT             NULL,
    [gi_item_no]            INT             NULL,
    [gi_transport_document] NVARCHAR (35)   NULL,
    [gi_kind_of_packages]   VARCHAR (3)     NULL,
    [gi_marks_of_packages]  NVARCHAR (42)   NULL,
    [gi_no_of_pieces]       INT             NULL,
    [gi_commodity_code]     VARCHAR (8)     NULL,
    [gi_item_desc]          NVARCHAR (280)  NULL,
    [manifest_decl_id]      NUMERIC (19)    NOT NULL,
    CONSTRAINT [pk_ecs_mft_goodsitem] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

