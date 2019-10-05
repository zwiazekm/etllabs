﻿CREATE TABLE [ncts].[CONTR_RES_TYP] (
    [ID]        CHAR (2) NOT NULL,
    [DAT_START] DATETIME NOT NULL,
    [DAT_END]   DATETIME NULL,
    CONSTRAINT [PK_CONTR_RES_TYP] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_NCTS]
);

