CREATE TABLE [ncts].[TRAD_SP_AUTH] (
    [ID]               VARCHAR (17)  NOT NULL,
    [LOC]              VARCHAR (3)   NOT NULL,
    [DAT_REQ]          DATETIME      NOT NULL,
    [DAT_SENT_TO_TRAD] DATETIME      NOT NULL,
    [DAT_EXP]          DATETIME      NULL,
    [MAX_JOURN_TIM]    DECIMAL (2)   NULL,
    [COMM]             VARCHAR (350) NULL,
    [TRAD_SID]         INT           NULL,
    [CUST_OFF_ID]      VARCHAR (8)   NOT NULL,
    [COMM_LNG]         CHAR (2)      NULL,
    [USER_ID]          VARCHAR (7)   NULL,
    [DECL_TYP]         VARCHAR (9)   NOT NULL,
    CONSTRAINT [PK_TRAD_SP_AUTH] PRIMARY KEY CLUSTERED ([ID] ASC, [LOC] ASC, [DECL_TYP] ASC)
);

