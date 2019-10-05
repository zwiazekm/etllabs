CREATE TABLE [ncts].[TRANS_OPER_STAT_HIST] (
    [SID]                            BIGINT         NOT NULL,
    [TRANS_OPER_SID]                 INT            NULL,
    [TRANS_OPER_STAT_TYP_ID]         VARCHAR (3)    NULL,
    [TRANS_OPER_PASS_SID]            INT            NULL,
    [TRANS_OPER_STAT_TYP_ID_NA_TRAN] VARCHAR (3)    NULL,
    [USER_ID]                        DECIMAL (8)    NOT NULL,
    [GROUP_ID]                       DECIMAL (8)    NOT NULL,
    [ACTION]                         VARCHAR (100)  NULL,
    [REMARKS]                        VARCHAR (1500) NULL,
    [DAT_TIM_STAT]                   DATETIME       NOT NULL,
    [TRANS_OPER_PASS_STAT_TYP_ID]    VARCHAR (3)    NULL,
    CONSTRAINT [PK_TRANS_OPER_STAT_HIST] PRIMARY KEY CLUSTERED ([SID] ASC)
);

