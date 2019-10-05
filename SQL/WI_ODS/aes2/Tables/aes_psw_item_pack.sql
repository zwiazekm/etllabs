CREATE TABLE [aes2].[aes_psw_item_pack] (
    [id]               NUMERIC (19)  NOT NULL,
    [psw_item_id]      NUMERIC (19)  NULL,
    [pack_quantity]    NUMERIC (8)   NULL,
    [pack_number_sign] NVARCHAR (42) NULL,
    [pack_type]        NVARCHAR (3)  NULL,
    CONSTRAINT [aes_psw_item_pack$pk_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [aes_psw_item_pack$fk_aes_psw_item] FOREIGN KEY ([psw_item_id]) REFERENCES [aes2].[aes_psw_item] ([id])
);

