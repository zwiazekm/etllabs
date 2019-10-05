﻿CREATE TABLE [ncts].[CUST_OFF] (
    [GEO_INF_COD]    VARCHAR (6)  NULL,
    [REG_COD]        VARCHAR (3)  NULL,
    [ID]             VARCHAR (8)  NOT NULL,
    [DAT_START_NCTS] DATETIME     NULL,
    [PHON_NUMB]      VARCHAR (35) NULL,
    [FAX_NUMB]       VARCHAR (35) NULL,
    [TELEX_NUMB]     VARCHAR (35) NULL,
    [E_MAIL_ADDR]    VARCHAR (70) NULL,
    [COUNTRY_ID]     CHAR (2)     NOT NULL,
    [TRAD_DED]       CHAR (1)     NOT NULL,
    [POST_COD]       VARCHAR (9)  NOT NULL,
    CONSTRAINT [PK_CUST_OFF] PRIMARY KEY CLUSTERED ([ID] ASC)
);

