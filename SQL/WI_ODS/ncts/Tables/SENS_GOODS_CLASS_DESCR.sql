﻿CREATE TABLE [ncts].[SENS_GOODS_CLASS_DESCR] (
    [SENS_GOODS_CLASS_SID] INT           NOT NULL,
    [LANG_ID]              CHAR (2)      NOT NULL,
    [DAT_END]              DATETIME      NULL,
    [DAT_START]            DATETIME      NULL,
    [NAM]                  VARCHAR (210) NULL,
    CONSTRAINT [FK_SGCD_SGC] FOREIGN KEY ([SENS_GOODS_CLASS_SID]) REFERENCES [ncts].[SENS_GOODS_CLASS] ([SID]),
    CONSTRAINT [SGCD_IN_L] FOREIGN KEY ([LANG_ID]) REFERENCES [ncts].[LANG] ([ID]),
    CONSTRAINT [SGCD_OF_GC_S] FOREIGN KEY ([SENS_GOODS_CLASS_SID]) REFERENCES [ncts].[SENS_GOODS_CLASS] ([SID])
) ON [FG_NCTS];


GO
CREATE NONCLUSTERED INDEX [SGCD_LI_I]
    ON [ncts].[SENS_GOODS_CLASS_DESCR]([LANG_ID] ASC)
    ON [FG_NCTS];


GO
CREATE NONCLUSTERED INDEX [SGCD_SGCS_I]
    ON [ncts].[SENS_GOODS_CLASS_DESCR]([SENS_GOODS_CLASS_SID] ASC)
    ON [FG_NCTS];

