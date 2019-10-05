﻿CREATE TABLE [ncts].[RECOVERY_ACCEPTANCE] (
    [SID]                        INT            NOT NULL,
    [TRANS_OPER_SID]             INT            NOT NULL,
    [MRN]                        VARCHAR (21)   NOT NULL,
    [CMP_REQUESTING_CUST_OFF_ID] VARCHAR (8)    NOT NULL,
    [CMP_REQUESTED_CUST_OFF_ID]  VARCHAR (8)    NOT NULL,
    [INFO_TEXT]                  NVARCHAR (420) NULL,
    [INFO_AVAILABLE]             DECIMAL (1)    NULL,
    [CONT_PERSON]                NVARCHAR (420) NULL,
    [COMM_DATE]                  DATETIME       NOT NULL,
    [ACCEPTANCE]                 DECIMAL (1)    NOT NULL,
    CONSTRAINT [PK_RECOVERY_ACCEPTANCE] PRIMARY KEY CLUSTERED ([SID] ASC)
);

