CREATE TABLE [aes2].[aes_psw_item_req_doc] (
    [id]                 NUMERIC (19)    NOT NULL,
    [psw_item_id]        NUMERIC (19)    NULL,
    [doc_code]           NVARCHAR (4)    NULL,
    [doc_number]         NVARCHAR (35)   NULL,
    [doc_notes]          NVARCHAR (35)   NULL,
    [item_quantity]      NUMERIC (16, 6) NULL,
    [quantity_unit]      NVARCHAR (3)    NULL,
    [agrim_result]       NVARCHAR (3)    NULL,
    [agrim_discrep_info] NVARCHAR (3072) NULL,
    [poz_id]             NUMERIC (5)     NULL,
    [institution_name]   NVARCHAR (70)   NULL,
    [expiration_date]    DATETIME        NULL,
    [Identifier]         NVARCHAR (70)   NULL,
    CONSTRAINT [aes_psw_item_req_doc$pk_id] PRIMARY KEY CLUSTERED ([id] ASC)
);

