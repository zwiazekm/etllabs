﻿CREATE TABLE [aes2].[aes_psw_additional_info] (
    [id]          NUMERIC (19)   NOT NULL,
    [psw_id]      NUMERIC (19)   NULL,
    [code]        NVARCHAR (5)   NULL,
    [description] NVARCHAR (512) NULL,
    CONSTRAINT [aes_psw_additional_info$pk_id] PRIMARY KEY CLUSTERED ([id] ASC)
);

