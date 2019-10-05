CREATE TABLE [aimp2].[ICS_ZCP_VAT_PERIOD] (
    [ID]               NUMERIC (19)    NOT NULL,
    [BE_RECEIVER_ID]   NUMERIC (19)    NULL,
    [DATE_FROM]        DATETIME2 (3)   NOT NULL,
    [DATE_TO]          DATETIME2 (3)   NOT NULL,
    [FREQUENCY_CODE]   NVARCHAR (1)    NOT NULL,
    [BASE]             NUMERIC (16, 2) NOT NULL,
    [AMOUNT]           NUMERIC (16, 2) NOT NULL,
    [VAT7_BASE]        NUMERIC (16, 2) NULL,
    [VAT7_AMOUNT]      NUMERIC (16, 2) NULL,
    [LOGIN]            NVARCHAR (255)  NULL,
    [ACC_DATE]         DATETIME2 (3)   NULL,
    [VAT7_CLOSED]      BIT             NOT NULL,
    [NP_RECEIVER_ID]   NUMERIC (19)    NULL,
    [TIN]              NVARCHAR (17)   NULL,
    [EORI]             NVARCHAR (17)   NULL,
    [VAT7_ARTICLE]     NVARCHAR (35)   NOT NULL,
    [VAT7_CLOSED_DATE] DATETIME2 (3)   NULL,
    [version]          INT             NOT NULL,
    CONSTRAINT [PK_ICS_ZCP_VAT_PERIOD] PRIMARY KEY CLUSTERED ([ID] ASC)
);

