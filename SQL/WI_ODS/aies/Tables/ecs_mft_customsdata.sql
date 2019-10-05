CREATE TABLE [aies].[ecs_mft_customsdata] (
    [id]               NUMERIC (19)    NOT NULL,
    [gross_mass]       NUMERIC (18, 3) NULL,
    [mrn]              VARCHAR (35)    NULL,
    [no_of_packages]   INT             NULL,
    [item_no]          INT             NULL,
    [no_of_pieces]     INT             NULL,
    [partial_shipment] TINYINT         NULL,
    [goods_item_id]    NUMERIC (19)    NOT NULL,
    CONSTRAINT [pk_ecs_mft_customsdata] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

