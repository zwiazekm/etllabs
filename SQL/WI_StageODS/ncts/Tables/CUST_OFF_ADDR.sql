CREATE TABLE [ncts].[CUST_OFF_ADDR] (
    [SID]                INT          NOT NULL,
    [CUST_OFF_ID]        VARCHAR (8)  NOT NULL,
    [ID_WITHIN_CUST_OFF] VARCHAR (17) NOT NULL,
    [ADDR_TYP_ID]        CHAR (1)     NOT NULL,
    [COUNTRY_ID]         CHAR (2)     NOT NULL,
    [REG_ID]             VARCHAR (3)  NULL,
    [LOC_ID]             VARCHAR (3)  NULL,
    [POST_COD]           VARCHAR (9)  NULL,
    [TRAD_SID]           INT          NULL,
    CONSTRAINT [PK_CUST_OFF_ADDR] PRIMARY KEY CLUSTERED ([SID] ASC)
);

