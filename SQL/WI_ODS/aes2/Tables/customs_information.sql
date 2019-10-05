CREATE TABLE [aes2].[customs_information] (
    [id]          NUMERIC (19) NOT NULL,
    [information] NTEXT        NULL,
    CONSTRAINT [customs_information$customs_in_id_10268156891] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [customs_information$fk_customs_information_verification_item] FOREIGN KEY ([id]) REFERENCES [aes2].[customs_verification_item] ([id])
) TEXTIMAGE_ON [FG_AES2];

