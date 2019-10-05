CREATE TABLE [aes2].[aes_psw_business_entity] (
    [id]                       NUMERIC (19)  NOT NULL,
    [psw_address_id]           NUMERIC (19)  NULL,
    [psw_doc_signer_id]        NUMERIC (19)  NULL,
    [email]                    NVARCHAR (70) NULL,
    [eori]                     NVARCHAR (17) NULL,
    [identifier]               NVARCHAR (18) NULL,
    [name]                     NVARCHAR (70) NULL,
    [regon]                    NVARCHAR (14) NULL,
    [tin]                      NVARCHAR (17) NULL,
    [be_outpost]               NVARCHAR (2)  NULL,
    [representative_type]      NVARCHAR (3)  NULL,
    [aeo_certificate_group_id] NUMERIC (19)  NULL,
    [customer_type]            NVARCHAR (20) NULL,
    [decl_id]                  NUMERIC (19)  NULL,
    CONSTRAINT [aes_psw_business_entity$pk_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [aes_psw_business_entity$fk_AEO_CERTIFICATE_GROUP] FOREIGN KEY ([aeo_certificate_group_id]) REFERENCES [aes2].[AEO_CERTIFICATE_GROUP] ([id]),
    CONSTRAINT [aes_psw_business_entity$fk_aes_psw] FOREIGN KEY ([decl_id]) REFERENCES [aes2].[aes_psw] ([id]),
    CONSTRAINT [aes_psw_business_entity$fk_aes_psw_address] FOREIGN KEY ([psw_address_id]) REFERENCES [aes2].[aes_psw_address] ([id]),
    CONSTRAINT [aes_psw_business_entity$fk_aes_psw_doc_signer] FOREIGN KEY ([psw_doc_signer_id]) REFERENCES [aes2].[aes_psw_doc_signer] ([id])
);

