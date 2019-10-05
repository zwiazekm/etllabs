CREATE TABLE [aes2].[ecs_spp_prev_doc_proc_gosp] (
    [id]            NUMERIC (19)  NOT NULL,
    [ref]           NVARCHAR (35) NULL,
    [ref_spp]       NVARCHAR (35) NULL,
    [type]          NVARCHAR (6)  NULL,
    [type_spp]      NVARCHAR (6)  NULL,
    [goods_item_id] NUMERIC (19)  NULL,
    CONSTRAINT [PK_ecs_spp_prev_doc_proc_gosp] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_spp_prev_doc_proc_gosp$fk_spp_prev_doc_gosp_goods_i] FOREIGN KEY ([goods_item_id]) REFERENCES [aes2].[ecs_spp_goods_item] ([id])
);

