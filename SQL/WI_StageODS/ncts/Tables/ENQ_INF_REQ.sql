CREATE TABLE [ncts].[ENQ_INF_REQ] (
    [CUST_OFF_ID]        VARCHAR (8)    NOT NULL,
    [ADD_INF_REQ_TYP_ID] CHAR (1)       NOT NULL,
    [ENQ_COMM_SID]       INT            NOT NULL,
    [SID]                INT            NOT NULL,
    [TEXT]               NVARCHAR (420) NULL,
    [DAT_REQ]            DATETIME       NULL,
    [COUNTER_REQ]        DECIMAL (4)    NULL,
    CONSTRAINT [PK_ENQ_INF_REQ] PRIMARY KEY CLUSTERED ([SID] ASC)
);

