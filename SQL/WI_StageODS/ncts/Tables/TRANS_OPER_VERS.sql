CREATE TABLE [ncts].[TRANS_OPER_VERS] (
    [TRANS_OPER_SID]          INT             NOT NULL,
    [VERS_NUMB]               DECIMAL (3)     NOT NULL,
    [TYP]                     CHAR (1)        NOT NULL,
    [STAT]                    CHAR (1)        NOT NULL,
    [DAT_SENT_BY_FIRST_PARTY] DATETIME        NULL,
    [DAT_TIM_FORM_DEC]        DATETIME        NULL,
    [DAT_REC_BY_SEC_PARTY]    DATETIME        NULL,
    [PLAC]                    NVARCHAR (105)  NULL,
    [PLAC_LNG]                CHAR (2)        NULL,
    [INIT_BY_CUST]            CHAR (1)        NULL,
    [REASON]                  NVARCHAR (1050) NULL,
    [REASON_LNG]              CHAR (2)        NULL,
    CONSTRAINT [PK_TRANS_OPER_VERS] PRIMARY KEY CLUSTERED ([TRANS_OPER_SID] ASC, [VERS_NUMB] ASC)
);

