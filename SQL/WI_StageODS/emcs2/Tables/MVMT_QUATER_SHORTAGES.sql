CREATE TABLE [emcs2].[MVMT_QUATER_SHORTAGES] (
    [ID]                    NUMERIC (38)    NOT NULL,
    [MVMT_ID]               NUMERIC (38)    NOT NULL,
    [PRODUCT_ID]            NUMERIC (38)    NOT NULL,
    [CONSIGNOR_NRA]         VARCHAR (13)    NOT NULL,
    [CONSIGNEE_NRA]         VARCHAR (13)    NULL,
    [YEAR]                  NUMERIC (4)     NOT NULL,
    [QUATER]                NUMERIC (1)     NOT NULL,
    [DATE_OF_ARRIVAL]       DATETIME2 (6)   NOT NULL,
    [EXCISE_PRODUCT_CODE]   VARCHAR (4)     NOT NULL,
    [CN_CODE]               VARCHAR (8)     NULL,
    [TRANSPORT_MODE]        VARCHAR (2)     NULL,
    [KIND_OF_PACKAGES_CODE] VARCHAR (2)     NULL,
    [AMOUNT]                NUMERIC (18, 3) NOT NULL,
    [USER_TASK_ID]          NUMERIC (38)    NULL,
    CONSTRAINT [PK_MVMT_QUATER_SHORTAGES] PRIMARY KEY CLUSTERED ([ID] ASC)
);

