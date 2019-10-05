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
    CONSTRAINT [ICS_ZCP_GUARANT$PK_ICS_ZCP_GUARANT] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_ZCP_GUARANT$FK_ICS_ZCP_GUARANT_ICS_ZCP] FOREIGN KEY ([ZCP_ID]) REFERENCES [aimp2].[ICS_ZCP] ([ID]),
    CONSTRAINT [ICS_ZCP_GUARANT$FK_ICS_ZCP_GUARANT_ICS_ZCP_ITEM] FOREIGN KEY ([ZCP_ITEM_ID]) REFERENCES [aimp2].[ICS_ZCP_ITEM] ([ID])
) TEXTIMAGE_ON [FG_AIMP2];


GO
ALTER TABLE [aimp2].[ICS_ZCP_GUARANT] NOCHECK CONSTRAINT [ICS_ZCP_GUARANT$FK_ICS_ZCP_GUARANT_ICS_ZCP_ITEM];

