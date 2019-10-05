CREATE TABLE [ncts].[ENQUIRY_INF] (
    [SID]                      INT          NOT NULL,
    [TRANS_OPER_SID]           INT          NOT NULL,
    [MRN]                      VARCHAR (21) NOT NULL,
    [REQ_CUST_OFF_INF_SID]     INT          NULL,
    [CMP_DEP_CUST_OFF_INF_SID] INT          NOT NULL,
    [CMP_DES_CUST_OFF_INF_SID] INT          NULL,
    [ENQ_DATE]                 DATETIME     NOT NULL,
    [INF_FROM_PRINCIPAL]       DECIMAL (1)  NULL,
    CONSTRAINT [PK_ENQUIRY_INF] PRIMARY KEY CLUSTERED ([SID] ASC)
);

