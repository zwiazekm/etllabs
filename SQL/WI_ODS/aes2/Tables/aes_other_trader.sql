CREATE TABLE [aes2].[aes_other_trader] (
    [id]                       NUMERIC (19)   NOT NULL,
    [street_and_no]            NVARCHAR (105) NULL,
    [postcode]                 NVARCHAR (9)   NULL,
    [city]                     NVARCHAR (105) NULL,
    [name_f]                   NVARCHAR (105) NULL,
    [country]                  NVARCHAR (2)   NULL,
    [tin]                      NVARCHAR (17)  NULL,
    [regon]                    NVARCHAR (14)  NULL,
    [other_decl_id]            NUMERIC (19)   NOT NULL,
    [eori]                     NVARCHAR (17)  NULL,
    [email]                    NVARCHAR (70)  NULL,
    [aeo_certificate_group_id] NUMERIC (19)   NULL,
    [type]                     NVARCHAR (2)   NULL,
    CONSTRAINT [aes_other_trader$pk_aes_other_trader] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [aes_other_trader$fk_AEO_CERTIFICATE_GROUP] FOREIGN KEY ([aeo_certificate_group_id]) REFERENCES [aes2].[AEO_CERTIFICATE_GROUP] ([id]),
    CONSTRAINT [aes_other_trader$fk_aes_other] FOREIGN KEY ([other_decl_id]) REFERENCES [aes2].[aes_other] ([decl_id])
);

