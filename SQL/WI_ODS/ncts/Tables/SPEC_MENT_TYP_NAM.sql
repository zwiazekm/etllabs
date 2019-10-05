﻿CREATE TABLE [ncts].[SPEC_MENT_TYP_NAM] (
    [SPEC_MENT_TYP_ID] VARCHAR (5)   NOT NULL,
    [LANG_ID]          CHAR (2)      NULL,
    [NAM]              VARCHAR (210) NULL,
    [DAT_START]        DATETIME      NULL,
    [DAT_END]          DATETIME      NULL,
    CONSTRAINT [FK_SMTN_SMT] FOREIGN KEY ([SPEC_MENT_TYP_ID]) REFERENCES [ncts].[SPEC_MENT_TYP] ([ID]),
    CONSTRAINT [SMTN_IN_L] FOREIGN KEY ([LANG_ID]) REFERENCES [ncts].[LANG] ([ID]),
    CONSTRAINT [SMTN_OF_SMT] FOREIGN KEY ([SPEC_MENT_TYP_ID]) REFERENCES [ncts].[SPEC_MENT_TYP] ([ID])
) ON [FG_NCTS];


GO
CREATE NONCLUSTERED INDEX [SMTN_LI_I]
    ON [ncts].[SPEC_MENT_TYP_NAM]([LANG_ID] ASC)
    ON [FG_NCTS];


GO
CREATE NONCLUSTERED INDEX [SMTN_SMTI_I]
    ON [ncts].[SPEC_MENT_TYP_NAM]([SPEC_MENT_TYP_ID] ASC)
    ON [FG_NCTS];

