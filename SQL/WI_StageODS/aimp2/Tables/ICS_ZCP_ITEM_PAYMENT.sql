CREATE TABLE [aimp2].[ICS_ZCP_ITEM_PAYMENT] (
    [ID]                     NUMERIC (19)    NOT NULL,
    [ZCP_ITEM_ID]            NUMERIC (19)    NULL,
    [DEBT_NOTIFICATION_DATE] DATETIME2 (3)   NULL,
    [DEBT_ACQUAINTED_DATE]   DATETIME2 (3)   NULL,
    [AMOUNT]                 NUMERIC (16, 2) NULL,
    [AMOUNT_TO_GUARANTEE]    NUMERIC (16, 2) NULL,
    [IS_AMOUNT_GUARANTEED]   BIT             NOT NULL,
    [PAYMENT_METHOD]         NVARCHAR (1)    NULL,
    [BASE]                   NUMERIC (16, 2) NULL,
    [RATE]                   NUMERIC (17, 2) NULL,
    [TYPE]                   NVARCHAR (3)    NULL,
    [ICS_ZCP_ITEM_PODZ_ID]   NUMERIC (19)    NULL,
    [ROW_STYLE]              NVARCHAR (1)    NULL,
    [AMOUNT_PAID]            NUMERIC (16, 6) NULL,
    [ZCP_ACF]                NTEXT           NULL,
    [version]                INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_PAYMENT$PK_ICS_ZCP_ITEM_PAYMENT] PRIMARY KEY CLUSTERED ([ID] ASC)
);

