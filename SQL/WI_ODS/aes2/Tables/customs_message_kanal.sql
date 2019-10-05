CREATE TABLE [aes2].[customs_message_kanal] (
    [ID]      NUMERIC (19)  NOT NULL,
    [MESS_ID] NUMERIC (19)  NOT NULL,
    [KTYP]    NVARCHAR (2)  NOT NULL,
    [KCHOISE] NVARCHAR (4)  NOT NULL,
    [VAL]     NVARCHAR (70) NOT NULL,
    [VAL_ADD] NVARCHAR (70) NULL,
    CONSTRAINT [customs_message_kanal$pk_customs_message_kanal] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AES2],
    CONSTRAINT [customs_message_kanal$fk_customs_message] FOREIGN KEY ([MESS_ID]) REFERENCES [aes2].[customs_message] ([id])
);


GO
ALTER TABLE [aes2].[customs_message_kanal] NOCHECK CONSTRAINT [customs_message_kanal$fk_customs_message];

