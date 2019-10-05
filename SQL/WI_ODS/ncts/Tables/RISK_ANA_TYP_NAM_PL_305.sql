﻿CREATE TABLE [ncts].[RISK_ANA_TYP_NAM_PL_305] (
    [RISK_ANA_TYP_ID] VARCHAR (4)   NOT NULL,
    [LANG_ID]         CHAR (2)      NOT NULL,
    [NAM]             VARCHAR (420) NULL,
    [DAT_START]       DATETIME      NULL,
    [DAT_END]         DATETIME      NULL,
    CONSTRAINT [PK_RISK_ANA_TYP_NAM_PL_305] PRIMARY KEY CLUSTERED ([RISK_ANA_TYP_ID] ASC, [LANG_ID] ASC) ON [FG_NCTS],
    CONSTRAINT [RATNPL305_IN_L] FOREIGN KEY ([LANG_ID]) REFERENCES [ncts].[LANG] ([ID])
);

