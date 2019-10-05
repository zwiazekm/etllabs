CREATE TABLE [aes2].[aes_psw_natural_person] (
    [id]                  NUMERIC (19)  NOT NULL,
    [psw_address_id]      NUMERIC (19)  NULL,
    [psw_doc_signer_id]   NUMERIC (19)  NULL,
    [identifier]          NVARCHAR (18) NULL,
    [name]                NVARCHAR (30) NULL,
    [surname]             NVARCHAR (40) NULL,
    [id_no]               NVARCHAR (30) NULL,
    [pesel]               NVARCHAR (11) NULL,
    [representative_type] NCHAR (3)     NULL,
    [be_outpost]          NCHAR (2)     NULL,
    [decl_id]             NUMERIC (19)  NULL,
    [customer_type]       NVARCHAR (20) NULL,
    CONSTRAINT [aes_psw_natural_person$pk_id] PRIMARY KEY CLUSTERED ([id] ASC)
);

