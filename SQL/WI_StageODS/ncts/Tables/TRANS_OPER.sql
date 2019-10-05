﻿CREATE TABLE [ncts].[TRANS_OPER] (
    [AAR_SENT]                       DECIMAL (1)     NULL,
    [LOCKED_DISP]                    CHAR (1)        NOT NULL,
    [BIND_ITIN_FLAG]                 CHAR (1)        NULL,
    [DEP_TRAD_ADDR]                  VARCHAR (105)   NULL,
    [ARR_TRAD_ADDR]                  VARCHAR (105)   NULL,
    [DEP_RISK_ANA]                   DECIMAL (3)     NULL,
    [ARR_RISK_ANA]                   DECIMAL (3)     NULL,
    [DEC_VIA]                        CHAR (1)        NULL,
    [ARR_VIA]                        CHAR (1)        NULL,
    [LOCKED]                         CHAR (1)        NULL,
    [NOT_COD]                        CHAR (2)        NULL,
    [NOT_TXT]                        NVARCHAR (1050) NULL,
    [STAT]                           CHAR (1)        NULL,
    [TRAD_SP_AUTH_ID]                VARCHAR (17)    NULL,
    [TRANS_OPER_STAT_TYP_ID_NA_TRAN] VARCHAR (3)     NULL,
    [DAT_TIM_DES_CONTR_REC]          DATETIME        NULL,
    [SID]                            INT             NOT NULL,
    [MRN]                            VARCHAR (21)    NULL,
    [LRN]                            VARCHAR (22)    NULL,
    [PRINC_TRAD_SID]                 INT             NULL,
    [PRINC_TRADS_SID]                INT             NULL,
    [PRES_AT_DEST_BY_TRAD_SID]       INT             NULL,
    [PRES_AT_DEST_BY_TRADS_SID]      INT             NULL,
    [DIV_PROH]                       CHAR (1)        NULL,
    [BIND_ITIN]                      NVARCHAR (420)  NULL,
    [BIND_ITIN_LNG]                  CHAR (2)        NULL,
    [RISK_ANA]                       DECIMAL (3)     NULL,
    [DAT_DOC_RET]                    DATETIME        NULL,
    [DAT_TIM_ALL_TRANS]              DATETIME        NULL,
    [DAT_PRINC_NOT_RESP]             DATETIME        NULL,
    [DAT_TRAD_REQ_REL]               DATETIME        NULL,
    [DAT_WRITT_OFF]                  DATETIME        NULL,
    [ENQ_AT_DEST]                    CHAR (1)        NULL,
    [ARR_SIMPL_PROC]                 CHAR (1)        NULL,
    [ARR_AGR_GOODS_LOC]              NVARCHAR (105)  NULL,
    [ARR_AGR_GOODS_LOC_COD]          NVARCHAR (17)   NULL,
    [ARR_AGR_GOODS_LOC_LNG]          CHAR (2)        NULL,
    [DAT_ARR]                        DATETIME        NULL,
    [DAT_ARR_NOT]                    DATETIME        NULL,
    [DAT_ACC]                        DATETIME        NULL,
    [ARR_NOT_PLAC]                   NVARCHAR (105)  NULL,
    [ARR_NOT_PLAC_LNG]               CHAR (2)        NULL,
    [DAT_DISCR_NOT]                  DATETIME        NULL,
    [DAT_DISCR_SOLV]                 DATETIME        NULL,
    [DAT_GOODS_REL]                  DATETIME        NULL,
    [DAT_OTS_DIV_ARR_ADV]            DATETIME        NULL,
    [DAT_TIM_LIM_FOR_ARR]            DATETIME        NULL,
    [DEP_CUST_OFF_ID]                VARCHAR (8)     NULL,
    [OR_DEST_CUST_OFF_ID]            VARCHAR (8)     NULL,
    [ARR_CUST_OFF_ID]                VARCHAR (8)     NULL,
    [OTS_DIV_REC_BY_CUST_OFF_ID]     VARCHAR (8)     NULL,
    [TRANS_OPER_STAT_TYP_ID]         VARCHAR (3)     NULL,
    [DAT_STAT_UPD]                   DATETIME        NULL,
    [ARR_CUST_OFF_ADDR_SID]          INT             NULL,
    [DEST_DIAL_LANG_ID]              CHAR (2)        NULL,
    [CONTR_NAM]                      NVARCHAR (105)  NULL,
    [DAT_TIM_ARR_CONTR]              DATETIME        NULL,
    [DAT_TIM_DEP_CONTR]              DATETIME        NULL,
    [OODEP_RES_DISCR]                CHAR (1)        NULL,
    [DEP_CONTR_RES_TYP_ID]           CHAR (2)        NULL,
    [ARR_CONTR_RES_TYP_ID]           CHAR (2)        NULL,
    [CONTR_BY_LNG]                   CHAR (2)        NULL,
    [SEALS_AFF_BY_USER_ID]           VARCHAR (7)     NULL,
    [INC]                            CHAR (1)        NULL,
    [SEALS_OK]                       CHAR (1)        NULL,
    [NUMB_OF_SEALS]                  DECIMAL (4)     NULL,
    [WAIT_FOR_INC_DOC]               CHAR (1)        NULL,
    [CONTR_REM]                      NVARCHAR (1050) NULL,
    [CONTR_REM_LNG]                  CHAR (2)        NULL,
    [CONTR_RES_SEC_COD]              CHAR (8)        NULL,
    [WAIT_FOR_RES_FLAG]              CHAR (1)        NULL,
    [AUD_USER_ID]                    VARCHAR (7)     NOT NULL,
    [AUD_DAT_TIM]                    DATETIME        NOT NULL,
    [DISP_COUNTRY_ID]                CHAR (2)        NULL,
    [DEST_COUNTRY_ID]                CHAR (2)        NULL,
    [DECL_TYP_ID]                    VARCHAR (5)     NULL,
    [NUMB_OF_LOAD_LISTS]             DECIMAL (5)     NULL,
    [SENS]                           CHAR (1)        NULL,
    [AUTH_CONSIGNEE_TRAD_TIN]        VARCHAR (17)    NULL,
    [DEST_CUST_OFF_ID]               VARCHAR (8)     NULL,
    [PROC]                           CHAR (2)        NULL,
    [PRINC_TRAD_NAM]                 NVARCHAR (105)  NULL,
    [PRINC_TRAD_TIN]                 VARCHAR (17)    NULL,
    [PRES_AT_DEST_BY_TRAD_NAM]       NVARCHAR (105)  NULL,
    [PRES_AT_DEST_BY_TRAD_TIN]       VARCHAR (17)    NULL,
    [UNL_COMPL]                      CHAR (1)        NULL,
    [UNL_VERS_NUMB]                  DECIMAL (8)     NULL,
    [GUA_ACCEPTED]                   CHAR (1)        NULL,
    [RISK_TIMER_STATUS]              DECIMAL (1)     NULL,
    [ENQ_EXP_TIMER]                  DECIMAL (1)     NULL,
    [ENQ_ALLRSP_RCD]                 DECIMAL (1)     NULL,
    [ENQ_RCV]                        DECIMAL (1)     NULL,
    [SECURITY_HIGH_RISK]             DECIMAL (1)     NULL,
    [TRA_RISK_ANA]                   DECIMAL (3)     NULL,
    [TIR_PAGE]                       CHAR (2)        NULL,
    [TIR_TYPE]                       VARCHAR (3)     NULL,
    [TIR_RESULT]                     CHAR (2)        NULL,
    [ARR_CONTR_NAM]                  VARCHAR (105)   NULL,
    [ARR_CONTR_REM]                  VARCHAR (1050)  NULL,
    [ARR_TYPING]                     CHAR (1)        NULL,
    [sim_pro_num]                    VARCHAR (35)    NULL,
    CONSTRAINT [PK_TRANS_OPER] PRIMARY KEY CLUSTERED ([SID] ASC)
);

