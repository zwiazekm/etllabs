CREATE TABLE [ncts].[ENQUIRY_INF_REQ] (
    [SID]                      INT          NOT NULL,
    [TRANS_OPER_SID]           INT          NOT NULL,
    [MRN]                      VARCHAR (21) NOT NULL,
    [CMP_DEP_CUST_OFF_INF_SID] INT          NOT NULL,
    [CMP_DES_CUST_OFF_INF_SID] INT          NULL,
    [ENQ_DATE]                 DATETIME     NOT NULL,
    CONSTRAINT [PK_ENQUIRY_INF_REQ] PRIMARY KEY CLUSTERED ([SID] ASC)
);

