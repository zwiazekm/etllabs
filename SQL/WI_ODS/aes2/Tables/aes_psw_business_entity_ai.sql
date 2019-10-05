CREATE TABLE [aes2].[aes_psw_business_entity_ai] (
    [id]                     NUMERIC (19) NOT NULL,
    [psw_business_entity_id] NUMERIC (19) NULL,
    [code]                   NVARCHAR (5) NULL,
    CONSTRAINT [aes_psw_business_entity_ai$pk_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2]
);

