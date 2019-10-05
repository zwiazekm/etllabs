﻿CREATE TABLE [aes2].[AES_PSW_ITEM_CONTAINER] (
    [ID]               NUMERIC (19)  NOT NULL,
    [PSW_ITEM_ID]      NUMERIC (19)  NULL,
    [CONTAINER_NUMBER] NVARCHAR (17) NULL,
    CONSTRAINT [AES_PSW_ITEM_CONTAINER$pk_id] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AES2],
    CONSTRAINT [AES_PSW_ITEM_CONTAINER$fk_aes_psw_item] FOREIGN KEY ([PSW_ITEM_ID]) REFERENCES [aes2].[aes_psw_item] ([id])
);

