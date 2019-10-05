﻿CREATE TABLE [ncts].[GUARANTEE_I] (
    [SID]              INT         NOT NULL,
    [TRANS_OPER_SID]   INT         NULL,
    [VERS_NUMB]        DECIMAL (3) NULL,
    [GUARANTEE_TYP_ID] CHAR (2)    NOT NULL,
    CONSTRAINT [PK_GUARANTEE_I] PRIMARY KEY CLUSTERED ([SID] ASC)
);

