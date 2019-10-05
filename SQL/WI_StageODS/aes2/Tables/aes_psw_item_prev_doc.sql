CREATE TABLE [aes2].[aes_psw_item_prev_doc] (
    [id]          NUMERIC (19)  NOT NULL,
    [psw_item_id] NUMERIC (19)  NULL,
    [category]    NVARCHAR (1)  NULL,
    [code]        NVARCHAR (3)  NULL,
    [number]      NVARCHAR (35) NULL,
    [prev_doc_no] NUMERIC (5)   NULL,
    CONSTRAINT [aes_psw_item_prev_doc$pk_id] PRIMARY KEY CLUSTERED ([id] ASC)
);

