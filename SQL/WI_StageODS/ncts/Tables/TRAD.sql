CREATE TABLE [ncts].[TRAD] (
    [SID]              INT            NOT NULL,
    [COUNTRY_ID]       CHAR (2)       NOT NULL,
    [CITY]             NVARCHAR (105) NULL,
    [NAM]              NVARCHAR (105) NULL,
    [POST_COD]         VARCHAR (27)   NULL,
    [STR_AND_NUMB]     NVARCHAR (105) NULL,
    [DAT_START]        DATETIME       NOT NULL,
    [TIN]              VARCHAR (17)   NULL,
    [CONT_PERS]        VARCHAR (35)   NULL,
    [FAX_NUMB]         VARCHAR (25)   NULL,
    [FIRST_NAM]        NVARCHAR (35)  NULL,
    [PHON_NUMB]        NVARCHAR (25)  NULL,
    [DAT_END]          DATETIME       NULL,
    [CUST_OFF_ID]      VARCHAR (8)    NULL,
    [NAD_LNG]          CHAR (2)       NULL,
    [EDI_TRAD]         CHAR (1)       NULL,
    [TIN_OR_HOLDER_ID] NUMERIC (1)    NULL,
    CONSTRAINT [PK_TRAD] PRIMARY KEY CLUSTERED ([SID] ASC)
);

