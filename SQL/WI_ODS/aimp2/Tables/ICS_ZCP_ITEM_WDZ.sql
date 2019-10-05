CREATE TABLE [aimp2].[ICS_ZCP_ITEM_WDZ] (
    [ID]                   NUMERIC (19)    NOT NULL,
    [ZCP_ITEM_ID]          NUMERIC (19)    NULL,
    [MRN]                  NVARCHAR (18)   NULL,
    [WDZ_NO]               NUMERIC (5)     NULL,
    [STATUS]               NVARCHAR (4)    NULL,
    [AMOUNT]               NUMERIC (16, 2) NULL,
    [COMMENTS]             NVARCHAR (1024) NULL,
    [GRN]                  NVARCHAR (50)   NULL,
    [G_OTHER_TYPE_CODE]    NVARCHAR (35)   NULL,
    [TIN]                  NVARCHAR (17)   NULL,
    [G_ACCESS_CODE]        NVARCHAR (4)    NULL,
    [NEXT_WDZ_NO]          NUMERIC (5)     NULL,
    [SENT_TO_OSOZ_STATUS]  NVARCHAR (20)   NOT NULL,
    [SENT_TO_ZEFIR_STATUS] NVARCHAR (20)   NOT NULL,
    [QUOTA_ID]             NUMERIC (19)    NULL,
    [SENT_ZC272]           BIT             NOT NULL,
    [AMOUNT_USED]          NUMERIC (16, 2) NULL,
    [DATE_USED]            DATETIME2 (3)   NULL,
    [version]              INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_ITEM_WDZ$PK_ICS_ZCP_ITEM_WDZ] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_ZCP_ITEM_WDZ$FK_ICS_ZCP_ITEM_WDZ_ICS_ZCP_ITEM] FOREIGN KEY ([ZCP_ITEM_ID]) REFERENCES [aimp2].[ICS_ZCP_ITEM] ([ID])
);

