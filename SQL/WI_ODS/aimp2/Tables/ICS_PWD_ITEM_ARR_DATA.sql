CREATE TABLE [aimp2].[ICS_PWD_ITEM_ARR_DATA] (
    [ID]                            NUMERIC (19)    NOT NULL,
    [CHK_DATE]                      DATETIME2 (3)   NULL,
    [REQUEST_ID]                    NVARCHAR (35)   NULL,
    [ADD_QUANTITY]                  NUMERIC (16, 6) NULL,
    [QUANTITY_SUPPL_UNIT]           NVARCHAR (3)    NULL,
    [PERMISSION_NO]                 NVARCHAR (50)   NULL,
    [DISCREPANCY_INFO]              NVARCHAR (1024) NULL,
    [AGRIM_VALID_TO]                DATETIME2 (3)   NULL,
    [PWD_ITEM]                      NUMERIC (19)    NULL,
    [QUANTITY]                      NUMERIC (16, 6) NULL,
    [QUANTITY_UNIT]                 NVARCHAR (3)    NULL,
    [QUANTITY_UNIT_QUALIFIER]       NVARCHAR (1)    NULL,
    [QUANTITY_SUPPL_UNIT_QUALIFIER] NVARCHAR (1)    NULL,
    [BALANCE_STATUS]                NVARCHAR (50)   NOT NULL,
    [version]                       INT             NOT NULL,
    CONSTRAINT [ICS_PWD_ITEM_ARR_DATA$PK_ICS_PWD_ITEM_ARR_DATA] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ICS_PWD_ITEM_ARR_DATA$FK_ICS_PWD_ITEM_ARR_DATA__PWD_ITEM] FOREIGN KEY ([PWD_ITEM]) REFERENCES [aimp2].[ICS_ZCP_ITEM] ([ID])
);

