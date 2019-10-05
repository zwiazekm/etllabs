CREATE TABLE [ncts].[SEAL_DET] (
    [SID]                      INT          NOT NULL,
    [TRANS_OPER_SID]           INT          NULL,
    [VERS_NUMB]                DECIMAL (3)  NULL,
    [SEAL_IDENT]               VARCHAR (60) NOT NULL,
    [SEAL_IDENT_LNG]           CHAR (2)     NULL,
    [RE_USE]                   CHAR (1)     NULL,
    [TRANS_OPER_UNL_MRN]       VARCHAR (21) NULL,
    [EN_ROUT_EVENT_MRN]        VARCHAR (21) NULL,
    [EN_ROUT_EVENT_SEQ]        DECIMAL (4)  NULL,
    [DEP_TRANS_OPER_MRN]       VARCHAR (21) NULL,
    [FROM_HS_GOODS_CLASS_ID]   VARCHAR (6)  NULL,
    [FROM_CN_GOODS_CLASS_ID]   CHAR (2)     NULL,
    [FROM_SENS_GOODS_CLASS_ID] CHAR (2)     NULL,
    [TO_HS_GOODS_CLASS_ID]     VARCHAR (6)  NULL,
    [TO_CN_GOODS_CLASS_ID]     CHAR (2)     NULL,
    [TO_SENS_GOODS_CLASS_ID]   CHAR (2)     NULL,
    [CUST_OFF_ADDR_SID]        INT          NULL,
    [TRAD_SP_AUTH_SID]         VARCHAR (17) NULL,
    [UNL_VERS_NUMB]            DECIMAL (8)  NULL,
    CONSTRAINT [PK_SEAL_DET] PRIMARY KEY CLUSTERED ([SID] ASC)
);

