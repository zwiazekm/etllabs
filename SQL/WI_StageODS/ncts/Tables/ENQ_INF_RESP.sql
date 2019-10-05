CREATE TABLE [ncts].[ENQ_INF_RESP] (
    [CUST_OFF_ID]         VARCHAR (8)    NOT NULL,
    [ENQ_COMM_SID]        INT            NOT NULL,
    [SID]                 INT            NOT NULL,
    [ADD_INF_RESP_TYP_ID] CHAR (2)       NOT NULL,
    [TEXT]                NVARCHAR (420) NULL,
    [DAT_RESP]            DATETIME       NULL,
    [COUNTER_REQ]         DECIMAL (4)    NULL,
    CONSTRAINT [PK_ENQ_INF_RESP] PRIMARY KEY CLUSTERED ([SID] ASC)
);

