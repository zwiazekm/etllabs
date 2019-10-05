﻿CREATE TABLE [ncts].[SP_AUTH_CONTR_LOC] (
    [TRAD_SP_AUTH_ID]   VARCHAR (17)   NOT NULL,
    [CUST_OFF_ID]       VARCHAR (8)    NOT NULL,
    [CUST_OFF_ADDR_SID] INT            NOT NULL,
    [TIMER]             NUMERIC (5)    NOT NULL,
    [STAND_DEL_TIM]     NUMERIC (4)    NULL,
    [SEALS_CHECK]       CHAR (1)       NULL,
    [DESCR]             NVARCHAR (35)  NULL,
    [COMM]              NVARCHAR (350) NULL,
    [DESCR_LNG]         CHAR (2)       NULL,
    [COMM_LNG]          CHAR (2)       NULL,
    [AFTER_HOUR]        CHAR (1)       NULL,
    CONSTRAINT [PK_SP_AUTH_CONTR_LOC] PRIMARY KEY CLUSTERED ([TRAD_SP_AUTH_ID] ASC, [CUST_OFF_ADDR_SID] ASC)
);

