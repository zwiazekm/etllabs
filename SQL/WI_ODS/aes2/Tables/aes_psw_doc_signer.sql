CREATE TABLE [aes2].[aes_psw_doc_signer] (
    [id]                       NUMERIC (19)   NOT NULL,
    [email]                    NVARCHAR (35)  NULL,
    [name]                     NVARCHAR (30)  NULL,
    [surname]                  NVARCHAR (40)  NULL,
    [criminal_liab_cert]       NVARCHAR (MAX) NULL,
    [phone]                    NVARCHAR (15)  NULL,
    [customs_agent_entry_date] DATETIME       NULL,
    [customs_agent_entry_no]   NVARCHAR (35)  NULL,
    CONSTRAINT [aes_psw_doc_signer$pk_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2]
);

