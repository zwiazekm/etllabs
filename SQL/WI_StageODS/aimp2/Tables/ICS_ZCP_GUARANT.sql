CREATE TABLE [aimp2].[ICS_ZCP_GUARANT] (
    [ID]                        NUMERIC (19)    NOT NULL,
    [GRN]                       NVARCHAR (50)   NULL,
    [ZCP_ID]                    NUMERIC (19)    NULL,
    [ZCP_ITEM_ID]               NUMERIC (19)    NULL,
    [OTHER_GUARANTEE_TYPE_CODE] NVARCHAR (35)   NULL,
    [ACCESS_CODE]               NVARCHAR (4)    NULL,
    [AMOUNT]                    NUMERIC (16, 2) NULL,
    [TYPE]                      NVARCHAR (1)    NULL,
    [TIN]                       NVARCHAR (17)   NULL,
    [AMOUNT_USED]               NUMERIC (16, 2) NULL,
    [DATE_USED]                 DATETIME2 (3)   NULL,
    [ZCP_ACF]                   NTEXT           NULL,
    [SEND_TO_ZEFIR]             BIT             NOT NULL,
    [AMOUNT_SENT_TO_ZEFIR]      NUMERIC (16, 2) NULL,
    [version]                   INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_GUARANT$PK_ICS_ZCP_GUARANT] PRIMARY KEY CLUSTERED ([ID] ASC)
);

