CREATE TABLE [ncts].[TRANS_OPER_PASS] (
    [ATR_SENT]                    DECIMAL (1)  NULL,
    [SID]                         INT          NOT NULL,
    [MRN]                         VARCHAR (21) NULL,
    [TRANS_OPER_SID]              INT          NULL,
    [VERS_NUMB]                   DECIMAL (3)  NULL,
    [CUST_OFF_ID]                 VARCHAR (8)  NOT NULL,
    [DAT_TIM_OFF_ARR]             DATETIME     NULL,
    [TRANS_OPER_PASS_STAT_TYP_ID] VARCHAR (3)  NULL,
    [DAT_STAT_UPD]                DATETIME     NULL,
    [ARRIVED]                     CHAR (1)     NULL,
    [GUARANTEE_INV]               CHAR (1)     NULL,
    CONSTRAINT [PK_TRANS_OPER_PASS] PRIMARY KEY CLUSTERED ([SID] ASC)
);

