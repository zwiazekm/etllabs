﻿CREATE TABLE [ncts].[TRANS_OPER_STAT_TYP_NAZWY] (
    [TRANS_OPER_STAT_TYP_ID] VARCHAR (3)   NOT NULL,
    [LANG_ID]                CHAR (2)      NOT NULL,
    [NAM]                    VARCHAR (120) NULL,
    CONSTRAINT [PK_TRANS_OPER_STAT_TYP_NAZWY] PRIMARY KEY CLUSTERED ([TRANS_OPER_STAT_TYP_ID] ASC, [LANG_ID] ASC) ON [FG_NCTS]
);

