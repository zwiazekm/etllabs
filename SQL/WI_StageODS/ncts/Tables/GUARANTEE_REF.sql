CREATE TABLE [ncts].[GUARANTEE_REF] (
    [SID]              INT             NOT NULL,
    [GUARANTEE_I_SID]  INT             NULL,
    [GRN]              VARCHAR (24)    NULL,
    [OTH_REF]          VARCHAR (35)    NULL,
    [ACC_COD]          VARCHAR (4)     NULL,
    [INV_FOR_EC]       DECIMAL (1)     NULL,
    [GUARANTEE_AMOUNT] DECIMAL (17, 2) NULL,
    [CURRENCY]         VARCHAR (3)     NULL,
    [GUA_CUST_OFF_ID]  VARCHAR (8)     NULL,
    [COUNTRY_ID]       CHAR (2)        NULL,
    [USAGE_STATUS]     CHAR (1)        NOT NULL,
    [USAGE_REJ_CODES]  VARCHAR (35)    NULL,
    [DAT_REL]          DATETIME        NULL,
    [DAT_CAN]          DATETIME        NULL,
    [DAT_CHECK_REQ]    DATETIME        NULL,
    [DAT_CHECK_RESP]   DATETIME        NULL,
    [CHECK_RESULT]     VARCHAR (3)     NULL,
    [CHECK_STATUS]     CHAR (1)        NULL,
    CONSTRAINT [PK_GUARANTEE_REF] PRIMARY KEY CLUSTERED ([SID] ASC)
);

