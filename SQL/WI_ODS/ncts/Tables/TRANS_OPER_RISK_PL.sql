﻿CREATE TABLE [ncts].[TRANS_OPER_RISK_PL] (
    [SID]               INT             NOT NULL,
    [TRANS_OPER_SID]    INT             NOT NULL,
    [VERS_NUMB]         DECIMAL (3)     NOT NULL,
    [LOC]               VARCHAR (3)     NOT NULL,
    [ITEM_NUMB_INV]     DECIMAL (5)     NULL,
    [RISK_ANA_TYP_ID]   VARCHAR (5)     NULL,
    [RISK_ANA_TEXT]     NVARCHAR (1050) NULL,
    [SECMOV]            DECIMAL (5)     NOT NULL,
    [DIRECTIVE_DATE]    DECIMAL (8)     NULL,
    [DIRECTIVE_TIME]    DECIMAL (4)     NULL,
    [ERROR_CODE]        VARCHAR (2)     NULL,
    [ERROR_MESSAGE]     NVARCHAR (255)  NULL,
    [PROFILE_NO]        VARCHAR (6)     NULL,
    [PROFILE_AUTHOR]    NVARCHAR (255)  NULL,
    [CONTROL_TYPE]      VARCHAR (1)     NULL,
    [POINTER]           VARCHAR (255)   NULL,
    [TYPE]              VARCHAR (255)   NULL,
    [RISK_CRITERIA]     VARCHAR (3)     NULL,
    [EMAIL]             VARCHAR (255)   NULL,
    [ACT]               DECIMAL (2)     NULL,
    [intervention_code] VARCHAR (4)     NULL,
    [user_id]           DECIMAL (8)     NULL,
    CONSTRAINT [PK_TRANS_OPER_RISK_PL] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_NCTS],
    CONSTRAINT [FK_TORP_TO] FOREIGN KEY ([TRANS_OPER_SID]) REFERENCES [ncts].[TRANS_OPER] ([SID])
);


GO
CREATE NONCLUSTERED INDEX [TORPL_TOS_VN_L_I]
    ON [ncts].[TRANS_OPER_RISK_PL]([TRANS_OPER_SID] ASC, [VERS_NUMB] ASC, [LOC] ASC)
    ON [FG_NCTS];

