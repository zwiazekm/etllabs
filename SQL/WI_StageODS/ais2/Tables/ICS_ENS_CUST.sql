CREATE TABLE [ais2].[ICS_ENS_CUST] (
    [ID]                       NUMERIC (19)  NOT NULL,
    [EMAIL]                    VARCHAR (255) NULL,
    [NAME]                     NVARCHAR (35) NULL,
    [TIN]                      VARCHAR (17)  NULL,
    [CITY]                     NVARCHAR (35) NULL,
    [COUNTRY]                  VARCHAR (2)   NULL,
    [POST_CODE]                VARCHAR (9)   NULL,
    [STREET]                   NVARCHAR (35) NULL,
    [CUST_TYPE]                VARCHAR (255) NULL,
    [ENS_ID]                   NUMERIC (19)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)  NULL,
    CONSTRAINT [ICS_ENS_CUST$ICS_ENS_CU_5113378551] PRIMARY KEY CLUSTERED ([ID] ASC)
);

