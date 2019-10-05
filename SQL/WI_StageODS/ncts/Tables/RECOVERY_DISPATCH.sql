CREATE TABLE [ncts].[RECOVERY_DISPATCH] (
    [SID]                        INT            NOT NULL,
    [TRANS_OPER_SID]             INT            NOT NULL,
    [MRN]                        VARCHAR (21)   NOT NULL,
    [CMP_REQUESTING_CUST_OFF_ID] VARCHAR (8)    NOT NULL,
    [CMP_REQUESTED_CUST_OFF_ID]  VARCHAR (8)    NOT NULL,
    [INFO_TEXT]                  NVARCHAR (420) NULL,
    [CONT_PERSON]                NVARCHAR (420) NULL,
    [COLLECTION_DATE]            DATETIME       NOT NULL,
    CONSTRAINT [PK_RECOVERY_DISPATCH] PRIMARY KEY CLUSTERED ([SID] ASC)
);

