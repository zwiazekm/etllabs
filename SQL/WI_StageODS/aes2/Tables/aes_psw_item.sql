CREATE TABLE [aes2].[aes_psw_item] (
    [id]               NUMERIC (19)    NOT NULL,
    [psw_id]           NUMERIC (19)    NULL,
    [item_no]          NUMERIC (5)     NULL,
    [p1c]              NVARCHAR (5)    NULL,
    [cus_code]         NVARCHAR (18)   NULL,
    [item_code]        NVARCHAR (18)   NULL,
    [item_description] NVARCHAR (1000) NULL,
    [net_mass_kg]      NUMERIC (16, 6) NULL,
    [gross_mass_kg]    NUMERIC (16, 6) NULL,
    [be_receiver_id]   NUMERIC (19)    NULL,
    [be_sender_id]     NUMERIC (19)    NULL,
    [be_seller_id]     NUMERIC (19)    NULL,
    [be_buyer_id]      NUMERIC (19)    NULL,
    CONSTRAINT [aes_psw_item$pk_id] PRIMARY KEY CLUSTERED ([id] ASC)
);

