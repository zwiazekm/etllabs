CREATE TABLE [aes2].[aes_psw_natural_pers_add_info] (
    [id]                    NUMERIC (19) NOT NULL,
    [psw_natural_person_id] NUMERIC (19) NULL,
    [code]                  NVARCHAR (5) NULL,
    CONSTRAINT [aes_psw_natural_pers_add_info$pk_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [aes_psw_natural_pers_add_info$fk_aes_psw_natural_person] FOREIGN KEY ([psw_natural_person_id]) REFERENCES [aes2].[aes_psw_natural_person] ([id])
);

