CREATE TABLE [aes2].[ecs_exp_produced_document] (
    [id]                 NUMERIC (19)    NOT NULL,
    [state_br]           NCHAR (1)       NOT NULL,
    [state_br_c]         NVARCHAR (420)  NULL,
    [type]               NVARCHAR (4)    NULL,
    [ref]                NVARCHAR (105)  NULL,
    [goods_item_id]      NUMERIC (19)    NOT NULL,
    [remarks]            NVARCHAR (35)   NULL,
    [agrex_result]       NVARCHAR (3)    NULL,
    [agrex_discrep_info] NVARCHAR (3072) NULL,
    [item_quantity]      NUMERIC (16, 6) NULL,
    [quantity_unit]      NVARCHAR (3)    NULL,
    [poz_id]             NUMERIC (5)     NULL,
    CONSTRAINT [ecs_exp_produced_document$pk_ecs_exp_produced_document] PRIMARY KEY CLUSTERED ([id] ASC)
);

