CREATE TABLE [aes2].[aes_psw_address] (
    [id]            NUMERIC (19)  NOT NULL,
    [zip_code]      NVARCHAR (9)  NULL,
    [country]       NVARCHAR (2)  NULL,
    [city]          NVARCHAR (35) NULL,
    [street_and_no] NVARCHAR (70) NULL,
    CONSTRAINT [aes_psw_address$pk_id] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2]
);

